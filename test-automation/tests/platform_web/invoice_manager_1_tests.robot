*** Settings ***
#Library      AutoRecorder      mode=test
Resource    ../../../utils/playwright_utils.robot
Resource    ../../../page_objects/user_management/login_page.robot
Resource    ../../../utils/csv_utils.robot
Resource    ../../../page_objects/customer_service/call_handling_page.robot
Resource    ../../../page_objects/customer_service/invoice_manager_page.robot
Resource    ../../../utils/table_utils.robot
Test Setup    Custom Setup
Suite Setup    Get Data from CSV    folder_name=platform_web    file_name=invoice_manager.csv    
Test Teardown    Custom Teardown    browser=ALL    context=ALL

*** Variables ***
${invoice_file_name}    invoice_manager_file.csv
${table_header_locator_accounts_tab_table}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[1]//div[contains(@class,'ant-table-header')]//tr//th
${table_row_locator_accounts_tab_table}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[1]//tr[contains(@class,'ant-table-row')]

${batch_table_header_locator_accounts_tab_table}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[2]//div[contains(@class,'ant-table-header')]//tr//th
${batch_table_row_locator_accounts_tab_table}=    xpath=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[2]//tr[contains(@class,'ant-table-row')]


*** Test Cases ***

Invoice Manager - Basics - Grid Sorting [SWPL-T3799|SWPL-T3800]
    [Documentation]    Invoice Manager - Basics - Grid Sorting
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3799?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3800?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_1   plt_GEN2_WEB    uid_swpl-t3800    uid_swpl-t3799    uid_swpl-t3800    
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    
    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    Sleep    10s
    Grid Sorting    column_name=${global_test_data}[dept_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[type_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[invoicedate_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[printdate_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[invoiceno_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[jobno_column]
    Sleep    2s
    Grid Sorting    column_name=${global_test_data}[lastname_column]
    #Lists Should Be Equal    ${row_texts}    ${sorted_texts}    Lists are not sorted correctly.


Invoice Manager_Receivables Manager Grid Report Export. 
    [Documentation]    Exporting the Grid Report. Also, Verify report is downloaded.    [SWPL-T3805]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3805?projectId=10211
    [Tags]    cmp_invoice_manager   invoice_2   plt_GEN2_WEB    uid_swpl-t3805
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    Sleep    10s
    Export/Download CSV File   file_name=${invoice_file_name}
    File Should Exist    ${EXECDIR}/downloads/${invoice_file_name}    msg=File is not available in to the downloads folder.
    

Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable) 
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable)[SWPL-T3812]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3812?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_3   plt_GEN2_WEB    uid_swpl-t3812   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Sleep    10s
    #Navigate To LHN Option    navigation=Customer Service>>Call Handling
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    Sleep    10s
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    
    Sleep    10s
    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount    unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${itemPost_success_msg}=    Invoice Post
    Custom Log    ${itemPost_success_msg}
    #Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    
    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}
    
    
Invoice Manager - Invoices with Discount - Invoice Discount with Tax Added
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount with Tax Added [SWPL-T3813|SWPL-T3815|SWPL-T3816]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3813?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3815?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3816?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_4   plt_GEN2_WEB    uid_swpl-t3813    uid_swpl-t3815    uid_swpl-t3816   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    

    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}
    

Invoice Manager - Invoices with Discount - Item Discount (Adding two parts)
    [Documentation]    Invoice Manager - Invoices with Discount - Item Discount (Adding two parts) [SWPL-T3814|SWPL-T3814]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3814?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3817?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_5   plt_GEN2_WEB    uid_swpl-t3814   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount with two items part    unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    #Should Be Equal    first=${afterDiscount}    second=${global_test_data}[afterDiscount]    values=${True}

    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    #Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itemsuccess_msg]    values=${True}   

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoice with Payment - Cash 
    [Documentation]    Invoice Manager - Invoices with Discount and Apply Payment with Cash mode [SWPL-T3818]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3818?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_6   plt_GEN2_WEB    uid_swpl-t3818   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount    unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    #Need to update this function
    ${invoicepayment_actual_msg}=    Invoice Apply Cash Payment    paymentmethod=${global_test_data}[paymentmethod]    unitprice=${global_test_data}[unitprice]
    Custom Log    ${invoicepayment_actual_msg}
    #Should Be Equal    first=${invoicepayment_actual_msg}    second=${global_test_data}[itemsuccess_msg]    values=${True}

    ${itemPost_success_msg}=    Invoice Post 
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    
    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoice with Payment - Adjust and Void Invoice 
    [Documentation]    Invoice Manager - Invoice with Payment - Validate Adjust Invoice and Void Invoice [SWPL-T3819|SWPL-T3823]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3819?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3823?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_7   plt_GEN2_WEB    uid_swpl-t3819   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    
    ${itemPost_success_msg}=    Invoice Post 
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    
    ${invoiceAdjust_actual_msg}=    Invoice Adjust
    Custom Log    ${invoiceAdjust_actual_msg}
    #Should Be Equal    first=${invoiceAdjust_actual_msg}    second=${global_test_data}[invoiceadjust_success_msg]    values=${True}
    
    ${btnpost_state}   ${btnadjust_state}=    Validate Void Invoice
    Should Contain    container=${btnpost_state}    item=${global_test_data}[disabled_state]    values=${True}
    Should Contain    container=${btnadjust_state}    item=${global_test_data}[disabled_state]    values=${True}


Invoice Manager - Multiple Invoices - Create Second Invoice for Job 
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable)[SWPL-T3824]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3824?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_8   plt_GEN2_WEB    uid_swpl-t3824   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount    unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}   
    ${Invoice_number1}    ${Invoice_number2}    ${itemSave_success_msg}=    Add More Invoice
    #Should Be Equal    first=${itemSave_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}  

    ${itemPost_success_msg}=    Invoice Post
    Custom Log    ${itemPost_success_msg}
    Sleep    10s
    Click Invoice Cancel
    Sleep    10s
    Filter Invoice with JobNumber    job_number=${job_number}
    Set Table    generic_table_header_locator=${table_header_locator_accounts_tab_table}    
    ...    generic_table_row_locator=${table_row_locator_accounts_tab_table}
    Validate Values Present In Column    column_name=Invoice No.    value=${Invoice_number1}
    Validate Values Present In Column    column_name=Invoice No.    value=${Invoice_number2}


