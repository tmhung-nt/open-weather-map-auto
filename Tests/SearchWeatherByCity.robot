*** Settings ***
Documentation  This is some basic info about the whole suite
Resource            ../Resources/Common.robot  # necessary for Setup & Teardown
Resource            ../Resources/BusinessFlowKeywords/OpenWeatherMap.robot  # necessary for lower level keywords in test cases
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test


*** Test Cases ***
Anonymouse user can Search By City
    [Tags]  Smoke
    Search By City

Anonymouse user can see weather of searched city
    [Tags]  Smoke  test
    See Weather By City