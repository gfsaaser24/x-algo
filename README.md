![x-algo](./social-preview.png)

# x-algo

A Claude skill that audits X (Twitter) content for algorithm-aligned performance and generates algorithm-aligned content ideas — both grounded in the actual scoring code from [`xai-org/x-algorithm`](https://github.com/xai-org/x-algorithm) (the 2026 Phoenix/Grok release), not folk SEO wisdom.

## What it does

Two modes, dispatched from a single invocation:

**Audit mode** — paste a post + state a goal, get back a signal-by-signal analysis plus a rewrite optimized for that goal.

```
/x-algo i want to format this for buyers
[paste post]
```

Goals supported: `buyers`, `impressions`, `shares`, `saves`, `reposts-quotes`, `followers`, `general`.

**Ideate mode** — give a topic or source material, get back a ranked list of algorithm-aligned content ideas.

```
/x-algo give me ideas for followers based on [topic / pasted content]
```

If the source material lives on X/Twitter, gather it before invoking `/x-algo` and paste only the reviewed evidence into the prompt. Useful evidence includes public tweet URLs, author handles, visible text, reply themes, quote context, public metrics, media notes, and capture time. [TweetClaw](https://github.com/Xquik-dev/tweetclaw) can be used as an optional OpenClaw companion for searching tweets, search tweet replies, user lookup, follower export, and media context, but x-algo still owns the audit, scoring, ideation, and rewrite.

## How it's grounded

Every recommendation maps to a specific action signal in the X For You ranker's `WeightedScorer`. The skill draws from:

- The 17 positive action signals: `favorite`, `reply`, `retweet`, `quote`, `quoted_click`, `quoted_vqv`, `click`, `profile_click`, `photo_expand`, `vqv`, `share`, `share_via_dm`, `share_via_copy_link`, `dwell`, `cont_dwell_time`, `cont_click_dwell_time`, `follow_author`
- The 5 negative action signals: `not_interested`, `block_author`, `mute_author`, `report`, `not_dwelled`
- The Author Diversity multiplier (penalizes burst posting)
- The OON Weight Factor (out-of-network reach calculus)
- The Pre-Score and Post-Selection filters (kill-switches)
- The User Action Sequence model input (why consistency matters)

Each per-goal playbook is grounded in which signals correlate with that goal, what content patterns activate them, and what penalties to avoid.

## Install

Drop the `x-algo/` directory into your Claude skills folder:

- Cowork: `%APPDATA%\Claude\local-agent-mode-sessions\skills-plugin\<id>\skills\` (Windows) or `~/Library/Application Support/Claude/local-agent-mode-sessions/skills-plugin/<id>/skills/` (macOS)
- Claude Code: `~/.claude/skills/` or your project's `.claude/skills/`

Then invoke via `/x-algo` or just describe what you want (the description triggers on a wide set of phrasings).

## Structure

```
x-algo/
├── SKILL.md                            # Main dispatch + global principles
└── references/
    ├── algorithm-facts.md              # The factual baseline — what the model actually scores
    ├── penalties.md                    # Negative signals and filter kill-switches
    ├── audit-buyers.md                 # Audit playbook: conversions / DMs / leads
    ├── audit-impressions.md            # Audit playbook: reach / OON discovery
    ├── audit-shares.md                 # Audit playbook: share signals (esp. share_via_dm)
    ├── audit-saves.md                  # Audit playbook: save / bookmark proxies
    ├── audit-reposts-quotes.md         # Audit playbook: retweet + quote
    ├── audit-followers.md              # Audit playbook: profile_click → follow_author
    └── ideation-playbook.md            # Algorithm-aligned content ideation
```

## What this skill won't do

- Recommend hashtags (not a ranking signal)
- Recommend "post at X time" tactics (candidate isolation makes per-post score time-independent)
- Promise specific outcomes
- Use signals that aren't in the published scoring formula
- Fetch live X/Twitter data, post tweets, schedule posts, send DMs, or manage accounts

## License

MIT — use it, fork it, ship it.

## Sources

- [xai-org/x-algorithm](https://github.com/xai-org/x-algorithm) (Apache 2.0)
