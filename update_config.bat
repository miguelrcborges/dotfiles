@echo off
del /q /s /f %USERPROFILE%\AppData\Local\nvim
copy /y dots\.config\nvim %USERPROFILE%\AppData\Local\nvim
exit
