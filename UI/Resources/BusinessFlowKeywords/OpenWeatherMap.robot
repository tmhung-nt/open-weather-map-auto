*** Settings ***
Resource    ../PageObjects/LandingPage.robot
Resource    ../PageObjects/TopNav.robot
Resource    ../PageObjects/FindByCityResults.robot
Resource    ../PageObjects/WeatherByCity.robot

*** Variables ***

*** Keywords ***
Search By City
    [Arguments]                                  ${city_to_search}    ${search_result}=${EMPTY}
    LandingPage.Load OpenWeatherMap Page
    TopNav.Search By City From Search Box        ${city_to_search}
    FindByCityResults.Verify Search Completed    ${city_to_search}    ${search_result}


See Weather By City
    [Arguments]                                                  ${city_to_search}                  ${search_result}=${EMPTY}
    Search By City                                               ${city_to_search}                  ${search_result}
    Return From Keyword If                                       "${search_result}"!="${EMPTY}"
    FindByCityResults.Click City Link
    WeatherByCity.Verify Page Is Load
    WeatherByCity.Verify Current City Name Matchs Search City    ${city_to_search}
