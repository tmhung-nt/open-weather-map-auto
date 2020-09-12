*** Settings ***
Documentation    This is some basic info about the whole suite
Resource         ../Resources/Common.robot                                 # necessary for Setup & Teardown
Resource         ../Resources/BusinessFlowKeywords/OpenWeatherMap.robot    # necessary for lower level keywords in test cases
Library          DataDriver    file=../Files/input_cities.csv   
Test Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test
Test Template    Search City Template

*** Test Cases ***
Search by ${search_keyword} and verify ${search_result}


*** Keywords ***
Search City Template
    [Arguments]            ${search_keyword}    ${search_result}   
    See Weather By City    ${search_keyword}    ${search_result}