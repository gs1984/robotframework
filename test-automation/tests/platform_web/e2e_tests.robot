*** Settings ***
Resource    ../../../utils/playwright_utils.robot
Resource    ../../../utils/csv_utils.robot
Resource    ../../../utils/table_utils.robot
Resource    ../../../page_objects/user_management/login_page.robot
Resource    ../../../page_objects/customer_service/call_handling_page.robot
Resource    ../../../page_objects/customer_service/dispatch_page.robot
Resource    ../../../page_objects/customer_service/invoice_manager_page.robot
Resource    ../../../page_objects/purchasing/purchasing_manager_page.robot
Resource    ../../../page_objects/purchasing/payables_manager_page.robot
Resource    ../../../page_objects/purchasing/pricebook_manager_page.robot


Test Setup    Custom Setup
Suite Setup    Get Data from CSV    folder_name=platform_web    file_name=e2e_data.csv
Test Teardown    Custom Teardown    browser=ALL    context=ALL

*** Test Cases ***

E2E AR-Job flow Test Case
    [Documentation]    E2E AR-Job flow Test Case
    [Tags]    tsn_e2e_tc    e2e_tc_01    plt_GEN2_WEB
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${zip_code}=    Create Random Strings    LETTERS=5    LETTERS=5    
    ...    NUMBERS=10    LETTERS=5    LETTERS=8    NUMBERS=6

    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    
    ...    phone_number=${phone_number}    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    
    ...    lead_source=${global_test_data}[lead_source_id]    address1=${address1}    city=${global_test_data}[city]    state=${global_test_data}[state]    
    ...    zip_code=${zip_code}    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}    
    ...    msg=Customer Record Created Successfully message is not matched or not displayed.

    ${job_number}=    Create Job Request with Schedule Job For E2E    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]    technician=${global_test_data}[technician_name]    equipment=

    Navigate To LHN Option    navigation=Customer Service>>Dispatch
    Open Job Details Drawer In Dispatch    first_name=${first_name}

    Set Assignment Progress    dispatched=${global_test_data}[dispatched_time]    onsite=${global_test_data}[onsite_time]    
    ...    completed=${global_test_data}[completed_time]
    Navigate to Invoice Sales Quote Tab
    Switch Page    NEW

    ${invoice_no}=    Get Invoice Number
    Close Page
    Close Job Details Drawer

    Navigate To LHN Option    navigation=Customer Service>>Invoice Manager
    Find Invoice With Invoice Number With Open Invoice    invoice_number=${invoice_no}

    ${beforeDiscount}    ${afterDiscount}=    Item Details With Discount And Tax   unitprice=${global_test_data}[unitprice]    
    ...    itemtype=${global_test_data}[itemtype]    item_no=${global_test_data}[item_no]    dept=${global_test_data}[dept]
    Should Be Equal    first=${beforeDiscount}    second=$1,000.00    values=${True}
    
    ${agreement_created_msg}=    Add New Agreement Invoice    type_name=${global_test_data}[type_name]    date=${global_test_data}[date]    month=${global_test_data}[month]    payment_method=${global_test_data}[payment_method]
    Should Be Equal    first=${agreement_created_msg}    second=${global_test_data}[future_payment_details_saved_msg]    values=${True}    msg=Future payment saved Message is not visible
    
    ${itemPost_success_msg}=    Invoice Post For E2E
    Should Be Equal    first=${itemPost_success_msg}    second=${global_test_data}[itempost_success_msg]    values=${True}
 
    Open Account History
    Click Invoice Close
    Sleep    5s
    ${local_total_credits}    ${local_total_debits}=    Validate GL Invoice
    Should Be Equal    first=${local_total_credits}    second=${local_total_debits}    values=${True}


