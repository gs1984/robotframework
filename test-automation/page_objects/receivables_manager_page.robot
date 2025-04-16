*** Settings ***
Resource    ../../utils/playwright_utils.robot
Resource    ../../page_objects/reports/dashboard_page.robot
Resource    agreement_manager.robot
Library    Browser
Library  PlaywrightLibrary
Library  BuiltIn
Resource    ../../utils/string_utils.robot

*** Variables ***
${generic_button}=    //iframe[@id='Left-frame'] >>> //span[text()='<<string_to_replace>>']
#${ellipsis}=    //iframe[@id='Left-frame'] >>> //span[text()='New Account']//../following-sibling::a//span[@aria-label='more']
${ellipsis}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_NewAccount_Button_MoreOutlined']
${reconcile}=    //iframe[@id='Left-frame'] >>> //a[text()='Reconcile']
${miscellaneous_cash_receipt}=    //iframe[@id='Left-frame'] >>> //a[text()='Miscellaneous Cash Receipt']
${actions_ellipsis}=    //iframe[@id='Left-frame'] >>> (//th[text()='Actions']/../../../../following-sibling::div//tr//span[@aria-label='more'])[1]
${actions_ellipsis_generic_button}=    //iframe[@id='Left-frame'] >>> //a[text()='<<string_to_replace>>']
${tabs_generic_button}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-tabs-tab-btn') and text()='<<string_to_replace>>']
${statement_print_dialog_print_btn} =    //iframe[@id='Left-frame'] >>> //a//span[text()='Print']
${generic_input_field_ar}=    //iframe[@id='Left-frame'] >>> //input[@name='<<string_to_replace>>']
${confirmation_message}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'message_description')])[1]
${payment_method_drop_down}=    //iframe[@id='Left-frame'] >>> //span[text()='Please choose']//..//input
${generic_drop_down_value}=    //iframe[@id='Left-frame'] >>> //div[text()='<<string_to_replace>>']
${generic_radio_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='<<string_to_replace>>']
${message_locator}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_title')]
${account_history_ellipsis}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_Accounts_Dropdown_MoreOutlined']
#${account_history_ellipsis}=    //iframe[@id='Left-frame'] >>> //span[text()='Undo']//../following-sibling::a//span[@aria-label='more']
${recal_account_totals_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Recal Account Totals']
${account_details_billing_acount_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Account Details']
${recalculate_account_totals}=    //iframe[@id='Left-frame'] >>> //span[text()='Recalculate Account Totals']
${billing_account_history_actions_ellipsis}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-body']//th[text()='Actions']/../../../../following-sibling::div//tr//span[@aria-label='more'])[1]
${adjust_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Adjust']
${generic_adjustment_drop_down}=    //iframe[@id='Left-frame'] >>> //label[text()='<<string_to_replace>>']//../following-sibling::div//input
${adjust_amount}=    //iframe[@id='Left-frame'] >>> //label[text()='Adjust Amount ($)']//../following-sibling::div//input
${adjustment_post_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Cancel']//..//..//span[text()='Post']
${open_items_toggle_btn}=    //iframe[@id='Left-frame'] >>> //button[@data-test-id='swTestID_Accounts_Switch_OpenItems']
#${open_items_toggle_btn}=    //iframe[@id='Left-frame'] >>> //button[@id='swID_ReceivablesManager_Accounts_Switch_OpenItems']//div[@class='ant-switch-handle']
${overdue_toggle_btn}=    //iframe[@id='Left-frame'] >>> (//button[contains(@class,'ant-switch')])[2]
${allocate_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Allocate']
${adjust_code}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-select-item')]//span[contains(text(),'BC')]
${department}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-select-item')]//div[contains(text(),'00')]
${auto_apply_to_this_item}=    //iframe[@id='Left-frame'] >>> //span[text()='Auto apply this item']
${allocate_value}=    //iframe[@id='Left-frame'] >>> //div[text()='Allocate:']/following-sibling::div//input
${close_btn_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[@aria-label='close']
${allocations_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Allocations']
${allocations_form_balance_text}=    //iframe[@id='Left-frame'] >>> //b[text()='Balance ($): ']//..//label
${date_picker_age}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-popover-content')]//input
${next_btn_date_picker}=    //iframe[@id='Left-frame'] >>> //span[@class='ant-picker-next-icon']
${date_from_date_picker}=    //iframe[@id='Left-frame'] >>> //div[text()='15']
${yes_btn_in_age_billing_account}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']//../following-sibling::div//span[text()='Yes']
${amount_is_required}=    //iframe[@id='Left-frame'] >>> //input[@name='paymentAmount']/../../../../../following-sibling::div//div//div
${allocate_input_field}=    //iframe[@id='Left-frame'] >>> //div[text()='Allocate:']/following-sibling::div//input
${statement_tab_date_picker}=    //iframe[@id='Left-frame'] >>> //div[@class="ant-picker-input"]
${statement_tab_today_date_picker}=    //iframe[@id='Left-frame'] >>> //a[text()='Today']
${statement_print_dialog_print_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Statement Print Dialog']/../../..//span[text()='Print']
${refund_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Refund']
${refund_amount}=    //iframe[@id='Left-frame'] >>> //label[text()='Amount ($) ']/../following-sibling::div//input
${card_name_txtbx}=    //iframe[@id='Left-frame'] >>> //label[text()='Card Name']/../following-sibling::div//input
${payment_method_dropdown_value}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-select-dropdown')]//div[text()='Check']
${refund_post_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Customer Refund')]/../../following-sibling::div//span[text()='Post']
${post_this_check_refund_popup_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Post this check refund')]/..//span[text()='Yes']
${monthly_rate}=    //iframe[@id='Left-frame'] >>> //label[text()='Monthly rate']/../following-sibling::div//input
${apply_finance_ellipsis}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Apply Finance')]/../../../following-sibling::div[@class='ant-drawer-footer']//span[@aria-label='more']
${prepare_finance_in_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Prepare']
${finance_information_popup_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Information']/../following-sibling::div//span[text()='Yes']
${finance_tab_date_picker}=    //iframe[@id='Left-frame'] >>> //div[@class="ant-picker-input"]
${finance_tab_today_date_picker}=    //iframe[@id='Left-frame'] >>> //a[text()='Today']
${review_gl_billing_account_history}=    //iframe[@id='Left-frame'] >>> //a[text()='Review G/L']
${get_total_credits_review_gl}=    //iframe[@id='Left-frame'] >>> //label[text()='Total Credits']/../following-sibling::div//label
${get_total_debits_review_gl}=    //iframe[@id='Left-frame'] >>> //label[text()='Total Debits']/../following-sibling::div//label
${reverse_receivable_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Reverse Receivable']
${yes_btn_in_reverse_receivable_in_billing_account}=    //iframe[@id='Left-frame'] >>> //p[text()='Are you sure want to reverse this entry?']/../../../following-sibling::div//span[text()='Yes']
${post_finance_charges}=    //iframe[@id='Left-frame'] >>> //a[text()='Post Finance Charges']
${marketing_report}=    //iframe[@id='Left-frame'] >>> //a[text()='Marketing Report']
${age_accounts}=    //iframe[@id='Left-frame'] >>> //a[text()='Age Accounts']
${post_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Post']
${reverse_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Reverse']
${save_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Save']
${marketing_export_csv_btn}=     //iframe[@id='Left-frame'] >>>  //div[contains(@class,'swDrawerFooterLftBtn')]//span[contains(text(),'Export CSV')] 
${age_accounts_confirm_popup_ok_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']/../following-sibling::div//span[text()='OK']
${add_credit_memo_billing_account_history}=    //iframe[@id='Left-frame'] >>> //span[text()='Add Credit Memo']
${credit_memo_drop_down}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper'])[2]//div[@class='ant-select-selector']
#${credit_memo_drop_down}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper'])[2]//input[@id='swID_InvoiceManager_Select_CreditMemo']/..
${credit_memo_drop_down_value}=    //iframe[@id='Left-frame'] >>> //div[text()='OTHER - Unspecified reason']
${finance_information_popup_text}=    //iframe[@id='Left-frame'] >>> //div[text()='Information']/../following-sibling::div[@class='ant-modal-body']
${yes_btn_in_print_account_statement}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']//../following-sibling::div//span[text()='Yes']
${no_btn_in_print_account_statement}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']//../following-sibling::div//span[text()='No']
${pop_message_description}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'message_description')]
${show_all_entries_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Show All Entries']
${delete_btn}=    //iframe[@id='Left-frame'] >>> (//span[text()='Delete'])[1]
${invoices_toggle_button}=    //iframe[@id='Left-frame'] >>> //button[@id='swID_InvoiceManager_AccountHistory_Switch_Invoices']
${open_invoice}=    //iframe[@id='Left-frame'] >>> //span[text()='Open Invoice']
${batch_print_account}=    //iframe[@id='Left-frame'] >>> (//span[contains(text(),'Total Account Statements')]/../../../following-sibling::div//div//div)[1]
${cash_receipt_drawer_amount_field}=    //iframe[@id='Left-frame'] >>> //label[text()='Amount ($)']/../following-sibling::div//input
${cash_receipt_drawer_gl_distribution_amount_field}=    //iframe[@id='Left-frame'] >>> (//label[text()='Amount ($)']/../following-sibling::div//input)[2]
${adjust_code_gl_distribution}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-select-dropdown')]//span[contains(text(),'CASHSA')]
${no_data_found}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'empty_message')]
${search_by_text_box}=    //iframe[@id='Left-frame'] >>> //span[text()='Search by']/../../../../../../../following-sibling::div//input
${search_by_ddl}=    //iframe[@id='Left-frame'] >>> //span[text()='Search by']/..//span[@class='ant-select-selection-item']
${notes_text_field}=    //iframe[@id='Left-frame'] >>> //textarea[@name='comments']
${from_reg_account_ddl}=    //iframe[@id='Left-frame'] >>> //label[text()='Account # - Description - Account Type']/..//span//span[2]
${adjust_code_text}=    //iframe[@id='Left-frame'] >>> //label[text()='Adjust Code']/../following-sibling::div//label
${department_text}=    //iframe[@id='Left-frame'] >>> //label[text()='Department']/../following-sibling::div//label
${actual_refund_chckbx}=    //iframe[@id='Left-frame'] >>> //span[text()='Actual Refund']/..//input
${same_as_customer_address_chckbx}=    //iframe[@id='Left-frame'] >>> //span[text()='Same as Customer Address']/..//input
${card_number}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_StaxPayments_Input_Number']    #//div[@id="secure-payment-field-wrapper"]//input[@name="cardNumber"]
${exp_date_mm_yy}=    //iframe[@id='Left-frame'] >>> //input[@placeholder='Exp. Date (MM / YY)']
${security_code}=    //iframe[@id='Left-frame'] >>> //input[@placeholder='Security Code']
${account_id_chckbx}=    //iframe[@id='Left-frame'] >>> //span[text()='Account ID']/..//input
${balance_chckbx}=    //iframe[@id='Left-frame'] >>> //span[text()='Balance']/..//input
${pagination_ddl}=    //iframe[@id='Left-frame'] >>> //div[@aria-label='Page Size']//span[@class='ant-select-selection-item']
${select_payment_select_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Select Payment']/../../..//th[text()='Actions']/../../../../following-sibling::div//tr//td//span[text()='Select']
${review_gl_actions_invoices_tab}=    //iframe[@id='Left-frame'] >>> //a[contains(text(),'Review GL')]
${cancel_changes_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Cancel Changes']/../following-sibling::div//span[text()='Yes']
${search_btn}=    //iframe[@id='Left-frame'] >>>  //span[text()='Search']
${tblcolumn_billingaccounthistory}=    //iframe[@id='Left-frame'] >>>  //span[normalize-space()='Item Date']
${ar_adjustment_lbl}=    //iframe[@id='Left-frame'] >>>  //div[contains(text(),'A/R Adjustment')]
${start_button}=    //iframe[@id='Left-frame'] >>>  //button[span[contains(text(), 'Start')]]
${view_more_btn_edit_billing_account}=    //iframe[@id='Left-frame'] >>> //span[@id='swID_InvoiceManager_Button_OpenInvoice']
${add_time_stamp_in_notes}=    //iframe[@id='Left-frame'] >>> //span[@aria-label='clock-circle']//*[name()='svg']
${clear_all_in_notes}=     //iframe[@id='Left-frame'] >>> //span[@class='anticon anticon-delete swActionIcon']
${timestamp_button}=   //iframe[@id='Left-frame'] >>> //span[@aria-label='clock-circle']
${clear_all_button}=  //iframe[@id='Left-frame'] >>> //span[@aria-label='delete']
${cancel_changes_yes_btn_notes}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']//../following-sibling::div//span[text()='Yes']
${view_more_button}=   //iframe[@id='Left-frame'] >>> //span[@aria-label='eye']
${notes_cancel_button}=    //iframe[@id='Left-frame'] >>> //div[text()='Notes']/../../..//span[text()='Cancel']
${notes_view_more_text}=    //iframe[@id='Left-frame'] >>> //textarea[contains(@class,'nonEditableTextArea')]
${edit_acc_save_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-col ant-col-24 swDrawerFooterRgtBtn css-142vneq']//span[text()='Save']
${invoices_export_ellipsis}    //iframe[@id='Left-frame'] >>> (//span[@aria-label='more']//*[name()='svg'])[1]
${alternate_notes_text_field}=    //iframe[@id='Left-frame'] >>> //textarea[@name='notes']
${table_Lastname}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Last Name']
${btn_exportcsv}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ExportButtons_Button_Export']
${btn_next}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Next']
${btn_print}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Print']
${txt_paymentAmount}=    //iframe[@id='Left-frame'] >>> //input[@name='paymentAmount']
${accounts_subtab}=    //iframe[@id='Left-frame'] >>> //div[@id='rc-tabs-0-tab-1']
${search_button}=    //iframe[@id='Left-frame'] >>> //div[contains(@class, 'ant-space-item')]//span[text()='Search']/ancestor::button
${abort}=    //iframe[@id='Left-frame'] >>> //button[span[contains(text(), 'Abort')]]
${account_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ReceivablesManagerTabs_TabPane_Accounts']
${invoices_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ReceivablesManagerTabs_TabPane_Invoices']
${billing_account_ellipsis}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper']//span[@class='anticon anticon-more'])[1]
${allocations}=    //iframe[@id='Left-frame'] >>> //span[text()='Allocations']
${btn_search}=    //iframe[@id='Left-frame'] >>> //span[text()='Search']
#${btn_search}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Search']
${account_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ReceivablesManagerTabs_TabPane_Accounts']
${invoice_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ReceivablesManagerTabs_TabPane_Invoices']
${pmts_adj_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ReceivablesManagerTabs_TabPane_PMTS/ADJ']
${search_btn}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_SearchFilter_Button_Search']
${newaccount_btn}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_NewAccount_Button_NewAccount']

*** Keywords ***

Export/Download CSV File
    [Arguments]    ${tab_name}    ${file_name}
    [Documentation]    This method is used to Export CSV File
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${btn_exportcsv}    timeout=10s
    Click Element    selector=${btn_exportcsv}    
    Wait For Download To Complete    file_name=${file_name}
    Click Element    selector=//iframe[@id='Left-frame'] >>> //span[normalize-space()='Download']
    #Click Generic Button    Download
    Sleep    3s    reason=Waiting for file to be downloaded

Export/Download CSV File Invoices
    [Arguments]    ${tab_name}    ${file_name}
    [Documentation]    This method is used to Export CSV File
    Wait For Element To Be Visible    ${invoice_tab}    timeout=10s
    Click Element    selector=${invoice_tab}
    Sleep    10s
    Click Element     selector=${invoices_export_ellipsis}
    Wait For Element To Be Visible    ${btn_exportcsv}    timeout=10s
    Click Element    selector=${btn_exportcsv}
    Wait For Download To Complete    file_name=${file_name}
    Click Generic Button    Download
    Sleep    3s    reason=Waiting for file to be downloaded

Receivable Manager Page Load
    Wait For Element To Be Visible    ${table_Lastname}    20s

Reconcile With GL
    [Arguments]    ${pdf_file_name}
    [Documentation]    This method is used for Download PDF of Reconcile General Ledger    
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Sleep    5s
    Click Element    selector=${reconcile}
    Wait For Element To Be Visible    ${btn_next}    20s
    Click Element    selector=${btn_next}
    Wait For Element To Be Visible    ${btn_print}    20s
    Click Element    selector=${btn_print}
    #Click Generic Button    Next
    #Click Generic Button    Print
    Wait For Download To Complete    file_name=${pdf_file_name}
    Click Generic Button    Download PDF
    Sleep    2s
    Click Generic Button    Close
    Click Generic Button    Yes
    Click Generic Button    OK

Print/Preveiw Billing Account History Single Statement
    [Arguments]    ${pdf_file_name}
    [Documentation]    This method is used for Print Billing Account History    
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Generic Button    Balance Due
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Sleep    5s
    Click Tab Generic Button    Statement
    Click Generic Button    Print
    Sleep    2s
    Click Element    selector=${statement_print_dialog_print_btn}
    Wait For Download To Complete    file_name=${pdf_file_name}
    Sleep    3s    reason=Waiting for file to be downloaded
    Click Generic Button    Preview

Create New Account In Receivable Manager
    [Arguments]    ${tab_name}    ${first_name}    ${last_name}    ${address_1}    ${city}    ${state}    ${zip}    ${phone_number}=''
    [Documentation]    This method is used for Create a New Account in Receivable Manager
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${newaccount_btn}    timeout=10s
    Click Element    selector=${newaccount_btn}
    Sleep    5s
    Fill Generic Input Field    firstName    ${first_name}
    Fill Generic Input Field    lastName    ${last_name}
    Fill Generic Input Field    address1    ${address_1}
    Fill Generic Input Field    city    ${city}
    Fill Generic Input Field    state    ${state}
    Fill Generic Input Field    zip    ${zip}
    IF    '${phone_number}' != ''
        Fill Generic Input Field    name_of_field=phoneNumber    value_of_field=${phone_number}
    END
    Click Generic Button    Save

Get Popup Message Title In Receivable Manager
    [Documentation]    This method is used for get the Success message.
    ${payment_completed_message}=    Get Element Text    selector=${message_locator}
    RETURN    ${payment_completed_message}

Get Popup Message Description In Receivable Manager
    [Documentation]    This method is used for get the Success message.
    Wait For Element To Be Visible    ${pop_message_description}    20s
    #Wait For Element To Be Visible    selector=${pop_message_description}     
    ${confirmation_message}=    Get Element Text    selector=${pop_message_description}
    RETURN    ${confirmation_message}

Find Account using Account Number
    [Arguments]    ${tab_name}    ${account_number}
    [Documentation]    This method is used for Search the Account with the Account Number.
    Sleep    10s
    # Wait For Element To Be Visible    ${account_tab}    timeout=10s
    # Click Element    selector=${account_tab}
    Fill Generic Input Field    billingCustomerId    ${account_number}
    Log To Console    Accont: ${account_number}
    #Wait For Element To Be Visible    ${btn_search}    timeout=10s
    Wait For Element To Be Visible    ${search_btn}    timeout=10s
    Click Element    selector=${search_btn}
    #Click Generic Button    Search

Find Account using address
    [Arguments]    ${tab_name}    ${address_1}
    [Documentation]    This method is used for Search the Account with Address.
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Fill Generic Input Field    address    ${address_1}
    #Click Generic Button    Search
    Sleep    20s
    Click Element    ${search_button}

Find Account using Phone Number
    [Arguments]    ${tab_name}    ${phone_number}
    [Documentation]    This method is used for Search the Account with the Phone Number.
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Fill Generic Input Field    phone    ${phone_number}
    Click Generic Button    Search

Find Account using Invoice Number
    [Arguments]    ${tab_name}    ${invoice_number}
    [Documentation]    This method is used for Search the Account with the Phone Number.
    Wait For Element To Be Visible    ${invoice_tab}    timeout=10s
    Click Element    selector=${invoice_tab}
    Sleep    10s
    Fill Generic Input Field    invoiceNumber    ${invoice_number}
    Click Generic Button    Search

Find Account using Last Name
    [Arguments]    ${tab_name}    ${last_name}
    [Documentation]    This method is used for Search the Account with the Phone Number.
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Click Element    selector=${search_by_ddl}
    ${generic_search_by}=    Replace String    string=${generic_drop_down_value}    search_for=<<string_to_replace>>    replace_with=Last Name
    Click Element    selector=${generic_search_by}
    Send Keys To Element    selector=${search_by_text_box}    keys_to_send=${last_name}
    Click Generic Button    Search

Clear Address Search Field
    ${generic_input_field}=    Replace String    string=${generic_input_field_ar}    search_for=<<string_to_replace>>    replace_with=address
    Sleep    2s    reason=Require to Load table data
    Click Element    selector=${generic_input_field}
    Press Keyboard Keys    ${generic_input_field}    Control+A
    Press Keyboard Keys    ${generic_input_field}    Backspace
    Click Generic Button    Search

Clear Phone Number Search Field
    ${generic_input_field}=    Replace String    string=${generic_input_field_ar}    search_for=<<string_to_replace>>    replace_with=phone
    Sleep    2s    reason=Require to Load table data
    Click Element    selector=${generic_input_field}
    Press Keyboard Keys    ${generic_input_field}    Control+A
    Press Keyboard Keys    ${generic_input_field}    Backspace
    Click Generic Button    Search

Clear Account Number Search Field
    ${generic_input_field}=    Replace String    string=${generic_input_field_ar}    search_for=<<string_to_replace>>    replace_with=billingCustomerId
    Sleep    2s    reason=Require to Load table data
    Click Element    selector=${generic_input_field}
    Press Keyboard Keys    ${generic_input_field}    Control+A
    Press Keyboard Keys    ${generic_input_field}    Backspace
    Click Generic Button    Search

Clear Last Name Search Field
    Sleep    2s    reason=Require to Load table data
    Click Element    selector=${search_by_text_box}
    Press Keyboard Keys    ${search_by_text_box}    Control+A
    Press Keyboard Keys    ${search_by_text_box}    Backspace
    Click Generic Button    Search

Find Invoices using Invoice Number
    [Arguments]    ${tab_name}    ${invoice_number}
    [Documentation]    This method is used for Search the Account with the Invoice Number.
    Wait For Element To Be Visible    ${invoice_tab}    timeout=10s
    Click Element    selector=${invoice_tab}
    Sleep    5s
    Fill Generic Input Field    invoiceNumber    ${invoice_number}
    Click Element    selector=${search_btn}

Post Cash Receipts
    [Arguments]    ${amount}    ${value_name}    ${rdo_btn_name}
    [Documentation]    This method is used for Post Cash Receipt in Receivable Manager
    Sleep    3s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Post Cash Receipts
    Wait For Element To Be Visible    ${txt_paymentAmount}    20s
    Fill Generic Input Field    paymentAmount    ${amount}
    Sleep    3s
    Click Element    selector=${payment_method_drop_down}
    Select Generic Value From Dropdown    ${value_name}
    Sleep    3s
    Select Generic Radio Button    ${rdo_btn_name}
    Sleep    3s
    Click Generic Button    Post
    ${payment_completed_message}=    Get Element Text    selector=${confirmation_message}
    Sleep    2s    reason=Required to wait for page close
    #Click Generic Button    Close
    RETURN    ${payment_completed_message}

Post Cash Receipts With Debit Card
    [Arguments]    ${amount}    ${value_name}    ${rdo_btn_name}    ${card_no}    ${exp_date}    ${cvv_number}
    [Documentation]    This method is used for Post Cash Receipt in Receivable Manager
    Sleep    3s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Post Cash Receipts
    Sleep    10s
    Fill Generic Input Field    paymentAmount    ${amount}
    Click Element    selector=${payment_method_drop_down}
    Select Generic Value From Dropdown    ${value_name}
    Click Element    selector=${same_as_customer_address_chckbx}
    Sleep    5s
    Wait For Element To Be Visible    selector=${card_number}    timeout=10s
    Click Element    selector=${card_number}
    Send Keys To Element    selector=${card_number}    keys_to_send=${card_no}
    Send Keys To Element    selector=${exp_date_mm_yy}    keys_to_send=${exp_date}
    Send Keys To Element    selector=${security_code}    keys_to_send=${cvv_number}
    Click Generic Button    button_name=Pay
    Select Generic Radio Button    ${rdo_btn_name}
    Click Generic Button    button_name=Post
    ${payment_completed_message}=    Get Element Text    selector=${confirmation_message}
    Sleep    2s    reason=Required to wait for page close
    RETURN    ${payment_completed_message}

Get Amount Is Required in Post Cash Receipt
    [Arguments]    ${amount}    ${value_name}    ${rdo_btn_name}
    [Documentation]    This method is used for Post Cash Receipt in Receivable Manager
    Sleep    3s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Post Cash Receipts
    sleep    10s
    Fill Generic Input Field    paymentAmount    ${amount}
    ${get_text}=    Get Element Text    selector=${amount_is_required}
    RETURN    ${get_text}

Recal Account Totals In Billing Account History
    [Documentation]    This method is used for Recal Account Totals in Billing Account History.
    Open Billing Account History
    Sleep    2s
    Click Tab Generic Button    Account History
    Sleep    2s    reason=Required to load data
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${recal_account_totals_billing_account_history}
    ${payment_completed_message}=    Get Element Text    selector=${message_locator}
    RETURN    ${payment_completed_message}

Post Cash Receipt Miscellaneous Add New Item Adjust Code
    [Arguments]    ${rdo_btn_name}
    Sleep    3s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Post Cash Receipts
    Select Generic Radio Button    ${rdo_btn_name}
    Click Generic Button    button_name=Add New Item
    ${adjust_code_tabel}=    Get Element Text    selector=${adjust_code_text}
    ${department_label}=    Get Element Text    selector=${department_text}
    RETURN    ${adjust_code_tabel}    ${department_label}

Add Edit Notes In Account Details In Billing Account History
    [Arguments]    ${text_to_send}
    Open Billing Account History
    Sleep    5s
    Click Tab Generic Button    Account History
    Sleep    2s    reason=Required to load data
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${account_details_billing_acount_history}
    Send Keys To Element    selector=${notes_text_field}    keys_to_send=${text_to_send}
    Sleep     2s
    Click Generic Button    button_name=Save
    ${notes_added_msg}=    Get Element Text    selector=${message_locator}
    Click Generic Button    button_name=Close
    Click Element    selector=${cancel_changes_yes_btn}
    RETURN    ${notes_added_msg}

Add Edit Notes In Alternate Account Details In Billing Account History
    [Arguments]    ${text_to_send}     ${alternate_address}    ${alternate_city}    ${alternate_state}    ${alternate_zip_code}
    Open Billing Account History
    Click Tab Generic Button    Account History
    Sleep    2s    reason=Required to load data
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${account_details_billing_acount_history}
    Fill Generic Input Field    alternate_address    ${alternate_address}
    Fill Generic Input Field    alternate_city    ${alternate_city} 
    Fill Generic Input Field    alternate_state    ${alternate_state}
    Fill Generic Input Field    alternate_zip_code    ${alternate_zip_code}
    Send Keys To Element    selector=${alternate_notes_text_field}    keys_to_send=${text_to_send}
    # Click Element  selector=${edit_acc_save_button}    
    Click Generic Button    button_name=Save
    ${notes_added_msg}=    Get Element Text    selector=${message_locator}
    Click Generic Button    button_name=Close
    Click Element    selector=${cancel_changes_yes_btn}
    RETURN    ${notes_added_msg}

Validate Notes In Account Details In Billing Account History
    Open Billing Account History
    Click Tab Generic Button    Account History
    Sleep    2s    reason=Required to load data
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${account_details_billing_acount_history}
    Sleep    3s
    ${notes_text}=    Get Element Text    selector=${notes_text_field}
    RETURN    ${notes_text}

Validate Notes In Alternate Account Details In Billing Account History
    Open Billing Account History
    Click Tab Generic Button    Account History
    Sleep    2s    reason=Required to load data
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${account_details_billing_acount_history}
    Sleep    3s
    ${alternate_notes_text}=    Get Element Text    selector=${alternate_notes_text_field}
    RETURN    ${alternate_notes_text}

Open Billing Account History
    #Wait For Element To Be Visible    selector=${actions_ellipsis}    timeout=10s
    Sleep    10s
    Click Element    selector=${actions_ellipsis}
    Sleep    10s
    Click Actions Ellipsis Generic Button    button_name=Billing Account History

Adjust Adjust Code And Department Dorpdown
    Open Billing Account History
    Wait For Element To Be Visible    selector=${billing_account_history_actions_ellipsis}
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Click Element    selector=${adjust_billing_account_history}
    ${adjust_code_tabel}=    Get Element Text    selector=${adjust_code_text}
    ${department_label}=    Get Element Text    selector=${department_text}
    RETURN    ${adjust_code_tabel}    ${department_label}

Column Grid Customization
    [Arguments]    ${tab_name}
    Wait For Element To Be Visible    ${pmts_adj_tab}    timeout=10s
    Click Element    selector=${pmts_adj_tab}
    Sleep    2s
    Click Generic Button    button_name=Show / Hide Columns
    Wait For Element To Be Visible    ${account_id_chckbx}    timeout=10s
    Click Element    selector=${account_id_chckbx}
    Wait For Element To Be Visible    ${balance_chckbx}    timeout=10s
    Click Element    selector=${balance_chckbx}
    Sleep    2s
    Click Generic Button    button_name=Save Customization
    Wait For Element To Be Visible    ${confirmation_message}    timeout=10s
    ${customization_updated}=    Get Element Text    selector=${confirmation_message}
    Click Generic Button    button_name=Restore Default Columns
    Sleep    2s
    Click Generic Button    button_name=Yes
    ${customization__again_updated}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${customization_updated}    ${customization__again_updated}

PMTS ADJ Tab Pagination
    [Arguments]    ${tab_name}    ${50_page}    ${200_page}    ${500_page}    ${tab_name_1}
    Wait For Element To Be Visible    ${pmts_adj_tab}    timeout=10s
    Click Element    selector=${pmts_adj_tab}
    Wait For Element To Be Visible    ${pagination_ddl}    timeout=10s
    Click Element    selector=${pagination_ddl}
    Select Generic Value From Dropdown    value_name=${50_page}
    Wait For Element To Be Visible    selector=${pagination_ddl}
    Click Element    selector=${pagination_ddl}
    Select Generic Value From Dropdown    value_name=${200_page}
    Sleep    5s
    Click Element    selector=${pagination_ddl}
    Sleep    5s
    Select Generic Value From Dropdown    value_name=${500_page}
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${pmts_adj_tab}    timeout=10s
    Click Element    selector=${pmts_adj_tab}
    Wait For Element To Be Visible    selector=${pagination_ddl}
    ${pagination_text}=    Get Element Text    selector=${pagination_ddl}
    RETURN    ${pagination_text}
    
Adjust In Billing Account History
    [Arguments]    ${rdo_btn_1}    ${amount}    ${rdo_btn_2}
    [Documentation]    This method is used for Adjust the Billing Account History.
    Open Billing Account History
    #Wait For Element To Be Visible    ${tblcolumn_billingaccounthistory}    10s
    Sleep    10s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    #Wait For Element To Be Visible    ${adjust_billing_account_history}    10s
    Sleep    3s
    Click Element    selector=${adjust_billing_account_history}
    Wait For Element To Be Visible    ${ar_adjustment_lbl}    10s
    Select Generic Radio Button    rdo_btn_name=${rdo_btn_1}
    Sleep    2s
    Select Generic Adjustment Dropdown    dropdown_name=Adjust Code
    Click Element    selector=${adjust_code}
    Click Element    selector=${adjust_amount}
    Send Keys To Element    selector=${adjust_amount}    keys_to_send=${amount}
    Press Keyboard Keys    ${adjust_amount}    Enter
    Sleep    2s
    Select Generic Radio Button    rdo_btn_name=${rdo_btn_2}
    Select Generic Adjustment Dropdown    dropdown_name=Department
    Click Element    selector=${department}
    Click Element    selector=${adjustment_post_btn}

Allocate In Billing Account History
    [Documentation]    This method is used for navigate to Allocate in Billing Account History
    #Wait For Element To Be Visible    ${billing_account_history_actions_ellipsis}    timeout=20s
    Sleep    5s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Sleep    5s
    Click Element    selector=${allocate_billing_account_history}

Navigate To Auto Apply This Item In Billing Account History
    [Documentation]    This method is used for Navigate to Auto Apply This Item in billing Account History
    #Wait For Element To Be Visible    ${billing_account_history_actions_ellipsis}    20s
    Sleep    10s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Sleep    5s
    Click Element    selector=${auto_apply_to_this_item}

Get Allocation Value From Auto Apply This Item In Billing Account History
    [Documentation]    This method is used for Get Allocation Value From Auto Apply This Item
    ${allocate_value}=    Get Element Attribute     selector=${allocate_value}    attribute_name=value
    RETURN    ${allocate_value}

Click Apply Button
    Click Generic Button    Apply

Update Allocate Value Of Auto Apply This Item In Billing Account History
    [Arguments]    ${allocate_value}
    [Documentation]    This method is used for Update The Allocation Value Of Auto Apply This Item.
    Click Element    selector=${allocate_input_field}
    Send Keys To Element    selector=${allocate_input_field}    keys_to_send=${allocate_value}
    Press Keyboard Keys    ${allocate_input_field}    Enter

Close Billing Account History
    [Documentation]    This method is used for Close right Drawer of Billing Account History
    Sleep    5s    reason=Require for load page.
    Click Element    selector=${close_btn_billing_account_history}
    Click Generic Button    Yes

Allocations Form In Billing Account History
    [Documentation]    This method is used for Navigate to Allocations Form in Billing Account History
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Click Element    selector=${allocations_billing_account_history}
    ${allocations_form}=    Get Element Text    selector=${allocations_form_balance_text}
    RETURN    ${allocations_form}

Activate Open Items Toggle
    [Documentation]    This method is used for Activate Open Items Toggle Button.
    Click Element    selector=${open_items_toggle_btn}
    
Deactivate Open Items Toggle
    [Documentation]    This method is used for Deactivate Open Items Toggle Button.
    Click Element    selector=${open_items_toggle_btn}

Activate Overdue Toggle
    [Documentation]    This method is used for Activate Overdue Toggle Button.
    Click Element    selector=${overdue_toggle_btn}
    
Deactivate Overdue Toggle
    [Documentation]    This method is used for Deactivate Overdue Toggle Button.
    Click Element    selector=${overdue_toggle_btn}

Age In Billing Account History
    [Documentation]    This method is used for Age in Billing Account History
    Sleep    2s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Click Generic Button    Age
    Click Element    selector=${date_picker_age}
    Click Element    selector=${next_btn_date_picker}
    Click Element    selector=${date_from_date_picker}
    Click Element    selector=${yes_btn_in_age_billing_account}
    Sleep    2s
    Click Element    selector=${close_btn_billing_account_history}

Print Todays Single Statement Billing Account History
    [Arguments]    ${statement_pdf_file_name}
    [Documentation]    This method is used for Print Billing Account History
    Sleep    2s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Click Tab Generic Button    Statement
    Click Element    selector=${statement_tab_date_picker}
    Click Element    selector=${statement_tab_today_date_picker}
    Click Generic Button    Print
    Sleep    2s
    Click Element    selector=${statement_print_dialog_print_btn}
    Wait For Download To Complete    file_name=${statement_pdf_file_name}
    Click Element    selector=${statement_print_dialog_print_btn}
    Sleep    10s    resaon=Waiting for file to be downloaded

Refund In Billing Account History
    [Arguments]    ${amount}
    [Documentation]    This method is used for Refund the Amount in Billing Account History.
    Open Billing Account History
    Sleep    2s
    Click Tab Generic Button    Account History
    Click Element    selector=${account_history_ellipsis}
    Sleep    5s
    Click Element    selector=${refund_account_history}
    Wait For Element To Be Visible    ${refund_amount}    timeout=10s
    Send Keys To Element    selector=${refund_amount}    keys_to_send=${amount}
    Press Keyboard Keys    ${refund_amount}    Enter
    Sleep    2s
    Click Element    selector=${payment_method_drop_down}
    Sleep    2s
    Click Element    selector=${payment_method_dropdown_value}
    Sleep    2s
    Click Element    selector=${refund_post_btn}
    Click Element    selector=${post_this_check_refund_popup_yes_btn}

Refund From Reg Account
    Open Billing Account History
    Click Tab Generic Button    Account History
    Click Element    selector=${account_history_ellipsis}
    Click Element    selector=${refund_account_history}
    ${from_reg_acc}=    Get Element Text    selector=${from_reg_account_ddl}
    RETURN    ${from_reg_acc}

Refund Select Payment
    [Arguments]    ${from_reg_account}    ${value_name}    ${amount}    ${card_name}
    Open Billing Account History
    Click Tab Generic Button    Account History
    Sleep    10s
    Click Element    selector=${billing_account_ellipsis}
    Click Element    selector=${refund_account_history}
    Click Element    selector=${from_reg_account_ddl}
    ${reg_account_value}=    Replace String    string=${generic_drop_down_value}    search_for=<<string_to_replace>>    replace_with=${from_reg_account}
    Click Element    selector=${reg_account_value}
    Click Element    selector=${payment_method_drop_down}
    Select Generic Value From Dropdown    ${value_name}
    Send Keys To Element    selector=${refund_amount}    keys_to_send=${amount}
    Send Keys To Element    selector=${card_name_txtbx}    keys_to_send=${card_name}
    Click Element    selector=${actual_refund_chckbx}
    Click Generic Button    button_name=OK
    Click Generic Button    button_name=Select Payment
    Sleep    2s
    Click Element    selector=${select_payment_select_btn}
    Click Generic Button    button_name=Post
    ${posting_msg}=    Get Element Text    selector=${pop_message_description}
    RETURN    ${posting_msg}
    

Marketing Report Export CSV File
    [Arguments]    ${tab_name}
    [Documentation]    This method is used to Export CSV File
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Wait For Element To Be Visible    ${marketing_report}    timeout=10s
    Click Element    selector=${marketing_report}
    Sleep    5s
    Click Generic Button    button_name=Save
    Wait For Element To Be Enabled    selector=${marketing_export_csv_btn}    timeout=10s
    Click Element    selector=${marketing_export_csv_btn}
    Sleep    5s
    ${confirmation_msg}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${confirmation_msg}

Finance In Biling Account History
    [Documentation]    This method is used for Finance the Amount in Billing Account History.
    Open Billing Account History
    Click Tab Generic Button    Finance
    Click Element    selector=${finance_tab_date_picker}
    Click Element    selector=${finance_tab_today_date_picker}
    Send Keys To Element    selector=${monthly_rate}    keys_to_send=2
    Press Keyboard Keys    ${monthly_rate}    Enter   
    Sleep    2s
    Click Element    selector=${apply_finance_ellipsis}
    Click Element    selector=${prepare_finance_in_billing_account_history}
    Click Element    selector=${finance_information_popup_yes_btn}
    Sleep    2s
    Click Element    selector=${finance_information_popup_yes_btn}

Review G/L In Billing Account History
    [Documentation]    This method is used for Review G/L in Billing Account History.
    Click Element    selector=${actions_ellipsis}
    Sleep    5s
    Click Actions Ellipsis Generic Button    button_name=Billing Account History
    Wait For Element To Be Visible    ${billing_account_history_actions_ellipsis}    timeout=10s
    Sleep    2s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Wait For Element To Be Visible    ${review_gl_billing_account_history}    timeout=10s
    Click Element    selector=${review_gl_billing_account_history}
    Sleep    3s    reason=Require for loading table data.
    ${local_total_credits}=    Get Element Text    selector=${get_total_credits_review_gl}
    ${local_total_debits}=    Get Element Text    selector=${get_total_debits_review_gl}
    RETURN    ${local_total_credits}    ${local_total_debits}

Review G/L Invoices
    [Documentation]    This method is used for Review G/L in Billing Account History.
    Click Element    selector=${actions_ellipsis}
    Click Element    selector=${review_gl_actions_invoices_tab}
    Sleep    3s    reason=Require for loading table data.
    ${local_total_credits}=    Get Element Text    selector=${get_total_credits_review_gl}
    ${local_total_debits}=    Get Element Text    selector=${get_total_debits_review_gl}
    Click Generic Button    Close
    RETURN    ${local_total_credits}    ${local_total_debits}

Reverse Receivable In Billing Account History
    [Documentation]    This method is used for Reverse Receivable in Billing Account History.
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    button_name=Billing Account History
    Wait For Element To Be Visible    ${billing_account_history_actions_ellipsis}    20s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Click Element    selector=${reverse_receivable_billing_account_history}
    Click Element    selector=${yes_btn_in_reverse_receivable_in_billing_account}
    ${confirmation_msg}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${confirmation_msg}

Post Finance Charges Prepare And Post
    [Arguments]    ${tab_name}
    # Wait For Element To Be Visible    ${account_tab}    timeout=10s
    # Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Sleep    5s
    Click Element    selector=${post_finance_charges}
    Click Element    selector=${finance_tab_date_picker}
    Click Element    selector=${finance_tab_today_date_picker}
    Click Generic Button    button_name=Prepare
    Click Element    selector=${finance_information_popup_yes_btn}
    #Wait For Element To Be Enabled    selector=${post_btn}
    Click Generic Button    button_name=Post
    Wait For Element To Be Visible    ${message_locator}    10s 
    #Wait For Element To Be Visible    selector=${message_locator}  
    ${success_message}=    Get Element Text    selector=${message_locator}
    ${posted_message}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${success_message}    ${posted_message}

Post Finance Charges Review Last
    [Arguments]    ${tab_name}
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Wait For Element To Be Visible    ${post_finance_charges}    timeout=10s
    Click Element    selector=${post_finance_charges}
    Sleep    5s
    Click Generic Button    button_name=Review Last
    Wait For Element To Be Enabled    selector=${reverse_btn}
    Click Generic Button    button_name=Reverse
    Wait For Element To Be Visible    ${finance_information_popup_yes_btn}    timeout=10s
    Click Element    selector=${finance_information_popup_yes_btn}
    Wait For Element To Be Visible    ${message_locator}    timeout=10s
    Wait For Element To Be Visible    selector=${message_locator}
    ${success_message}=    Get Element Text    selector=${message_locator}
    ${reversed_message}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${success_message}    ${reversed_message}

Age Accounts
    [Arguments]    ${tab_name}
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Click Element    selector=${ellipsis}
    Click Element    selector=${age_accounts}
    Click Element    selector=${age_accounts_confirm_popup_ok_btn}
    ${aging_account_message}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${aging_account_message}

Add Credit Memo In Billing Account History
    [Documentation]    This method is used for Add Credit Memo in to the Billing Account History.
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    button_name=Billing Account History
    Wait For Element To Be Visible    selector=${billing_account_history_actions_ellipsis}    timeout=5s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Sleep    2s
    Click Element    selector=${add_credit_memo_billing_account_history}
    Sleep    2s
    Click Generic Button    button_name=Continue
    Wait For Element To Be Visible    ${credit_memo_drop_down}    timeout=5s
    Click Element    selector=${credit_memo_drop_down}
    Sleep    2s
    Click Element    selector=${credit_memo_drop_down_value}
    Sleep    2s
    Click Generic Button    button_name=Submit
    ${success_message}=    Get Element Text    selector=${message_locator}
    RETURN    ${success_message}

Negative Scenario Create New Account
    [Arguments]    ${tab_name}    ${first_name}    ${last_name}    ${address_1}    ${city}    ${state}
    [Documentation]    This method is used for Neagtive scenario of Create a New Account in Receivable Manager    
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${newaccount_btn}    timeout=10s
    Click Element    selector=${newaccount_btn}
    Fill Generic Input Field    firstName    ${first_name}
    Fill Generic Input Field    lastName    ${last_name}
    Fill Generic Input Field    address1    ${address_1}
    Fill Generic Input Field    city    ${city}
    Fill Generic Input Field    state    ${state}
    ${element_states}=    Get Element States    selector=${save_btn}
    RETURN    ${element_states}

Negative Scenario Post Finance Charges Prepare And Post
    [Arguments]    ${tab_name}
    Navigate To LHN Option    navigation=Customer Service>>Receivables Manager
    Receivable Manager Page Load
    Wait For Element To Be Visible    ${account_tab}    timeout=10s
    Click Element    selector=${account_tab}
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Sleep    5s
    Click Element    selector=${post_finance_charges}
    ${element_states}=    Get Element States    selector=${post_btn}
    Click Generic Button    button_name=Prepare
    Wait For Element To Be Visible    selector=${finance_information_popup_text}
    ${popup_message}=    Get Element Text    selector=${finance_information_popup_text}
    RETURN    ${element_states}    ${popup_message}

Print Batch Statement Start
    [Documentation]    This method is used for Print Batch Statement
    Sleep    10s
    Click Element    ${account_tab}
    Sleep    5s
    Click Element    selector=${actions_ellipsis}
    Sleep    5s
    Click Actions Ellipsis Generic Button    Print Batch Statement
    Sleep    5s
    Click Generic Button    Print
    Sleep    5s

    ${states}=    Get Element States    selector=${start_button}
    Custom Log    ${states}

    IF    "enabled" in ${states}
        Custom Log    Start Button is enabled
        Click Generic Button    button_name=Start
        Click Element    selector=${yes_btn_in_print_account_statement}
    ELSE
        Click Element    ${abort}
        Click Generic Button    Yes
        Sleep    10s
        Click Generic Button    button_name=Start
        Click Element    selector=${yes_btn_in_print_account_statement}
    END

    # ${confirmation_message}=    Get Element Text    selector=${confirmation_message}
    # ${batch_message}=    Get Element Text    selector=${batch_print_account}
    # Click Generic Button    Refresh
    # RETURN    ${confirmation_message}    ${batch_message}
Print Batch Statement Abort
    [Documentation]    This method is used for Print Batch Account Statement Abort
    Sleep    10s
    Click Element    ${account_tab}
    Sleep    5s
    Click Element    selector=${actions_ellipsis}
    Sleep    5s
    Click Actions Ellipsis Generic Button    Print Batch Statement
    Sleep    5s
    Click Generic Button    Print
    Sleep    5s

    ${states}=    Get Element States    selector=${abort}
    Custom Log    ${states}

    IF    "enabled" in ${states}
        Custom Log    Abort Button is enabled
        Click Element    ${abort}
        Click Generic Button    No
        Sleep    5s
        Click Element    ${abort}
        Click Generic Button    Yes
        Sleep    10s
    ELSE
        Click Generic Button    button_name=Start
        Wait For Element To Be Visible    ${yes_btn_in_print_account_statement}    timeout=10s
        Click Element    selector=${yes_btn_in_print_account_statement}
        ${confirm_message}=    Get Element Text    selector=${confirmation_message}
        ${batch_message}=    Get Element Text    selector=${batch_print_account}
        Sleep    2s
        Click Generic Button    Abort
        Click Element    selector=${no_btn_in_print_account_statement}
        Click Generic Button    Abort
        Sleep    2s
        Click Element    selector=${yes_btn_in_print_account_statement}
    END
    # Click Generic Button    Start
    # Wait For Element To Be Visible    ${yes_btn_in_print_account_statement}    timeout=10s
    # Click Element    selector=${yes_btn_in_print_account_statement}
    # ${confirm_message}=    Get Element Text    selector=${confirmation_message}
    # ${batch_message}=    Get Element Text    selector=${batch_print_account}
    # Sleep    2s
    # Click Generic Button    Abort
    # Click Element    selector=${no_btn_in_print_account_statement}
    # Click Generic Button    Abort
    # Sleep    2s
    # Click Element    selector=${yes_btn_in_print_account_statement}
    # ${aborted_message}=    Get Element Text    selector=${confirmation_message}
    # RETURN    ${confirm_message}    ${batch_message}    ${aborted_message}

# 
Print Batch Statement Refresh
    [Documentation]    This method is used for Print Batch Statement
    Sleep    10s
    Click Element    ${account_tab}
    Sleep    5s
    Click Element    selector=${actions_ellipsis}
    Sleep    5s
    Click Actions Ellipsis Generic Button    Print Batch Statement
    Sleep    5s
    Click Generic Button    Print
    Sleep    5s

    ${states}=    Get Element States    selector=${start_button}
    Custom Log    ${states}

    IF    "enabled" in ${states}
        Custom Log    Start Button is enabled
        Click Generic Button    button_name=Start
        Click Element    selector=${yes_btn_in_print_account_statement}
    ELSE
        Click Element    ${abort}
        Click Generic Button    Yes
        Sleep    10s
        # Click Generic Button    Save
        # Sleep    5s 
    END
    #Sleep    2s
    # ${confirmation_message}=    Get Element Text    selector=${confirmation_message}
    # ${batch_message}=    Get Element Text    selector=${batch_print_account}
    # Click Generic Button    Refresh
    # RETURN    ${confirmation_message}    ${batch_message}

Delete Receivables Starting Balance
    [Documentation]    This method is used to Export CSV File
    [Arguments]    ${message}
    Click Element    selector=${show_all_entries_btn}
    ${delete_btn_state}=    Get Element States    selector=${delete_btn}
    IF  ${delete_btn_state} == 'visible'
        Click Element    selector=${delete_btn}
        Click Generic Button    Yes        
        ${entry_deleted_message}=    Get Element Text    selector=${pop_message_description}
        Should Be Equal    first=${entry_deleted_message}    second=${message}    msg=Entry deleted successfully message is not displayed.
    ELSE
        Custom Log    text_to_log=There is no Record for Receivables Starting Balance
    END

Open Invoice
    Sleep    5s    reason=Require to load table data.
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Sleep    5s
    Click Tab Generic Button    Account History
    Wait For Element To Be Visible    ${invoices_toggle_button}    timeout=10s
    Click Element    selector=${invoices_toggle_button}
    Sleep    2s    reason=Require to load table data.
    Wait For Element To Be Visible    ${billing_account_history_actions_ellipsis}    timeout=10s
    Click Element    selector=${billing_account_history_actions_ellipsis}
    Wait For Element To Be Visible    ${open_invoice}    timeout=10s
    Click Element    selector=${open_invoice}

Open Open-Item
    [Arguments]    ${tab_name}
    Wait For Element To Be Visible    ${invoice_tab}    timeout=10s
    Click Element    selector=${invoice_tab}
    # Wait For Element To Be Visible    ${open_items_toggle_btn}    timeout=10s
    # Click Element    selector=${open_items_toggle_btn}    wait_for_enabled=${False}
    Wait For Element To Be Visible    ${actions_ellipsis}    timeout=10s
    Click Element    selector=${actions_ellipsis}

Miscellaneous Cash Receipt
    [Arguments]    ${tab_name}    ${amount}    ${value_name}
    Navigate To LHN Option    navigation=Customer Service>>Receivables Manager
    Receivable Manager Page Load
    # Wait For Element To Be Visible    ${account_tab}    timeout=10s
    # Click Element    selector=${account_tab}
    Sleep    10s
    Wait For Element To Be Visible    ${ellipsis}    timeout=10s
    Click Element    selector=${ellipsis}
    Wait For Element To Be Visible    ${miscellaneous_cash_receipt}    timeout=10s
    Click Element    selector=${miscellaneous_cash_receipt}
    Wait For Element To Be Visible    ${cash_receipt_drawer_amount_field}    timeout=20s
    Send Keys To Element    selector=${cash_receipt_drawer_amount_field}    keys_to_send=${amount}
    Click Element    selector=${payment_method_drop_down}
    Select Generic Value From Dropdown    ${value_name}
    Click Generic Button    Add New Item
    Select Generic Adjustment Dropdown    dropdown_name=Adjust Code
    Click Element    selector=${adjust_code_gl_distribution}
    Select Generic Adjustment Dropdown    dropdown_name=Department
    Click Element    selector=${department}
    Send Keys To Element    selector=${cash_receipt_drawer_gl_distribution_amount_field}    keys_to_send=${amount}
    Click Generic Button    Save
    ${success_message}=    Get Element Text    selector=${message_locator}
    ${account_added_message}=    Get Element Text    selector=${confirmation_message}
    Sleep    5s
    Click Generic Button    Post
    ${successful_message}=    Get Element Text    selector=${message_locator}
    ${post_message}=    Get Element Text    selector=${confirmation_message}
    RETURN    ${success_message}    ${account_added_message}    ${successful_message}    ${post_message}

View Allocations
    [Arguments]    ${tab_name}
    # Wait For Element To Be Visible    ${account_tab}    timeout=10s
    # Click Element    selector=${account_tab}
    Sleep    10s
    Click Element    selector=${actions_ellipsis}
    Click Actions Ellipsis Generic Button    Billing Account History
    Sleep    8s
    Click Element    selector=${billing_account_ellipsis}
    Click Element    ${allocations}
    

Add Time Stamp in notes 
    Click Element    selector=${timestamp_button}
    ${notes_text}=    Get Element Text    selector=${notes_text_field}
    Custom Log    text_to_log=Notes grabbed texts are:${notes_text}
    RETURN    ${notes_text}

Click On Clear All
    Click Element    selector=${clear_all_button}
    Click Element    selector=${cancel_changes_yes_btn_notes}
    ${notes_text}=    Get Element Text    selector=${notes_text_field}
    Custom Log    text_to_log=Notes grabbed texts are:${notes_text}
    RETURN    ${notes_text}

Click On View More
    [Arguments]    ${notes_text}
    Send Keys To Element    selector=${notes_text_field}    keys_to_send=${notes_text}
    Click Element    selector=${view_more_button}
    ${grabbed_notes_text}=    Get Element Text    selector=${notes_view_more_text}
    Custom Log    text_to_log=Notes grabbed texts are:${notes_text}
    Click Element    selector=${notes_cancel_button}
    RETURN    ${grabbed_notes_text}


## Generic Methods
Click Generic Button
    [Arguments]    ${button_name}
    ${generic_button}=    Replace String    string=${generic_button}    search_for=<<string_to_replace>>    replace_with=${button_name}
    Click Element    ${generic_button}       

Click Actions Ellipsis Generic Button
    [Arguments]    ${button_name}
    ${actions_ellipsis_generic_button}=    Replace String    string=${actions_ellipsis_generic_button}    search_for=<<string_to_replace>>    replace_with=${button_name}
    Click Element    ${actions_ellipsis_generic_button}

Click Tab Generic Button
    [Arguments]    ${button_name}
    ${tabs_generic_button}=    Replace String    string=${tabs_generic_button}    search_for=<<string_to_replace>>    replace_with=${button_name}
    Click Element    ${tabs_generic_button}

Fill Generic Input Field
    [Arguments]    ${name_of_field}    ${value_of_field}
    ${generic_input_field}=    Replace String    string=${generic_input_field_ar}    search_for=<<string_to_replace>>    replace_with=${name_of_field}
    Send Keys To Element    ${generic_input_field}    keys_to_send=${value_of_field}

Select Generic Value From Dropdown
    [Arguments]    ${value_name}
    ${generic_drop_down_value}=    Replace String    string=${generic_drop_down_value}    search_for=<<string_to_replace>>    replace_with=${value_name}
    Click Element    ${generic_drop_down_value}

Select Generic Radio Button
    [Arguments]    ${rdo_btn_name}
    ${generic_radio_btn}=    Replace String    string=${generic_radio_btn}    search_for=<<string_to_replace>>    replace_with=${rdo_btn_name}
    Click Element    ${generic_radio_btn}

Select Generic Adjustment Dropdown
    [Arguments]    ${dropdown_name}
    ${generic_adjustment_drop_down}=    Replace String    string=${generic_adjustment_drop_down}    search_for=<<string_to_replace>>    replace_with=${dropdown_name}
    Click Element    ${generic_adjustment_drop_down}

Receivable Manager Page Load Time
    Sleep    10s
