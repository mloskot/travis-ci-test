#!/usr/bin/env powershell
#Requires -RunAsAdministrator

$version = '3.14.2'
$prefix = 'C:\cmake'

$major, $minor, $patch = $version.split('.');
try {
  $currentVersion = (cmake --version 2>&1);
  $currentVersion = $currentVersion.split(' ')[2] # cmake version X.Y.Z
} catch {
  $currentVersion = $null;
}
if ($currentVersion -ne $null) {
  $currentMajor, $currentMinor, $currentPatch = $currentVersion.split('.');
  $currentPatch = $currentPatch.split('-')[0] # 0-rcX to 0
  $patch = $patch.split('-')[0]
  if ([Version]::new($currentMajor, $currentMinor, $currentPatch) -ge `
      [Version]::new($major, $minor, $patch)) {
        Write-Host ('Installed CMake {0} is not newer than {1}' -f $currentVersion.ToString(), $version);
        exit 0;
  }
}


$name = ('cmake-{0}-win64-x64' -f $version);
$zip = ('{0}.zip' -f $name);
$out = ('{0}\{1}'-f $PSScriptRoot, $zip);
if (-not (Test-Path -Path $out -PathType Leaf)) {
  $url = ('https://cmake.org/files/v{0}.{1}/{2}' -f $major, $minor, $zip);
  Write-Host ('Downloading CMake from {0}' -f $url)
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

try {
  Write-Host ("Installing {0} in {1}" -f $out, $prefix)
  Expand-Archive $out -DestinationPath C:\
  Rename-Item -Path ('C:\{0}' -f $name) -NewName $prefix
} catch {
  Write-Host $_.Exception.Message
  exit 1
}
Remove-Item -Path $out -Force

$env:Path = ('{0}\bin' -f $prefix), $env:Path -join ";"
[System.Environment]::SetEnvironmentVariable('Path', $env:Path, [System.EnvironmentVariableTarget]::Machine)

Get-Command cmake
cmake --version
