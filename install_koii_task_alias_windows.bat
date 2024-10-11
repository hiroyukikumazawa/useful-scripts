@echo off
SETLOCAL

REM Define the alias command
SET ALIAS_COMMAND=npx @_koii/create-task-cli@latest

REM Define the batch file path
SET BATCH_FILE=C:\Windows\System32\koii-task.bat

REM Check if the alias batch file already exists
IF EXIST "%BATCH_FILE%" (
    echo Alias already exists at %BATCH_FILE%.
) ELSE (
    REM Create the batch file
    (
        echo @echo off
        echo %ALIAS_COMMAND% %%*
    ) > "%BATCH_FILE%"
    echo Alias created at %BATCH_FILE%. You can now run 'koii-task' from any command prompt.
)

ENDLOCAL
