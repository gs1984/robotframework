*** Settings ***
Resource    ../../../utils/playwright_utils.robot
Resource    ../../../utils/csv_utils.robot
Resource    ../../../utils/table_utils.robot
Resource    ../../../page_objects/user_management/login_page.robot
Resource    ../../../page_objects/onboarding_smoke/onboarding_smoke_page.robot
Test Setup    Custom Setup
Suite Setup    Get Data from CSV    folder_name=platform_web    file_name=onboarding_smoke.csv
Test Teardown    Custom Teardown    browser=ALL    context=ALL

*** Test Cases ***

Navigate to Call Handling -> Click on Contact History
    [Documentation]    [SWPL-T5964]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5964
    [Tags]    cmp_navigation    onboard_tc_01    plt_GEN2_WEB    uid_SWPL-T5964

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Contact History
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Call Handling -> Click on Job Records
    [Documentation]    [SWPL-T5965]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5965
    [Tags]    cmp_navigation    onboard_tc_02    plt_GEN2_WEB    uid_SWPL-T5965

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Job Records
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Call Handling -> Click on Agreement Visits
    [Documentation]    [SWPL-T5966]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5966
    [Tags]    cmp_navigation    onboard_tc_03    plt_GEN2_WEB    uid_SWPL-T5966

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Agreement Visits
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Call Handling -> Click on Ticket Record
    [Documentation]    [SWPL-T5967]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5967
    [Tags]    cmp_navigation    onboard_tc_04    plt_GEN2_WEB    uid_SWPL-T5967

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Ticket Record
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Call Handling -> Click on Sales Record
    [Documentation]    [SWPL-T5968]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5968
    [Tags]    cmp_navigation    onboard_tc_05    plt_GEN2_WEB    uid_SWPL-T5968

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Sales Record        
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status] 


Navigate to Call Handling -> Click on New Phone call -> search any customer Name
    [Documentation]    [SWPL-T5969]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5969
    [Tags]    cmp_navigation    onboard_tc_06    plt_GEN2_WEB    uid_SWPL-T5969
    ${first_name}=    Create Random Strings    LETTERS=5

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${err_status}=    Call Handling Search Customer    customer_name=${first_name}
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Customer Service-> Dispatch -> Navigate to different views on board
    [Documentation]    [SWPL-T5970]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5970
    [Tags]    cmp_navigation    onboard_tc_07    plt_GEN2_WEB    uid_SWPL-T5970
    ${first_name}=    Create Random Strings    LETTERS=5

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Dispatch
    ## Validate in Assignment View
    ${err_status_1}=    Dispatch Navigate To Different Views On Board    view_name=${global_test_data}[assignment_view]
    Should Be Equal    first=${err_status_1}    second=${global_test_data}[error_status]
    
    ## Validate in Week View
    ${err_status_2}=    Dispatch Navigate To Different Views On Board    view_name=${global_test_data}[week_view]
    Should Be Equal    first=${err_status_2}    second=${global_test_data}[error_status]

    ## Validate in Day View.
    ${err_status_3}=    Dispatch Navigate To Different Views On Board    view_name=${global_test_data}[day_view]
    Should Be Equal    first=${err_status_3}    second=${global_test_data}[error_status]
    
    
