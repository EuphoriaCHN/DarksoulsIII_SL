%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~f0"" rem","","runas",1)(window.close)&exit

chcp 65001

cls
@echo off

title 黑暗之魂 III 读档工具

set dir_path=%~dp0
set lib_file_path=\lib\load.ps1

set lib_path=%dir_path:~0,-1%%lib_file_path%

Powershell.exe -executionpolicy remotesigned -File %lib_path%
