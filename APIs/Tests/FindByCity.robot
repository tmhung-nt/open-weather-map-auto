*** Settings ***
Resource  ../Resources/K_FindByCity.robot
Resource  ../Resources/K_API_Validations.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}

*** Test Cases ***
Search By Correct City Name
    Find By City Name    ho chi minh
    Reponse Status Code Should Be       200
    Reponse Field Value Should Be Equal As String       $.message              accurate
    Reponse Field Value Should Be Equal As String       $.cod                  200
    Reponse Field Value Should Be Equal As Number       $.count                  2
    Reponse Field Value Should Be Null       $.list[0].snow

Search By InCorrect City Name
    Find By City Name    hoChi minh
    Reponse Status Code Should Be       200
    Reponse Field Value Should Be Equal As String       $.message              accurate
    Reponse Field Value Should Be Equal As String       $.cod                  200
    Reponse Field Value Should Be Equal As Number       $.count                  0
    Reponse Field Value Should Be Array       $.list

Search By # Character
    Find By City Name    \#
    Reponse Status Code Should Be       500
    Reponse Field Value Should Be Equal As String       $.message              Internal server error

Search By Empty Input
    Find By City Name    ${EMPTY}
    Reponse Status Code Should Be       500
    Reponse Field Value Should Be Equal As String       $.message              Internal server error