Invoice Manager - Print and Send Invoice to Customer 
    [Documentation]    Invoice Manager - Print and Send Invoice to Customer (on non-taxable)[SWPL-T3828]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3828?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_9   plt_GEN2_WEB    uid_swpl-t3828   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager    
    
    ${preview_message} =    Preview Invoice
    Should Be Equal    first=${preview_message}    second=${global_test_data}[preview]


Invoice Manager - Quick Entry - Enter/Post Zero Dollar Invoice
    [Documentation]    Invoice Manager - Quick Entry - Enter/Post Zero Dollar Invoice[SWPL-T3806|SWPL-T3808]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3806?projectId=10211
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3808?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_10   plt_GEN2_WEB    uid_swpl-t3806   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    
    ${itemSave_success_msg}=    Item Details With Zero Discount    unitprice=${global_test_data}[unitpricezero]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    #Should Be Equal    first=${itemSave_success_msg}    second=${global_test_data}[itemsuccess_msg]    values=${True}

    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    
    ${actual_account_balance}=    Validate Account History
    Should Be Equal    first=${actual_account_balance}    second=$0.00     values=${True}
    Click Invoice Close
    
    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Quick Entry - Adjust Invoice
    [Documentation]    Invoice Manager - Quick Entry - Adjust Invoice [SWPL-T3807]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3807?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_11   plt_GEN2_WEB    uid_swpl-t3807   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer     first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    
    ${itemPost_success_msg}=    Invoice Post 
    Custom Log    ${itemPost_success_msg}
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
    
    ${invoiceAdjust_actual_msg}=    Invoice Adjust
    Custom Log    ${invoiceAdjust_actual_msg}
    #Should Be Equal    first=${invoiceAdjust_actual_msg}    second=${global_test_data}[invoiceadjust_success_msg]    values=${True}

    ${actual_account_balance}=    Validate Account History
    Should Be Equal    first=${actual_account_balance}    second=$0.00     values=${True}


