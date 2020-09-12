*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  String
Resource  ./StringUtils.robot

*** Variables ***

*** Keywords ***
Open URL
    [Arguments]  ${url}
    Go To   ${url}
    Wait for condition  return window.document.readyState === 'complete'

Verify Page Contains Element
    [Arguments]  ${locator}  ${timeout}=5
    wait until page contains element  ${locator}  ${timeout}

Verify Element Is Visible
    [Arguments]  ${locator}  ${timeout}=5
    Wait Until Element Is Visible   ${locator}  ${timeout}

Verify Element Is Not Visible
    [Arguments]  ${locator}  ${timeout}=5
    Wait Until Element Is Not Visible     ${locator}  ${timeout}

Verify Element Is Disabled
    [Documentation]  verify that the HTML element contains disabled attribute
    [Arguments]  ${locator}  ${timeout}=5
    Wait Until Element Is Visible   ${locator}  ${timeout}

Verify Page Does NOT Contain Element
    [Arguments]  ${locator}  ${timeout}=5
    wait until page does not contain element  ${locator}  ${timeout}

Verify Page Contains Text
    [Arguments]  ${text}  ${timeout}=5
    wait until page contains   ${text}  ${timeout}

#Verify Page Contains Text
#    [Arguments]  ${text}  ${timeout}=5
#    ${status} =  run keyword and return status  wait until page contains   ${text}  ${timeout}
#    [Return]  ${status}

Verify Page Does NOT Contain Text
    [Arguments]  ${text}  ${timeout}=5
    wait until page does not contain   ${text}  ${timeout}

Verify Element Text Is Not Empty
    [Arguments]  ${locator}    ${timeout}=5
    wait until page contains element    ${locator}     ${timeout}
    ${element_label}   Get Text  ${locator}
    should not be empty  ${element_label}

Verify Element Contains text
    [Arguments]  ${locator}  ${text}  ${timeout}=5
    Wait until element contains    ${locator}    ${text}  ${timeout}

Select a item from list
    [Arguments]  ${locator}  ${item}
    Verify Element Contains text   ${locator}  ${item}
    Select From List By Label      ${locator}   ${item}

Click On GUI Element
    [Documentation]  Click on element on GUI based on its locator
    [Arguments]  ${locator}  ${timeout}=5s   ${noSpinner}=Spinner
    run keyword if   "${noSpinner}"!="NoSpinner"    run keyword and return status  Wait For Spinner To Be Disappeared

    Verify Page Contains Element  ${locator}   ${timeout}
    click element  ${locator}
    Wait for condition  return window.document.readyState === 'complete'
    sleep  1s

Click On GUI Element If Present
    [Documentation]  Click on element on GUI based on its locator
    [Arguments]  ${locator}  ${timeout}=2
    run keyword and return status  Wait For Spinner To Be Disappeared
    ${isPresent} =  run keyword and return status  Verify Page Contains Element  ${locator}  ${timeout}
    run keyword if  ${isPresent}   click element  ${locator}
    Wait for condition  return window.document.readyState === 'complete'
    sleep  1s

Click on One Of Two Locators
    [Documentation]  Click on one of input locator, if first locator is present on page, click to it.
    ...  Unless click to the second locator if present
    [Arguments]  ${locator_1}  ${locator_2}  ${timeout}=2
    run keyword and return status  Wait For Spinner To Be Disappeared
    ${isPresent} =  run keyword and return status  Verify Page Contains Element  ${locator_1}  ${timeout}
    run keyword if  ${isPresent}   run keyword  click element  ${locator_1}  AND  return from keyword
    Click On GUI Element If Present   ${locator_2}

Verify that locator has only one matching
    [Documentation]  Use to verify that search result table in Dialog has record(s)
    ...   if there is only matching means search table has no record
    [Arguments]  ${locator}
    @{number_of_matching} =  get webelements  ${locator}
    ${list_length} =  get length  ${number_of_matching}
    run keyword if  ${list_length} <= 1  FAIL  Input locator has only one matching   # = 1 means search table has no record

