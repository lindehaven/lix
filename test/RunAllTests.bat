@echo off
set errorlevel=

echo|set /p="Too short text      : "
..\bin\Release\lix.exe < test_1_too_short.txt >nul
if "%errorlevel%" neq "-1" (
  echo FAIL
  exit /b 1
)
echo PASS

echo|set /p="Very easy text      : "
..\bin\Release\lix.exe < test_2_very_easy.txt >nul
if "%errorlevel%" neq "13" (
  echo FAIL
  exit /b 1
)
echo PASS

echo|set /p="Easy text           : "
..\bin\Release\lix.exe < test_3_easy.txt >nul
if /i "%errorlevel%" neq "33" (
  echo FAIL
  exit /b 1
)
echo PASS

echo|set /p="Medium text         : "
..\bin\Release\lix.exe < test_4_medium.txt >nul
if /i "%errorlevel%" neq "41" (
  echo FAIL
  exit /b 1
)
echo PASS

echo|set /p="Difficult text      : "
..\bin\Release\lix.exe < test_5_difficult.txt >nul
if /i "%errorlevel%" neq "57" (
  echo FAIL
  exit /b 1
)
echo PASS

echo|set /p="Very difficult text : "
..\bin\Release\lix.exe < test_6_very_difficult.txt >nul
if /i "%errorlevel%" neq "62" (
  echo FAIL
  exit /b 1
)
echo PASS

exit /b 0