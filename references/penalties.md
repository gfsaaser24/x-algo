# Penalties & Kill-Switches

Every audit must check these. A post that scores well on positive signals can still get crushed if it triggers a negative signal or a filter.

## The 5 Negative Action Signals

These have negative weights in the score formula. They subtract from your score, and because the model uses the User Action Sequence (UAS), they teach the model that users-like-this-one don't want content-like-this from authors-like-you.

### 1. `not_dwelled` — the silent killer

Fires when a user scrolls past your post without dwelling. This is passive — it doesn't require the user to do anything except not stop.

**What causes it:**
- Weak first line / no hook
- Visual sameness with the rest of feed (no image, no break-pattern formatting)
- Generic opener ("Just thinking about...", "Hot take:", "Honestly,")
- Wall of text with no visual anchor

**Mitigation:**
- First line must do work: a number, a name, a specific claim, a confession, a contradiction
- Use line breaks to create vertical scanability
- Pair with an image when reasonable (photo_expand is also a positive signal — double win)

### 2. `not_interested`

Fires when a user explicitly hits "Not Interested in this post."

**What causes it:**
- Off-topic for the audience you've trained the model on
- Politically/emotionally provocative without value
- Looks like spam (link-in-first-line, "thread 🧵" with nothing after, "RT if you agree")
- Looks like AI slop ("In today's fast-paced world...", em-dash-heavy generic writing)

**Mitigation:**
- Stay in your lane — consistency of subject matter trains the model on which users want your content
- Cut anything that smells like a template

### 3. `mute_author`

Fires when a user mutes you outright. This is catastrophic — it removes you from that user's feed forever AND signals the model that users-like-them don't want you.

**What causes it:**
- Rapid-fire posting (also caught by Author Diversity)
- Reply-guy behavior (replying to every popular post)
- Cringe / try-hard
- Repetitive content (same take posted 3 times in a week)

### 4. `block_author`

Fires on block. Even worse than mute — typically requires real hostility or perceived stalking.

**What causes it:**
- Attacking individuals
- Misreading rooms during heated topics
- Reply harassment / pile-ons

### 5. `report`

Fires on report. Triggers visibility filtering review and can result in `VFFilter` drops.

**What causes it:**
- Anything that looks like a Terms of Service violation
- Spam or scam-shaped content
- Misinformation flags

## Pre-Score Filters That Drop You Before Scoring

These cause your post to never even be considered for a user:

### `MutedKeywordFilter`

If a user has muted any token that appears in your post, you're dropped. The match is token-level, not substring.

**High-mute-risk tokens (cause many people to mute):**
- Crypto coin tickers ($PEPE, $SOL, etc.)
- Politics tokens (any politician's last name during election cycles)
- Brand names commonly used in spam (Bitcoin, crypto, NFT, DeFi)
- Hashtagged ad tropes (#growthhack, #hustle, #grindset)
- "OnlyFans", "DM for collab" patterns

**Mitigation:** when writing about a high-risk topic, find a less-muted way to refer to it, OR accept the reduced reach if the topic is core to your point.

### `AgeFilter`

Posts older than a threshold get dropped. This means: re-using last week's good idea won't work — you have to repackage.

### `SelfTweetFilter`

You don't see your own posts. Implication: when sharing screenshots of your own tweets, the model treats the screenshot as a new candidate, not as your old tweet — so the screenshot's text + caption are what get scored.

### `PreviouslySeenPostsFilter` and `PreviouslyServedPostsFilter`

Once a user has seen or been served a post, it doesn't come back. So evergreen content can't ride a single post forever — it must be rephrased and re-posted (which is fine; reposting your own ideas in new form is standard).

### `VideoFilter`

Videos that fail eligibility (too short, unsupported format, etc.) get dropped before the `vqv_score` even matters.

### `AuthorSocialgraphFilter`

Posts from authors you've blocked or muted. Once you're muted by someone, you're filtered for them forever.

## Post-Selection Filters

These run *after* you've already been scored and selected for top-K. Even a high score can't save you here.

### `VFFilter`

Safety drops. Content flagged as deleted, spam, violence, gore, or otherwise unsafe.

**What causes it:**
- Trigger words combined with imagery
- Content matching known spam patterns
- Anything the safety system labels with `Action::Drop`

There are softer actions (limit, label) that don't fully drop you but degrade reach. We can't see those weights in the released code, but they exist.

### `DedupConversationFilter`

If multiple posts from the same conversation tree get to the same user, only the best one is kept. Implication for thread strategy: replying to your own thread N times doesn't N-tuple your reach to a single user; only the best branch shows.

## Soft-Penalty Patterns (algorithmically unverified but observably reach-reducing)

These aren't in the public scorer, but they correlate with poor performance:

1. **Two posts in <10 minutes:** likely triggers Author Diversity penalty heavily, and may trigger informal anti-spam heuristics not visible in this release.

2. **External link in the first line:** drives `click` but reduces `cont_dwell_time` (people leave). Net effect varies — for buyers it can be fine, for reach it usually isn't.

3. **All-caps opener:** historically a mute-trigger pattern. Doesn't necessarily cause a single mute but reduces dwell from many.

4. **Engagement bait phrasing ("RT if you agree", "Like if you've been here"):** these tend to lower `share_via_dm` and `follow_author` (low-intent engagement) while elevating `not_interested` and `mute_author`. Net negative.

5. **Reply guy on a high-traffic post:** can score well via `click` and `profile_click` if the reply is sharp. Can also tank you via `mute_author` if seen as desperate. Quality of reply is the swing factor.

## How to Use This File in an Audit

For every audit, score each of these as LOW / MEDIUM / HIGH risk:

- `not_dwelled` risk (hook quality)
- `mute/block/report` risk (off-tone, off-audience, off-brand)
- Muted-keyword risk (high-mute-risk tokens present)
- Author Diversity risk (is this part of a same-day series?)
- `VFFilter` risk (does this look like spam/unsafe to a classifier?)

For ideation, every idea must pass the not_dwelled and mute checks before being recommended.
