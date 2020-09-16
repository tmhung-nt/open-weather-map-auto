#!/bin/sh
workDir=$(pwd)
suite_path="UI/Tests"

reportDir="/tests/out/${suite_path}"

pabot  --testlevelsplit -d ${reportDir}  --listener allure_robotframework  --log Chrome_Parallel_log.html --report Chrome_Parallel_report.html --output Chrome_Parallel_output.xml \
             -v BROWSER:gc  -v CUR_TEST_NAME:${test_suite_name}_Chrome  ${suite_path}/SearchWeatherByCity.robot 

pabot  --testlevelsplit -d ${reportDir}  --listener allure_robotframework  --log Firefox_Paralle_log.html --report Firefox_Paralle_report.html --output Firefox_Paralle_output.xml \
             -v BROWSER:ff  -v CUR_TEST_NAME:${test_suite_name}_Firefox  ${suite_path}/SearchWeatherByCity.robot 

robot -d ${reportDir}  --listener allure_robotframework  --log data_driven_log.html --report data_driven_report.html --output data_driven_output.xml \
             -v BROWSER:gc  -v CUR_TEST_NAME:${test_suite_name}_data_driven  ${suite_path}/SearchByCityDataDriven.robot 


