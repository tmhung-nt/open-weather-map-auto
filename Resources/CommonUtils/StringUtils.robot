*** Settings ***
Library         String

*** Variables ***


*** Keywords ***
Check String Contains SubString
    [Arguments]  ${string}  ${sub_string}
    LOG  Check whether "${string}" contains "${sub_string}"
    ${contains}=  Evaluate   "${sub_string}" in """${string}"""
    run keyword unless  ${contains}  FAIL   \" ${string}\" does NOT contain \"${sub_string}"
    [Return]   ${contains}

Check String "Does not" Contains SubString
    [Arguments]  ${string}  ${sub_string}
    LOG  Check whether "${string}" contains "${sub_string}"
    ${contains}=  Evaluate   "${sub_string}" in """${string}"""
    run keyword if  ${contains}  FAIL   \" ${string}\" DOES contain \"${sub_string}"
    [Return]   ${contains}

Check String Contains Regex
    [Arguments]  ${string}  ${regex}
    @{match} =  Get Regexp Matches  ${string}  ${regex}
    ${number_of_matching} =  get length  ${match}
    run keyword if  ${number_of_matching} == 0  FAIL  \"${string}\" does NOT contain regex "${regex}"
    ...  ELSE  LOG  \"${string}\" DOES contain regex "${regex}"
    set test variable  @{REGEX_MATCH}  @{match}

Check String Contains Number Only
    [Arguments]  ${string}
    ${is_converted} =  run keyword and return status  convert to integer   ${string}
    run keyword unless  ${is_converted}  FAIL  \"${string}\" DOES NOT contain only NUMBER
    LOG  \"${string}\" just contains only NUMBER