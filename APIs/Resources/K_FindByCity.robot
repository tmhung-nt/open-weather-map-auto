*** Settings ***
Documentation  Common keywords for /find API
Resource        ./R_API_Common.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Library         ../../Libraries/UrlEncodeDecode.py

*** Keywords ***
Find By City Name
    [Arguments]  ${city_name}
    ${encode_url}=  encode url   ${city_name}
    REST.GET    ${FIND_BY_CITY_ENDPOINT}&q=${encode_url}
    REST.Output     $