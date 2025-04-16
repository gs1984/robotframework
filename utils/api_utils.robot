*** Settings ***
Library    RequestsLibrary
Resource    yaml_utils.robot
Library    String

*** Variables ***
${url}    ${None}
${url_webg2}    ${None}
${token}    ${None}
${graphql_query}    query referenceBook($page: Int!, $size: Int!, $tableName: String, $filter: String, $sort: [String]) {
    ...    referenceBook(page: $page, size: $size, tableName: $tableName, filter: $filter, sort: $sort) {
    ...    tableName
    ...    totalDataRow
    ...    totalPages
    ...    pageNumber
    ...    pageSize
    ...    columns {
    ...        dataIndex
    ...        editable
    ...        key
    ...        title
    ...        width
    ...        fixed
    ...        inputType
    ...        visible
    ...        sortable
    ...        __typename
    ...    }
    ...    rowData {
    ...        rowIndex
    ...        column1
    ...        column2
    ...        column3
    ...        column4
    ...        column5
    ...        column6
    ...        column7
    ...        column8
    ...        column9
    ...        column10
    ...        column11
    ...        column12
    ...        column13
    ...        column14
    ...        column15
    ...        __typename
    ...    }
    ...    __typename
    ...    }
    ...    }

${graphql_mutation}    mutation alterRefBooks($input: ReferenceBookRequest!) {
  ...    alterRefBooks(input: $input) {
  ...      pageNumber
  ...      pageSize
  ...      tableName
  ...      totalDataRow
  ...      totalPages
  ...      crudOperation {
  ...        id
  ...        status
  ...        type
  ...        __typename
  ...      }
  ...      __typename
  ...    }
  ...    }

${employee_graphql_mutation}    mutation CreateEmployee($input: CreateEmployeeInput!) {
    ...      createEmployee(input: $input) {
    ...        id
    ...        employeeCode
    ...        firstName
    ...        middleName
    ...        lastName
    ...        employeeEmail
    ...        employeeNumber
    ...        active
    ...        technician
    ...        subcontracted
    ...        address1
    ...        address2
    ...        payFrequency
    ...        employeeType {
    ...          id
    ...          __typename
    ...        }
    ...        zip
    ...        city
    ...        state
    ...        employerPayrollTaxState
    ...        employerPayrollTaxCode
    ...        daysGap
    ...        socialSecurityNumber
    ...        preparedEndDate
    ...        payRate
    ...        payType
    ...        piecePercentage
    ...        usePieceBase
    ...        usePieceParts
    ...        usePieceLabor
    ...        usePieceMiscellaneous
    ...        defaultDepartment
    ...        birthDate
    ...        sex
    ...        driverLicenseNumber
    ...        driverLicenseExpiryDate
    ...        maritalStatus
    ...        spouseName
    ...        spouseBirthDate
    ...        marriageDate
    ...        jobTitle
    ...        phone
    ...        pager
    ...        cellPhone
    ...        vehicleId
    ...        workDays
    ...        beginTime
    ...        endTime
    ...        inCaseOfEmergency
    ...        hireDate
    ...        terminationDate
    ...        overtimeRate
    ...        otherRate
    ...        salary
    ...        lastRaise
    ...        lastReview
    ...        nextReview
    ...        exemptions
    ...        notes
    ...        hirePayRate
    ...        hireSalary
    ...        lastPayRate
    ...        lastSalary
    ...        billRate
    ...        billCost
    ...        currentStatus
    ...        currentStatusEntryId
    ...        currentStatusTimeIn
    ...        currentStatusTimeOut
    ...        currentStatusIsOpen
    ...        currentStatusComment
    ...        pageable
    ...        pagerEmail
    ...        middleInitial
    ...        averagePeriodHours
    ...        averageCheck
    ...        salesPerson
    ...        scheduled
    ...        salaryExpenseType
    ...        useAutomaticOvertime
    ...        payrollSetupOk
    ...        allowTimeCardConflicts
    ...        apVendorId
    ...        apprentice
    ...        gpsDeviceId
    ...        bioPhotoUrl
    ...        bioPhotoExt
    ...        bioText
    ...        bioUrl
    ...        bioUrlText
    ...        reviewUrl
    ...        reviewUrlText
    ...        companycamId
    ...        companycamUrl
    ...        payrollExportGroup
    ...        monBeginTime
    ...        monEndTime
    ...        tueBeginTime
    ...        tueEndTime
    ...        wedBeginTime
    ...        wedEndTime
    ...        thuBeginTime
    ...        thuEndTime
    ...        friBeginTime
    ...        friEndTime
    ...        satBeginTime
    ...        satEndTime
    ...        __typename
    ...      }
    ...    }

