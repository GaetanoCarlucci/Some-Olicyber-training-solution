$7zipPath = "$env:PROGRAMFILES\7-Zip\7z.exe"

if (-not (Test-Path -Path $7zipPath)) {
    throw "7-Zip executable not found at '$7zipPath'"
}

Set-Alias Start-SevenZip $7zipPath

$Target = "out"

# Loop through files from "999" down to "1"
for ($i = 999; $i -ge 1; $i--) {
    $Source = "$i"

    # Set the target directory for the current iteration
    $Target = ($i - 1).ToString()
    Start-SevenZip x "$Source" -o"$Target"
}
