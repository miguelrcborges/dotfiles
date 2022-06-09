@echo off

:: Nvim
del /q /s /f %USERPROFILE%\AppData\Local\nvim
xcopy /y /e /s dots\.config\nvim %USERPROFILE%\AppData\Local\nvim

:: Bash
del /q /s /f %USERPROFILE%\.bashrc
xcopy /y /e /s dots\.bashrc %USERPROFILE\.bashrc

exit
