@echo off
setlocal enabledelayedexpansion

:: ��������ı��ļ��� mkdir.txt
set "file=mkdir.txt"

:: ����ļ��Ƿ����
if not exist "%file%" (
    echo �ļ� "%file%" �����ڣ�
    exit /b
)

:: ��ȡ�ļ�������Ŀ¼�� index.md �ļ�
for /f "delims=" %%i in (%file%) do (
    set "dir=%%i"
    echo ���ڴ���Ŀ¼: !dir!
    
    :: ����Ŀ¼
    mkdir "!dir!" 2>nul

    :: ���� index.md �ļ���д������
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

    echo Ŀ¼ "!dir!" �� index.md �ļ��Ѵ�����
)

echo ����Ŀ¼�� index.md �ļ�������ɣ�
pause
