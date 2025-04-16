*** Settings ***
Resource    ../../../utils/playwright_utils.robot
Resource    ../../../page_objects/user_management/login_page.robot
Resource    ../../../utils/csv_utils.robot
Resource    ../../../page_objects/customer_service/call_handling_page.robot

Test Setup    Custom Setup
Suite Setup    Get Data from CSV    folder_name=platform_web    file_name=call_handling.csv
Test Teardown    Custom Teardown    browser=ALL    context=ALL

*** Test Cases ***
Validate That User Is Able To Navigate To Call Handling Screen TC_01
    [Documentation]    Verify Login Functionality And Navigating To Callhandling Screen
    [Tags]      cmp_call_handling   ch_tc_01   plt_GEN2_WEB   tsn_regression
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Call Handling


New Customer Validate That User Can Create New Customer TC_02
    [Documentation]    Creating New New Customer    
    [Tags]      cmp_call_handling   ch_tc_02   plt_GEN2_WEB   tsn_regression      
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}

Validate That User Should Be Able To Add New Payment Method TC_03
    [Documentation]    Creating New Customer And Selection New Payment Method And verify successful message
    [Tags]      cmp_call_handling   ch_tc_03   plt_GEN2_WEB   tsn_regression    
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${True}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}=    Add Payment Method    payment_method=${global_test_data}[payment_method]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[payment_added__success_message]    values=${True}
    ...    msg=Payment added success message is not displayed


New Customer Validate That User Can Create New Job Request TC_04
    [Documentation]    Creating Job Request For New Customer    [SWPL-T4440 | SWPL-T3866 | SWPL-T4390]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4440
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3866
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4390
    [Tags]      cmp_call_handling   ch_tc_04   plt_GEN2_WEB   tsn_regression     uid_SWPL-T4440    uid_SWPL-T3866    uid_SWPL-T4390    
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully
    Navigation Job Record Tab-Home    phone_number=${phone_number}
    ${job}=    Call Status Job Created Filter    job_exp_txt=${global_test_data}[job_exp_txt]
    Should Be Equal    first=${job}    second=${global_test_data}[job_exp_txt]    values=${True}    msg=Job filter not displayed call type

New Customer Validate That User Can Create Ticket TC_05 
    [Documentation]    Creating Ticket For New Customer.    [SWPL-T3867]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3867
    [Tags]      cmp_call_handling   ch_tc_05   plt_GEN2_WEB   tsn_regression    uid_SWPL-T3867       
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=

    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${success_message_title}    ${ticket_request_success_message}=    Create Ticket    ticket_Type=${global_test_data}[ticket_Type]    description=${global_test_data}[description]
    
    Should Be Equal    first=${success_message_title}    second=${global_test_data}[ticket_created_succ_title_msg]    values=${True}     
    ...    msg=ticket created success msg is not displayed
    
    Should Be Equal    first=${ticket_request_success_message}    second=${global_test_data}[ticket_created_succ_desc_msg]    values=${True}     
    ...    msg=ticket created success msg is not displayed
    
    Navigation Ticket Record Tab-Home     phone_number=${phone_number}    ticket_Type=${global_test_data}[ticket_Type]

    ${ticket}=    Call Status Ticket Type Filter      ticket_exp_txt=${global_test_data}[ticket_exp_txt]

    Should Be Equal    first=${ticket}    second=${global_test_data}[ticket_exp_txt]    values=${True}     msg=Ticket type not displayed in job type flter

Validate That User Should Be Able To Find Search Customer By His Phone Number TC_06
    [Documentation]    Search Custome By Phone Number On Call Handling Screen.    [SWPL-T4426]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4426
    [Tags]      cmp_call_handling   ch_tc_06   plt_GEN2_WEB   tsn_regression    uid_SWPL-T4426
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    Find Customer By PhoneNumber    phone_number=${phone_number}


Validate That User Should Be Able To Make Outbound Call TC_07
    [Documentation]    Create Outbound Call By Selection Outbound Call Option From Call Direction Dropdown
    [Tags]      cmp_call_handling   ch_tc_07   plt_GEN2_WEB   tsn_regression    
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    Create Call
    ${success_message_title}    ${ticket_request_success_message}=    Create Ticket    ticket_Type=${global_test_data}[ticket_Type]    description=${global_test_data}[description]
    Should Be Equal    first=${success_message_title}    second=${global_test_data}[ticket_created_succ_title_msg]    values=${True}     
    ...    msg=ticket created success msg is not displayed
    Should Be Equal    first=${ticket_request_success_message}    second=${global_test_data}[ticket_created_succ_desc_msg]    values=${True}     
    ...    msg=ticket created success msg is not displayed

