#!/bin/sh

suite_path=$1

robot -d Result_execution/testTag -T -i test --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:  ${suite_path}
