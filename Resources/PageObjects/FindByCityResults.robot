*** Settings ***
Documentation  Amazon top navigation

Resource            ../Data_Repository/R_FindByCityResults.robot
Resource            ../CommonUtils/UI_Utils.robot

*** Keywords ***
Verify Search Completed
    [Arguments]  ${search_keyword}
    UI_Utils.Verify Page Contains Element           ${SEARCH_BTN}
    UI_Utils.Verify Element's Attribute             ${SEARCH_STRING_BOX}   value  ${search_keyword}
    UI_Utils.Verify Page Contains Element           ${FIRST_SEARCH_RESULT}

Click City Link
    [Documentation]  Clicks on the first product in the search results list
    UI_Utils.Click On GUI Element  ${FIRST_SEARCH_RESULT_CITY_LINK}