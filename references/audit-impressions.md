# Audit Playbook: Impressions / Reach

The "impressions" goal means maximize how many people see the post — including out-of-network. Because OON content is multiplied by `OON_WEIGHT_FACTOR` (<1), to get reach beyond followers, your in-network base score has to be high enough to overcome the OON penalty.

## Primary Signals to Optimize For

1. **`cont_dwell_time`** — Continuous dwell time is the largest reach lever. Time-on-post is rare and the model rewards it heavily.
2. **`dwell` (binary)** — Did the user dwell at all? Beating the `not_dwelled` penalty is necessary for any reach.
3. **`reply`** — Replies are conversational signals. Posts with many replies show to mutuals of repliers AND signal high engagement to the OON pathway.
4. **`retweet` (repost)** — Reposts directly inject your post into the in-network feed of the reposter's followers, which means a fresh round of high-base-score evaluation against new audiences.
5. **`quote`** — Same as retweet but with the OON-overcoming property that quotes drag along a comment, which gives Phoenix more to embed against.
6. **`photo_expand`** — Image expansion drives dwell and is itself a positive signal. Strongly correlated with reach.
7. **`favorite`** — Likes still matter for reach. They're the cheapest positive signal, and they accumulate.

## Why Likes Alone Don't Drive OON Reach

A like-only post has thin signal vectors. The model needs *multiple* positive actions to push the in-network base score high enough to overcome the OON multiplier. A post that gets 100 likes and 1 reply will reach less than a post with 50 likes, 10 replies, and 5 reposts.

## What Reach-Optimized Content Looks Like

### Pattern 1: Universal Specific

A post that's about something extremely specific but emotionally universal. The specificity makes it land hard for a subset; the universality makes it dwell-worthy for everyone else.

Hook example: "My grandmother kept a single recipe card from 1962. The handwriting changed three times. Each change was a divorce."

### Pattern 2: The Provocative Frame

A clean reframe of a topic that everyone has an opinion on. Drives `reply` (people add their take), `quote` (people argue), `retweet` (people endorse).

Hook example: "The reason your team doesn't move fast isn't the team. It's that you keep asking them to."

### Pattern 3: The Visual Anchor

A post built around an image, chart, or short video. Drives `photo_expand` and `vqv` directly, dwell indirectly (people study the visual), and shares (visuals are DM-able).

### Pattern 4: The Numbered List That Earns It

A list post where the items are non-obvious and the list is short (≤5 items). Drives dwell because readers read the whole list. Avoid lists that are 17 items long — readers bounce.

Hook example: "Three things I've changed about how I take meetings in 2026:"

### Pattern 5: The Story Hook

A 1-2 sentence opener that obviously implies a story, then delivers it. Drives `cont_dwell_time` because narrative is dwell-resistant.

Hook example: "I almost shut down my agency in March. Here's the message that changed it."

## What to Avoid for Reach

- **Insider references** (specific company names, internal jargon) — narrows the reachable audience.
- **Long opening setup** before the point — readers bounce before the payoff.
- **Replies as standalone reach plays** — replies are scored against the conversation, not as standalone candidates the same way top-level posts are.
- **Quote-tweet dunks of unrelated content** — can work but high mute risk if the original audience disagrees.

## Format Recommendations

- **Threads work for reach IF the first post is a complete idea** (so it can survive without people reading the rest). The thread then adds dwell and follows for those who do.
- **Single posts work when they have a clean, complete idea** with a strong visual or numeric anchor.
- **Image posts beat text-only for reach** because they activate `photo_expand`, dwell, AND visual differentiation in feed.
- **Videos work IF over the VQV duration threshold AND the first 2 seconds hook.** A 6-second video that gets scrolled is worse than no video.

## The OON-Discovery Pathway

To get OON reach, your post needs:

1. High `cont_dwell_time` from in-network viewers (the model's strongest "this is good" signal)
2. Reposts or quotes that put you in new feeds with fresh in-network scoring rounds
3. Topic alignment so that `TopicOonWeightFactor` boosts you for topic-following users
4. Pattern match to "what new users engage with" so `NEW_USER_OON_WEIGHT_FACTOR` helps

The repost is the most reliable OON pathway. A post gets reposted → it appears in-network for new audience → if it scores well there, those people's engagement compounds → OON penalty matters less because you keep entering new in-network feeds.

## Audit Checklist for Reach

- [ ] Will the first line stop a scroller? (Pass the `not_dwelled` check.)
- [ ] Does the post reward time spent reading it? (Multiple positive signals across `dwell`, `cont_dwell_time`, `photo_expand`.)
- [ ] Is it repostable? (Does it stand alone? Does endorsing it carry social risk for the reposter? Low-risk endorsability boosts repost rate.)
- [ ] Is it quote-able? (Does it leave room for someone to add a take?)
- [ ] Is there a visual? (Image, chart, screenshot — drives `photo_expand`.)
- [ ] Is it topic-clear enough that `TopicOonWeightFactor` activates?
- [ ] Avoid muted-keyword risk?
- [ ] Avoid mute/report risk?

## Rewrite Heuristics

- **Generic hook** → Replace with specific/numeric/named opener.
- **Long preamble** → Cut everything before the point. Start with the point.
- **No visual** → Add a chart, screenshot, or simple image that earns the post a `photo_expand`.
- **List too long** → Cut to 3–5 items.
- **No reposting incentive** → Add a sharp, defensible POV that the reposter would be proud to endorse.
- **All thread, no standalone first post** → Rewrite the first post so it's a complete idea on its own.