Navigate to Customer Service-> Dispatch -> Click on any job on the Board.(If Job is present on the Dispatch Board)
    [Documentation]    [SWPL-T5971 | SWPL-T5973]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5971
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5973
    [Tags]    cmp_navigation    onboard_tc_08    plt_GEN2_WEB    uid_SWPL-T5971    uid_SWPL-T5973
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=5    LETTERS=5    NUMBERS=10    LETTERS=5

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}    
    ...    msg=Customer Record Created Successfully message is not matched or not displayed.

    ${job_request_success_message}    ${job_number}=    Create Job Request with Schedule Job    job_class=eSales Test    job_type=Test - Test Automation
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]    technician=${global_test_data}[technician_name]    equipment=
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    ${err_status}=    Dispatch Click On Any Job    first_name=${first_name}
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Job Manager-> Click on any job on the screen.
    [Documentation]    [SWPL-T5972]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5972
    [Tags]    cmp_navigation    onboard_tc_09    plt_GEN2_WEB    uid_SWPL-T5972
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=5    LETTERS=5    NUMBERS=10    LETTERS=5

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}    
    ...    msg=Customer Record Created Successfully message is not matched or not displayed.

    ${job_request_success_message}    ${job_number}=    Create Job Request with Schedule Job    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]    technician=${global_test_data}[technician_name]    equipment=
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully
    
    ${err_status}=    Job Manager Click On Any Job    job_number=${job_number}
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Customer Service-> Agreement Manager
    [Documentation]    [SWPL-T5974]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5974
    [Tags]    cmp_navigation    onboard_tc_10    plt_GEN2_WEB    uid_SWPL-T5974

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${err_status}=    Agreement Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    
Navigate to Customer Service-> Receivables Manager
    [Documentation]    [SWPL-T5975]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5975
    [Tags]    cmp_navigation    onboard_tc_11    plt_GEN2_WEB    uid_SWPL-T5975

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${err_status}=    Receivables Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Customer Service-> Invoice Manager
    [Documentation]    [SWPL-T5976]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5976
    [Tags]    cmp_navigation    onboard_tc_12    plt_GEN2_WEB    uid_SWPL-T5964

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${err_status}=    Invoice Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Customer Service-> Customer Manager
    [Documentation]    [SWPL-T5977]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5977
    [Tags]    cmp_navigation    onboard_tc_13    plt_GEN2_WEB    uid_SWPL-T5977

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Customer Manager
    ${err_status}=    Customer Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    