*** Keywords ***

Get Authentication Token
    [Arguments]    ${useLog}=${True}
    ${url_local}=    yaml_utils.Get Url    ${useLog}
    ${url_login}=    Set Variable    ${url_local}web/bedrock/login
    ${username}=    Get Username    ${useLog}
    ${password}=    Get Password    ${useLog}
    ${tenantname}=    Get Tenant Name    ${useLog}
    ${headers}=    Create Dictionary
    ...    Content_Type=application/json
    Set Global Variable    ${url}    ${url_local}
    ${body}=    Create Dictionary
    ...    username=${username}
    ...    password=${password}
    ...    companyName=${tenantname}
    IF  '${useLog}' == '${True}'
        Custom Log    url is ${url_login}
        Custom Log    body is ${body}
        Custom Log    headers are ${headers}
    END
    ${response}=    POST    url=${url_login}    json=${body}    headers=${headers}    expected_status=any
    IF  '${useLog}' == '${True}'
        Log To Console    ${response.text}
    END
    Set Global Variable    ${token}    ${response.json()['access_token']}
    Set Global Variable    ${url}    ${url_local}web/bedrock/graphql
    Set Global Variable    ${url_webg2}    ${url_local}webg2/graphql

Is Job Class Exists
    [Arguments]    ${job_class_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=JobClasses    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        Custom Log    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
        IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${job_class_name}'
            Custom Log    Job Class Value --> ${job_class_name} is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Job Class Active
    [Arguments]    ${job_class_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=JobClasses    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    ${row_index}=    Set Variable    0
    ${active}=    Set Variable    ${True}

    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Custom Log    Job Class --> Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 4 Value: ${row["column4"]}
        IF    '${row["column1"]}' == '${job_class_name}' and '${row["column4"]}' == 'false'
            ${row_index}=    Set Variable    ${row["rowIndex"]}
            Custom Log    Id of ${job_class_name} is ${row_index}
            ${active}=    Set Variable    ${False}
            Custom Log    Value of ${job_class_name} is ${active}
            BREAK
        END
    END
    RETURN    ${row_index}    ${active}

Create Job Class
    [Arguments]    ${job_class_name}    ${job_class_alias}
    ${job_class_values}=    Split String    ${job_class_name}    |||
    FOR    ${job_class_name_value}    IN    @{job_class_values}
        ${does_job_class_exist}=    Is Job Class Exists    ${job_class_name_value}
        IF  ${does_job_class_exist} == ${False}
            Custom Log    ${job_class_name_value} does not exist. Creating it
            IF    '${token}' == '${None}'
                Get Authentication Token
            END
            ${headers}=    Create Dictionary    Authorization=bearer ${token}
            ${rowData}=    Create Dictionary
            ...    rowIndex=0
            ...    column1=${job_class_name_value}
            ...    column2=${job_class_alias}
            ...    column3=true
            ...    column4=true
            ${input}=    Create Dictionary
            ...    tableName=JobClasses
            ...    rowData=${rowData}
            ...    crudOperation=update
            ${variables}=    Create Dictionary
            ...    input=${input}
            ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
            ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
        ELSE
            ## CHECKING IF JOB CLASS ACTIVE
            ${row_index}    ${active}=    Is Job Class Active   ${job_class_name_value}
            IF   ${active} == ${False}
                Custom Log    ${job_class_name_value} does not active. Activating it
                IF    '${token}' == '${None}'
                    Get Authentication Token
                END
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=${row_index}
                ...    column1=${job_class_name_value}
                ...    column2=${job_class_alias}
                ...    column3=true
                ...    column4=true
                ${input}=    Create Dictionary
                ...    tableName=JobClasses
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            END
            Custom Log    ${job_class_name_value} is already active
            Custom Log    ${job_class_name_value} is already Exists
        END
    END
    
Is Job Type Exists
    [Arguments]    ${job_type_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=JobAndCall    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        Custom Log    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
        IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${job_type_name}'
            Custom Log    Job Type Value --> ${job_type_name} is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Job Type Active
    [Arguments]    ${job_type_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=JobAndCall    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    ${row_index}=    Set Variable    0
    ${active}=    Set Variable    ${True}

    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Custom Log    Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 12 Value: ${row["column12"]}
        IF    '${row["column1"]}' == '${job_type_name}' and '${row["column12"]}' == 'false'
            ${row_index}=    Set Variable    ${row["rowIndex"]}
            Custom Log    Id of ${job_type_name} is ${row_index}
            ${active}=    Set Variable    ${False}
            Custom Log    Value of ${job_type_name} is ${active}
            BREAK
        END
    END
    RETURN    ${row_index}    ${active}

Create Job Type
    [Arguments]    ${job_type_name}    ${job_type_alias}    ${job_type_description}    ${job_class_names}
    ${job_class_values}=    Split String    ${job_class_names}    |||
    FOR    ${job_class_name}    IN    @{job_class_values}
        ${job_type_values}=    Split String    ${job_type_name}    |||
        FOR    ${job_type_name_value}    IN    @{job_type_values}
            ${does_job_type_exist}=    Is Job Type Exists    ${job_type_name_value}
            IF  ${does_job_type_exist} == ${False}
                Custom Log    ${job_type_name_value} does not exist. Creating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=0
                ...    column1=${job_type_name_value}
                ...    column2=${job_type_alias}
                ...    column3=${job_type_name_value}${job_type_description}
                ...    column4=${job_class_name}
                ...    column12=true
                ${input}=    Create Dictionary
                ...    tableName=JobAndCall
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            ELSE
                ## CHECKING IF JOB TYPE ACTIVE
                ${row_index}    ${active}=    Is Job Type Active   ${job_type_name_value}
                IF  ${active} == ${False}
                    Custom Log    ${job_type_name_value} does not active. Activating it
                    ${headers}=    Create Dictionary    Authorization=bearer ${token}
                    ${rowData}=    Create Dictionary
                    ...    rowIndex=${row_index}
                    ...    column1=${job_type_name_value}
                    ...    column2=${job_type_alias}
                    ...    column3=${job_type_name_value}${job_type_description}
                    ...    column4=${job_class_name}
                    ...    column12=true
                    ${input}=    Create Dictionary
                    ...    tableName=JobAndCall
                    ...    rowData=${rowData}
                    ...    crudOperation=update
                    ${variables}=    Create Dictionary
                    ...    input=${input}
                    ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
                END
                Custom Log    ${job_type_name_value} is already active
                Custom Log    ${job_type_name_value} is already Exists
            END
        END
    END

Is Lead Source Type Exists
    [Arguments]    ${lead_source_type_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}    Content-Type=application/json
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=LeadSourceTypes    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        Custom Log    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
        IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${lead_source_type_name}'
            Custom Log    Lead Source Type Value --> ${lead_source_type_name} is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Lead Source Type Active
    [Arguments]    ${lead_source_type_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=LeadSourceTypes    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    ${row_index}=    Set Variable    0
    ${active}=    Set Variable    ${True}

    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Custom Log    Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 2 Value: ${row["column2"]}
        IF    '${row["column1"]}' == '${lead_source_type_name}' and '${row["column2"]}' == 'false'
            ${row_index}=    Set Variable    ${row["rowIndex"]}
            Custom Log    Id of ${lead_source_type_name} is ${row_index}
            ${active}=    Set Variable    ${False}
            Custom Log    Value of ${lead_source_type_name} is ${active}
            BREAK
        END
    END
    RETURN    ${row_index}    ${active}

Create Lead Source Type
    [Arguments]    ${lead_source_type_name}
    ${lead_source_type_values}=    Split String    ${lead_source_type_name}    |||
    FOR    ${lead_source_type_name_value}    IN    @{lead_source_type_values}
        ${does_lead_source_type_exist}=    Is Lead Source Type Exists    ${lead_source_type_name_value}
        IF  ${does_lead_source_type_exist} == ${False}
            Custom Log    ${lead_source_type_name_value} does not exist. Creating it
            ${headers}=    Create Dictionary    Authorization=bearer ${token}
            ${rowData}=    Create Dictionary
            ...    rowIndex=0
            ...    column1=${lead_source_type_name_value}
            ...    column2=true
            ${input}=    Create Dictionary
            ...    tableName=LeadSourceTypes
            ...    rowData=${rowData}
            ...    crudOperation=update
            ${variables}=    Create Dictionary
            ...    input=${input}
            ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
            ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
        ELSE
            ## CHECKING IF LEAD SOURCE TYPE ACTIVE
            ${row_index}    ${active}=    Is Lead Source Type Active   ${lead_source_type_name_value}
            IF  ${active} == ${False}
                Custom Log    ${lead_source_type_name_value} is not active. Activating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=${row_index}
                ...    column1=${lead_source_type_name_value}
                ...    column2=true
                ${input}=    Create Dictionary
                ...    tableName=LeadSourceTypes
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            END
            Custom Log    ${lead_source_type_name_value} is already active
            Custom Log    ${lead_source_type_name_value} is already exists
        END
    END
    
Is Lead Source Exists
    [Arguments]    ${lead_source_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=LeadSources    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        Custom Log    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
        IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${lead_source_name}'
            Custom Log    Lead Source Value --> ${lead_source_name} is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Lead Source Active
    [Arguments]    ${lead_source_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=LeadSources    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    ${row_index}=    Set Variable    0
    ${active}=    Set Variable    ${True}

    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Custom Log    Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 4 Value: ${row["column4"]}
        IF    '${row["column1"]}' == '${lead_source_name}' and '${row["column4"]}' == 'false'
            ${row_index}=    Set Variable    ${row["rowIndex"]}
            Custom Log    Id of ${lead_source_name} is ${row_index}
            ${active}=    Set Variable    ${False}
            Custom Log    Value of ${lead_source_name} is ${active}
            BREAK
        END
    END
    RETURN    ${row_index}    ${active}

Create Lead Source
    [Arguments]    ${lead_source_name}    ${lead_source_type_name}    ${lead_source_description}
    ${lead_source_type_name_values}=    Split String    ${lead_source_type_name}    |||
    FOR    ${lead_source_type_name}    IN    @{lead_source_type_name_values}
        ${lead_source_values}=    Split String    ${lead_source_name}    |||
        FOR    ${lead_source_name_value}    IN    @{lead_source_values}
            ${does_lead_source_exist}=    Is Lead Source Exists    ${lead_source_name_value}
            IF  ${does_lead_source_exist} == ${False}
                Custom Log    ${lead_source_name_value} does not exist. Creating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=0
                ...    column1=${lead_source_name_value}
                ...    column2=${lead_source_type_name}
                ...    column3=${lead_source_name_value}${lead_source_description}
                ...    column4=true
                ${input}=    Create Dictionary
                ...    tableName=LeadSources
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200

            ELSE
                ## CHECKING IF LEAD SOURCE ACTIVE
                ${row_index}    ${active}=    Is Lead Source Active   ${lead_source_name_value}
                Log To Console    it is Acitve or not ${active}
                IF  ${active} == ${False}
                    Custom Log    ${lead_source_name_value} does not active. Activating it
                    ${headers}=    Create Dictionary    Authorization=bearer ${token}
                    ${rowData}=    Create Dictionary
                    ...    rowIndex=${row_index}
                    ...    column1=${lead_source_name_value}
                    ...    column2=${lead_source_type_name}
                    ...    column3=${lead_source_name_value}${lead_source_description}
                    ...    column4=true
                    ${input}=    Create Dictionary
                    ...    tableName=LeadSources
                    ...    rowData=${rowData}
                    ...    crudOperation=update
                    ${variables}=    Create Dictionary
                    ...    input=${input}
                    ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
                    Log To Console    ${response.json()}
                END
                Custom Log    ${lead_source_name_value} is already active
                Custom Log    ${lead_source_name_value} is already Exists
            END
        END
    END

Is Employee Exists
    [Arguments]    ${first_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}    Content-Type=application/json
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=Employees    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        Custom Log    ${response_data['data']['referenceBook']['rowData'][${index}]['column2']}
        IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column2"]}' == '${first_name}'
            Custom Log    Employee Name --> ${first_name} is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Employee Active
    [Arguments]    ${first_name}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=Employees    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    ${row_index}=    Set Variable    0
    ${active}=    Set Variable    ${True}

    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Custom Log    First Name Value: ${row['column2']} - Active Value: ${row['column9']}
        IF    '${row["column2"]}' == '${first_name}' and '${row["column9"]}' == 'true'
            ${active_row}=    Set Variable    ${row["rowIndex"]}
            Custom Log    Id of ${first_name} is ${row_index}
            ${active}=    Set Variable    ${False}
            Custom Log    Value of ${first_name} is ${active}
            BREAK
        END
    END
    RETURN    ${False}    ${active}

Create Employee
    [Arguments]    ${employeecode}    ${employee_name}    ${email}
    ${employee_name_values}=    Split String    ${employee_name}    |||
    FOR    ${employee_name_value}    IN    @{employee_name_values}
        ${name_parts}=    Split String    ${employee_name_value}    ${SPACE}
        ${first_name}=    Set Variable    ${name_parts[0]}
        ${last_name}=    Set Variable    ${name_parts[1]}

        ${does_employee_exist}=    Is Employee Exists    ${first_name}
        IF  ${does_employee_exist} == ${False}
            Custom Log    ${employee_name_value} does not exist. Creating it
            ${headers}=    Create Dictionary    Authorization=bearer ${token}
            ${input}=    Create Dictionary
            ...    employeeCode=${employeecode}
            ...    firstName=${first_name}
            ...    lastName=${last_name}
            ...    employeeEmail=${email}
            ...    active=true
            ${operation}=    Create Dictionary    
            ...    operationName=CreateEmployee
            ${variables}=    Create Dictionary
            ...    input=${input}
            ${body}=    Create Dictionary    query=${employee_graphql_mutation}    operation=${operation}    variables=${variables}
            ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
        ELSE
            ## CHECKING IF EMPLOYEE ACTIVE
            ${active_row}    ${active}=    Is Employee Active   ${first_name}
            Log To Console    it is Acitve or not ${active}
            IF  ${active} == ${False}
                Custom Log    ${employee_name_value} does not active. Activating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    employeeCode=${active_row}
                ...    firstName=${first_name}
                ...    lastName=${last_name}
                ...    employeeEmail=${email}
                ...    active=true
                ${input}=    Create Dictionary
                ...    rowData=${rowData}
                ${operation}=    Create Dictionary    
                ...    operationName=UpdateEmployee
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${employee_graphql_mutation}    operation=${operation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            END
            Custom Log    ${employee_name_value} is already active
            Custom Log    ${employee_name_value} is already Exists   
        END
    END

Is Payment Method Exists
    [Arguments]    ${PaymentMethod}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=PaymentMethods    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
     Log To Console    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
     IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${PaymentMethod}'
          Log To Console    Value is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Payment Method Active
    [Arguments]    ${PaymentMethod}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=PaymentMethods    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Log To Console    Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 3 Value: ${row["column3"]}
        IF    '${row["column1"]}' == '${PaymentMethod}' and '${row["column3"]}' == 'true'
            ${active_row}=    Set Variable    ${row["rowIndex"]}
             Log To Console    I am here ${active_row}
             ${active}=    Set Variable    ${True}
              Log To Console    Here it is ${active}
        END
    END
    RETURN    ${active_row}    ${active}

Create Payment Method
    [Arguments]    ${PaymentMethod}    ${payment_type_desc}
    ${payment_method_name}=    Split String    ${PaymentMethod}    |||
    FOR    ${payment_name}    IN    @{payment_method_name}
        ${payment_mode}=    Split String    ${PaymentMethod}    |||
        FOR   ${payment_mode_type}    IN      ${payment_mode}
            ${does_payment_method_exist}=    Is Payment Method Exists    ${payment_mode_type}
            IF  ${does_payment_method_exist} == ${False}
                Custom Log    ${payment_mode_type} does not exist. Creating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=0
                ...    column1=${payment_mode_type}
                ...    column2=${payment_mode_type}${payment_type_desc}
                ...    column3=true
                ${input}=    Create Dictionary
                ...    tableName=PaymentMethods
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            ELSE
                Custom Log    ${PaymentMethod} Exists
                ${row_index}    ${active}=    Is Payment Method Active   ${payment_mode_type}
                Log To Console    it is Acitve or not ${active}
                IF  ${active} == ${False}
                    Custom Log    ${PaymentMethod} does not exist. Creating it
                    ${headers}=    Create Dictionary    Authorization=bearer ${token}
                    ${rowData}=    Create Dictionary
                    ...    rowIndex=${row_index}
                    ...    column1=${payment_mode_type}
                    ...    column2=${payment_mode_type}${payment_type_desc}
                    ...    column3=True
                    ${input}=    Create Dictionary
                    ...    tableName=PaymentMethods
                    ...    rowData=${rowData}
                    ...    crudOperation=update
                    ${variables}=    Create Dictionary
                    ...    input=${input}
                    ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
                    Log To Console    ${response.json()}
                END
                Custom Log    ${payment_mode_type} is already active
                Custom Log    ${payment_mode_type} is already Exists
            END
        END
    END

Is Agreement Type Exists
    [Arguments]    ${agreement_type}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=AgreementTypes    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${response.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
     Log To Console    ${response_data['data']['referenceBook']['rowData'][${index}]['column1']}
     IF    '${response_data["data"]["referenceBook"]["rowData"][${index}]["column1"]}' == '${agreement_type}'
          Log To Console    Value is Present
            RETURN    ${True}
        END
    END
    RETURN    ${False}

Is Agreement Type Active
    [Arguments]    ${agreement_type}
    IF    '${token}' == '${None}'
        Get Authentication Token
    END
    ${headers}=    Create Dictionary    Authorization=bearer ${token}
    ${variables}=    Create Dictionary    page=${0}    size=${10000}    tableName=AgreementTypes    filter=${EMPTY}
    ${body}=    Create Dictionary    query=${graphql_query}    variables=${variables}
    ${res}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
    ${response_data}=    Set Variable    ${res.json()}
    ${rows}=    Get Length    ${response_data['data']['referenceBook']['rowData']}
    FOR    ${index}    IN RANGE    0    ${rows}
        ${row}=    Set Variable    ${response_data['data']['referenceBook']['rowData'][${index}]}
        Log To Console    Row Index: ${row["rowIndex"]} - Column 1 Value: ${row["column1"]} - Column 3 Value: ${row["column3"]}
        IF    '${row["column1"]}' == '${agreement_type}' and '${row["column3"]}' == 'true'
            ${active_row}=    Set Variable    ${row["rowIndex"]}
             Log To Console    I am here ${active_row}
             ${active}=    Set Variable    ${True}
              Log To Console    Here it is ${active}
        END
    END
    RETURN    ${active_row}    ${active}

Create Agreement Type
    [Arguments]    ${agreement_type}    ${agreement_type_desc}
    ${agreement_type_name}=    Split String    ${agreement_type}    |||
    FOR    ${agreement_type_name_value}    IN    @{agreement_type_name}
        ${agreement_type_values}=    Split String    ${agreement_type}
        FOR    ${agreementtype}    IN    @{agreement_type_values}    |||
            ${does_agreement_type_exist}=    Is Agreement Type Exists    ${agreement_type_name_value}
            IF  ${does_agreement_type_exist} == ${False}
                Custom Log    ${agreementtype} does not exist. Creating it
                ${headers}=    Create Dictionary    Authorization=bearer ${token}
                ${rowData}=    Create Dictionary
                ...    rowIndex=0
                ...    column1=${agreementtype}
                ...    column2=${agreementtype}${agreement_type_desc}
                ...    column3=true
                ${input}=    Create Dictionary
                ...    tableName=AgreementTypes
                ...    rowData=${rowData}
                ...    crudOperation=update
                ${variables}=    Create Dictionary
                ...    input=${input}
                ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
            ELSE
                ${row_index}    ${active}=    Is Lead Source Active   ${agreementtype}
                Log To Console    it is Acitve or not ${active}
                IF  ${active} == ${False}
                    Custom Log    ${agreement_type} does not exist. Creating it
                    ${headers}=    Create Dictionary    Authorization=bearer ${token}
                    ${rowData}=    Create Dictionary
                    ...    rowIndex=${row_index}
                    ...    column1=${agreementtype}
                    ...    column2=${agreementtype}${agreement_type_desc}
                    ...    column3=True
                    ${input}=    Create Dictionary
                    ...    tableName=AgreementTypes
                    ...    rowData=${rowData}
                    ...    crudOperation=update
                    ${variables}=    Create Dictionary
                    ...    input=${input}
                    ${body}=    Create Dictionary    query=${graphql_mutation}    variables=${variables}
                    ${response}=    POST   url=${url}    headers=${headers}    json=${body}    expected_status=200
                    Log To Console    ${response.json()}
                END
                Custom Log    ${agreementtype} is already active
                Custom Log    ${agreementtype} is already Exists
            END
        END
    END
        