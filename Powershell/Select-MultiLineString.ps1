$usePath = "C:\TestFolderPath\*.txt"
$matchString = "(?s)matchTextLiteral1.matchTextLiteral2.matchTextLiteral3.matchTextLiteral4"

ForEach( $file in get-childitem $usePath){
    $content = [IO.File]::ReadAllText($file)
    if( $content -match $matchString ){
        Write-Output $file
    }
}