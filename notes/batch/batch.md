# Batch file / Command line examples

## Adding folder to PATH environment variable (Temporarily?)
`set PATH=%PATH%;C:\YourFolderpath`

## Remove directory - RD
```
Syntax
      RD pathname
      RD /S pathname
      RD /S /Q pathname
   
Key
   /S  : Delete all files and subfolders
         in addition to the folder itself.
         Use this to remove an entire folder tree.

   /Q  : Quiet - do not display Y/N confirmation
```
   
## Example of implementing muliple user options in batch file
```
@echo off
setlocal enabledelayedexpansion

:Menu
echo MENU
echo     1. Option One
echo     2. Option Two
echo     3. Option Three
echo     4. Exit
echo Type the number for your option and then ENTER
set /p _menuOption=Option: 
if "%_menuOption%" == "1" (
    call :ProcOne
) else (
    if "%_menuOption%" == "2" (
        call :ProcTwo
    ) else (
        if "%_menuOption%" == "3" (
            call :ProcThree
        ) else (
            if "%_menuOption%" == "4" (
				cls
                echo Exiting
                goto :eof
            ) else (
				cls
                echo Unrecognized menu option. Try again.
            )
        )
    )
)
goto :Menu

:ProcOne
cls
echo Doing Option One actions...
echo ... done with option One Actions
goto :eof

:ProcTwo
cls
echo Doing Option Two actions...
echo ... done with option Two Actions
goto :eof

:ProcThree
cls
echo Doing Option Three actions...
echo ... done with option Three Actions
goto :eof
```

[home](/jason-notes)<br>