E2E Purchasing flow Test Case
    [Documentation]    E2E Purchasing flow Test Case
    [Tags]    tsn_e2e_tc    e2e_tc_02    plt_GEN2_WEB   
    
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    Navigate To LHN Option    navigation=Purchasing>>Payables Manager
    ${vendor_number}    ${Vendor_Added_Notification_Message}=    Create New Vendor    Vendor_Address=${global_test_data}[Vendor_Address]
    Should Be Equal    first=${Vendor_Added_Notification_Message}    second=${global_test_data}[Vendor_Added_Notification]    values=${True}    msg=Vendor Added Successfully message is not displayed.
    
    Navigate To LHN Option    navigation=Purchasing>>Purchasing
    Create New PO without closing For E2E   Vendor_Number=${vendor_number}    Name_PO=${global_test_data}[Name_PO]
    Add Item In PO    Item_Type=${global_test_data}[Item_Type]    Item#=${global_test_data}[Item#]    Department=${global_test_data}[Department]    Unit_Cost=${global_test_data}[Unit_Cost]
    
    ${receipt_posted_message}=    Post Receipt For E2E
    Should Be Equal    first=${receipt_posted_message}    second=${global_test_data}[receipt_posted_message]    values=${True}    msg=Receipt Posted message is not displayed


