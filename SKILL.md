---
name: x-algo
description: Audit X (Twitter) content for algorithm-aligned performance against a stated goal — buyers, impressions, shares, saves, reposts/quotes, or followers — OR generate algorithm-aligned content ideas from a topic or source material. Use this skill ANY time the user invokes "/x-algo", says "x-algo", asks to "audit this for X", "format for [outcome]", "make this perform on X", "give me X ideas based on Y", "what would do best on X", or any variant that touches on optimizing a post or thread for the new X For You algorithm. Also trigger when the user references the X algorithm, Phoenix ranker, Grok-based ranker, For You feed, or any of these signals: dwell, reposts, quotes, profile clicks, follow_author, share via DM, photo expand, VQV. This skill is grounded in the actual scoring weights from xai-org/x-algorithm — not vibes.
---

# x-algo

A working tool for two jobs against the live X algorithm:

1. **Audit** a piece of content (post, thread, reply, quote, image caption) for performance against a user-specified outcome.
2. **Ideate** algorithm-aligned content from a topic or source material.

Both modes are grounded in the actual scoring code in `xai-org/x-algorithm` (the 2026 Phoenix/Grok release). No SEO-style folk wisdom. No 2023 algo holdovers. The skill works against the signals that are *actually* in the weighted score formula.

## Dispatch

When invoked, parse the user's call and route:

**Audit mode** — triggers: "format for", "audit", "score this", "review this for", "make this perform for", "fix this for", or a post/thread is pasted in with a stated goal.

- Identify the goal (one of: `buyers`, `impressions`, `shares`, `saves`, `reposts-quotes`, `followers`, or `general`).
- Read `references/algorithm-facts.md` once for grounding.
- Read the matching `references/audit-{goal}.md`.
- Read `references/penalties.md` (always — every audit must check kill-switches).
- Output: scored audit (see "Audit Output Format" below).

**Ideate mode** — triggers: "give me ideas", "ideas for", "based on this give me", "what should I post about X", "ideate", "brainstorm posts about".

- Identify the topic / source material.
- Identify the implicit goal if stated; if not, ask once (default to `followers + reposts-quotes` for compounding growth).
- Read `references/algorithm-facts.md` and `references/ideation-playbook.md`.
- Output: ranked idea list (see "Ideate Output Format" below).

If the user's call is ambiguous (could be either), assume **audit** if a post is pasted in, **ideate** if a topic/source is given without a post.

## Global Principles (apply to every invocation)

These are non-negotiable because they're hard-coded in the scoring math. Reference `algorithm-facts.md` for citations.

1. **The score is a weighted sum of action probabilities, not a single relevance score.** Every action the model predicts has its own weight: `favorite`, `reply`, `retweet`, `quote`, `quoted_click`, `quoted_vqv`, `click`, `profile_click`, `photo_expand`, `vqv` (video quality view), `share`, `share_via_dm`, `share_via_copy_link`, `dwell` (binary), `cont_dwell_time` (continuous seconds), `cont_click_dwell_time`, `follow_author`. Different goals = different actions to optimize for.

2. **Five signals are negative and actively suppress reach:** `not_interested`, `block_author`, `mute_author`, `report`, **`not_dwelled`**. The last one is the most important — if users scroll past your post without dwelling, the model penalizes you. This means: hook in the first 1–2 lines or you lose.

3. **Author Diversity is multiplicative.** Multiplier = `(1 - floor) × decay^position + floor`. The 2nd post from the same author in a single user's feed is scored lower than the 1st; the 3rd is lower still. **Spacing > volume.** Posting 5 things in an hour cannibalizes your own reach.

4. **Out-of-network posts get multiplied by OON_WEIGHT_FACTOR.** That factor is normally <1, so OON content (reach beyond your followers) starts at a disadvantage. It's boosted in two cases: (a) the viewer is a new user, (b) the viewer has topic preferences matching the post.

