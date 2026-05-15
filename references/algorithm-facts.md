# Algorithm Facts

These are sourced from the actual code in `xai-org/x-algorithm`. Do not introduce signals that are not in this file. If you want to recommend optimizing for something, it must map to one of these.

## The Scoring Formula

```
final_score = Σ ( P(action_i) × weight_i ) for all actions
            → normalized
            → × author_diversity_multiplier
            → × oon_weight_factor (if out-of-network)
```

Source: `home-mixer/scorers/ranking_scorer.rs` and `home-mixer/scorers/weighted_scorer.rs`.

## The Action Signals (these are what the model predicts)

### Positive signals (push score UP)

| Signal | What it is | What activates it |
|---|---|---|
| `favorite` | Like | Hearts the post |
| `reply` | Reply | Posts a reply to the thread |
| `retweet` | Repost (RT) | Hits repost |
| `quote` | Quote tweet | RT with added commentary |
| `quoted_click` | Click on quoted content | Taps into the embedded quoted post |
| `quoted_vqv` | Video quality view on a quoted video | Watches the embedded video (must exceed min duration) |
| `click` | Click on the post itself | Taps into the post / link / "show more" |
| `profile_click` | Click on the author's profile | Taps the author's name/avatar |
| `photo_expand` | Photo expansion | Taps an image to view full-screen |
| `vqv` | Video quality view | Watches video past `MIN_VIDEO_DURATION_MS` threshold |
| `share` | Generic share | Hits the share button |
| `share_via_dm` | Share via DM | Sends the post in a DM (highest-intent share) |
| `share_via_copy_link` | Share via copy link | Copies the link |
| `dwell` | Probability of dwelling | Stays on the post long enough to register as "looked at" |
| `cont_dwell_time` | Continuous dwell time (seconds) | Raw time spent on the post — more = better |
| `cont_click_dwell_time` | Continuous dwell after click | Raw time spent after tapping in |
| `follow_author` | Follows author | Hits Follow after seeing the post |

### Negative signals (push score DOWN — suppress this post AND future ones from this author for similar users)

| Signal | What it is |
|---|---|
| `not_interested` | Hits "Not Interested in this post" |
| `block_author` | Blocks the author |
| `mute_author` | Mutes the author |
| `report` | Reports the post |
| `not_dwelled` | Scrolled past without dwelling — **the most common negative signal by far** |

## Why `not_dwelled` is the most important signal to understand

It's the only negative signal that fires *passively*. Every post that doesn't catch the eye contributes to a `not_dwelled` penalty. This is why hook quality dominates: a bad opening line doesn't just fail to get likes, it actively suppresses your reach by stacking `not_dwelled` events.

## Author Diversity

The Author Diversity Scorer runs *after* the weighted scorer.

```
multiplier(position) = (1 - floor) × decay_factor^position + floor
```

Where `position` is the 0-indexed count of this author's posts already ranked higher in the same feed response. So:

- 1st post from this author in feed: multiplier ≈ 1.0
- 2nd post from same author: multiplier = (1-floor) × decay + floor, which is significantly less than 1
- 3rd: even lower
- Eventually asymptotes to `floor`

**Implication:** burst-posting cannibalizes your own ranking. Space your posts. Reply-to-self threads do NOT count as separate top-level posts here — they live in a single conversation. But standalone posts in rapid succession do.

Source: `home-mixer/scorers/author_diversity_scorer.rs`

## Out-of-Network (OON) Weight

After diversity, OON posts get an additional multiplier:

```
if candidate.in_network == false:
    score = score × OON_WEIGHT_FACTOR
```

Where:
- `OON_WEIGHT_FACTOR` is normally <1 (in-network is preferred)
- `TopicOonWeightFactor` overrides it (higher) when the user has matching topic preferences
- `NEW_USER_OON_WEIGHT_FACTOR` overrides it (higher) when the viewer is a new user with enough follows

**Implication:** to reach non-followers, you need either (a) very high base score from in-network engagement to overcome the OON penalty, (b) content that maps to popular topic clusters, or (c) content that resonates with new-user engagement patterns.

Source: `home-mixer/scorers/oon_scorer.rs` and `ranking_scorer.rs::effective_oon_weight`.

## The User Action Sequence (UAS)

Before scoring runs, the system hydrates the viewer's recent action history into an aggregated sequence (`UAS_MAX_SEQUENCE_LENGTH` items max, windowed by `UAS_WINDOW_TIME_MS`). This sequence is the user-side input to the Phoenix transformer.

