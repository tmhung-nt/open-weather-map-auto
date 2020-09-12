#!/bin/sh

suite_path=$1
tag=$2

robot -d Result_execution/testTag -i ${tag} --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:  ${suite_path}
