*** Settings ***
Library         SeleniumLibrary
Resource        ../Data_Repository/R_LandingPage.robot
Resource        ../Data_Repository/R_TopNav.robot
Resource        ../CommonUtils/UI_Utils.robot

*** Keywords ***
Load OpenWeatherMap Page
    UI_Utils.Open URL  ${HOME_PAGE_URL}
    Verify Page Loaded

Verify Page Loaded
    UI_Utils.Verify Page Contains Element       ${WEATHER_WIDGET}
    UI_Utils.Verify Page Contains Element       ${OPEN_WEATHER_MAP_LOGO}
    UI_Utils.Verify Page Contains Text      ${INTRODUCTION_TXT}