Validate That User Can Make A Job Request As Post-Pending TC_08
    [Documentation]    Create Job Request As Post-Pending
    [Tags]      cmp_call_handling   ch_tc_08   plt_GEN2_WEB   tsn_regression      
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${post_pending_success_message_title}=    Post Pending    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]    
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${post_pending_success_message_title}    second=${global_test_data}[post_pending_success_msg]    values=${True}     
    ...    msg=Post pending success message is not displayed.
    ${text_abort}=    Call Status Post-Pending Filter    post_pending_exp_txt=${global_test_data}[post_pending_exp_txt]

    Should Be Equal    first=${text_abort}    second=${global_test_data}[post_pending_exp_txt]    values=${True}     


SWG2-10418 & SOE-129, Validatde Received By FIlter
    [Documentation]    While Creating A User, Check That There Should Not Be Any Error.
    [Tags]      cmp_call_handling   ch_tc_09   plt_GEN2_WEB   tsn_regression        
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=

    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${received_email}=    Received By Filter    receivedby=${global_test_data}[receivedby]
    Should Be Equal    first=${received_email}    second=${global_test_data}[receivedby]    values=${True}    msg=Received by filter not working


Validate That User Should Be Able Create Agreement TC_10
    [Documentation]    Verify Create Agreement For New Customer.    [SWPL-T3869]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3869
    [Tags]      cmp_call_handling   ch_tc_10   plt_GEN2_WEB   tsn_regression    uid_SWPL-T3869         
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
   ${agreementC_created_success}=    Add Agreement     agreement_type=${global_test_data}[agreement_type]    
    ...    month=${global_test_data}[month]    payment_method=${global_test_data}[payment_method]
    Should Be Equal    first=${agreementC_created_success}    second=${global_test_data}[agreement_created_succ_msg]    values=${True}     
    ...    msg=Agreement created successfully message is not displayed
    # Should Be Equal    first=${future_payment_detail}    second=${global_test_data}[agree_future_pay_detail]    values=${True}     
    #  ...    msg=future payment method success message is not displayed


Validate That User Shoule Be Able To Link Billing Account TC_11
    [Documentation]   Add billing account for new customer
    [Tags]      cmp_call_handling   ch_tc_11   plt_GEN2_WEB   tsn_regression       
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}

    ${success_message_title}=    Link Primery Billing account    last_name=${global_test_data}[last_name]
    Should Be Equal    first=${success_message_title}    second=${global_test_data}[bill_account_link_succ_msg]    values=${True}     
    ...    msg=Billing Account Linked success message is not displayed


Validate That User Should Be Able To Unlink The Primary Billing Account TC_12
    [Documentation]    Verify Unlink Primary Billing
    [Tags]      cmp_call_handling   ch_tc_12   plt_GEN2_WEB   tsn_regression
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${success_message_title}=    Link Primery Billing account    last_name=${global_test_data}[last_name]
    Should Be Equal    first=${success_message_title}    second=${global_test_data}[bill_account_link_succ_msg]    values=${True}     
    ...    msg=Billing Account Linked success message is not displayed
    
    ${unlink_success_msg}=    Unlink Primery Billing account
    Should Be Equal    first=${unlink_success_msg}    second=${global_test_data}[unlink_bill_acc_mesg]    values=${True}     
    ...    msg=Unlink Billing Account success message is not displayed


Validate That User Should Be Able To Abort The Job Request TC_13
    [Documentation]    Verify Abort Call Functionality , Abort Call
    [Tags]      cmp_call_handling   ch_tc_13   plt_GEN2_WEB   tsn_regression
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    ${success_message_title}=    Job Request-Abort Functionality
    Should Be Equal    first=${success_message_title}    second=${global_test_data}[job_abort_msg]    values=${True}     msg=job abort success message is not displayed
    ${text_abort}=    Call Status Abort-Filter    expected_txt=${global_test_data}[expected_txt]

    Should Be Equal    first=${text_abort}    second=${global_test_data}[expected_txt]    values=${True}     msg=Abort text not displayed

Validate That User Should Be Able Create Agreement With Periodic Payment TC_14
    [Documentation]    Verify Create Agreement And Select Periodic Payment Mode
    [Tags]      cmp_call_handling   ch_tc_14   plt_GEN2_WEB   tsn_regression    
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${description}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5    LETTERS=50     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${agreementC_created_success}=    Add Agreement     agreement_type=${global_test_data}[agreement_type]    
    ...    month=${global_test_data}[month]    payment_method=${global_test_data}[payment_method]
    Should Be Equal    first=${agreementC_created_success}    second=${global_test_data}[agreement_created_succ_msg]    values=${True}     
    ...    msg=future payment method success message is not displayed
    
    ${make_payment_success}=    Add Agreement-Make Payment
    Should Be Equal    first=${make_payment_success}    second=${global_test_data}[agree_payment_done]    values=${True}     msg=Payment success message is not displayed


