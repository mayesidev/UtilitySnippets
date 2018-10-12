$path = 'C:\FolderPathHere\*.txt'
$compareList = 'C:\listToMatch1.txt'
$otherCompareList = 'C:\listToMatch2.txt'
$outFile = 'C:\output.txt'

$fileList = Get-ChildItem $path | Select-Object BaseName -Unique

# Clear existing out file contents to avoid endless appending- if it exists...
if(Test-Path $outFile){Clear-Content $outFile}

$fileList | ForEach-Object { if(-not ((select-string -Path $compareList -Pattern $_.BaseName.Trim() -Quiet) -or (select-string -Path $otherCompareList -Pattern $_.BaseName.Trim() -Quiet))){ Out-File -FilePath $outFile -Append -InputObject $_.BaseName.Trim() }}