Invoice Manager - Invoices with Tax Added - Parts (only)
    [Documentation]    Invoice Manager - Invoices with Tax Added - Parts (only) [SWPL-T3809]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3809?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_12   plt_GEN2_WEB    uid_swpl-t3809   
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    

    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Misc   unitprice=${global_test_data}[unitprice]    
    ...    itemtype_misc=${global_test_data}[itemtype_misc]    item_no_misc=${global_test_data}[item_no_misc]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoices with Tax Added - No Tax
    [Documentation]    Invoice Manager - Invoices with Tax Added - No Tax [SWPL-T3810]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3810?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_13   plt_GEN2_WEB    uid_swpl-t3810 
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    
    Add NoTax Invoice
    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Misc   unitprice=${global_test_data}[unitprice]    
    ...    itemtype_misc=${global_test_data}[itemtype_misc]    item_no_misc=${global_test_data}[item_no_misc]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoices with Tax Added - Custom Tax
    [Documentation]    Invoice Manager - Invoices with Tax Added - Custom Tax [SWPL-T3811]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T3811?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_14   plt_GEN2_WEB    uid_swpl-t3811 
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    
    Add Custom Tax Invoice    taxcode_amt=${global_test_data}[taxcode_amount]
    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
      
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoices with Tax Added - Labor (only)
    [Documentation]    Invoice Manager -  Invoices with Tax Added - Labor (only) [SWPL-T4072]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4072?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_15   plt_GEN2_WEB    uid_swpl-t4072 
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    
    
    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor with Tax    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Misc   unitprice=${global_test_data}[unitprice]    
    ...    itemtype_misc=${global_test_data}[itemtype_misc]    item_no_misc=${global_test_data}[item_no_misc]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoices with Tax Added - Misc (only)
    [Documentation]    Invoice Manager -  Invoices with Tax Added - Misc (only) [SWPL-T4073]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4073?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_16   plt_GEN2_WEB    uid_swpl-t4073 
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    
    
    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Discount   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Misc with Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype_misc=${global_test_data}[itemtype_misc]    item_no_misc=${global_test_data}[item_no_misc]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


Invoice Manager - Invoices with Tax Added - Combo Parts, Labor, Misc
    [Documentation]    Invoice Manager -  Invoices with Tax Added - Combo Parts, Labor, Misc [SWPL-T4089]
    # https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4089?projectId=10211
    [Tags]      cmp_invoice_manager   invoice_17   plt_GEN2_WEB    uid_swpl-t4089
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}=    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5 
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com     lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]    
    ...    address1=${global_test_data}[address_1]    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${global_test_data}[zip_code]    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    ${setdiscount_message}=    Select Invoice with JobNumber    job_number=${job_number}       
    ${setdiscount_message}=    Set Discount    discounttype=${global_test_data}[discounttype]
    Should Be Equal    first=${setdiscount_message}    second=${global_test_data}[discounttype_success]    values=${True}    
    
    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Labor with Tax    unitprice=${global_test_data}[unitprice]    
    ...    itemtype_labor=${global_test_data}[itemtype_labor]    item_no_labor=${global_test_data}[item_no_labor]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}

    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}=    Item Details With Misc with Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype_misc=${global_test_data}[itemtype_misc]    item_no_misc=${global_test_data}[item_no_misc]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${itemPost_success_msg}=    Invoice Post
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}

    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}