Validate That User Should Be Able To Abort-Ticket TC_15
    [Documentation]    Verify Abort Functionality For Ticket , Abort-Ticket
    [Tags]      cmp_call_handling   ch_tc_15   plt_GEN2_WEB   tsn_regression
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=

    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${ticket_abort_succ_msg}=    Ticket-Abort Functionality
    Should Be Equal    first=${ticket_abort_succ_msg}    second=${global_test_data}[ticket_abort_msg]    values=${True}     msg=Ticket abort success message is not displayed


Validate That User Should Be Able To Abort-Sales TC_16
    [Documentation]    Verify Abort Functionality For Ticket , Abort-Sales
    [Tags]      cmp_call_handling   ch_tc_16   plt_GEN2_WEB   tsn_regression
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=

    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${sales_abort_succ_msg}=    Sales-Abort Functionality
    Should Be Equal    first=${sales_abort_succ_msg}    second=${global_test_data}[sales_abort_msg]    values=${True}     msg=Sales abort success message is not displayed


Validate That User Shoule Be Able To Click On Purchase Order On Dispatch Screen TC_17
    [Documentation]    Verify Job Quick View > Click Ourchase Order 
    [Tags]      cmp_call_handling   ch_tc_17   plt_GEN2_WEB    tsn_regression
    Skip       
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com  
    ...      lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=

    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}=    Purchasing Order-Quick View    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]    
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]    technician=${global_test_data}[technician]

    Purchasing Order-Quick View-Part_2    ${first_name}    ${last_name}


Validate That After Creating A Job When User Opens The Same Call Again And Click On Back To Search And Select Different Customer, New Customer Is Not Getting Selected TC_18
    [Documentation]    Verify Create User >Go Back To Serach And Select Different Customer And Again Go Back To Serach And Select New Customer
    [Tags]      cmp_call_handling   ch_tc_18   plt_GEN2_WEB   tsn_regression        
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${description}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5    LETTERS=50     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]    
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Find Customer By Name    first_name=${first_name}    user_test_data=${global_test_data}[user_test_data]


Validate That User Can Cancel Job From Call Handling Screen TC_19
    [Documentation]    Cancel Job From Call Handling Screen
    [Tags]      cmp_call_handling   ch_tc_19   plt_GEN2_WEB   tsn_regression           
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request For Cancel Job    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job is not created successfully
 
    ${job_cancelled_succ_msg}=    Cancel job -callhandling screen    ${phone_number}
    Should Be Equal    first=${job_cancelled_succ_msg}    second=${global_test_data}[job_cancell_msg]    values=${True}    msg=job cancelled message is not displayed

    ${expected_txt}=    Navigation Job Record Tab-Home - Job Status    
    Should Be Equal    first=${expected_txt}    second=${global_test_data}[job_status_1]    values=${True}    msg=Job Sataus text Not Fetch

Validate That User Can Create Sales TC_20
    [Documentation]     Create Sales And Validate Sales Created Success Message.    [SWPL-T4462 | T4878]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4462
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4878
    [Tags]      cmp_call_handling   ch_tc_20   plt_GEN2_WEB   tsn_regression    uid_SWPL-T4462      uid_SWPL-T4878     
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${confirmation_screen}    ${sales_creation_success_message}=    Create Sales Without Job    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    lead_source_type_2=${global_test_data}[lead_source_type_2]    equipment=${global_test_data}[equipment]
    Should Be Equal    first=${confirmation_screen}    second=${global_test_data}[sales_oppor_confr_msg]    values=${True}     msg=Sales created success message is not displayed
    Should Be Equal    first=${sales_creation_success_message}    second=${global_test_data}[sales_creation_succ_desc_msg]    values=${True}     
    ...    msg=Sales created success description message is not displayed
    Navigation Sales Record Tab-Home    phone_number=${phone_number}     expected_jobtype=${global_test_data}[expected_jobtype]
    
    ${opportunity}=    Call Status Opportunity Created Filter    opportunity_txt=${global_test_data}[opportunity_txt]
    Should Be Equal    first=${opportunity}    second=${global_test_data}[opportunity_txt]    values=${True}    msg=Opportunity text not displayed

Validate That User Can Create Ticket With Self-Assign TC_21
    [Documentation]    Create Ticket And Select Checkbox Self-Assign
    [Tags]      cmp_call_handling   ch_tc_21   plt_GEN2_WEB   tsn_regression       
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${description}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5    LETTERS=50     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${icket_Self_Assign_success_message}=    Create Ticket-Self Assign    ticket_Type=${global_test_data}[ticket_Type]    description=${global_test_data}[description]
    Should Be Equal    first=${icket_Self_Assign_success_message}    second=${global_test_data}[ticket_self_assign_msg]    values=${True}     
    ...    msg=Ticket self created message is not displayed


