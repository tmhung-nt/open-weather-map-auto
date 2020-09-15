*** Settings ***
Documentation  The json Modal is generated from API response using onine tool
...            and it is not unofficical one. Hence, test may fail if the current weather doesn't have some attributes.
...            For example, if it is not rain at the time test is ran, the test will fail.
...            Here is the good change to use Stub server by overwrite the APP_URL variable to stub server
...            Use live server: robot -d api_results  APIs/Tests/FindByCityModalDriven.robot
...            Use stub server: robot -d api_results -v APP_URL:"http://localhost:7777"  APIs/Tests/FindByCityModalDriven.robot

Resource        ../Resources/K_API_Validations.robot
Resource        ../Resources/K_FindByCity.robot
Resource        ../Resources/R_API_Common.robot
Resource        ../../environments.robot
Library         Process
Suite Setup     Start Process    APIs/start_stubmatic.sh    shell=True
Suite Teardown  Terminate All Processes
Test Setup      Wait For Process    timeout=3s

*** Test Cases ***
Valid city
    Find By City Name       ho chi minh
    Reponse Status Code Should Be   200

Invalid city
    Clear Expectations
    Expect response body   {"cod": 500,"message": "Internal server error"}
    Find By City Name       ho         invalidApiKey
    Reponse Status Code Should Be   500


Invalid API Key
    Clear Expectations
    Expect response body   {"cod": 401,"message": "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."}
    Find By City Name       ho chi minh    invalidApiKey01
    Reponse Field Value Should Be Equal As Integer  $.cod   401
    Reponse Field Value Should Be Equal As String  $.message    Invalid API key. Please see http://openweathermap.org/faq#error401 for more info.