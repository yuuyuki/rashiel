@echo off
setlocal enabledelayedexpansion

set /p RLDEV="Enter the path to RLDev: "

if "!RLDEV!"=="" (
    for %%a in ("%~dp0..\..") do set "grandparent=%%~fa"
    set RLDEV=!grandparent!
    echo [*] Using default RLDev path: !RLDEV!
)

for %%a in (mtl-scripts\*.ke) do (
    set /a count=!count!+1
    echo [!count!] Processing file: %%a
    ..\rlc -v -e utf-8 -i ..\GAMEEXE.INI %%a

    set "exitcode=!errorlevel!"

    if !exitcode! neq 0 (
        echo [!] Error processing %%a exit code !exitcode!
        rem Stop on first error:
        exit /b !exitcode!
    ) else (
        echo [*] Successfully processed %%a
    )
)

if exist SEEN_EN.TXT (
    del SEEN_EN.TXT
)

..\kprl -a SEEN_EN.TXT mtl-scripts\*.txt
echo [*] SEEN_EN.TXT generated successfully.

echo Do you want to copy the file to the parent folder? (Y/N)
set /p choice="> "
if /i "%choice%"=="Y" (
    copy /-y SEEN_EN.TXT ..\SEEN.TXT
    echo [*] SEEN.TXT copied successfully.
)

endlocal
pause
