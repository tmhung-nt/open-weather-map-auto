*** Settings ***
Documentation  Common keywords for /find API
Resource        ./R_API_Common.robot
Resource        ./K_API_Validations.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Library         ../../Libraries/UrlEncodeDecode.py
Library         String

*** Keywords ***
Find By City Name
    [Arguments]  ${city_name}  ${api_key_to_use}=${EMPTY}
    ${encode_url}=  encode url   ${city_name}
    ${is_live_server}=   Check String Contains Pattern  ${APP_URL}    openweathermap
    ${test_url} =  Run Keyword If  "${api_key_to_use}"!="${EMPTY}" and "${is_live_server}"=="${FALSE}"    Set Variable   ${FIND_BY_CITY_ENDPOINT}&appid=${api_key_to_use}
    ...  ELSE       Set Variable     ${FIND_BY_CITY_ENDPOINT}&appid=${API_KEY}
    ${test_url} =  Run Keyword If  "${api_key_to_use}"=="invalidApiKey01"      Set Variable   ${FIND_BY_CITY_ENDPOINT}&appid=${api_key_to_use}
    ...  ELSE IF     "${api_key_to_use}"=="invalidApiKey" and "${is_live_server}"=="${FALSE}"     Set Variable   ${FIND_BY_CITY_ENDPOINT}&appid=${api_key_to_use}
    ...  ELSE       Set Variable     ${FIND_BY_CITY_ENDPOINT}&appid=${API_KEY}

    REST.GET    ${test_url}&q=${encode_url}
    REST.Output     $