@echo off
echo.
echo =============================================
echo    Sahara App - Flutter Demo Runner
echo =============================================
echo.

echo Checking Flutter installation...
flutter --version
if %errorlevel% neq 0 (
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter from https://flutter.dev/
    pause
    exit /b 1
)

echo.
echo Getting Flutter dependencies...
flutter pub get

if %errorlevel% neq 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo Starting Sahara App...
echo Make sure you have:
echo 1. Android device connected OR Android emulator running
echo 2. iOS simulator running (if on macOS)
echo.

flutter run

pause