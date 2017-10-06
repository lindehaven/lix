#!/usr/bin/env bash

# :: Calculate the start timestamp
start=$(date +%s.%N)

# :: Beginning of test suite
passed=0
script="../bin/Release/lix.exe"

testcase="Too short"
expected=$((128-1))
$script < test_1_too_short.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))

testcase="Very Easy"
expected=13
$script < test_2_very_easy.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))

testcase="Easy"
expected=33
$script < test_3_easy.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))

testcase="Medium"
expected=41
$script < test_4_medium.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))

testcase="Difficult"
expected=57
$script < test_5_difficult.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))

testcase="Very difficult"
expected=62
$script < test_6_very_difficult.txt >/dev/null
result=$?
if [ $result != $expected ]; then echo error: Failure in $testcase: Expected $expected but was $result; exit 1; fi
((passed++))
# :: End of test suite

# :: Calculate the test execution time
end=$(date +%s.%N)    
duration=`echo "$start" "$end" | awk '{printf "%f\n", $2-$1}'`
hh=`echo "$duration" | awk '{printf "%d\n", $1/3600}'`
mm=`echo "$duration" | awk '{printf "%02d\n", $1/60%60}'`
ss=`echo "$duration" | awk '{printf "%02d\n", $1%60%60}'`
ms=`echo "$duration" | awk '{printf "%02d\n", ($1+0.005)*100%100}'`

# :: Successful test suite execution
echo Success: $passed tests passed.
echo Test time: $hh:$mm:$ss.$ms

exit 0
