#!/bin/sh
workDir=$(pwd)
suite_path="Tests/SearchWeatherByCity.robot"

reportDir="/tests/out/${suite_path}"

robot -d ${reportDir}  --listener allure_robotframework  --log Smoke_log.html --report Smoke_report.html --output Smoke.xml \
            -i Smoke  -v BROWSER:gc  -v CUR_TEST_NAME:${test_suite_name}_Smoke  ${suite_path} &

robot -d ${reportDir}  --listener allure_robotframework  --log Regression_log.html --report Regression_report.html --output Regression.xml \
            -i Regression  -v BROWSER:ff  -v CUR_TEST_NAME:${test_suite_name}_Regression  ${suite_path} &

wait

echo -e "\n***** Merge output log files into one file *****"
echo "sleep 5 second before executing"
sleep 5


cd ${reportDir}
rebot -o output.xml -l log.html -r report.html --merge *.xml

cd ${workDir}
