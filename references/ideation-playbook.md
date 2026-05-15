# Ideation Playbook

The ideate mode generates algorithm-aligned content ideas from a topic, source material (article, transcript, doc), or vague brief. Every idea must map to one or more specific positive signals in the algorithm.

## How to Read Source Material for Algorithm-Aligned Ideas

When the user provides source material (an article, podcast transcript, doc, newsletter, or another piece of content), scan it for these extractable elements:

| Extractable | Maps to which algorithmic signal |
|---|---|
| A counter-intuitive claim | `reply`, `quote`, `retweet` |
| A specific number / stat | `dwell`, `share_via_dm`, `share_via_copy_link` |
| A named framework | `share_via_dm`, `cont_dwell_time` (save proxy) |
| A specific story / anecdote | `cont_dwell_time`, `favorite`, `profile_click` |
| A naming (giving a thing a name) | `quote`, `retweet`, `reply` |
| A reframe of common wisdom | `retweet`, `quote`, `profile_click` |
| A visual asset (chart, screenshot) | `photo_expand`, `cont_dwell_time` |
| A list of items | `cont_dwell_time`, `share_via_dm` (saves) |
| A specific pain statement | `profile_click`, `follow_author`, `share_via_dm` |
| A confession / authentic disclosure | `reply`, `follow_author`, `profile_click` |

For each source, identify at least 3 of these elements and propose one idea per element.

## The Hook Library (use these to start ideas)

Every idea needs a hook that beats `not_dwelled`. Drawing from patterns that consistently work:

### Number openers
- "I [verb] [N] [things] in [timeframe]. [Single thing they had in common]."
- "[N] things I've changed about [X] in [timeframe]:"

### Confession openers
- "I almost [did the wrong thing]. Here's what stopped me."
- "I was wrong about [topic] for [N] years."

### Naming openers
- "I call it the [name]: [definition]. [Why it matters]."
- "There's a name for [phenomenon]. It's [name]."

### Contradiction openers
- "Everyone says [X]. The data says [Y]."
- "[Common wisdom] is dead. Here's what replaced it."

### Identifier openers
- "If you're [specific person/situation], [thing they need to know]."
- "If you've ever [specific experience], your problem isn't [common diagnosis]."

### Story openers (high-dwell)
- "[Vivid one-sentence opening that obviously implies a story]."
- "The most expensive lesson I learned about [topic] cost me [specific amount]."

### Question openers (sparingly — usually weak, but work for replies)
- "Why does [thing everyone has experienced] keep happening?"

## The Idea Generation Process

Given a topic or source, do this:

1. **Identify the goal.** If unspecified, default to `followers + reposts-quotes` (the compounding-growth pair). For Gabe specifically, this default is correct most of the time.

2. **Extract 3–5 algorithmically-aligned elements** from the source (using the table above).

3. **For each element, draft 1–2 ideas** using a hook pattern that matches its signal target. Aim for 5–8 ideas total.

4. **For each idea, write:**
   - Format (single post, thread, image+caption, etc.)
   - Target signals (the specific actions it should activate)
   - Hook line (verbatim — the first line of the post)
   - Draft or outline (enough for the user to evaluate)
   - Why it ranks (which algorithmic mechanism makes this work)

5. **Rank the ideas by algorithm fit + voice fit.** The strongest idea is the one that maps to multiple positive signals AND fits the user's voice without requiring rewrite.

## Format Recommendations by Signal Target

| Goal | Preferred format | Why |
|---|---|---|
| Reach / impressions | Single post with visual | Dwell + photo_expand + repostability |
| Followers | Single post with implied series | Drives profile_click; voice-coherent series builds follow habit |
| Buyers | Single post, no thread, no obvious CTA | Specific pain → implicit answer; quiet authority |
| Shares (DM) | Medium single post or short thread | Long enough to feel worth sending, short enough to send |
| Saves | Numbered list or framework, single post or thread | Reference-worthy structure |
| Reposts / quotes | Single post, defensible POV | Clean, complete, endorsement-shaped |

## The Voice Layer (for Gabe specifically)

Apply Ruthless Clarity to every idea before recommending it:

- **One idea per piece.** If an idea contains two ideas, split it into two ideas.
- **Root-level opinion, not surface-level observation.** "AI is changing podcasting" is surface. "The reason AI editors won't kill human editors is that taste isn't a deliverable" is root-level.
- **Specific over abstract.** Replace "many" with a number. Replace "various reasons" with the actual reason. Replace "people often" with "I" or with a named example.
- **No slop phrases.** Cut: "In today's fast-paced world", "Let's dive in", "It's worth noting", "Game-changer", "Unlock", "Leverage", "synergy", "actionable insights".
- **Earn the conviction.** If you say "X is always Y", show why. Conviction without evidence reads as bluster.

## Idea-Generation Anti-Patterns

Avoid generating ideas that:

- Are generic enough that 20 other accounts could post them ("5 tips for better Tweets")
- Require a long preamble before the point
- Are jokes-as-content rather than ideas-as-content (jokes get likes, not the deeper signals)
- Lean on hashtags or "🧵" emoji as substitutes for hook quality
- Are framed as questions when they should be framed as positions
- Use the word "thoughts?" at the end

## Quality Bar

Before recommending an idea, check:

- [ ] Could only this user (or someone in their specific position) credibly post this?
- [ ] Does the hook line earn the first 1.5 seconds of attention?
- [ ] Is there at least one specific (name, number, named framework, specific story)?
- [ ] Does it map to a known positive signal in the algorithm?
- [ ] Does it avoid penalty triggers (muted keywords, mute-bait phrasing)?
- [ ] Is it post-able as written, or does it still need a substantial rewrite?

If any of these are "no", iterate on the idea or cut it.

## When the User Gives You a Source That Doesn't Yield 5+ Ideas

If the source material is thin, instead of generating filler:

1. Tell the user: "This source yielded [N] strong ideas. Want me to also generate [N+] adjacent ideas using your usual angle of attack?"
2. Or: ask for additional source material.
3. Don't pad the list with weak ideas just to hit a count.

## When the User Wants Volume

If the user explicitly wants 10–20 ideas (e.g., for a content sprint), generate them in tiers:

- **Tier 1 (3–5 ideas):** strongest algorithmic + voice fit. Ready to post with minor polish.
- **Tier 2 (5–8 ideas):** good but need a sharper hook or one more concrete detail.
- **Tier 3 (rest):** seeds — directional ideas the user can develop further.

Label them clearly. Don't blend tiers.
