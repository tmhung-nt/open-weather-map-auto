*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Data_Repository/R_Common.robot

*** Keywords ***
Begin Web Test
    Open Browser    about:blank     ${BROWSER}  remote_url=${SELENIUM_HUB}  
     Maximize Browser Window

End Web Test
    Close Browser

