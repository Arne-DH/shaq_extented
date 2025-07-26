@echo off
:input
set /p folder=Folder naam: 
REM Verwijder aanhalingstekens uit de invoer
set "folder=%folder:"=%"
if "%folder%"=="" (
    echo Geen map opgegeven. Probeer opnieuw.
    goto input
)
if not exist "%folder%\" (
    echo Map bestaat niet. Probeer opnieuw.
    goto input
)
for /R "%folder%" %%f in (*) do (
    python -m shaq --metadata --input "%%~f"
)