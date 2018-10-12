# This implementation was initially based on this StackOverflow answer:
# http://stackoverflow.com/questions/3920383/how-to-use-powershell-select-string-to-find-more-than-one-pattern-in-a-file

Param(
	[string] $inFilePath = "inFilePath",
	[string] $outFilePath = "outFilePath",
	[string[]] $matchStrings = ("string1","string2"),
	[string[]] $notMatchStrings = ("string3","string4")
)

#implement checkParams

filter MultiSelectString( [string[]]$matchPatterns, [bool]$shouldMatch ) 
{
    foreach($pattern in $matchPatterns)
    {
        $didMatch = @($_ | select-string -pattern $pattern )
		# Apparently '-ne' is not a commutative operator. Don't flip the below statement...
        if($shouldMatch -ne $didMatch)
        {
			return
        }
    }

   $_
}

$inFilePath = "C:\TestFolderPath\*.txt"
$outFilePath = "C:\outFilePath.txt"
$matchStrings = ("MatchMe")
$notMatchStrings = ("NotMe")

Get-ChildItem $inFilePath | MultiSelectString $matchStrings $TRUE | MultiSelectString $notMatchStrings $FALSE | select-object Name -unique > $outFilePath
