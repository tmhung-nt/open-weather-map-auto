*** Settings ***
Documentation    Amazon top navigation

Resource    ../Data_Repository/R_FindByCityResults.robot
Resource    ../CommonUtils/UI_Utils.robot

*** Keywords ***
Verify Search Completed
    [Arguments]                              ${search_keyword}                 ${search_result}=${EMPTY}
    UI_Utils.Verify Page Contains Element    ${SEARCH_BTN}
    UI_Utils.Verify Element's Attribute      ${SEARCH_STRING_BOX}              value                               ${search_keyword}
    Run Keyword If                           "${search_result}"=="${EMPTY}"    Verify Search Results Are Shown  
    Run Keyword Unless                       "${search_result}"=="${EMPTY}"    Verify Not Found Alert Is Shown


Verify Search Results Are Shown
    UI_Utils.Verify Page Contains Element            ${FIRST_SEARCH_RESULT}    10s
    UI_Utils.Verify Page Does NOT Contain Element    ${NOT_FOUND_ALERT}        1s

Verify Not Found Alert Is Shown
    Verify Page Contains Element            ${NOT_FOUND_ALERT}
    Verify Page Does NOT Contain Element    ${FIRST_SEARCH_RESULT}    1s

Click City Link
    [Documentation]                  Clicks on the first product in the search results list
    UI_Utils.Click On GUI Element    ${FIRST_SEARCH_RESULT_CITY_LINK}