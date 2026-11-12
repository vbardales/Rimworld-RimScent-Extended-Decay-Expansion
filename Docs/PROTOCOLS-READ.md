# Protocols read

Read on 2026-09-26 for `RimScentExtendedDecayExpansion`, at repository commit
`3d07044942fa86f3260f12ae92250c50fe0be761`. Each fingerprint is SHA-256 of the exact file
read; a changed fingerprint requires rereading only where the applicability column says so.

| Document | Lines | SHA-256 | Applicability / reread rule |
| --- | ---: | --- | --- |
| `../AGENTS.md` | 46 | `36631e7304333692cf07d7eb7968ec97fc1c2533f9ff342a8b80dfe160b8bcf0` | Useful: mod gates, evidence retention and CI publication authority. |
| `../AUDIT.md` | 232 | `d5dc23b06e35f79b2ee5e7d52ab25132ab45d517962c31a3c19d1d1445d5b740` | Useful: stage semantics, Pickle evidence and interpretation. |
| `../MOD_SETTINGS.md` | 107 | `404916bc99a7f1c6fc00d7ab51d417f86fc719ab62af023c4022f502d7a9f2c6` | Useful: supports the recorded `not_applicable` settings decision. |
| `../PUBLISHING.md` | 719 | `7d34f55d583d7f657cc66b899ca7d5d385584c02d1d138af40afe1a7d204342a` | Useful: later prepublication/CI requirements. |
| `../TRANSLATIONS.md` | 112 | `298f74d226da2c4b9365d65a82275d0fe80c7edb3fe08910f6b452fbad945792` | Useful: English/French DefInjected coverage and runtime evidence. |
| `../STYLE_RIMWORLD.md` | 484 | `de13cbe5e1f978b7357eadedfc2df035b857e3641b0023fd2da6e44985ffb205` | Not useful now: assets already reviewed; reread only before regenerating/editing artwork. |
| `../WORKSHOP_COMMENTS.md` | 137 | `6c69a05bb42493305b2400fe39a2cff2ff3a9196b3fd2f2671429816b39d3c69` | Not useful now: no publication/comment draft; reread before writing/posting thanks. |
| `../scripts/SEARCHING.md` | 168 | `9dbd52b2bcd4ba66c7465c02c0e9c816b24f4251c0fd447561a315dfc15d20b4` | Not useful now: no corpus-wide ownership/class/texture query. |
| `../PickleTools/README.md` | 86 | `628350c7bcc3ecbfa14b6fe2a4655108065ffdc3b7e07b3a6016f879a123b67f` | Useful: companion-tool catalogue and staging rules. |
| `../PickleTools/Headless/README.md` | 508 | `488a0bb2ca831792c3b6f284e6457dd6fc47ba6d0b2cf24b7e36ec6075dbb54b` | Useful: pass selection, WSL lifecycle and retained evidence. |
| `../PickleTools/docs/steps.md` | 229 | `0f897b4557a9b7414d95cfccbbea09db3fb3cce0ddac463a22dae1342678364a` | Useful: validates the step vocabulary used by the Pickle feature. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | 267 | `f6f85474f6d3dda1521d0fbb7625eee324f75b07ca2cc20dbf40951e93fc3ae2` | Not useful now: no dry-run, release or CI publication action; reread before any of them. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 139 | `135d16d524e875fad926588df27920b00eefb9a360e07c95361061072707fd21` | Useful: dispatcher is now the sole normal submission path; do not run the launcher directly or create a heartbeat. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | 131 | `90b7385b1bda5b88c20e053f2d68c5b07ff4e07eb885c53137cbafa73e6d8d80` | Useful: submit one request with owner, SHA-labelled run and evidence directory. |
| `STATUS.md` | 131 | `dc5918145eef215f4ece67ec09dc184925b707d8259f953cd18c4b8913e9b359` | Useful: current `done` stage and outstanding runtime evidence. |
| `README.md` | 89 | `5714bf389e5da411d5e087551472d457827a51b08bef953d19d1a8ebe95c2091` | Useful: feature and dependency claims. |
| `CHANGELOG.md` | 6 | `99586a12d51246f42e48df7d01fe9030c38f5f6b894c51079bb55a4db9fdd25b` | Useful: release baseline; reread before release preparation. |
| `ATTRIBUTION.md` | 21 | `9ef37fb8c7d2fd8484ab1e4d895ee46011fc203e38a5851d126e9e4a0d5f8712` | Useful: rights and dependency attribution. |
| `LICENSE` | 21 | `ae6ae5fa894c78bb5c5b661ac6b51a86ceed7b5d596f2a7b2981218b16b26a94` | Useful: MIT distribution terms. |
| `PUBLICATION.md` | 42 | `117b53189f0e79559ff393998b34b2af3378b454108b15ea195d6b9950326163` | Useful: known prepublication gaps. |
| `TESTING.md` | 27 | `ec9c548f19dd5a21e9ca1f2e4e978ec578fcf4d4dd12ccd843b78a4d8af36b57` | Useful: offline test and minimal runtime pass scope. |
| `Tests/Pickle/` | 4 files | companion + feature read | Useful: minimal English load scenario and hard-dependency map. |
| `Mod/About/About.xml` | 76 | `5470bf69e4fb8682e25afcaf5fb0af2ec1df6eb47af7db767e37753f296543b5` | Useful: distributed metadata, dependencies and Workshop text. |

Absent at this revision: `BACKLOG.md`, `NOTES.md`, `BUGS.md`, `docs/runs/`, and this file before
this entry. They have no content to read or reread; create them only when their subject exists.

## Operational consequence

The prior direct `Run-PickleWsl.ps1` queue attempt is superseded. A future runtime pass must be
submitted through `Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1` with this mod's frozen
commit SHA in `-Label`, a `local_<session-id>` owner, and a fresh repository-relative
`-EvidenceDir`. The dispatcher owns lifecycle notifications; no session heartbeat is needed.
