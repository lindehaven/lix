@echo off

:: Calculate the start timestamp
set _time=%time%
set /a _hours=100%_time:~0,1%%%100,_min=100%_time:~3,2%%%100,_sec=100%_time:~6,2%%%100,_cs=%_time:~9,2%
set /a _started=_hours*60*60*100+_min*60*100+_sec*100+_cs

:: Beginning of test suite
set passed=0

set script=..\bin\Release\lix.exe

set testcase="Too short"
set expected=-1
%script% < test_1_too_short.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1

set testcase="Very Easy"
set expected=13
%script% < test_2_very_easy.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1

set testcase="Easy"
set expected=33
%script% < test_3_easy.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1

set testcase="Medium"
set expected=41
%script% < test_4_medium.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1

set testcase="Difficult"
set expected=57
%script% < test_5_difficult.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1

set testcase="Very difficult"
set expected=62
%script% < test_6_very_difficult.txt >nul
if not "%errorlevel%" == "%expected%" ( echo error: Failure in %testcase%: Expected %expected% but was %errorlevel% & exit /b 1 )
set /a passed=passed+1
:: End of test suite

:: Calculate the test execution time
set _time=%time%
set /a _hours=100%_time:~0,1%%%100,_min=100%_time:~3,2%%%100,_sec=100%_time:~6,2%%%100,_cs=%_time:~9,2%
set /a _duration=_hours*60*60*100+_min*60*100+_sec*100+_cs-_started
set /a _hours=_duration/60/60/100,_min=100+_duration/60/100%%60,_sec=100+(_duration/100%%60%%60),_cs=100+_duration%%100

:: Successful test suite execution
echo Success: %passed% tests passed.
echo Test time: %_hours%:%_min:~-2%:%_sec:~-2%.%_cs:~-2%
exit /b 0
