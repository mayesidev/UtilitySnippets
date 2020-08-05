# This script was created because I had a number of files with
# the same name in an arbitrary number of different formats.
# I needed these files to be in a single folder per set of files.

# Path to search for files (collections of Humble Book Bundles)
$searchPath = 'E:\Books\Humble Bundle*\*'
# Path to create folders and then copy files into
$outputFolderPath = 'E:\Books\ToImport\'

# Get list of all paths
$fileList = Get-ChildItem $searchPath

# Create folders for each unique file name without extension (if doesn't exist). Void to suppress output.
$fileList | Select-Object BaseName -Unique | ForEach-Object { if(!(Test-Path ($outputFolderPath+$_.BaseName.Trim()) -PathType Container)){ [void](New-Item -ItemType Directory -Force -Path ($outputFolderPath+$_.BaseName.Trim())) } }

# Move each file into the folder with the same name
# This writes out an error if a file to move already exists. This is OK because we don't want duplicates anyway.
$fileList | ForEach-Object { Move-Item $_.FullName -Destination ($outputFolderPath+$_.BaseName.Trim()) }
