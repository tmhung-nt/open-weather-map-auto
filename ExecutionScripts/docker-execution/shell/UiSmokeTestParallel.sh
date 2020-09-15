#!/bin/sh
workDir=$(pwd)
suite_path="UI/Tests"

reportDir="/tests/out/${suite_path}"

pabot -d ${reportDir}  --listener allure_robotframework  --log Chrome_log.html --report Chrome_report.html --output Chrome_output.xml \
             -v BROWSER:gc  -v CUR_TEST_NAME:${test_suite_name}_Chrome  ${suite_path}/SearchWeatherByCity.robot &

pabot -d ${reportDir}  --listener allure_robotframework  --log Firefox_log.html --report Firefox_report.html --output Firefox_output.xml \
             -v BROWSER:ff  -v CUR_TEST_NAME:${test_suite_name}_Firefox  ${suite_path}/SearchWeatherByCity.robot &

robot -d ${reportDir}  --listener allure_robotframework  --log Chrome_log.html --report Chrome_report.html --output Chrome_output.xml \
             -v BROWSER:gc  -v CUR_TEST_NAME:${test_suite_name}_Chrome  ${suite_path}/SearchByCityDataDriven.robot &
wait

echo -e "\n***** Merge output log files into one file *****"
echo "sleep 5 second before executing"
sleep 5


cd ${reportDir}
rebot -o output.xml -l log.html -r report.html --merge *.xml

cd ${workDir}
