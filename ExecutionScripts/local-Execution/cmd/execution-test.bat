set suite_path=%1

call robot -d Result_execution/testTag -i test  --listener allure_robotframework;test-results\allure -v SELENIUM_HUB:   %suite_path%

PAUSE