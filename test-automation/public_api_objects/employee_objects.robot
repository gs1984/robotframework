#** API Calls in this file
#** fetchEmployees
#** queryEmployees

*** Settings ***
Resource    ../utils/public_api_utils.robot

*** Variables ***
${fetchEmployees_body}=
...  query FetchEmployees($employeeCode:String!){
...    fetchEmployees(employeeCode: $employeeCode) {id employeeCode firstName lastName middleInitial isSalesperson isTechnician isSubcontracted defaultDepartment
...      jobTitle employeeType email phone pagerEmail cellPhone}}
${queryEmployees_body}=
...  query QueryEmployees($employeeCode: String, $inactive: Boolean = false){
...    queryEmployees(employeeCode: $employeeCode, inactive: $inactive){successful message errors{path errorMessage}
...      employees{id employeeCode firstName lastName middleInitial isSalesperson isTechnician isSubcontracted defaultDepartment jobTitle
...      employeeCode email phone pagerEmail cellPhone legacyEmployeeType legacyApVendorId}}}

*** Keywords ***
FetchEmployees API
    [Arguments]    ${employee_code}
    IF    '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}
    ${variables}=    Create Dictionary
    ...    employeeCode=${employee_code}
    ${body}=    Create Dictionary
    ...    query=${fetchEmployees_body}
    ...    variables=${variables}
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    ${response_body_length}=    Get Length    ${response.json()['data']}
    RETURN    ${response.json()['data']['fetchEmployees']}

QueryEmployees API
    [Arguments]    ${employee_code}
    IF    '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}
    ${variables}=    Create Dictionary
    ...    employeeCode=${employee_code}
    ${body}=    Create Dictionary
    ...    query=${queryEmployees_body}
    ...    variables=${variables}
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    ${response_body_length}=    Get Length    ${response.json()['data']}
    RETURN    ${response.json()['data']['queryEmployees']}