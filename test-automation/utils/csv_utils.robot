*** Settings ***
Library  CSVLib 
Library    Collections
Resource    log_utils.robot
Resource    yaml_utils.robot
Resource    api_utils.robot
Resource    string_utils.robot

*** Variables ***
${global_test_data}    None

*** Keywords ***
# This routine is used to load in csv data into global variables for the test suite.
# It is also used by public integration apis.
Get Data from CSV
    [Arguments]    ${folder_name}    ${file_name}    ${useLog}=${True}
    ${env}=    Get Env    ${useLog}
    ${username}=    Get Username    ${useLog}
    ${password}=    Get Password    ${useLog}
    ${tenantname}=    Get Tenantname    ${useLog}
    ${approval_user_username}=    Get Approval User Username    ${useLog}
    ${approval_user_password}=    Get Approval User Password    ${useLog}
    ${test_data}=    Read Csv As Dictionary     filename=test_data/${folder_name}/${file_name}    key_column=key    value_columns=value    delimiter=,
    Set To Dictionary    ${test_data}    username=${username}    password=${password}    tenantname=${tenantname}
    Set To Dictionary    ${test_data}    approval_user_username=${approval_user_username}    approval_user_password=${approval_user_password}    tenantname=${tenantname}
    Set Suite Variable    ${global_test_data}    ${test_data}


Create Data If Does Not Exist
    [Arguments]    ${master_test_data}
    ${employee_code}    ${email_id}=    Create Random Strings    NUMBERS=4    LETTERS=5
    # Below code is checkng if Job Class, Job Type, Lead Source Type and Lead Source is present or not.
    FOR    ${i}    IN    @{master_test_data.keys()}
        IF    '${i}' == 'lead_source_type'
            Create Lead Source Type    lead_source_type_name=${master_test_data}[lead_source_type]
        ELSE IF    '${i}' == 'lead_source'
            Create Lead Source    lead_source_name=${master_test_data}[lead_source_id]    lead_source_type_name=${master_test_data}[lead_source_type]    
            ...    lead_source_description=description
        ELSE IF    '${i}' == 'job_class'
            Create Job Class    job_class_name=${master_test_data}[job_class]   job_class_alias=${master_test_data}[job_class]alias
        ELSE IF    '${i}' == 'job_type'
            Create Job Type    job_type_name=${master_test_data}[job_type]    job_type_alias=${master_test_data}[job_type]alias    
            ...    job_type_description=description    job_class_names=${master_test_data}[job_class]
        ELSE IF    '${i}' == 'payment_method_type'
            Create Payment Method    PaymentMethod=${master_test_data}[payment_method]    payment_type_desc=${master_test_data}[payment_type_desc]description
        ELSE IF    '${i}' == 'agreement_type'
            Create Agreement Type    agreement_type=${master_test_data}[agreement_type]    agreement_type_desc=${master_test_data}[agreement_type]description
        ELSE IF    '${i}' == 'employee'
            Create Employee    employeecode=${employee_code}    employee_name=${master_test_data}[employee]    email=protivitiautomation+${email_id}@gmail.com
        END
    END


Create Master Data
    Custom Log    Creating Master Data...
    ${master_test_data}=    Read Csv As Dictionary     filename=test_data/master_data.csv    key_column=key    value_columns=value    delimiter=,
    Create Data If Does Not Exist    ${master_test_data}
