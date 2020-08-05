$searchPath = 'E:\Books\ToImport\*'

$fileList = Get-ChildItem $searchPath -Exclude "*.cbz","*.prc","*.mobi","*.pdf","*.epub" -Recurse

$fileList | ForEach-Object { Write-Output $_.FullName }