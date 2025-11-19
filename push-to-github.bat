@echo off
echo ========================================
echo    PUSH CODE LÊN GITHUB
echo ========================================
echo.

echo Bước 1: Kiểm tra Git status...
git status
echo.

echo Bước 2: Thêm tất cả file...
git add .
echo.

echo Bước 3: Commit...
set /p commit_message="Nhập commit message: "
git commit -m "%commit_message%"
echo.

echo Bước 4: Push lên GitHub...
git push
echo.

echo ========================================
echo    HOÀN THÀNH!
echo ========================================
echo.
echo Code đã được push lên GitHub
echo.
pause