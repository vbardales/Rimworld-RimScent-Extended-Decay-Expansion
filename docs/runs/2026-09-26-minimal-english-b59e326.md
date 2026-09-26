# Invalid Pickle attempt — 2026-09-26

- Ticket: `20260926-115016-908-ba88`
- Requested revision: `b59e326d9493c0af71cc1b311b4640f5ca0cf48f`
- Requested pass: full English, `wsl-deps.sans-facultatifs.map`
- Requested evidence directory: `Tests/Pickle/Evidence/minimal-english-b59e326`
- Terminal launcher result: exit code `1`, with no current Pickle report.

This is not evidence for RimScent Extended: Decay Expansion. The dispatcher did select this mod,
but staging failed before Pickle launched: the copy of Workshop Pickle `3791648678` was incomplete
and consequently exposed no `packageId`. Its Workshop source currently has the expected
`rimworks.pickle` metadata, so this is a transient staging failure, not an incorrect dependency
declaration in the mod under test. The `Player.log` left in the shared report directory belonged to
the preceding Joy Rescue run and was explicitly not interpreted. The local report/log copy was
deleted after this summary was written. A fresh dispatcher pass remains required before the
`done -> tested` transition.
