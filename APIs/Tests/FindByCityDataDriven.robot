*** Settings ***
Documentation    This is some basic info about the whole suite
Resource  ../Resources/K_FindByCity.robot
Resource  ../Resources/K_API_Validations.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Library          DataDriver    file=../Files/api_input_cities.csv
Test Template    Find By City Name Template

*** Test Cases ***
Search by ${search_keyword} and verify by ${resp_status_code}, ${message_field}, ${cod_field}, ${count_field}


*** Keywords ***
Find By City Name Template
    [Arguments]            ${search_keyword}    ${resp_status_code}      ${message_field}   ${cod_field}   ${count_field}
    Find By City Name    ${search_keyword}
    Reponse Status Code Should Be       ${resp_status_code}
    Reponse Field Value Should Be Equal As String       $.message              ${message_field}
    Run Keyword If   "${resp_status_code}"=="200"   Reponse Field Value Should Be Equal As String       $.cod                   ${cod_field}
    Run Keyword If   "${resp_status_code}"=="200"   Reponse Field Value Should Be Equal As Integer      $.count                   ${count_field}
    Run Keyword If   "${resp_status_code}"=="200"   Reponse Field Value Should Be Array  $.list
    Run Keyword If   "${resp_status_code}"=="500"   Response Field Value Should Not Exist  $.list
    Run Keyword If   "${resp_status_code}"=="500"   Reponse Field Value Should Be Equal As Integer  $.cod   ${cod_field}