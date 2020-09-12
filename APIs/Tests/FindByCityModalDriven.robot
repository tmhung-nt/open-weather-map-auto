*** Settings ***
Resource        ../Resources/K_API_Validations.robot
Resource        ../Resources/R_API_Common.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Test Setup     Expect response body      ${EXECDIR}/APIs/Resources/FindByCityModal.json

*** Test Cases ***
Valid city
    REST.GET         ${FIND_WITHOUT_CALL_BACK}ho%20chi%20minh
    Reponse Status Code Should Be   200

Invalid city
    REST.Expect response body      {}
    REST.GET         ${FIND_WITHOUT_CALL_BACK}hoChiMinh
    Reponse Status Code Should Be   200
