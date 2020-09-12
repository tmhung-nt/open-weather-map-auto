*** Settings ***
Documentation  Common keywords to verify API response

*** Keywords ***
Reponse Status Code Should Be
    [Arguments]  ${expected_code}
    REST.Integer     response status   ${expected_code}

Reponse Field Value Should Be Equal As String
    [Arguments]  ${json_path}   ${expected_value}
    REST.String      ${json_path}            ${expected_value}

Reponse Field Value Should Be Equal As Number
    [Arguments]  ${json_path}   ${expected_value}
    REST.Number      ${json_path}            ${expected_value}

Reponse Field Value Should Be Equal As Integer
    [Arguments]  ${json_path}   ${expected_value}
    REST.Integer      ${json_path}            ${expected_value}

Reponse Field Value Should Be Null
    [Arguments]  ${json_path}
    REST.Null      ${json_path}

Reponse Field Value Should Be Array
    [Arguments]  ${json_path}
    REST.Array      ${json_path}