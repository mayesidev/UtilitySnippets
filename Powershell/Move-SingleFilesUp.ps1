# This is non-recursive, and only moves files up one level then deletes the empty folder. It will need to be run repeatedly for a series of folders, each time moving a file up one and then deleting the empty child folders.
# Un-comment the second to last line for just a listing, and un-comment the last line for actual move. One of these must be commented out to run properly.

# NOTE: if the paths contain square brackets ('[', ']') this script will not move the files or delete the folders, but can still list them.

$path = "C:\TestPath"

(Get-ChildItem $path -recurse | Where-Object {$_.psiscontainer -eq $true}) | Where-Object {($_.GetFiles().Count -eq 1) -and ($_.GetDirectories().Count -eq 0)} |
Select-Object FullName
#foreach($_){ Get-ChildItem $_.FullName | Move-Item -Destination $_.Parent.FullName ; Remove-Item $_.FullName}