Navigate to Customer Service-> Project Management
    [Documentation]    [SWPL-T5978]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5978
    [Tags]    cmp_navigation    onboard_tc_14    plt_GEN2_WEB    uid_SWPL-T5978

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Project Management
    ${err_status}=    Project Management Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Customer Service-> Comm center
    [Documentation]    [SWPL-T5979]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5979
    [Tags]    cmp_navigation    onboard_tc_15    plt_GEN2_WEB    uid_SWPL-T5979

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Comm Center
    ${err_status}=    Comm Center Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Marketing -> Campaign Management
    [Documentation]    [SWPL-T5980]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5980
    [Tags]    cmp_navigation    onboard_tc_16    plt_GEN2_WEB    uid_SWPL-T5980

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Marketing>>Campaign Management
    ${err_status}=    Campaign Management Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Marketing -> Revenue Goal Management
    [Documentation]    [SWPL-T5981]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5981
    [Tags]    cmp_navigation    onboard_tc_17    plt_GEN2_WEB    uid_SWPL-T5981

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Marketing>>Revenue Goal Management
    ${err_status}=    Revenue Goal Management Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Marketing -> Oppurtunity Management
    [Documentation]    [SWPL-T5982]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5982
    [Tags]    cmp_navigation    onboard_tc_18    plt_GEN2_WEB    uid_SWPL-T5982

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Marketing>>Opportunity Management
    ${err_status}=    Opportunity Management Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Purchasing -> Click on different tabs and open any PO
    [Documentation]    [SWPL-T5983]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5983
    [Tags]    cmp_navigation    onboard_tc_19    plt_GEN2_WEB    uid_SWPL-T5983

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Purchasing>>Purchasing
    ${err_status}=    Purchasing Manager Open Any Job Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Price book-> Click on different tabs
    [Documentation]    [SWPL-T5984]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5984
    [Tags]    cmp_navigation    onboard_tc_20    plt_GEN2_WEB    uid_SWPL-T5984

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Purchasing>>Price Book
    ${err_status}=    Pricebook Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Payables Manager-> Click on different tabs
    [Documentation]    [SWPL-T5985]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5985
    [Tags]    cmp_navigation    onboard_tc_21    plt_GEN2_WEB    uid_SWPL-T5985

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Purchasing>>Payables Manager
    ${err_status}=    Payables Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Inventory Manager -> Click on different tabs
    [Documentation]    [SWPL-T5986]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5986
    [Tags]    cmp_navigation    onboard_tc_22    plt_GEN2_WEB    uid_SWPL-T5986

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Purchasing>>Inventory Manager
    ${err_status}=    Inventory Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Timecard Manager
    [Documentation]    [SWPL-T5987]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5987
    [Tags]    cmp_navigation    onboard_tc_23    plt_GEN2_WEB    uid_SWPL-T5987

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Payroll>>Timecard Manager
    ${err_status}=    Timecard Manager Navigation Modify Button    emp_code=${global_test_data}[employee_code]
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Timecard Manager - Click on Timecard Assistant
    [Documentation]    [SWPL-T5988]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5988
    [Tags]    cmp_navigation    onboard_tc_24    plt_GEN2_WEB    uid_SWPL-T5988

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Payroll>>Timecard Manager
    ${err_status}=    Timecard Manager Navigation Timecard Assistant Button
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Payroll Manager
    [Documentation]    [SWPL-T5989]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5989
    [Tags]    cmp_navigation    onboard_tc_25    plt_GEN2_WEB    uid_SWPL-T5989

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Payroll>>Payroll Manager
    ${err_status}=    Payroll Manager Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Payroll Manager - Click on Period Review for any period
    [Documentation]    [SWPL-T5990]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5990
    [Tags]    cmp_navigation    onboard_tc_26    plt_GEN2_WEB    uid_SWPL-T5990

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Payroll>>Payroll Manager
    ${err_status}=    Payroll Manager Navigation Period Review
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Payroll Manager - Click on Payroll Setup - Click on all tabs
    [Documentation]    [SWPL-T5991]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5991
    [Tags]    cmp_navigation    onboard_tc_27    plt_GEN2_WEB    uid_SWPL-T5991

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Payroll>>Payroll Manager
    ${err_status}=    Payroll Manager Navigation Payroll Setup button
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Accounting - Account Register
    [Documentation]    [SWPL-T5992 | SWPL-T5993]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5992
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5993
    [Tags]    cmp_navigation    onboard_tc_28    plt_GEN2_WEB    uid_SWPL-T5992    uid_SWPL-T5993

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Accounting>>Account Register
    ${err_status}=    Account Register Navigation    account=${global_test_data}[account_name]    activity=${global_test_data}[account_reconciliation]
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Accounting - Account Inquiry
    [Documentation]    [SWPL-T5994]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5994
    [Tags]    cmp_navigation    onboard_tc_29    plt_GEN2_WEB    uid_SWPL-T5994

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Accounting>>Account Inquiry
    ${err_status}=    Account Inquiry Navigation    year=${global_test_data}[year]    account=${global_test_data}[account_type]
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Accounting - GL Budget
    [Documentation]    [SWPL-T5995]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5995
    [Tags]    cmp_navigation    onboard_tc_30    plt_GEN2_WEB    uid_SWPL-T5995

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Accounting>>GL Budget
    ${err_status}=    GL Budget Navigation    year=${global_test_data}[year]
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Accounting - Journal Entry
    [Documentation]    [SWPL-T5996]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5996
    [Tags]    cmp_navigation    onboard_tc_31    plt_GEN2_WEB    uid_SWPL-T5996

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Accounting>>Journal Entry
    ${err_status}=    Journal Entry Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Accounting - Vendor Balance
    [Documentation]    [SWPL-T5997]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5997
    [Tags]    cmp_navigation    onboard_tc_32    plt_GEN2_WEB    uid_SWPL-T5997

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Accounting>>Vendor Balance
    ${err_status}=    Vendor Balance Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Reporting - Report Gallery
    [Documentation]    [SWPL-T5998]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5998
    [Tags]    cmp_navigation    onboard_tc_33    plt_GEN2_WEB    uid_SWPL-T5998

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Reporting>>Report Gallery
    ${err_status}=    Report Gallery Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Reporting - KPI Management
    [Documentation]    [SWPL-T5999]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T5999
    [Tags]    cmp_navigation    onboard_tc_34    plt_GEN2_WEB    uid_SWPL-T5999

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Reporting>>KPI Management
    ${err_status}=    KPI Management Navigation Different Tab
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Reporting - Export
    [Documentation]    [SWPL-T6000]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6000
    [Tags]    cmp_navigation    onboard_tc_35    plt_GEN2_WEB    uid_SWPL-T6000
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Reporting>>Export
    ${err_status}=    Reporting Export Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Employee Management Navigation
    [Documentation]    [SWPL-T6001]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6001
    [Tags]    cmp_navigation    onboard_tc_36    plt_GEN2_WEB    uid_SWPL-T6001
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Employee Management
    ${err_status}=    Employee Management Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Payment Account Navigation
    [Documentation]    [SWPL-T6002]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6002
    [Tags]    cmp_navigation    onboard_tc_37    plt_GEN2_WEB    uid_SWPL-T6002
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Payment Account
    ${err_status}=    Payment Account Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Business Setup Navigation
    [Documentation]    [SWPL-T6003]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6003
    [Tags]    cmp_navigation    onboard_tc_38    plt_GEN2_WEB    uid_SWPL-T6003
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Business Setup
    ${err_status}=    Business Setup Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Module Configuration Navigation
    [Documentation]    [SWPL-T6004]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6004
    [Tags]    cmp_navigation    onboard_tc_39    plt_GEN2_WEB    uid_SWPL-T6004
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Module Configuration
    ${err_status}=    Module Configuration Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Invoice Setting Navigation
    [Documentation]    [SWPL-T6005]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6005
    [Tags]    cmp_navigation    onboard_tc_40    plt_GEN2_WEB    uid_SWPL-T6005
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Invoice Setting
    ${err_status}=    Invoice Setting Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup -Financial Navigation
    [Documentation]    [SWPL-T6006]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6006
    [Tags]    cmp_navigation    onboard_tc_41    plt_GEN2_WEB    uid_SWPL-T6006
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Financial
    ${err_status}=    Financial Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Work Order Printing Navigation
    [Documentation]    [SWPL-T6007]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6007
    [Tags]    cmp_navigation    onboard_tc_42    plt_GEN2_WEB    uid_SWPL-T6007
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Work Order Printing
    ${err_status}=    Work Order Printing Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Other Navigation
    [Documentation]    [SWPL-T6008]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6008
    [Tags]    cmp_navigation    onboard_tc_43    plt_GEN2_WEB    uid_SWPL-T6008
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Other
    ${err_status}=    Other Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Other Receivables Navigation
    [Documentation]    [SWPL-T6009]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6009
    [Tags]    cmp_navigation    onboard_tc_44    plt_GEN2_WEB    uid_SWPL-T6009
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Other
    ${err_status}=    Other Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Call Center (Dispatch) Navigation
    [Documentation]    [SWPL-T6010]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6010
    [Tags]    cmp_navigation    onboard_tc_45    plt_GEN2_WEB    uid_SWPL-T6010
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Call Center (Dispatch)
    ${err_status}=    Call Center (Dispatch) Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Recurring Payment Settings Navigation
    [Documentation]    [SWPL-T6011 | SWPL-T6012]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6011
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6012
    [Tags]    cmp_navigation    onboard_tc_46    plt_GEN2_WEB    uid_SWPL-T6011    uid_SWPL-T6012

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Recurring Payment
    ${err_status}=    Recurring Payment Settings Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Reset GL Activation Date Navigation
    [Documentation]    [SWPL-T6013]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6013
    [Tags]    cmp_navigation    onboard_tc_47    plt_GEN2_WEB    uid_SWPL-T6013
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Reset GL Activation Date
    ${err_status}=    Reset GL Activation Date Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Duplicate Customer Merge Navigation
    [Documentation]    [SWPL-T6014]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6014
    [Tags]    cmp_navigation    onboard_tc_48    plt_GEN2_WEB    uid_SWPL-T6014
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Duplicate Customer Merge
    ${err_status}=    Duplicate Customer Merge Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    ${err_status}=    Search Duplicate Customer Records
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - User Management Navigation
    [Documentation]    [SWPL-T6015]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6015
    [Tags]    cmp_navigation    onboard_tc_49    plt_GEN2_WEB    uid_SWPL-T6015
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>User Management
    ${err_status}=    User Management Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    User role Management Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - General Ledger Setup Navigation
    [Documentation]    [SWPL-T6016]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6016
    [Tags]    cmp_navigation    onboard_tc_50    plt_GEN2_WEB    uid_SWPL-T6016
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>General Ledger Setup
    ${err_status}=    General Ledger Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    Sub Account Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    Default Account Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    Department Account Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    Period Account Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    ${err_status}=    Expense Group Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    

