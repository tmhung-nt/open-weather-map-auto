*** Settings ***
Resource        ../Resources/K_API_Validations.robot
Resource        ../Resources/R_API_Common.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}



*** Test Cases ***
Search By Valid City
    REST.GET    ${FIND_WITHOUT_CALL_BACK}ho%20chi%20minh
    REST.Output      $
    Reponse Status Code Should Be       200
    Reponse Field Value Should Be Equal As String       $.message              accurate
    Reponse Field Value Should Be Equal As String       $.cod                  200
    Reponse Field Value Should Be Equal As Number       $.count                  2
    Reponse Field Value Should Be Null       $.list[0].snow

Search By Invalid City
    [Setup]  REST.Expect response body      {}
    REST.GET    ${FIND_WITHOUT_CALL_BACK}hoChi%20minh
    REST.Output      $
    Reponse Status Code Should Be       200
    Reponse Field Value Should Be Equal As String       $.message              accurate
    Reponse Field Value Should Be Equal As String       $.cod                  200
    Reponse Field Value Should Be Equal As Number       $.count                  0
    Reponse Field Value Should Be Array       $.list

Search By # Character
    [Setup]  REST.Expect response body      {}
    REST.GET    ${FIND_WITHOUT_CALL_BACK}#
    REST.Output      $
    Reponse Status Code Should Be       500
    Reponse Field Value Should Be Equal As String       $.message              Internal server error

Search By Empty Input
    [Setup]  REST.Expect response body      {}
    REST.GET    ${FIND_WITHOUT_CALL_BACK}
    REST.Output      $
    Reponse Status Code Should Be       500
    Reponse Field Value Should Be Equal As String       $.message              Internal server error