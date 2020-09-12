*** Settings ***
Documentation  Amazon top navigation
Resource            ../Data_Repository/R_FindByCityResults.robot
Resource            ../CommonUtils/UI_Utils.robot
Resource            ../CommonUtils/StringUtils.robot

*** Variables ***
${HOURLY_FORCAST_TXT}       Hourly forecast
${MINUTE_FORCAST_TXT}       Minute forecast
${8_DAYS_FORCAST_TXT}       8-day forecast
${CITY_NAME}                css:div.current-container h2

*** Keywords ***
Verify Page Is Load
    UI_Utils.Verify Page Contains Text              ${HOURLY_FORCAST_TXT}
    UI_Utils.Verify Page Contains Text              ${MINUTE_FORCAST_TXT}
    UI_Utils.Verify Page Contains Text              ${8_DAYS_FORCAST_TXT}


Verify Weather Details
    [Documentation]  Clicks on the first product in the search results list
    UI_Utils.Click On GUI Element  ${FIRST_SEARCH_RESULT}

Verify Current City Name Matchs Search City
    [Arguments]  ${search_city}
    ${current_city_name}=       Get Text        ${CITY_NAME}
    ${current_city_name_lowercase}=  Convert To Lower Case      ${current_city_name}
    ${search_city}=      Convert To Lower Case  ${search_city}
    StringUtils.Check String Contains SubString     ${current_city_name_lowercase}  ${search_city}
