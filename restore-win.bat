@echo off
chcp 65001 >nul
REM ========================================================
REM Antigravity 2.0 zh-Hant-HK package - restore
REM ========================================================
title Antigravity 2.0 繁體中文（香港）套件 - 還原

echo.
echo ========================================================
echo   Antigravity 2.0 繁體中文（香港）套件 - 還原工具
echo ========================================================
echo.

REM Check Node.js
echo [前置檢查] 正在檢查 Node.js...
node -v >nul 2>nul
if errorlevel 1 (
    echo.
    echo [錯誤] 找不到 Node.js！
    echo   請先從 https://nodejs.org/ 安裝 Node.js LTS，
    echo   並確保 node 已加入 PATH。
    echo.
    pause
    exit /b 1
)

REM Check local @electron/asar
if not exist "%~dp0node_modules\@electron\asar\bin\asar.js" (
    echo.
    echo [錯誤] 找不到本地 @electron/asar CLI。
    echo   請先在套件根目錄執行：
    echo     npm install
    echo   然後再重新執行此還原腳本。
    echo.
    pause
    exit /b 1
)

echo [前置檢查] Node.js 與 asar CLI 已就緒。
echo.

echo [1/3] 正在關閉 Antigravity 程序...
taskkill /f /im Antigravity.exe /t >nul 2>nul
timeout /t 2 /nobreak >nul

echo.
echo [2/3] 正在還原官方原版檔案...
node "%~dp0localization_engine.js" --restore %*

echo.
echo [3/3] 還原完成。
echo.
echo [提示] 請手動重新啟動 Antigravity 以套用變更。
echo.
pause
