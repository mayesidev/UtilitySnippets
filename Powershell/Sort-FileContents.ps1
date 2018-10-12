Param(
    [string] $inFilePath = "defaultInPathValue",
    [string] $outFilePath = "defaultOutPathValue"
)

function ShowUsage(){
    Write-Output "=== Sort-FileContents Usage Notes ===`n"
    Write-Output "inFilePath (first parameter, required) - the file to sort the lines of."
    Write-Output "outFilePath (second parameter, optional) - the output file to write sorted lines to.`n"
    Write-Output "** If outFilePath is not specified, the file at inFilePath will have its contents sorted and overwritten. **"
    Write-Output "** If a file already exists at outFilePath, the contents will be overwritten. **"
    return
}

if($inFilePath -eq "defaultInPathValue"){
    Write-Output "inFilePath parameter must be specified!`n"
    ShowUsage
}
else{
    if(Test-Path $inFilePath){
        if($outFilePath -eq "defaultOutPathValue"){
            $outFilePath = $inFilePath
        }

        (Get-Content $inFilePath) | Sort-Object > $outFilePath
    }
    else{
        Write-Output "inFilePath must point to a valid file!`n"
        ShowUsage
    }
}
