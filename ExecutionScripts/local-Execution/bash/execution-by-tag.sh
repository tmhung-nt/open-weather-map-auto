set suite_path=%1
set tag=%2

call robot -d Result_execution/testTag -i %tag%  --listener allure_robotframework;test-results\allure -v SELENIUM_HUB:  %suite_path%

PAUSE