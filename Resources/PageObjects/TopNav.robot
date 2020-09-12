*** Settings ***
Documentation  Amazon top navigation

Resource            ../Data_Repository/R_TopNav.robot
Resource            ../CommonUtils/UI_Utils.robot

*** Keywords ***
Search By City From Search Box
    [Arguments]  ${search_keyword}
    Enter Search Term   ${search_keyword}
    Submit Search By Press Enter

Enter Search Term
    [Arguments]  ${search_keyword}
    UI_Utils.Input Text To TextBox  ${SEARCH_BY_CITY_BOX}   ${search_keyword}

Submit Search By Press Enter
    Press Keys     None      RETURN