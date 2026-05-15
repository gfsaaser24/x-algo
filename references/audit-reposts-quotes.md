# Audit Playbook: Reposts and Quotes

`retweet` (repost) and `quote` are separate signals with separate weights. They share a property no other signal has: they create *new in-network candidacy* — the reposter/quoter's followers now see your content as in-network, which avoids the OON penalty entirely. This is the most powerful organic-amplification mechanism on the platform.

## Primary Signals to Optimize For

1. **`retweet`** — Simple reposts. Highest-volume amplification signal.
2. **`quote`** — Reposts with commentary. Bigger lift per event because quotes carry text the algorithm can embed.
3. **`quoted_click`** — Clicks on the quoted (original) post inside someone's quote tweet. Indicates the quote drove curiosity.
4. **`quoted_vqv`** — Video views on quoted videos. Same idea, for video.
5. **`favorite`** and **`reply`** — Strongly correlated; posts that get reposted usually also get likes and replies.

## Reposts vs. Quotes: When to Optimize for Each

### Optimize for REPOSTS when:
- The post is a clean, complete statement that an endorser can stand behind silently
- The post is "the thing I would have said but didn't" for many readers
- It's data, framework, or framing that wins on its own merit
- The reposter doesn't need to add anything — repost IS the endorsement

### Optimize for QUOTES when:
- The post is a sharp claim that invites a response, not just agreement
- The post is debatable enough that endorsers want to nuance it
- The post has a counter-argument shape ("X is wrong because Y") that triggers quoters to add "and also..."
- The post is unfinished in a productive way — leaves room for the quoter to extend the idea

## What Repostable / Quotable Content Looks Like

### Pattern 1: The Defensible POV

A clear opinion the reposter would feel proud (not embarrassed) to associate with their name. Confident, specific, not crazy.

Hook example: "Most agency owners don't have a pricing problem. They have a positioning problem that masquerades as a pricing problem."

### Pattern 2: The Asymmetric Truth

A statement that's not obvious until you read it, and after you read it, you can't unsee it.

Hook example: "Your best customers are not the ones who pay the most. They're the ones who never bring up price."

### Pattern 3: The Naming

You name a thing that everyone has experienced but no one has named. Quoters love naming because they can extend the naming.

Hook example: "I call it the 'Saturday email' — the message a client sends on the weekend that ruins the next two weeks. Every agency I've audited has at least one client who only sends Saturday emails."

### Pattern 4: The Public Position-Take

A clean public stance on something the reader has a stance on too. Drives quotes because quoters can endorse, qualify, or push back.

Hook example: "Stop asking AI to write your first draft. Use it to delete your second draft. Your first draft is the only place your taste shows up."

### Pattern 5: The Sharp Frame

A frame so tight that the reposter feels like reposting is the highest-leverage thing they can do — anything they'd add would dilute it.

## What to Avoid for Reposts/Quotes

- **Hot takes that look like trolling** — high mute risk, low repost
- **Self-effacing personal stories** — read well, repost poorly (reposting someone else's confession feels off)
- **In-progress thinking** — quoters can't endorse half-baked ideas
- **Vague generalities** — "Be authentic!" — nothing to repost
- **Anything that makes the reposter look bad to repost** — if your followers might judge you for endorsing this, they won't endorse it

## The "Reposter's Risk Calculus"

Every potential reposter is unconsciously asking: *What does reposting this say about me?* The post wins reposts when the answer is unambiguously good. The post wins quotes when the answer is "this is interesting and I have something to add."

If the answer is "this is risky" — reposts die immediately.

## Format Recommendations

- **Single posts dominate for reposts.** Threads get reposted less because the reposter is committing to N tweets, not 1.
- **The first post of a thread is the repost candidate.** It must be complete on its own.
- **Images help** — `photo_expand` is its own positive signal, and visual posts in feed are more likely to be paused on long enough to repost.
- **Short and dense beats long.** The repost is fundamentally an act of agreement; long posts have more surface area for disagreement.

## Audit Checklist for Reposts/Quotes

- [ ] Is the post a clean, defensible POV?
- [ ] Is the post short enough to repost in good conscience? (Long ones rarely repost.)
- [ ] Does the post pass the "what does reposting this say about me?" test for your target reposter audience?
- [ ] Does the post leave room for a quote-tweet take? (Or, if optimized for pure repost, is it complete enough that no addition is needed?)
- [ ] Is there a visual that helps it stand out in feed before the repost happens?
- [ ] Avoid mute-trigger tokens (crypto, politics, MLM-coded) that high-value reposters won't touch?

## Rewrite Heuristics

- **Half-formed idea** → finish it; close the loop
- **Hot take that's risky to endorse** → moderate the language without losing the point
- **Vague principle** → make it specific and named
- **Long thread compressed into one** → cut it; pick the strongest single sentence
- **Wishy-washy hedge** → cut the hedge; commit to the position

## A Note on Reciprocal Reposts

Reposts from accounts with overlapping audiences create a compounding loop because:
1. Their repost puts you in front of their in-network followers
2. If those followers engage, your in-network base score climbs for that cohort
3. Your subsequent posts are more likely to clear the OON penalty for the same cohort

This is why building relationships with adjacent-audience accounts matters more than raw follower count.
