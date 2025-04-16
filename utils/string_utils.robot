*** Settings ***
Library    String
Library    Collections

*** Variables ***
${LOWER}          qwertyuiopasdfghjklzxcvbnm
${UPPER}          QWERTYUIOPASDFGHJKLZXCVBNM
${LETTERS}        ${LOWER}
${NUMBERS}        1234567890

*** Keywords ***
Create Random String
    [Arguments]    ${number_of_chars}    ${type}
    IF    '${type}' == 'LETTERS'
        ${output}=    Generate Random String    length=${number_of_chars}    chars=${LETTERS}
    ELSE IF    '${type}' == 'UPPER_LETTERS'
        ${output}=    Generate Random String    length=${number_of_chars}    chars=${UPPER}
    ELSE IF    '${type}' == 'NUMBERS'
        ${output}=   Generate Random String    length=${number_of_chars}    chars=${NUMBERS}
    END
    RETURN    ${output}

Get Data Between Strings
    [Arguments]    ${original_string}    ${preceding_string}    ${following_string}
    ${data}=    Split String    string=${original_string}    separator=${preceding_string}
    ${data}=    Split String    string=${data}[1]    separator=${following_string}
    ${data}=    Strip String    ${data}[0]
    RETURN    ${data}

Create Random Strings
    [Arguments]    @{values}
    ${results}=    Create List
    FOR    ${i}    IN    @{values}
        ${type}    ${number_of_chars}=    Split String    string=${i}    separator==
        ${val}=    Create Random String    number_of_chars=${number_of_chars}    type=${type}
        Append To List    ${results}    ${val}
    END
    RETURN    ${results}