E2E Inventory Manager flow Test Case
    [Documentation]    E2E Inventory Manager flow Test Case
    [Tags]    tsn_e2e_tc    e2e_tc_03    plt_GEN2_WEB
    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${address1}    ${zip_code}    ${group_name}    ${group_description}    ${additem_item_no}    
    ...    ${warehouse_number_1}    ${warehouse_number_2}     ${group_name}=    
    ...    Create Random Strings    LETTERS=8    LETTERS=8    NUMBERS=10    LETTERS=5     LETTERS=10    NUMBERS=6    LETTERS=5    LETTERS=4    NUMBERS=5    
    ...    UPPER_LETTERS=5    UPPER_LETTERS=5    LETTERS=5
       
    Login To Application    username=${global_test_data}[username]    password=${global_test_data}[password]    tenant_name=${global_test_data}[tenantname]
    ${message_popup_text}=    Add Customer - With Random Address    first_name=${first_name}    last_name=${last_name}    phone_number=${phone_number}    
    ...    email_id=protivitiautomation+${email_id}@gmail.com    lead_source_type=${global_test_data}[lead_source_type]    lead_source=${global_test_data}[lead_source_id]
    ...    address1=${address1}    city=${global_test_data}[city]    state=${global_test_data}[state]  zip_code=${zip_code}    
    ...    add_customer_existing_address=${True}    add_payment=${False}    company_name=
    Should Be Equal    first=${message_popup_text}    second=${global_test_data}[customer_creation_success_message]    values=${True}
    
    ${job_request_success_message}    ${job_number}=    Create Job Request    job_class=${global_test_data}[job_class]    job_type=${global_test_data}[job_type]
    ...    lead_source_type=${global_test_data}[lead_source_type]    job_lead_source=${global_test_data}[job_lead_source]
    Should Be Equal    first=${job_request_success_message}    second=${global_test_data}[job_created_success_msg]    values=${True}    msg=Job not created successfully

    Navigate To LHN Option    navigation=Purchasing>>Price Book
    ${Group_Notification_Message}=    Add Group in Parts Tab    group_name=${group_name}    group_description_text=${group_description}
    Should Be Equal    first=${Group_Notification_Message}    second=${global_test_data}[group_created_message]    values=${True}    
    ...    msg=Group Created Successfully message is not displayed.

    ${Item_Created_Notification_Message}=    Add Item in Group in Parts Tab    group_description_text=${group_description}    additem_item_no=${additem_item_no}
    ...    additem_description=${global_test_data}[additem_description]
    Should Be Equal    first=${Item_Created_Notification_Message}    second=${global_test_data}[item_created_notification]    values=${True}    
    ...    msg=Item Created successfully message is not displayed.

    Navigate To LHN Option    navigation=Purchasing>>Payables Manager
    ${vendor_number}    ${Vendor_Added_Notification_Message}=    Create New Vendor    Vendor_Address=${global_test_data}[Vendor_Address]
    Should Be Equal    first=${Vendor_Added_Notification_Message}    second=${global_test_data}[Vendor_Added_Notification]    values=${True}    msg=Vendor Added Successfully message is not displayed.

    Navigate To LHN Option    navigation=Purchasing>>Inventory Manager
    ${success_message}=    Create New Stock Warehouse    warehouse_number=${warehouse_number_1}

    ${receipt _message}=    Create New Receipt     vendor_number=${vendor_number}
    Should Be Equal    first=${receipt _message}    second=${global_test_data}[receipt_created_success_msg]    values=${True}    msg=Receipt not created successfully
    ${receipt_item_added_msg}=    Add Item In Receipt    itemtype=${global_test_data}[itemtype]    item_no=${additem_item_no}    department=${global_test_data}[Department]    
    ...    qty=${global_test_data}[received_qty]    warehouse=${warehouse_number_1}
    Should Be Equal    first=${receipt_item_added_msg}    second=${global_test_data}[receipt_updated_success_msg]    values=${True}    msg=Receipt Item added message not displayed.
    ${receipt_posted_message}=    Post Receipt In Inventory
    Should Be Equal    first=${receipt_posted_message}    second=${global_test_data}[receipt_posted_success_msg]    values=${True}    msg=Receipt Item posted message not displayed.

    ${requisition_message}=    Create New Requisition    warehouse_number=${warehouse_number_1}    job_number=${job_number}
    Should Be Equal    first=${requisition_message}    second=${global_test_data}[requisition_created_success_msg]    values=${True}    msg=Requisition not created successfully
    Add Item In Requisition    item_no=${additem_item_no}    qty=${global_test_data}[pulled_qty]
    #Should Be Equal    first=${requisition_item_added_msg}    second=${global_test_data}[requisition_item_success_msg]    values=${True}    msg=Requisition Item added message not displayed.
    Post Requisition In Inventory
    #Should Be Equal    first=${requisition_posted_message}    second=${global_test_data}[requisition_posted_success_msg]    values=${True}    msg=Requisition Item posted message not displayed.

    ${return_message}=    Create New Return    warehouse_number=${warehouse_number_1}    job_number=${job_number}
    Should Be Equal    first=${return_message}    second=${global_test_data}[return_created_success_msg]    values=${True}    msg=Return not created successfully
    ${return_item_added_msg}=    Edit Item In Return        qty=${global_test_data}[pulled_qty]    itemtype=${global_test_data}[itemtype]
    Should Be Equal    first=${return_item_added_msg}    second=${global_test_data}[return_item_success_msg]    values=${True}    msg=Return Item added message not displayed.
    ${return_posted_message}=    Post Return In Inventory
    Should Be Equal    first=${return_posted_message}    second=${global_test_data}[return_posted_success_msg]    values=${True}    msg=Return Item posted message not displayed.

    ${success_message}=    Create New Stock Warehouse    warehouse_number=${warehouse_number_2}

    ${transfer_message}=    Create New Tranfer    warehouse_number_1=${warehouse_number_1}    warehouse_number_2=${warehouse_number_2}    job_number=${job_number}
    Should Be Equal    first=${transfer_message}    second=${global_test_data}[transfer_created_success_msg]    values=${True}    msg=Transfer not created successfully
    ${transfer_item_added_msg}=    Add Item In Tranfer    item_no=${global_test_data}[item_no] 
    Should Be Equal    first=${transfer_item_added_msg}    second=${global_test_data}[transfer_item_success_msg]    values=${True}    msg=Transfer Item added message not displayed.
    ${transfer_posted_message}=    Post Tranfer In Inventory
    Should Be Equal    first=${transfer_posted_message}    second=${global_test_data}[transfer_posted_success_msg]    values=${True}    msg=Transfer Item posted message not displayed.

    ${adjust_message}=    Create New Adjust    warehouse_number=${warehouse_number_1}    job_number=${job_number}     adjustment_code=${adjustment_code}
    Should Be Equal    first=${adjust_message}    second=${global_test_data}[adjust_created_success_msg]    values=${True}    msg=Adjust not created successfully
    ${adjust_item_added_msg}=    Add Item In Adjust    item_no=${global_test_data}[item_no]    qty=${global_test_data}[pulled_qty]
    Should Be Equal    first=${adjust_item_added_msg}    second=${global_test_data}[adjust_item_success_msg]    values=${True}    msg=Adjust Item added message not displayed.
    ${adjust_posted_message}=    Post Adjust In Inventory
    Should Be Equal    first=${adjust_posted_message}    second=${global_test_data}[adjust_posted_success_msg]    values=${True}    msg=Adjust Item posted message not displayed.
