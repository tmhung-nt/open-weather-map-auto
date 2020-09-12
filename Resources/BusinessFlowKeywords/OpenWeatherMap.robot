*** Settings ***
Resource  ../PageObjects/LandingPage.robot
Resource  ../PageObjects/TopNav.robot
Resource  ../PageObjects/FindByCityResults.robot
Resource  ../PageObjects/WeatherByCity.robot

*** Variables ***
${CITY_TO_SEARCH}      ho chi minh

*** Keywords ***
Search By City
    LandingPage.Load OpenWeatherMap Page
    TopNav.Search By City From Search Box      ${CITY_TO_SEARCH}
    FindByCityResults.Verify Search Completed       ${CITY_TO_SEARCH}


See Weather By City
    Search By City
    FindByCityResults.Click City Link
    WeatherByCity.Verify Page Is Load
    WeatherByCity.Verify Current City Name Matchs Search City   ${CITY_TO_SEARCH}
