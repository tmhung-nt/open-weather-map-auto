*** Settings ***
Documentation  Common keywords for /find API
Resource        ./R_API_Common.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Library         ../../Libraries/UrlEncodeDecode.py

*** Keywords ***
Find By City Name
    [Arguments]  ${city_name}   ${api_key_to_use}=${EMPTY}
    ${encode_url}=  encode url   ${city_name}
    ${test_url} =  Run Keyword If  "${api_key_to_use}"=="${EMPTY}"      Set Variable    ${FIND_BY_CITY_ENDPOINT}${API_KEY}
    ...  ELSE       Set Variable    ${FIND_BY_CITY_ENDPOINT}${api_key_to_use}

    REST.GET    ${test_url}&q=${encode_url}
    REST.Output     $