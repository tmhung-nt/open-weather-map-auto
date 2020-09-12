set suite_path=Tests/AmazonTests.robot
set workdir=%cd%
set reportDir= Result_execution\%suite_path%

call robot -d %reportDir%  --listener allure_robotframework -v SELENIUM_HUB: --log Smoke_log.html --report Smoke_report.html --output Smoke.xml -i Smoke %suite_path%
echo "sleep 5 second before executing"
ping 127.0.0.1 -n 6 > nul

call robot -d %reportDir%  --listener allure_robotframework -v SELENIUM_HUB: --log Regression_log.html --report Regression_report.html --output Regression.xml -i Regression %suite_path%
echo "sleep 5 second before executing"
ping 127.0.0.1 -n 6 > nul

REM Merge output log files into one file
echo "sleep 2 second before executing"
ping 127.0.0.1 -n 3 > nul


cd %reportDir%
call rebot -o output.xml -l log.html -r report.html --merge *.xml

cd %workdir%

PAUSE