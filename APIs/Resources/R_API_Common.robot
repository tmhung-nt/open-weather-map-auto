*** Settings ***
Documentation  Common variables for API testing

*** Variables ***
${FIND_WITH_CALL_BACK}      data/2.5/find?callback=api_test
        ...                 &type=like&sort=population&cnt=30&appid=439d4b804bc8187953eb36d2a8c26a02&_=1599917709135
        ...                 &q=
${FIND_WITHOUT_CALL_BACK}   data/2.5/find?type=like&sort=population&cnt=30
        ...                 &appid=439d4b804bc8187953eb36d2a8c26a02&_=1599917709135
        ...                 &q=
