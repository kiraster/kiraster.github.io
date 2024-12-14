@echo off
setlocal enabledelayedexpansion

:: 假设你的文本文件是 mkdir.txt
set "file=mkdir.txt"

:: 检查文件是否存在
if not exist "%file%" (
    echo 文件 "%file%" 不存在！
    exit /b
)

:: 读取文件并创建目录和 index.md 文件
for /f "delims=" %%i in (%file%) do (
    set "dir=%%i"
    echo 正在创建目录: !dir!
    
    :: 创建目录
    mkdir "!dir!" 2>nul

    :: 创建 index.md 文件并写入内容
    set "mdfile=!dir!\_index.md"
    echo --- > "!mdfile!"
    echo title: "!dir!" >> "!mdfile!"
    echo description: "This is an example category" >> "!mdfile!"
    echo slug: "!dir!" >> "!mdfile!"
    echo image: "!dir!.jpg" >> "!mdfile!"
    echo style: >> "!mdfile!"
    echo   background: "#2a9d8f" >> "!mdfile!"
    echo   color: "#fff" >> "!mdfile!"
    echo --- >> "!mdfile!"

    echo 目录 "!dir!" 和 index.md 文件已创建。
)

echo 所有目录和 index.md 文件创建完成！
pause
