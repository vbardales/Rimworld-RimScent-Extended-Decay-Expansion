[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Read-Xml([string]$relativePath) {
    [xml](Get-Content -Raw (Join-Path $root $relativePath))
}

function Assert-True([bool]$condition, [string]$message) {
    if (-not $condition) { throw $message }
}

$xmlFiles = Get-ChildItem (Join-Path $root 'Mod') -Recurse -File -Filter '*.xml'
foreach ($file in $xmlFiles) {
    [xml](Get-Content -Raw $file.FullName) | Out-Null
}

$thoughtFiles = @(
    'Mod/Defs/Scents_Corpses.xml',
    'Mod/Defs/Scents_Illness.xml',
    'Mod/Defs/Scents_RottenFood.xml',
    'Mod/Diseases/Defs/Scents_Diseases.xml'
)
$thoughtNames = foreach ($path in $thoughtFiles) {
    Select-Xml -Path (Join-Path $root $path) -XPath '//ThoughtDef[defName]/defName' |
        ForEach-Object { $_.Node.InnerText }
}
$expectedThoughts = @(
    'RimScentExtended_Scent_CorpseFresh',
    'RimScentExtended_Scent_CorpseRotting',
    'RimScentExtended_Scent_CorpseDessicated',
    'RimScentExtended_Scent_Fever',
    'RimScentExtended_Scent_Infection',
    'RimScentExtended_Scent_RottenFood',
    'RimScentExtended_Scent_Sickroom'
)
$actualThoughtInventory = @($thoughtNames | Sort-Object) -join ','
$expectedThoughtInventory = @($expectedThoughts | Sort-Object) -join ','
Assert-True ($actualThoughtInventory -eq $expectedThoughtInventory) 'Owned scent thought inventory changed.'

$expectedMoodEffects = @{
    RimScentExtended_Scent_CorpseFresh      = '-2'
    RimScentExtended_Scent_CorpseRotting    = '-6'
    RimScentExtended_Scent_CorpseDessicated = '-1'
    RimScentExtended_Scent_Fever            = '-2'
    RimScentExtended_Scent_Infection        = '-4'
    RimScentExtended_Scent_RottenFood       = '-4'
    RimScentExtended_Scent_Sickroom         = '-2'
}
foreach ($path in $thoughtFiles) {
    $thoughtDocument = Read-Xml $path
    foreach ($thought in @($thoughtDocument.Defs.ThoughtDef | Where-Object { $_.defName })) {
        Assert-True ($expectedMoodEffects.ContainsKey($thought.defName)) "Unexpected concrete thought: $($thought.defName)."
        Assert-True ($thought.stages.li.baseMoodEffect -eq $expectedMoodEffects[$thought.defName]) "Unexpected mood effect for $($thought.defName)."
    }
}

$patchThoughts = Select-String -Path (Join-Path $root 'Mod/Patches/Illness.xml'), (Join-Path $root 'Mod/Diseases/Patches/Diseases.xml') -Pattern '<thought>([^<]+)</thought>' |
    ForEach-Object { $_.Matches.Groups[1].Value }
$missingOwnedReferences = $patchThoughts | Where-Object { $_ -like 'RimScentExtended_*' -and $_ -notin $thoughtNames }
Assert-True ($null -eq $missingOwnedReferences -or @($missingOwnedReferences).Count -eq 0) "Patch references missing owned thoughts: $($missingOwnedReferences -join ', ')."
Assert-True ($patchThoughts -contains 'RimScent_VomitScent') 'Food poisoning must reuse RimScent_VomitScent.'

$frenchFiles = Get-ChildItem (Join-Path $root 'Mod') -Recurse -File -Filter '*.xml' |
    Where-Object { $_.FullName -match '[\\/]Languages[\\/]French[\\/]' }
$frenchEntries = foreach ($file in $frenchFiles) {
    Select-String -Path $file.FullName -Pattern '<(RimScentExtended_[^>]+)>' |
        ForEach-Object { $_.Matches.Groups[1].Value }
}
$frenchThoughtNames = $frenchEntries | ForEach-Object { ($_ -split '\.')[0] } | Sort-Object -Unique
$actualFrenchThoughtInventory = @($frenchThoughtNames) -join ','
Assert-True ($actualFrenchThoughtInventory -eq $expectedThoughtInventory) 'French DefInjected coverage does not match owned thoughts.'
Assert-True (@($frenchEntries).Count -eq 14) 'French coverage must provide a label and description for every owned thought.'

$about = Read-Xml 'Mod/About/About.xml'
$dependencyIds = @($about.ModMetaData.modDependencies.li.packageId)
Assert-True ($dependencyIds -contains 'reo.RimScent') 'RimScent must remain a hard dependency.'
Assert-True ($dependencyIds -contains 'nelim.rimscent.extended') 'RimScent Extended must remain a hard dependency.'
Assert-True ($about.ModMetaData.url -eq 'https://github.com/vbardales/Rimworld-RimScent-Extended-Decay-Expansion') 'Repository URL changed unexpectedly.'
Assert-True ($about.ModMetaData.description.TrimEnd().EndsWith('[url=https://github.com/vbardales/Rimworld-RimScent-Extended-Decay-Expansion]Source code on GitHub[/url]')) 'Workshop source link must end the description.'

$diseasesFolder = @(Select-Xml -Path (Join-Path $root 'Mod/LoadFolders.xml') -XPath "/loadFolders/v1.6/li[@IfModActive='onegative.communicablediseases' and text()='Diseases']")
Assert-True ($diseasesFolder.Count -eq 1) 'Communicable Diseases support must remain conditionally loaded.'

Write-Host "PASS: $($xmlFiles.Count) XML files, $($expectedThoughts.Count) owned thoughts, and $($frenchEntries.Count) French entries validated."
