*** Settings ***
Documentation  This is the global data repository to use while executing testcases


*** Variables ***
${SEARCH_BY_CITY_BOX}           css:form[role='search'] input#q
${SUBMIT_SEARCH}                css:form[role='search'] input[type='submit']
${GET_STARTED_NAV}              xpath://li/a[@href='/guide']
${OPEN_WEATHER_MAP_LOGO}        css:img[src*='logo_white_cropped']
