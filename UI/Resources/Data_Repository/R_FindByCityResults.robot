*** Settings ***
Documentation  This is the global data repository to use while executing testcases

*** Variables ***
${SEARCH_STRING_BOX}        id=search_str
${SEARCH_BTN}               xpath://button[@type='submit']
${NOT_FOUND_ALERT}          class:alert-warning  #css:div#forecast-list a[class='close']
${FIRST_SEARCH_RESULT}      css:div#forecast-list table tr
${FIRST_SEARCH_RESULT_CITY_LINK}      css:div#forecast-list tr b > a