5. **The User Action Sequence (UAS) is the model's input on the user side.** Recent actions (likes, replies, follows, dwells) are aggregated and fed to the transformer. This means: you reach people whose recent action sequence matches the kind of content yours predicts engagement for. Consistency teaches the model who your audience is.

6. **Phoenix uses candidate isolation in attention.** A post's score does not depend on what else is in the batch. You cannot game timing. The post either matches the user's pattern or it doesn't.

7. **Muted keywords are tokenized.** If a viewer mutes "AI" as a token, posts with "AI" get dropped at filter time — before scoring. Word choice matters.

## Audit Output Format

Use this exact template:

```
# X-ALGO AUDIT — Goal: {goal}

## The Post
{verbatim post}

## Algorithmic Score Estimate
**Verdict:** {WILL PERFORM / NEEDS WORK / WILL UNDERPERFORM}

## Signal-by-Signal Analysis
For each action signal relevant to the goal:
- **{signal_name}**: {assessment} — {one-line reason}

## Kill-Switch Check
- not_dwelled risk: {LOW/MEDIUM/HIGH} — {reason}
- mute/block/report risk: {LOW/MEDIUM/HIGH} — {reason}
- muted-keyword risk: {LOW/MEDIUM/HIGH} — {potentially-muted tokens}
- author diversity (if posting a series): {note on spacing}

## Rewrite
{Specific rewrite optimized for the stated goal. Show the new version verbatim, ready to paste.}

## Why This Rewrite Wins
{2–4 sentences tying the changes to specific weighted signals.}
```

## Ideate Output Format

Use this exact template:

```
# X-ALGO IDEAS — Source: {topic or material} — Goal: {goal}

## Algorithm Fit
{1–2 sentences on which signals this topic naturally activates and which goals it serves.}

## Ideas (ranked by algorithm fit)

### 1. {Idea title}
**Format:** {single post / thread / quote-of-X / image+caption / video}
**Target signals:** {primary action signals it should activate}
**Hook line:** {literal opening line — must beat the not_dwelled penalty}
**Draft / outline:**
{the actual draft or thread outline}
**Why it ranks here:** {why this idea fits the algorithm and the goal}

### 2. {…}
{repeat for 5–8 ideas}

## Pattern Notes
{1–2 paragraphs on what the strongest ideas have in common — for the user's voice memory.}
```

## Reference Files

Load only what you need. Always load `algorithm-facts.md` and `penalties.md`. Load the goal-specific file based on the user's stated outcome.

| File | When to read |
|---|---|
| `references/algorithm-facts.md` | Always — the factual baseline. |
| `references/penalties.md` | Always — every audit and ideation must avoid these. |
| `references/audit-buyers.md` | Goal is buyers / conversions / DMs / leads. |
| `references/audit-impressions.md` | Goal is reach / impressions / virality / OON discovery. |
| `references/audit-shares.md` | Goal is shares (DM, copy link, generic share). |
| `references/audit-saves.md` | Goal is saves / bookmarks / reference content. |
| `references/audit-reposts-quotes.md` | Goal is reposts or quote tweets. |
| `references/audit-followers.md` | Goal is follower growth. |
| `references/ideation-playbook.md` | Any ideate-mode invocation. |

## Voice Guardrails (for Gabe specifically)

Gabe runs Compounded Content (Substack), @gabefletcher on X, and the "Ruthless Clarity" editorial line. When rewriting or generating, default to his voice — one idea per piece, root-level opinion, specific over abstract, no slop phrases. If the user wants a different voice, they'll say so.

## What Not To Do

- Don't invent signals. If the action isn't in `algorithm-facts.md`, it isn't in the score.
- Don't recommend hashtags as a ranking lever. They aren't in the scoring formula.
- Don't recommend "post at X time" — candidate isolation means time doesn't change the per-post score (it changes the size of the audience awake to see it, which is a different question and outside this skill's scope).
- Don't recommend engagement bait that triggers `not_interested` or `mute_author` — the negative weights are real and they suppress your future reach, not just the bait post.
- Don't promise specific outcomes. The skill produces algorithm-aligned recommendations, not guaranteed results.
