# Pickle test suite

Development-only companion for RimScent Extended: Decay Expansion. It is never included in `Mod/`
or uploaded to the Workshop.

`01-minimal-load.feature` is the minimal hard-dependency pass. It verifies that the seven owned
thought definitions load in a real RimWorld process and that the load produces no errors. This is
the runtime counterpart to the offline XML contract test; it does not claim to test RimWorld's
dependency loader or RimScent's implementation.

Run it only through the shared WSL launcher:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedDecayExpansion -DepMap wsl-deps.sans-facultatifs.map -Language English
```

The optional Communicable Diseases pass is not runnable at present. Its required Workshop item
`3263015203` has been removed from Steam and is not available in this workspace. This is recorded
as runtime-unverified, not a passing or failing integration result.
