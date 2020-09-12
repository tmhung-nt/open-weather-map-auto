set suite_path=%1

call robot -d Result_execution/NoRunTag -e NoRun  --listener allure_robotframework;test-results\allure -v SELENIUM_HUB:  %suite_path%

PAUSE