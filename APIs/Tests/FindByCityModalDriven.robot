*** Settings ***
Documentation  For demo purpose only, the json Modal is generated from API response using onine tool
...            and it is not unofficical one. Hence, test may fail if the current weather doesn't have some attributes.
...            For example, if it is not rain at the time test is ran, the test will fail

Resource        ../Resources/K_API_Validations.robot
Resource        ../Resources/K_FindByCity.robot
Resource        ../Resources/R_API_Common.robot
Resource        ../../environments.robot
Library         REST              ${APP_URL}
Test Setup     Expect response body      ${EXECDIR}/APIs/Resources/FindByCityModal.json

*** Test Cases ***
Valid city
    Find By City Name       ho chi minh
    Reponse Status Code Should Be   200

Invalid city
    REST.Expect response body      {}
    Find By City Name       hoChi Minh
    Reponse Status Code Should Be   200
