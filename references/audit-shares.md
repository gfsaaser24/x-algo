# Audit Playbook: Shares

X has three distinct share signals, each with its own weight in the score formula:

1. `share` — Generic share button hit
2. `share_via_dm` — Shared by sending in a DM (highest intent)
3. `share_via_copy_link` — Shared by copying the link (often external)

The "shares" goal usually means `share_via_dm` because it's the strongest organic-recommendation signal in the entire model. DM-sharing means a real person decided this post was worth sending to a specific other real person.

## Primary Signals to Optimize For

1. **`share_via_dm`** — Highest-intent share. Means the content has a specific person it reminds the sharer of.
2. **`share_via_copy_link`** — Often means cross-platform sharing (Slack, iMessage, email).
3. **`cont_dwell_time`** — Shareable content is also high-dwell content; people don't share things they didn't actually read.
4. **`share`** — Generic share.
5. **`favorite`** — A weak proxy: shareable content tends to also be likeable, but the converse isn't true.

## The Three Types of DM-able Posts

People DM posts to other people for one of three reasons. Optimize for one of them deliberately.

### Type 1: "This made me think of you"

The post is specific enough that the reader pictures a particular friend. Personal, named, narrow.

Hook example: "If you have a friend who keeps starting podcasts and shutting them down 3 episodes in, send them this."

### Type 2: "This is the thing I was trying to explain to you"

The post articulates an idea the sharer has been failing to put into words. The DM is them saying "see, THIS is what I meant."

Hook example: "The reason your designer keeps missing the brief isn't that they don't understand the brief. It's that the brief doesn't exist yet, and they know it."

### Type 3: "You have to see this"

The post is so unusual, well-said, or counter-conventional that the reader feels compelled to put it in front of someone whose reaction they want to see.

Hook example: "I asked 12 LinkedIn ghostwriters to rewrite the same paragraph. The cheapest one was 4x better than the most expensive."

## What to Avoid for Shares

- **Too universal** — A post that applies to everyone reminds the reader of no one specifically. DM-share requires a specific imagined recipient.
- **Too insider** — The reader has no one to send it to who'd get it.
- **Self-promotional** — People rarely DM-share content that's obviously someone's marketing.
- **Time-sensitive** — Shares often happen hours or days after the post; news-of-the-moment content loses share velocity fast.
- **One-liner zingers** — Funny one-liners get likes, not shares. Shares require enough substance that the sharer can stand behind it.

## Format Recommendations

- **Medium-length single posts** — long enough to have substance, short enough to read in 10 seconds. This is the DM-share sweet spot.
- **Thread first-posts** can be share-bait if the first post is a complete idea AND the thread adds depth. People DM the first post and say "the whole thread is good."
- **Image posts** share well because images make the DM message more visually engaging. Charts and screenshots travel especially well in DMs.
- **Avoid videos for share_via_dm** unless they're short, captioned, and playable inline. Video shares often happen via `share_via_copy_link` to other platforms instead.

## The "DM Forwarding Test"

For each piece of content, ask: **Who would the reader send this to, and what would the accompanying DM say?**

If you can't picture both halves of that sentence — the recipient AND the one-line message — the post won't DM-share well.

Best cases:
- "Send this to [friend who's an agency owner], say: this is your business in 200 words"
- "Send this to [friend who keeps quitting things], say: please read this"
- "Send this to [boss], say: this is what I've been trying to explain"

## Audit Checklist for Shares

- [ ] Does the post imply a specific reader-to-share-with?
- [ ] Is the post long enough to feel "worth sending" but short enough to read quickly?
- [ ] Would the sharer feel smart for having sent it? (Endorsement-shaped content shares; bland content doesn't.)
- [ ] Is there a visual that makes the DM thumbnail engaging?
- [ ] Avoid self-promo framing that makes it feel like a forwarded ad?
- [ ] Avoid time-sensitive references that decay within hours?
- [ ] Pass the muted-keyword check on share-killer tokens (crypto, politics, MLM-coded words)?

## Rewrite Heuristics

- **Too universal** → narrow the audience: "If you're [specific role/situation]..."
- **Too dense** → break up the paragraph; shareable content is scannable
- **No visual** → add one; DM thumbnails matter
- **Self-promo tone** → strip the offer language; let the content stand alone
- **Vague pronouns** → replace with specifics; vague content doesn't earn DMs