Navigate to Setup - Reference Library Setup Navigation
    [Documentation]    [SWPL-T6017]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6017
    [Tags]    cmp_navigation    onboard_tc_51    plt_GEN2_WEB    uid_SWPL-T6017
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Reference Library
    ${err_status}=    Reference Library Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Add On Manager Setup Navigation
    [Documentation]    [SWPL-T6018]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6018
    [Tags]    cmp_navigation    onboard_tc_52    plt_GEN2_WEB    uid_SWPL-T6018
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Add On Manager
    ${err_status}=    Add On Manager Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    
    ${err_status}=    Browse AddOn Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - BookIt Setup Navigation
    [Documentation]    [SWPL-T6019]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6019
    [Tags]    cmp_navigation    onboard_tc_53    plt_GEN2_WEB    uid_SWPL-T6019
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>BookIt Setup
    ${err_status}=    BookIt Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Communication Manager Setup Navigation
    [Documentation]    [SWPL-T6020]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6020
    [Tags]    cmp_navigation    onboard_tc_54    plt_GEN2_WEB    uid_SWPL-T6020
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Communication Manager
    ${err_status}=    Communication Manager Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Receivables Starting Balance Setup Navigation
    [Documentation]    [SWPL-T6021]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6021
    [Tags]    cmp_navigation    onboard_tc_55    plt_GEN2_WEB    uid_SWPL-T6021
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Receivables Starting Balance
    ${err_status}=    Receivables Starting Balance Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - General Ledger Starting Balance Setup Navigation
    [Documentation]    [SWPL-T6022]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6022
    [Tags]    cmp_navigation    onboard_tc_56    plt_GEN2_WEB    uid_SWPL-T6022
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>General Ledger Starting Balance
    ${err_status}=    General Ledger Starting Balance Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Script Management Setup Navigation
    [Documentation]    [SWPL-T6023]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6023
    [Tags]    cmp_navigation    onboard_tc_57    plt_GEN2_WEB    uid_SWPL-T6023
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Script Management
    ${err_status}=    Script Management Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Setup - Timecard Management Setup Navigation
    [Documentation]    [SWPL-T6024]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6024
    [Tags]    cmp_navigation    onboard_tc_58    plt_GEN2_WEB    uid_SWPL-T6024
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Setup>>Time Slot Capacity Management
    ${err_status}=    Timecard Management Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    ${err_status}=    Configuration Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    ${err_status}=    Time Slot Capacity Group Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    ${err_status}=    Default Slots Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]

    ${err_status}=    Create Daily Slots Setup Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Quick Start - General Ledger Navigation
    [Documentation]    [SWPL-T6025]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6025
    [Tags]    cmp_navigation    onboard_tc_59        plt_GEN2_WEB    uid_SWPL-T6025
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Quick Start>>General Ledger
    ${err_status}=    General Ledger Quick Start Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]


Navigate to Quick Start - Receivables Navigation
    [Documentation]    [SWPL-T6026]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T6026
    [Tags]    cmp_navigation    onboard_tc_60        plt_GEN2_WEB    uid_SWPL-T6026
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Quick Start>>Receivables
    ${err_status}=    Receivables Quick Start Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
    
    Navigate To LHN Option    navigation=Quick Start>>Payables
    ${err_status}=    Payables Quick Start Navigation
    Should Be Equal    first=${err_status}    second=${global_test_data}[error_status]
