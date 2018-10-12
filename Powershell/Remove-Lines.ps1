#### MAKE SURE THIS STILL WORKS (TEST+VERIFY ALL PARAM CASES) ####

# Script initially based on answer found here:
# http://superuser.com/questions/117650/deleting-entire-lines-in-a-text-file-based-on-a-partial-string-match-with-window

Param(
    [string] $inFilePath = "inFilePath",
    [string] $outFilePath = "outFilePath",
    [string] $linesNotLike = "linesNotLike"
)

function ShowUsage(){
    Write-Output "=== Remove-Lines Usage Notes ===`n"
    Write-Output "inFilePath (first parameter, required) - the file to remove lines from."
    Write-Output "outFilePath (second parameter, optional) - the output file to write remaining lines to.`n"
    Write-Output "linesNotLike (third parameter, required) - the lines to match to remove from the file at inFilePath.`n"
    Write-Output "** If outFilePath is not specified, the file at inFilePath will have its contents removed and overwritten. **"
    Write-Output "** If file at outFilePath already exists, the contents will be overwritten. **"
    return
}

function CheckParams(){
    $validParams = true
    $invalidParamMessage = ""

    if($inFilePath -eq "inFilePath"){
        $invalidParamMessage += "inFilePath parameter must be specified!`n"
        $validParams = false
    }

    if(Test-Path $inFilePath){
        $invalidParamMessage += "inFilePath must point to a valid file!`n"
        $validParams = false
    }    

    if($linesNotLike -eq "linesNotLike"){
        $invalidParamMessage += "linesNotLike parameter must be specified!`n"
        $validParams = false
    }

    if(!$validParams){
        Write-Output $invalidParamMessage
        ShowUsage
    }

    return $validParams
}

function RemoveLines(){
    if(CheckParams){
        if($outFilePath -eq "outFilePath"){
            $outFilePath = $inFilePath
        }

        Get-Content $inFilePath | Where-Object {$_ -notmatch $linesNotLike} | Set-Content $outFilePath
    }
}

RemoveLines
