*** Settings ***
Documentation  This is some basic info about the whole suite
Resource            ../Resources/Common.robot  # necessary for Setup & Teardown
Resource            ../Resources/BusinessFlowKeywords/OpenWeatherMap.robot  # necessary for lower level keywords in test cases
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test


*** Test Cases ***
Anonymouse User Searches By Valid City Name
    [Tags]  Smoke
    Search By City      ho chi minh

Anonymouse User Searches By Invalid City Name
    [Tags]  Smoke
    Search By City      hoChiMinh       not found


Anonymouse user can see weather of searched city
    [Tags]  Smoke
    See Weather By City     ho chi minh