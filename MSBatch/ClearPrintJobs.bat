REM stop Spooler service (print spooler)
sc stop Spooler

REM pause for a few seconds while it stops
timeout 5 > nul

REM clear the queued documents folder
cd "C:\Windows\System32\spool\PRINTERS"
del *.* /F /Q

REM pause for a few more seconds
timeout 5 > nul

REM start Spooler service (print spooler)
sc start Spooler
