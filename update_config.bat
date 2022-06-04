@echo off
del /q /s /f %USERPROFILE%\AppData\Local\nvim
xcopy /y /e /s dots\.config\nvim %USERPROFILE%\AppData\Local\nvim
exit
