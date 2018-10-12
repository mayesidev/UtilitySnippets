# PowerShell version < 4 does not have Get-FileHash. This is a functional replacement.
# Requires pscx.

# https://www.sapien.com/powershell/cmdlet/get-hash/

# TODO:
# Take in two paths.
# Take in hash algo (default to default (MD5)).
# If paths match, return true.
# If both are dirs, hash/compare all contents.
# If only one is dir, write-out that this only works on two files or two dirs.
# If both are files, hash/compare files.

$fileOne = "C:\TestFile1.txt"
$fileTwo = "C:\TestFile2.txt"

$fileOneHash = (Get-Hash $fileOne).HashString
$fileTwoHash = (Get-Hash $fileTwo).HashString

Write-Output $fileOneHash
Write-Output $fileTwoHash

if ($fileOneHash -eq $fileTwoHash)
{
    Write-Output $true
}
else
{
    Write-Output $false
}
