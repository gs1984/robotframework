*** Settings ***
Library    Browser

*** Keywords ***
Custom Log
    [Arguments]    ${text_to_log}
    Log To Console    ${text_to_log}
    Log    ${text_to_log}


