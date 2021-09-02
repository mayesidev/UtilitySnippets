# This script performs a case-insensitive find-replace.

ECHO "Processing..."

$findReplaceDict = @{"Find1"="Replace1";"Find2"="Replace2";"Find3"="Replace3"}

$path = "C:\full_file_path\here.txt"

# Had an issue with some files that have UTF-8 encoding. This had to be preserved for the certain characters above the ASCII range (and for an XML Encoding declaration).
$content = (Get-Content $path -Encoding UTF8 -Raw)
foreach ($findReplaceText in $findReplaceDict.GetEnumerator())
{
    $findText = $findReplaceText.Key
    $replaceText = $findReplaceText.Value
    $content = $content -replace $findText, $replaceText
}

# Related to the above, an XML file was designated as UTF-8 encoded, and a file parser down the line threw an error if it wasn't really UTF-8 encoded.
# Out-File with utf8 Encoding makes the file UTF-8-BOM, which the file parser also doesn't like. Changing the file encoding wasn't an option in this case.
#$content | Out-File $path -Encoding utf8

# This writes the file back-out, maintaining the encoding as UTF-8 (without BOM).
[IO.File]::WriteAllLines($path,$content)

ECHO "Complete!"