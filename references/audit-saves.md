# Audit Playbook: Saves (Bookmarks)

A note on the algorithm:

The released `xai-org/x-algorithm` scorer does **not** expose a `bookmark` or `save` weight explicitly. Bookmarks are tracked by X, but their direct contribution to the For You score is not in the published code. The signals that most correlate with save-worthy content — and that ARE in the scorer — are:

1. **`cont_dwell_time`** — Long dwell. Saveable content gets re-read.
2. **`share_via_dm`** — High-intent share. Often saved AND shared.
3. **`share_via_copy_link`** — Same: link-saved content often gets copied for later.
4. **`click`** — Click on the post for "show more" or linked content.

So we optimize for the saveable-content profile by targeting these four. Save behavior tracks closely with dwell + DM-share, both of which the model rewards.

## What Saveable Content Looks Like

Saveable content is *reference content* — things the reader will want to come back to. Not jokes, not hot takes, not news. Three reliable patterns:

### Pattern 1: The Definitive List

A short list (3–7 items) where each item is the actual best/canonical answer, not a generic suggestion. Drives dwell (people read all items) and saves (people want to come back to the list).

Hook example: "The 5 questions I ask before signing any client. Each one has killed a deal — and every kill saved me money."

### Pattern 2: The Framework

A named or numbered system that the reader can apply. Frameworks save well because they're tools, not opinions.

Hook example: "The 3-line email template that gets 70%+ reply rates from cold prospects. Line 1: context. Line 2: ask. Line 3: out."

### Pattern 3: The Screenshot-able Document

A long-form post that is itself a complete reference document — a checklist, a script, a price guide, a teardown. Drives high `cont_dwell_time` and saves; also gets screenshot-shared on other platforms.

Hook example: "My full discovery call script, verbatim. Steal it."

## What to Avoid for Saves

- **Personal essays / narratives** — Save poorly. People consume them once, move on.
- **News / opinion** — Time-decays. Saves drop to zero within days.
- **Hot takes** — Save almost never.
- **Vague principles** — "Be consistent!" "Work hard!" — nothing to save because nothing to apply.

## Format Recommendations

- **Threads work well for saves** if each tweet is its own valuable unit. Readers save the thread for the whole list.
- **Single posts work if dense enough** — a 280-char checklist or framework.
- **Images of frameworks** save especially well — easier to screenshot.
- **Videos save rarely.** Reference content in video form is annoying to navigate back into.

## The "Two-Week Test"

For each piece of content, ask: **In two weeks, would the reader want to find this again?**

If yes → optimized for saves. If no → optimize for a different goal.

## Audit Checklist for Saves

- [ ] Is the content actionable? (Reference, framework, checklist, script — not opinion.)
- [ ] Is it dense enough to be worth coming back to? (Not just a sentence; not so long that it's a tutorial.)
- [ ] Would the reader screenshot this and put it in their notes?
- [ ] Does it have a memorable name or structure? (Numbered list, framework name.)
- [ ] Does it stand alone without context?
- [ ] Pass the muted-keyword check?

## Rewrite Heuristics

- **Opinion piece** → rewrite as actionable framework
- **Long story** → extract the lesson into a 3-item list at the end (or just post the list separately)
- **Vague principle** → specify the steps; give the actual tactic
- **Unscreenshotable wall of text** → break into numbered items with line breaks

## A Tactical Note

Because saves are off-platform in some sense (bookmarks aren't visible to other users), they don't generate the kind of feedback loop that other signals do. But the *correlation* with dwell + share is strong, and dwell is the biggest reach lever. So optimizing for save-worthy content tends to also drive reach — a rare two-fer.
