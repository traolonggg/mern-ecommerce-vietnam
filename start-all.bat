@echo off
echo Starting MERN Stack Ecommerce Project...
echo.

echo Starting Backend Server...
start "Backend Server" cmd /k "cd Backend && npm run server"

timeout /t 3 /nobreak > nul

echo Starting Frontend Application...
start "Frontend App" cmd /k "cd Frontend && npm start"

timeout /t 3 /nobreak > nul

echo Starting Admin Panel...
start "Admin Panel" cmd /k "cd Admin && npm start"

echo.
echo All applications are starting...
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000  
echo Admin: http://localhost:3001
echo.
pause