Verify that locator has more than one matching
    [Documentation]  Use to verify that search result table in Dialog has record(s)
    ...  if there are more than 1 matching means search table has record(s)
    [Arguments]  ${locator}
    ${number_of_matching} =  get webelements  ${locator}
    ${list_length} =  get length  ${number_of_matching}
    run keyword if  ${list_length} <= 1  FAIL  Input locator has only one matching   # = 1 means search table has no record

Verify TextBox Is NOT Blank
    [Documentation]  Just use for element which has "value" attribute
    [Arguments]  ${textbox_locator}
    ${text} =  get value  ${textbox_locator}
    ${is_empty} =  run keyword and return status  should not be empty  ${text}
    run keyword if  ${is_empty}  LOG  The checking textbox has some value
    ...   ELSE  The testing textbox is empty

Get Page Source
    [Documentation]  Get the current html source and write down to file
    [Arguments]  ${file_name}
    ${content} =  get source
    create file   ${file_name}.html   ${content}

Verify Page Contains "Regex"
    [Arguments]  ${regex_text}
    ${current_page_source} =  get source
    @{match} =  Get Regexp Matches  ${current_page_source}  ${regex_text}
    ${number_of_matching} =  get length  ${match}
    run keyword if  ${number_of_matching} == 0  FAIL  Current Page does NOT contain regex "${regex_text}"
    ...  ELSE  LOG  Current page does contain regex "${regex_text}"

Verify Input Texts Does NOT Contains "regex"
    [Documentation]  Verify input text  doesnt contain a specific regex
    [Arguments]  ${input_text}  ${input_regex}
    @{match} =  Get Regexp Matches  ${input_text}  ${input_regex}
    ${number_of_matching} =  get length  ${match}
    run keyword if  ${number_of_matching} != 0  FAIL  "${input_text}" does contain regex "${input_regex}"
    ...  ELSE  LOG  "${input_text}" does NOT contain regex "${input_regex}"

Input Text To TextBox
    [Documentation]  This is common keyword to input text to a textbox based on its locator
    [Arguments]  ${textbox_locator}   ${text}  ${noSpinner}=Spinner
    Click On GUI Element  ${textbox_locator}  10s  ${noSpinner}
    clear element text  ${textbox_locator}
    input text   ${textbox_locator}   ${text}

Generate random numbers
    [Documentation]  generate random number which is in range ${number_1}  and ${number2}
    [Arguments]  ${number_1}   ${number2}
    ${numbers} =    Evaluate    random.sample(range(${number_1}, ${number_2}), 1)    random
    ${numbers} =  convert to integer  @{numbers}[0]
    [Return]  ${numbers}

Get Element's Attribute
    [Documentation]  Get an attribute of element
    [Arguments]  ${locator}  ${attribute}    ${timeout}=10s
    wait until page contains element  ${locator}  ${timeout}
    ${value}  get element attribute   ${locator}   ${attribute}
    [Return]  ${value}

Verify Element's Attribute
    [Documentation]  Get an attribute of element then verify its value
    [Arguments]  ${locator}  ${attribute}  ${expectedValue}  ${timeout}=10s
    wait until page contains element  ${locator}  ${timeout}
    Element Attribute Value Should Be   ${locator}   ${attribute}  ${expectedValue}

Get Number Of Elements By Locator
    [Documentation]  A locator can match more than one element, this keyword will return the total number of match elements
    [Arguments]  ${locator}
    @{elements}  Get WebElements  ${locator}
    ${number_of_element} =  get length  ${elements}
    [Return]  ${number_of_element}

Verify Current URL Contains
    [Arguments]  ${expected_text}
    ${current_url}=     Get Location
    Check String Contains SubString     ${current_url}  ${expected_text}