SWG2-10109,SOE-122 - When User Switch Back To Call Handling From Any Other Module, Edit Customer Information Drawer Is Getting Opened Automatically TC_22
    [Documentation]    Navigationg Between Different Components
    [Tags]      cmp_call_handling   ch_tc_22   plt_GEN2_WEB   tsn_regression
   ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${description}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5    LETTERS=50     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    Navigate To LHN Option    navigation=Customer Service>>Customer Manager
    Navigate To LHN Option    navigation=Customer Service>>Call Handling

Validate Date Of Call Filter TC_23
    [Documentation]     Create Job Request Without Adding Billing Account
    [Tags]      cmp_call_handling   ch_tc_23   plt_GEN2_WEB   tsn_regression         
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job is not created successfully
    Date OF Call FIlter    job_number=${job_number}

Create Customer Without Entering Data In Required Fields-negative TC_24
    [Documentation]    Validating Error Message When Trying To Create A User By Not Filling Data In Mandatory Fields - Negative_Tc
    [Tags]      cmp_call_handling   ch_tc_24   plt_GEN2_WEB   tsn_regression    negative
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5   
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${phone_number_empty}=    Not Filling Data In Phone Number Tab    first_name=${first_name}    last_name=${last_name}    phone_number=    email_id=protivitiautomation+${email_id}@gmail.com    
    ...    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    
    Should Be Equal    first=${phone_number_empty}    second=${global_test_data}[invalid_phno_validation_message]    values=${True} 
    ...       msg=proper validation message not displaye for missing data ni mandatory 

Validate That User Should Not Be Able Create Agreement With Adding Visit Per Year More Than Scheduled Visit Per Year-negative TC_25
    [Documentation]    Validating Error Message > Adding Visit Per Year More Than Scheduled Visit - Negative_Tc
    [Tags]      cmp_call_handling   ch_tc_25   plt_GEN2_WEB   tsn_regression    negative
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${description}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5    LETTERS=50
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]   
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    email_id=protivitiautomation+${email_id}@gmail.com    
    ...    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${validation_message}=    Add Agreement-Negative_tc     agreement_type=${global_test_data}[agreement_type]        month=${global_test_data}[month]
    Should Be Equal    first=${validation_message}    second=${global_test_data}[agr_validation_msg]    values=${True}    msg=agreement message is not displayed

Validate That User Can Edit Billing Account TC_26
    [Documentation]    Update Billing Account By Clicking On Edit Icon.    [SWPL-T4442 | SWPL-T4443]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4443
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4442
    [Tags]      cmp_call_handling   ch_tc_26   plt_GEN2_WEB   tsn_regression    uid_SWPL-T4442    uid_SWPL-T4443
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${billing_acccount_validation_message}=    Edit Primery Billing account        payment_note=${global_test_data}[payment_note]
    Should Be Equal    first=${billing_acccount_validation_message}    second=${global_test_data}[edit_billing_acc_msg]    values=${True}    
    ...    msg=Billing account edit message is not displayed

SWG2-10246,SOE-118 - Edit Billing Account - Not Filling Mandatory Fields Or Not Tokenizing And And Clicking On Save - Success Popup Appears TC_27
    [Documentation]    Validated Tokenization Error Message By Selecting Payment Method But Not Filling Details In Fields and click Save.    
    
    [Tags]      cmp_call_handling   ch_tc_27   plt_GEN2_WEB   tsn_regression
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    email_id=protivitiautomation+${email_id}@gmail.com    
    ...    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}

    ${amex_tokenization_validation_message}=    Edit Primery Billing account-select Amex
    Should Be Equal    first=${amex_tokenization_validation_message}    second=${global_test_data}[tokenixation_msg]    values=${True}    msg=tokenization message is not displayed
    

SWG2-10102 ,SOE-125 - Technician Name Is Not Getting Displayed In Job Tab In Call Handling Even After Assigning The Job To Technician TC_28
    [Documentation]    Check The Technician Name In The Job Tab On The Call Handling Screen After Creating The Job And Assigning It To The Technician.    [SWPL-T4884]
    #https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4884
    [Tags]      cmp_call_handling   ch_tc_28   plt_GEN2_WEB   tsn_regression    uid_SWPL-T4884
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${city}    ${state}    ${zip_code}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    LETTERS=5    LETTERS=2    NUMBERS=6
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${city}    state=${state}  
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
   Find Customer By PhoneNumber    phone_number=${phone_number}
    
    ${job_request_success_message}=    Job Tab on Call Handling Page    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]    
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]    technician=${global_test_data}[technician]    phone_number=${phone_number}
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=technician name not displayed


