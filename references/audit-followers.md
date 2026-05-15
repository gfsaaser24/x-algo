# Audit Playbook: Followers

`follow_author` is its own action signal with its own weight. But there's a critical insight: the *cause* of a follow is almost always a `profile_click` first. So follower-growth optimization is really a two-step funnel: drive profile clicks → convert profile clicks to follows.

## The Follow Funnel

```
Post seen → profile_click → profile delivers → follow_author
```

The post controls profile_click. The profile (bio + pinned + recent posts) controls the conversion to follow_author. Both must be working.

## Primary Signals to Optimize For

1. **`profile_click`** — The on-ramp. No profile click, no follow.
2. **`follow_author`** — The conversion.
3. **`cont_dwell_time`** — High-dwell posts make readers curious about the author.
4. **`reply`** — Replies are a stepping stone to follows; readers who reply often follow too.
5. **`share_via_dm`** — Strong correlation with follows because DM-share implies "this person is worth following."

## What Profile-Click-Driving Content Looks Like

The reader must finish the post wanting to know more about you. Three reliable patterns:

### Pattern 1: The Earned POV

You say something so specific to your experience that the reader thinks "who IS this." Drives `profile_click` because the reader needs to know your context.

Hook example: "I've fired 14 podcast editors in 3 years. The same flaw kept showing up — and it wasn't skill."

### Pattern 2: The Authority Signal

You demonstrate authority without claiming it. The reader infers expertise from the specificity of what you said.

Hook example: "If your podcast editor is using Adobe Audition's auto-leveler with no LUFS check, your audio is being mastered wrong every week."

### Pattern 3: The Self-Implied Question

The post ends in a way that the reader has a follow-up question — and the implicit answer is "go look at my profile to learn more."

Hook example: "The single weirdest decision I've made in my business: I refuse to take meetings before 11am. It's worth $400k/year."

### Pattern 4: The Pattern-Match Identifier

You describe a person so specifically that the reader thinks "that's me" — then they want to follow the person who saw them.

Hook example: "If you've ever rewritten the same client onboarding doc four times because each new client breaks it differently — your problem isn't the doc."

## What Converts Profile-Click → Follow

Profile clicks don't matter if the profile doesn't deliver. For follower growth, your profile must:

1. **Bio is one clear line about what you do AND for whom.** Not aspirational, not clever — clear.
2. **Pinned post is your best demonstration of the value the bio promises.** No exceptions.
3. **Recent posts (above the fold) match the post they clicked from.** Wild variance in topic = no follow.
4. **Avatar and header are coherent.** Looks like a real account, not a parked one.
5. **No engagement bait in recent posts.** A profile full of "RT if you agree" tanks the follow conversion from a profile click.

## What to Avoid for Follower Growth

- **Posts with no implied author voice** — Generic posts get likes, not profile clicks. The reader has no reason to want more from you.
- **Hot takes off your usual lane** — One viral post about something off-brand brings followers who unfollow when you return to your actual content. Net negative.
- **Engagement bait** — Drives `follow_author` toward zero because it signals low-quality account to anyone who profile-clicks.
- **Endless threads with no profile-click incentive** — Long threads can convert IF the reader wants more *of you*, not just more *of this thread*.

## Format Recommendations

- **Posts that close with a hook, not a CTA** — A "follow me for more" CTA reads as desperate and lowers `follow_author` conversion. The post itself should make the follow obvious.
- **Visible series** — When your posts hint at a continuing thread of thought, readers profile-click to see if you've said more on this. They follow to catch the next one.
- **Image posts work for follows IF the image is voice-aligned.** A chart that looks like your other charts. A screenshot in your usual format.
- **Numbered observations / running counts** — "Year 6 of running an agency. Things I now know that I didn't in Year 1, part 11." These build a habit of follow-and-track.

## The "Why Would I Follow This Person?" Test

For each piece of content, ask: **If I saw this from a stranger, why would I follow them?**

The answer must be a clean, specific reason — not "they seem smart" but "they understand X and I want their next take on X."

If you can't fill in the blank, the post isn't follower-bait.

## Audit Checklist for Followers

- [ ] Does the post imply a clear "what this author knows about"?
- [ ] Does the post leave the reader curious enough to profile-click?
- [ ] Does the post match the rest of your recent content? (Off-brand posts hurt the conversion.)
- [ ] Is there a clear voice / POV that's consistent with your account?
- [ ] Does the post avoid CTA spam ("Follow for more!")?
- [ ] Bio + pinned + recent feed aligned with this post for the conversion step?
- [ ] No engagement bait that tanks the profile-click → follow conversion?

## Rewrite Heuristics

- **Generic insight** → tie it to your specific experience or evidence
- **Hot take off-lane** → don't post it, or post it from a different account
- **No implied author voice** → add a specific frame or experience that only you would have
- **Loud CTA** → remove it; let the post earn the follow
- **Inconsistent with recent content** → either match the recent content or accept it won't convert

## A Note on Follower Quality

The model uses the User Action Sequence to predict engagement. Followers who don't engage actually *hurt* you over time — their `not_dwelled` signals stack against you. So the goal isn't "more followers" — it's "more followers whose action sequences will positively engage with your future content."

This means:
- A follower from a viral off-brand post is often net-negative (won't engage with future on-brand posts → contributes `not_dwelled` against you).
- A follower from an on-brand post is net-positive (will engage → strengthens the model's pattern for you).

Optimize for on-brand follower acquisition. Vanity follows are worse than no follows.
