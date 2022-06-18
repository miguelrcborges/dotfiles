@echo off

:: Nvim
del /q /s /f "%USERPROFILE%\AppData\Local\nvim"
xcopy /y /e /s "dots\.config\nvim" "%USERPROFILE%\AppData\Local\nvim"

:: Bash
del /q "%USERPROFILE%\.bashrc"
xcopy /y /q "dots\.bashrc" "%USERPROFILE%\.bashrc"

exit
