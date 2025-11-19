@echo off
echo ========================================
echo    HUONG DAN CAI DAT MONGODB
echo ========================================
echo.
echo MongoDB chua duoc cai dat tren he thong cua ban.
echo.
echo Co 2 cach de cai dat MongoDB:
echo.
echo 1. CAI DAT MONGODB LOCAL (Khuyen khich):
echo    - Tai MongoDB Community Server tu: https://www.mongodb.com/try/download/community
echo    - Chon phien ban Windows
echo    - Cai dat va khoi dong MongoDB service
echo.
echo 2. SU DUNG MONGODB ATLAS (Cloud - Mien phi):
echo    - Dang ky tai: https://www.mongodb.com/atlas
echo    - Tao cluster mien phi
echo    - Lay connection string va thay the trong Backend/.env
echo.
echo Sau khi cai dat MongoDB, chay lai script nay de kiem tra.
echo.
echo Nhan phim bat ky de mo trang tai MongoDB...
pause > nul
start https://www.mongodb.com/try/download/community
echo.
echo Sau khi cai dat xong, chay lenh: mongod --version de kiem tra
pause