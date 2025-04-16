*** Settings ***
Resource    playwright_utils.robot
Library    Collections

*** Variables ***
${table_header_locator}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[1]//div[contains(@class,'ant-table-header')]//tr//th//div/span[1]
${table_row_locator}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[1]//tr[contains(@class,'ant-table-row')]

*** Keywords ***
Set Table
    [Arguments]    ${generic_table_header_locator}    ${generic_table_row_locator}
    Set Suite Variable    ${table_header_locator}    ${generic_table_header_locator}
    Set Suite Variable    ${table_row_locator}    ${generic_table_row_locator}

Get Table Columns With Indexes
    Sleep    10s
    #Wait For Element To Be Visible    ${table_header_locator}    timeout=10s
    @{list_of_header_elements}=    Get Elements With Selector    selector=${table_header_locator}  
    ${cnt}=    Get length    ${list_of_header_elements}
    ${dict_of_header_names}=    Create Dictionary
    FOR    ${i}    IN RANGE    ${cnt}
        ${element}=    Set Variable    ${list_of_header_elements}[${i}]     
        ${text}=    Get Element Text     ${element}
        Custom Log    ${i}
        Custom Log    ${text}
        Set To Dictionary    ${dict_of_header_names}    ${text}    ${i}
    END
    RETURN    ${dict_of_header_names}

Get Values Of Column
    [Arguments]    ${column_name}
    &{dict_of_header_values}=    Get Table Columns With Indexes
    ${index_of_column}=    Get From Dictionary        dictionary=${dict_of_header_values}    key=${column_name}
    ${actual_index_of_column}=    Evaluate    int(${index_of_column})+1
    Custom Log        ${actual_index_of_column}
    @{list_of_values}=    Create List
    @{list_of_values_locator}=    Get Elements    selector=${table_row_locator}//td[${actual_index_of_column}]
    FOR    ${element}    IN    @{list_of_values_locator}
        ${text}=    Get Element Text    ${element}
        Append To List    ${list_of_values}    ${text}
    END
    Custom Log    list is ${list_of_values}
    RETURN    ${list_of_values}

Validate Values Present In Column
    [Arguments]   ${column_name}    ${value}    ${expected_times}=1
    Custom Log    Column to fetch values from is ${column_name}
    Sleep    2s
    @{values_in_list}=    Get Values Of Column    ${column_name}
    Custom Log    Column values are @{values_in_list}
    Custom Log    Value to search is ${value}
    ${x}=    Count Values In List    list_=${values_in_list}    value=${value}
    Custom Log    Total number of values in list are ${x}
    Should Be Equal As Numbers    ${x}    ${expected_times}
