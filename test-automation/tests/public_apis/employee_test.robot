#** API Calls in this file
#** fetchEmployees
#** queryEmployees

*** Settings ***
Resource    ../../public_api_objects/employee_objects.robot
Resource    ../../utils/csv_utils.robot

Suite Setup    Get Data from CSV  folder_name=public_apis  file_name=employees_public_api.csv

*** Test Cases ***
Validate fetchEmployees API
    [Documentation]  fetchEmployees [SWPL-T4211|SWR3-T3090]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/72eae07a-09d0-4219-a208-e825d2b05795
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4211
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_employee  grp_annie  grp_hello_booked  grp_sunland  atr_query  
    ...     uid_fetchEmployees  uid_SWPL-T4211  uid_SWR3-T3090    cmp_chiirp_api
    ${fetchEmployee_response}=    FetchEmployees API    ${global_test_data}[employee_code_1]
 #   Should Be Equal As Strings    ${fetchEmployee_response[0]['employeeCode']}    ${global_test_data}[employee_code_1]    msg=Employee code is not as expected
 #   Should Be Equal As Strings    ${fetchEmployee_response[0]['firstName']}    ${global_test_data}[employee_name_1]    msg=Employee name is not as expected
    ${length_of_employees}=    Get Length    ${fetchEmployee_response}
    ${FLAG}=    Set Variable    ${False}
    FOR    ${index}    IN RANGE    0    ${length_of_employees}
        IF    '${fetchEmployee_response}[${index}][employeeCode]' == '${global_test_data}[employee_code_1]'
            Log To Console    Value is Present
            Should Be Equal As Strings    ${fetchEmployee_response}[${index}][firstName]    
            ...    ${global_test_data}[employee_name_1]    
            ...    msg=Employee Name is not as expected for given employee code       
            ${FLAG}=    Set Variable  ${True}
        END
    END
    Should Be Equal    ${FLAG}    ${True}    msg=Expected employee code is not present in the response

Validate fetchEmployees API Negative
    [Documentation]  Tests fetchEmployees API with invalid inputs [SWPL-T4211-NEG|SWR3-T3090-NEG]
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_employee  grp_annie  grp_hello_booked  grp_sunland  atr_query
    ...     uid_fetchEmployees  uid_SWPL-T4211_negative  uid_SWR3-T3090_negative  negative_tc    cmp_chiirp_api

    ${non_existent_code}=    Set Variable    NONEXISTENT_EMP_CODE
    ${response}=    FetchEmployees API    ${non_existent_code}
    
    ${list_length}=    Get Length    ${response}
    Should Be Equal As Integers    ${list_length}    0    msg=Response should be an empty list for non-existent employee code

Validate queryEmployees API
    [Documentation]  queryEmployees [SWPL-T4197|SWR3-T3076]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/20f60dc8-c364-47c6-9315-2e2bdf53b7d6
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4197
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_employee  grp_annie  grp_hello_booked  grp_sunland  atr_query  
    ...     uid_queryEmployees  uid_SWPL-T4197  uid_SWR3-T3076
    ${queryEmployee_response}=    FetchEmployees API    ${global_test_data}[employee_code_1]
#    Should Be Equal As Strings    ${queryEmployee_response[0]['employeeCode']}    ${global_test_data}[employee_code_1]    msg=Employee code is not as expected
#    Should Be Equal As Strings    ${queryEmployee_response[0]['firstName']}    ${global_test_data}[employee_name_1]    msg=Employee name is not as expected
    ${length_of_employees}=    Get Length    ${queryEmployee_response}
    ${FLAG}=    Set Variable    ${False}
    FOR    ${index}    IN RANGE    0    ${length_of_employees}
        IF    '${queryEmployee_response}[${index}][employeeCode]' == '${global_test_data}[employee_code_1]'
            Log To Console    Value is Present
            Should Be Equal As Strings    ${queryEmployee_response}[${index}][firstName]    
            ...    ${global_test_data}[employee_name_1]    
            ...    msg=Employee Name is not as expected for given employee code       
            ${FLAG}=    Set Variable  ${True}
        END
    END
    Should Be Equal    ${FLAG}    ${True}    msg=Expected employee code is not present in the response

Validate queryEmployees API Negative
    [Documentation]  Tests queryEmployees API with invalid inputs [SWPL-T4197-NEG|SWR3-T3076-NEG]
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_employee  grp_annie  grp_hello_booked  grp_sunland  atr_query
    ...     uid_queryEmployees  uid_SWPL-T4197_negative  uid_SWR3-T3076_negative  negative_tc

    ${non_existent_code}=    Set Variable    NONEXISTENT_EMP_CODE
    ${response}=    QueryEmployees API    ${non_existent_code}
    
    ${list_length}=    Get Length    ${response}[employees]
    Should Be Equal As Integers    ${list_length}    0    msg=Response should be an empty list for non-existent employee code