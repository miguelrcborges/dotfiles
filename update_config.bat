@echo off

:: Nvim
del /q /s /f "%USERPROFILE%\AppData\Local\nvim"
xcopy /y /e /s "dots\.config\nvim" "%USERPROFILE%\AppData\Local\nvim"

:: Bash
del /q "%USERPROFILE%\.bashrc"
xcopy /y /q "dots\.bashrc" "%USERPROFILE%\.bashrc"

:: MPV
del /q "%USERPROFILE%\Documents\mpv\shaders"
del /q "%USERPROFILE%\Documents\mpv\input.conf"
del /q "%USERPROFILE%\Documents\mpv\mpv.conf"
xcopy /y /e /s "dots\.config\mpv\shaders" "%USERPROFILE%\Documents\mpv\shaders"
xcopy /y /q "dots\.config\mpv\input.conf" "%USERPROFILE%\Documents\mpv\input.conf"
xcopy /y /q "dots\.config\mpv\mpv.conf" "%USERPROFILE%\Documents\mpv\mpv.conf"


:: Alacritty
del /q /s /f "%APPDATA%\alacritty"
xcopy /y /e /s "dots\.config\alacritty" "%APPDATA%\alacritty"
del /q "%APPDATA%\alacritty\alacritty.yml"
xcopy /y /q "windows\alacritty.yml" "%APPDATA%\alacritty\alacritty.yml"

exit
