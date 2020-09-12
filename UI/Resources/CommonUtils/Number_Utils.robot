*** Settings ***
Documentation  Common keywords to compare numbers

*** Variables ***


*** Keywords ***
Generate random numbers
    [Documentation]  generate random number which is in range ${number_1}  and ${number2}
    [Arguments]  ${number_1}   ${number2}
    ${numbers} =    Evaluate    random.sample(range(${number_1}, ${number_2}), 1)    random
    ${numbers} =  convert to integer  @{numbers}[0]
    [Return]  ${numbers}

Is Greater Than
    [Documentation]  Verify that first input number is greater than second input number
    [Arguments]  ${number_1}  ${number_2}
    ${number_1} =  convert to integer  ${number_1}
    ${number_2} =  convert to integer  ${number_2}

    ${is_greater_than} =  run keyword if  ${number_1} > ${number2}  set variable     ${TRUE}
    ...  ELSE   set variable  ${FALSE}

    run keyword if  ${is_greater_than}  LOG  ${number_1} is greater than ${number_2}
    ...  ELSE  FAIL  ${number_1} is not greater than ${number_2}

    [Return]  ${is_greater_than}


Is Less Than
    [Documentation]  Verify that first input number is less than second input number
    [Arguments]  ${number_1}  ${number_2}
    ${number_1} =  convert to integer  ${number_1}
    ${number_2} =  convert to integer  ${number_2}

    ${is_less_than} =  run keyword if  ${number_1} < ${number2}  set variable     ${TRUE}
    ...  ELSE   set variable  ${FALSE}

    run keyword if  ${is_less_than}  LOG  ${number_1} is less than ${number_2}
    ...  ELSE  FAIL  ${number_1} is not less than ${number_2}

    [Return]  ${is_less_than}

Is Less Than or Is Equal
    [Documentation]  Verify that first input number is less than second input number
    [Arguments]  ${number_1}  ${number_2}
    ${number_1} =  convert to integer  ${number_1}
    ${number_2} =  convert to integer  ${number_2}

    ${is_equal} =  run keyword if  ${number_1} == ${number2} or ${number_1} < ${number2}  set variable     ${TRUE}
    ...  ELSE   set variable  ${FALSE}

    run keyword if  ${is_equal}  LOG  ${number_1} is less than or equal ${number_2}
    ...  ELSE  FAIL  ${number_1} is not less than ${number_2}

    [Return]  ${is_equal}