The transformer predicts: "given this user's recent actions on these other posts, what is the probability they take each action on this candidate post?"

**Implication:** the algorithm has no concept of topics, hashtags, or keywords as ranking signals. It has only patterns of user behavior. Your reach is determined by how well your post matches the engagement fingerprint of users whose action sequences predict positive actions on content like yours.

Source: `home-mixer/query_hydrators/user_action_seq_query_hydrator.rs`

## Phoenix Model: Candidate Isolation

In the ranking transformer, candidates can attend to the user and history, but cannot attend to each other. This is the attention mask:

- User token → attends to user + history
- History tokens → attend to user + history
- Candidate tokens → attend to user + history + SELF only (not to other candidates)

**Implication:** the score for your post is independent of what other posts are in the same scoring batch. There's no "this post is competing with that post" effect at the per-score level. The post either matches the user's pattern at threshold or it doesn't.

Source: `phoenix/README.md`

## Phoenix Cluster Routing

The phoenix_scorer routes the request to a different inference cluster for "new users" — defined as users whose action sequence has fewer than `PhoenixRankerNewUserHistoryThreshold` events. New users get a different model that doesn't depend as heavily on long action histories.

**Implication:** for new-X users, you reach them via broad-pattern content. For seasoned users, you reach them via consistent voice that builds into their action sequence over time.

Source: `home-mixer/scorers/phoenix_scorer.rs`

## Pre-Scoring Filters (these drop candidates BEFORE scoring runs)

| Filter | What it removes |
|---|---|
| `DropDuplicatesFilter` | Duplicate post IDs |
| `CoreDataHydrationFilter` | Posts that failed to load core metadata |
| `AgeFilter` | Posts older than the threshold |
| `SelfTweetFilter` | Posts where author == viewer (you don't see your own posts) |
| `RetweetDeduplicationFilter` | Multiple reposts of the same underlying post |
| `IneligibleSubscriptionFilter` | Paywalled content the viewer can't see |
| `PreviouslySeenPostsFilter` | Posts the user has already seen |
| `PreviouslyServedPostsFilter` | Posts already served in this session |
| `MutedKeywordFilter` | Posts whose text contains any of the viewer's muted keywords (tokenized matching) |
| `AuthorSocialgraphFilter` | Posts from blocked/muted authors |
| `VideoFilter` | Videos that fail eligibility |
| `TopicIdsFilter` | Topic-mismatched content (esp. for new users) |
| `NewUserTopicIdsFilter` | Stricter topic match for new users |

## Post-Selection Filters (after the top-K is chosen)

| Filter | What it removes |
|---|---|
| `VFFilter` | Posts flagged by visibility filtering (deleted, spam, violence, gore, safety actions) |
| `DedupConversationFilter` | Multiple branches of the same conversation |
| `AncillaryVFFilter` | Additional safety drops |

## Muted Keyword Mechanics (important)

The `MutedKeywordFilter` tokenizes the post text using `TweetTokenizer` and matches against the user's muted token sequences. This is **not substring matching** — it's token-level. So:

- A user who muted "AI" filters posts where "AI" appears as a token
- "AI-powered" might or might not match depending on tokenization rules
- This means popular tokens are higher-risk: words muted by many people (politics, crypto coin tickers, specific brand names that get spam-muted) will reduce your reachable audience

Source: `home-mixer/filters/muted_keyword_filter.rs`

## Visibility Filtering

The `VFFilter` drops posts where the safety system returned a "Drop" action. Even high-scored posts can be killed here. Triggers include:

- Detected spam
- Violence, gore, NSFW outside-eligible-surfaces
- Anything the safety system flags for full drop

There are also softer actions (limit, label) handled elsewhere.

Source: `home-mixer/filters/vf_filter.rs`

## What Is NOT a Signal

Based on the released code, these are **not** weighted scoring signals in the For You ranker:

- Number of followers you have (it's not in the scoring formula — though it affects how many people can see your in-network posts via Thunder)
- Hashtags (no hashtag weight; hashtags only matter if they affect tokenization for muted-keyword filtering, which is usually negative)
- Verification status (no `is_verified` weight in the released scorer)
- Time of day (candidate isolation; per-post score is time-independent)
- External link presence (no link-penalty weight — but links may affect click signal which IS weighted)

Note: some of these may exist as features elsewhere (e.g., visibility filtering may treat verified differently). But they are not in the weighted score formula.
