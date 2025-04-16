*** Settings ***
Resource    ../../utils/playwright_utils.robot
Resource    ../../utils/string_utils.robot

*** Variables ***
${index}=    0
${iframe}=    //iframe[@id='Left-frame']
${generic_title_message}=    ${iframe} >>> //p[contains(@class,'message_title')]
${generic_title_message1}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'message_description')])[1]
${generic_title_message2}=    ${iframe} >>> (//p[contains(@class,'message_title')])[2]
${generic_description_message}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'message_description')]
${generic_description_message2}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'message_success')]//div[contains(@class,'message_description')]
${name_dropdown_scroll}=    //iframe[@id='Left-frame'] >>> //div[@style='height: 256px; overflow-y: auto; overflow-anchor: none;']
${Name_dropdown_height}=    //iframe[@id='Left-frame'] >>> (//div[@style='height: 256px; overflow-y: auto; overflow-anchor: none;']//div)[1]
${generic_button}=    //iframe[@id='Left-frame'] >>> //span[text()='<<string_to_replace>>']
${select_generic_dropdown_value}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'<<string_to_replace>>')]
${generic_dropdown_select_value}=    //iframe[@id='Left-frame'] >>> //div[text()='<<string_to_replace>>']
${generic_value_select}=    //iframe[@id='Left-frame'] >>> (//div[text()='<<string_to_replace>>'])[3]

${invoice_filter}=    ${iframe} >>> //span[text()='Filter']
${job_number_txt_field}=    //iframe[@id='Left-frame'] >>> //label[text()='Job Number ']/../..//input
${invoice_number_tab}=    ${iframe} >>> //input[@name='invoiceNumber']
${job_number_tab}=    ${iframe} >>> //input[@name='number']
${customer_po_tab}=    ${iframe} >>> //input[@name='customerPo']
${submit_btn}=    ${iframe} >>> //span[text()='Submit']
#${open_invoice}=    ${iframe} >>> (//th[text()='Actions']/../../../../following-sibling::div//tr//span[@aria-label='eye'])[1]
${open_invoice}=    ${iframe} >>> //span[@id='swID_InvoiceManager_Button_OpenInvoice']
${open_invoice2}=    ${iframe} >>> (//th[text()='Actions']/../../../../following-sibling::div//tr//span[@aria-label='eye'])[2]
# ${open_invoice}=    ${iframe} >>> //span[text()='Open Invoice']
# ${open_invoice2}=    ${iframe} >>> (//span[text()='Open Invoice'])[2]
${setdiscount_btn}=    ${iframe} >>> //span[text()='Set Discount']
${discounttype_ddl}=    ${iframe} >>> //span[text()='Select an Item']/..//input
${discountitemtype_chk}=    ${iframe} >>> //input[@value='onParts']
${itemdetails_tab}=    ${iframe} >>> //div[text()='Item Details']
${setdiscount_invoice_btnsave}=    ${iframe} >>> //div[text()='Set Invoice Discount']/../../following-sibling::div//span[text()='Save']

${jobstatus_filter}=    ${iframe} >>> //input[@id='swID_InvoiceManagerFiltering_Input_JobStatus']/following::span[text()='Select Job Status']
${jobstatus_open_filter}=    ${iframe} >>> (//div[text()='OPEN'])[1]
${jobstatus_closed_filter}=    ${iframe} >>> (//div[text()='CLOSED'])[1]
${jobstatus_canceled_filter}=    ${iframe} >>> (//div[text()='Canceled'])[1]
${jobstatus_finalized_filter}=    ${iframe} >>> (//div[text()='Finalized'])[1]
${jobprogress_filter}=    ${iframe} >>> //input[@id='swID_InvoiceManagerFiltering_Input_JobProgress']/following::span[text()='Select Job Progress']
${jobprogress_unfinalized_filter}=    ${iframe} >>> (//div[text()='UNFINALIZED'])[1]
${jobprogress_notinvoiced_filter}=    ${iframe} >>> (//div[text()='NOT INVOICED'])[1]

#${item_type_ddl1}=    ${iframe} >>> //label[text()='Item Type']/../following-sibling::div//input
${item_type_ddl}=    ${iframe} >>> (//label[text()='Item Type']/following::span[@class='ant-select-selection-item'])[1]
${item_type_ddlvalue}=    ${iframe} >>> //div[contains(@class,'ant-select-dropdown')]//div[contains(@class,'ant-select-item')]//div[contains(text(),'<<string_to_replace>>')]     
${item_no_ddl}=    ${iframe} >>> (//label[@title='Item No:']/following::span[@class='ant-select-selection-search'])[1]
${laboritem_no_ddl}=    ${iframe} >>> (//label[@title='Item No:']/following::span//input)[1]

${dept_ddl}=    ${iframe} >>> (//label[@title='Dept:']/following::span[@class='ant-select-selection-item'])[1]
#${dept_ddl}=    ${iframe} (//label[@title='Dept:']/following::span[@class='ant-select-selection-search'])[1]
${dept_ddlvalue}=    ${iframe} >>> //div[contains(@class,'ant-select-dropdown')]//tr//td[text()='<<string_to_replace>>']

${invoiceview_filter}=    ${iframe} >>> //div[contains(@class,'swPrimaryNavBar')]//div[contains(@class,'taskbar_swViewSelect')]//input
${invoiceview_all_filter}=    ${iframe} >>> (//div[text()='ALL'])[1]
${invoiceview_notprinted_filter}=    ${iframe} >>> (//div[text()='Not Printed'])[1]
${invoiceview_Post_filter}=    ${iframe} >>> (//div[text()='Post'])[1]
${invoiceview_nxtbatch_filter}=    ${iframe} >>> (//div[text()='Next Batch'])[1]
${invoiceview_lastbatch_filter}=    ${iframe} >>> (//div[text()='Last Batch'])[1]
${invoiceview_Adjusting_filter}=    ${iframe} >>> (//div[text()='Adjusting'])[1]
${invoiceview_readytopost_filter}=    ${iframe} >>> (//div[text()='Ready to Post'])[1]
${invoiceview_printed_filter}=    ${iframe} >>> (//div[text()='Printed'])[1]

${unit_price_txt}=    ${iframe} >>> //input[@name='unitPrice']
${discount_chk}=    ${iframe} >>> //input[@name='discountable']
${addtax_chk}=    ${iframe} >>> //input[@name='addTax']
${after_discount_lbl}=    ${iframe} >>> //span[text()='After Discount:']/../following-sibling::div
${itemdetails_btnsave}=    ${iframe} >>> (//span[text()='Save'])[1]
${item_entercost_btnsave}=    ${iframe} >>> (//span[text()='Save'])[2]
${itemdetails_btnpost}=    ${iframe} >>> //div[contains(@class,'swDrawerFooterLftBtn')]//span[text()='Post']
${itemdetails_btnadjust}=    ${iframe} >>> //div[contains(@class,'swDrawerFooterLftBtn')]//span[text()='Adjust']
${itemdetails_readytopost}=    ${iframe} >>> //div[contains(@class,'swDrawerFooterLftBtn')]//span[text()='Ready to Post']
${invoice_status_txt}=    ${iframe} >>> (//label[text()='Verify']/../../../following-sibling::div//label)[1]

${itemdetails_ellipsis}=    ${iframe} >>> //div[text()='Invoice Item Details']/../../../following-sibling::div//span[@aria-label='more']
${invoicemanager_ellipsis}=    ${iframe} >>> (//span[@aria-label='more'])[1]
${duplicatecreditmemo_invoicemanager_ellipsis}=    ${iframe} >>> (//span[@aria-label='more'])[3]
${gl_review}=    ${iframe} >>> //span[text()='GL Review']
${account_history}=    ${iframe} >>> //span[text()='Account History']
${modify_customer_po}=    ${iframe} >>> //span[text()='Modify Customer PO#']
${invoice_void}=    ${iframe} >>> //li[contains(@class,'menu-item-only-child')]//span[text()='Void']
${invoice_readytopost}=    ${iframe} >>> //span[text()='Ready To Post']

${get_total_credits_review_gl}=    //iframe[@id='Left-frame'] >>> //label[text()='Total Credits']/../..//div[contains(@class,'control-input-content')]
${get_total_debits_review_gl}=    //iframe[@id='Left-frame'] >>> //label[text()='Total Debits']/../..//div[contains(@class,'control-input-content')]
${get_account_balance_account_history}=    ${iframe} >>> //label[text()='Account Balance']/../..//div[contains(@class,'control-input-content')]
${edit_customerpo_txt}=    ${iframe} >>> //div[contains(@class,'confirmModal')]//input[contains(@class,'createInput_input_')]

${get_total_debits_review_gl}=    //iframe[@id='Left-frame'] >>> //label[text()='Total Debits']/../following-sibling::div//label
${message_description_xpath}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_description')]


${applypayment_btn}=    ${iframe} >>> //span[text()='Apply Pmts']
${addpayment_btn}=    ${iframe} >>> //span[text()='Add Payment']
${amount_addpymt_txt}=    ${iframe} >>> //input[@name='paymentAmount']
${paymentmethod_ddl}=    ${iframe} >>> //div[text()='Payment Method:']//..//..//../following-sibling::div//input
${paymentmethod_ddlvalue}=    ${iframe} >>> //div[contains(@class,'ant-select-dropdown')]//tr//td[text()='<<string_to_replace>>']
${generic_column_name}=    ${iframe} >>> //div[@class='ant-table-header']//span[text()='<<string_to_replace>>']

${past_date_job_creation_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-footer']//span[text()='Yes']
${addpaymentmethod_ddl}=    ${iframe} >>> //div[text()='Add Payment']/..//..//..//label[text()='Payment Method:']/../..//input
${sameaddress_chk}=    ${iframe} >>> //span[text()='Same as Customer Address']/..//input
${accountNumber_txt}=    ${iframe} >>> //input[@name='bank_account']
${routingNumber_txt}=    ${iframe} >>> //input[@name='bank_routing']
${pay_btn}=    ${iframe} >>> //button[@id='paybutton']
#${cardnumber_txt}=    ${iframe} >>> //label[@id='number_label']/..//input
${cardnumber_txt}=    ${iframe} >>> //input[@id='card_number']    
${cvv_txt}=    ${iframe} >>> //input[@id='cvv']
${expiremonth_txt}=    ${iframe} >>> //input[@name='month']
${expireyear_txt}=    ${iframe} >>> //input[@name='year']

${paymentamount_txt}=    ${iframe} >>> //label[text()='Amount ($)']/..//..//input
${addpayment_btnsave}=    ${iframe} >>> (//button[contains(@class,'ant-btn-primary')])[2]
#${addpayment_btnsave}=    ${iframe} >>> //button[@class='ant-btn ant-btn-primary']
${invoice_btnclose}=    ${iframe} >>> //div[contains(@class,'swDrawerFooterRgtBtn')]//span[text()='Close']
${invoice_btncancel}=    ${iframe} >>> //div[contains(@class,'swDrawerFooterRgtBtn')]//span[text()='Cancel']
${invoice_details_lbl}=    ${iframe} >>> //div[@class="ant-drawer-header"]//div


${invoicedetail_rdb}=    ${iframe} >>> //div[text()='Invoice Details']
${netbalance_lbl}=    ${iframe} >>> (//span[text()='Net Balance:']/../..//div[contains(@class,'swTxtRgtAlg')])[6]    
${AddInvoice_lnk}=    ${iframe} >>> //span[text()='Add an Invoice']
${AddCreditMemo_lnk}=    ${iframe} >>> //span[text()='Add Credit Memo']
${preview_lnk}=    //iframe[@id='Left-frame'] >>> //span[text()='Preview']
${preview_lbl}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//div[contains(text(),'Preview')]
${select_totalnotax}=    ${iframe} >>> //input[@name='Totals no tax']
${select_taxcode}=    ${iframe} >>> (//label[text()='Tax Code']/../../../../following-sibling::div//span)[2]
${select_taxcode_value}=    ${iframe} >>> (//div[contains(@class,'select-item-option-content')])[1]
${taxcode_amount_txt}=    ${iframe} >>> (//label[text()='Tax Code']/../../../../following-sibling::div//input)[2]
${customer_po_txt}=    ${iframe} >>> //div[text()='Customer PO#']/../following-sibling::div//input
${customer_po_btnsave}=    ${iframe} >>> //div[text()='Customer PO#']/../following-sibling::div//span[text()='Save']

${partitem_ellipsis}=    ${iframe} >>> //td[text()='03113']/following-sibling::td//span[@aria-label='more']
${partitem_entercost}=    ${iframe} >>> //a[text()='Enter Cost']
${partitem_editlnk}=    ${iframe} >>> (//td[text()='03113']/following-sibling::td//span[text()='Edit'])[2]
${partitem_quantitytxt}=    ${iframe} >>> //input[@name='quantity']
${partitem_unitcosttxt}=    ${iframe} >>> //input[@name='unitCost']
${partitem_markup}=    ${iframe} >>> //input[@name='markup']
${partitem_totalcostlbl}=    ${iframe} >>> //span[text()='Total Cost:']/../following-sibling::div
${partitem_totalpricelbl}=    ${iframe} >>> //span[text()='Total Price:']/../following-sibling::div
${previewpdf_lnk}=    //iframe[@id='Left-frame'] >>> //span[text()='Preview PDF']
${costplus_rdb}=    ${iframe} >>> (//input[@class='ant-radio-input'])[2]

${creditmemo_ddl}=    ${iframe} >>> (//input[@id='swID_InvoiceManager_Select_CreditMemo']/following::span)[1]
${creditmemo_reason_ddlvalue}=    ${iframe} >>> //div[contains(@class,'ant-select-dropdown')]//div[contains(@class,'ant-select-item')]//div[contains(text(),'<<string_to_replace>>')]
${duplicate_creditmemo_rdb}=    ${iframe} >>> (//span[contains(text(),'Create a new blank Credit Memo')]/..//span)[1]
${returnpart_chk}=    ${iframe} >>> (//div[text()='Additional Options']/../..//input[@type='checkbox'])[2]
${reversepaybase_chk}=    ${iframe} >>> (//div[text()='Additional Options']/../..//input[@type='checkbox'])[3]
${ok_btn_creditmemo_invoice_manager}=    //iframe[@id='Left-frame'] >>> //span[text()='OK']
${creditmemo_processrefund_chk}=    //iframe[@id='Left-frame'] >>> //span[text()='Process Refund after Posting']/..//input

${start_date_invoice}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-picker-input'])[1]
${start_month_panel}=    //iframe[@id='Left-frame'] >>> (//button[@aria-label='Choose a month'])[1]    #(//button[@aria-label='month panel'])[1]
${select_start_month}=    //iframe[@id='Left-frame'] >>> (//div[text()='Jan'])[1] 
${select_start_date}=    //iframe[@id='Left-frame'] >>> (//td[@title='2020-06-06']//div[@class='ant-picker-cell-inner'])[2]    #(//div[@class='ant-picker-cell-inner'][normalize-space()='1'])[1]
${end_month_panel}=    //iframe[@id='Left-frame'] >>> (//button[@aria-label='Choose a month'])[2]
${select_end_month}=    //iframe[@id='Left-frame'] >>> (//div[text()='Jun'])[1]
${select_end_date}=    //iframe[@id='Left-frame'] >>> //td[@title='2024-06-10']//div[@class='ant-picker-cell-inner'][normalize-space()='10']
${select_invoice_search}=    //iframe[@id='Left-frame'] >>> (//input[@type='search'])[2]
${select_all_value}=    //iframe[@id='Left-frame'] >>> (//div[text()='ALL'])[2]
${select_printed_value}=    //iframe[@id='Left-frame'] >>> //div[text()='Printed'] 
${select_notprinted_value}=    //iframe[@id='Left-frame'] >>> (//div[text()='Not Printed'])[2]    
${first_chckbx_table}=    //iframe[@id='Left-frame'] >>> (//input[@class='ant-checkbox-input'])[2]
${second_chckbx_table}=    //iframe[@id='Left-frame'] >>> (//input[@class='ant-checkbox-input'])[3]
${invoice_manager_ellipsis}=    //iframe[@id='Left-frame'] >>> //span[text()='Export CSV']/../../following-sibling::a//span[@aria-label='more']
${print_selected_invoices_btn}=    //iframe[@id='Left-frame'] >>> //span[contains(text(),'Print Selected')]
${confirm_yes_btn_in_print_invoices}=    //iframe[@id='Left-frame'] >>> //div[text()='Confirm']//../following-sibling::div//span[text()='Yes']
${table_footer}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'list_infolLft')]

${start_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Start']
${batch_process_txt}=    //iframe[@id='Left-frame'] >>> //div[text()='Batch Process has been Initiated. Please refresh to see the Progess.']
${batch_process_refresh_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'swPrimaryNavBar swButtonWrapper')]//span[text()='Refresh']
${abort_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'swPrimaryNavBar swButtonWrapper')]//span[text()='Abort']
${batch_status_lbl}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'swBlockCondGrayBorderedDark')]
${failure_reason}=    //iframe[@id='Left-frame'] >>> //th[text()='Batch Failure Reason']

${select_agreement_type1}=    //iframe[@id='Left-frame'] >>> (//label[text()='Type Name']/../..//span)[3]
${start_date_picker}=    //iframe[@id='Left-frame'] >>> //div[@class='swPaddingAll']//label[text()='Start Date']//../following-sibling::div//div[@class='ant-picker-input']
${visit_month_dropdown1}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-selection-overflow']
${confirmation_yes_btn_add_agreement}=    //iframe[@id='Left-frame'] >>> //span[text()='Confirmation']/../../..//span[text()='Yes']
${payment_method_ddl_add_agreement}=    //iframe[@id='Left-frame'] >>> //label[text()='Payment Method']/../..//input
${select_new_payment_method_rdo_btn}=    //iframe[@id='Left-frame'] >>> //span[contains(text(),'Select New Payment Method')]/../..//input
${future_payment_reference_save_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Future Payment Preference']/../../..//span[text()='Save']
${make_payment_later_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Make Payment']/../../..//span[text()='Later']
${confirmation_copy_agreement_no}=    //iframe[@id='Left-frame'] >>> //span[text()='Confirmation']/../../..//span[text()='Copy Agreement #']

${invoice_billing_account_notes}=   //iframe[@id='Left-frame'] >>> //textarea[@name='locationNotes']
${notes_text_field}=    //iframe[@id='Left-frame'] >>> //textarea[@name='comments']

*** Keywords ***

Grid Sorting
    [Arguments]    ${column_name}
    # Click on the column header to sort the table
    ${generic_select_columnname}    Replace String    string=${generic_column_name}    search_for=<<string_to_replace>>    replace_with=${column_name}
    Click Element    selector=${generic_select_columnname}
    # Get the text of each row in the sorted table
    ${table_rows}=    Get Elements    selector=//iframe[@id='Left-frame'] >>> (//div[@class='ant-table-container'])[1]//tr[contains(@class,'ant-table-row')]
    Log To Console    ${table_rows}    
    ${row_texts}=   Create List
    FOR    ${row}    IN    @{table_rows}
        ${text}=    Get Text    ${row}
        Append To List    ${row_texts}    ${text}
    END
    Log To Console    ${row_texts}
    # Validate sorting order
    ${sorted_texts}=    Sort List    ${row_texts}

Export/Download CSV File
    [Arguments]    ${file_name}
    [Documentation]    This method is used to Export CSV File
    Click Generic Button    Export CSV
    Click Generic Button    Download
    Wait For Download To Complete    file_name=${file_name}
    Sleep    3s    reason=Waiting for file to be downloaded

Filter Invoice with JobNumber
    [Arguments]    ${job_number}       
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable)
    Sleep    5s
    Click Element    selector=${invoice_filter}
    Press Keyboard Keys    ${job_number_tab}    Control+A
    Press Keyboard Keys    ${job_number_tab}    Backspace
    Send Keys To Element    selector=${job_number_tab}    keys_to_send=${job_number}
    Click Generic Button    button_name=Submit
    Sleep    2s

Find Invoice With Invoice Number With Open Invoice
    [Arguments]    ${invoice_number}
    Sleep    5s
    Wait For Element To Be Visible    selector=${invoice_filter}    timeout=10s
    Click Element    selector=${invoice_filter}
    Send Keys To Element    selector=${invoice_number_tab}    keys_to_send=${invoice_number}
    Click Generic Button    button_name=Submit
    Sleep    3s
    Click Element    selector=${open_invoice}

Validate Invoice Manager Basic View
    [Documentation]    Validate Invoice Manager Basic View
    Sleep    2s    
    Click Element    selector=${invoiceview_filter}
    ${all_filter}=    Get Element Text    selector=${invoiceview_all_filter}
    ${notprinted_filter}=    Get Element Text    selector=${invoiceview_notprinted_filter}
    ${Post_filter}=    Get Element Text    selector=${invoiceview_Post_filter}
    ${nxtbatch_filter}=    Get Element Text    selector=${invoiceview_nxtbatch_filter}
    ${lastbatch_filter}=    Get Element Text    selector=${invoiceview_lastbatch_filter}
    ${Adjusting_filter}=    Get Element Text    selector=${invoiceview_Adjusting_filter}
    ${readytopost_filter}=    Get Element Text    selector=${invoiceview_readytopost_filter}
    ${printed_filter}=    Get Element Text    selector=${invoiceview_printed_filter} 
    Click Element    selector=${invoiceview_filter}            
    RETURN    ${all_filter}    ${notprinted_filter}    ${Post_filter}    ${nxtbatch_filter}    ${lastbatch_filter}    
    ...    ${Adjusting_filter}    ${readytopost_filter}    ${printed_filter}

Validate Invoice Manager Filter_JobStatus          
    [Documentation]    Validate Invoice Manager Filter_JobStatus
    Sleep    10s
    Click Element    selector=${invoice_filter}
    Sleep    10s
    Click Element    selector=${jobstatus_filter}
    ${open_filter}=    Get Element Text    selector=${jobstatus_open_filter}
    ${closed_filter}=    Get Element Text    selector=${jobstatus_closed_filter}
    Sleep    5s
    ${canceled_filter}=    Get Element Text    selector=${jobstatus_canceled_filter}
    ${finalized_filter}=    Get Element Text    selector=${jobstatus_finalized_filter}
    Click Element    selector=${jobstatus_finalized_filter}
    #Click Element    selector=${jobstatus_filter}         
    RETURN    ${open_filter}    ${closed_filter}    ${canceled_filter}    ${finalized_filter}

Validate Invoice Manager Filter_JobProgress      
    [Documentation]    Validate Invoice Manager Filter_JobProgress
    Sleep    10s
    # Click Element    selector=${invoice_filter}
    Click Element    selector=${jobprogress_filter}
    Sleep    10s
    ${unfinalized_filter}=    Get Element Text    selector=${jobprogress_unfinalized_filter}
    ${notinvoiced_filter}=    Get Element Text    selector=${jobprogress_notinvoiced_filter} 
    RETURN    ${unfinalized_filter}    ${notinvoiced_filter}

Click Close
    Click Generic Button    button_name=Close

Select Invoice with JobNumber
    [Arguments]    ${job_number}       
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable)
    Wait For Element To Be Visible    ${invoice_filter}    timeout=20s
    Click Element    selector=${invoice_filter}
    #Wait For Element To Be Visible    ${job_number_txt_field}    timeout=20s
    Sleep    10s
    Click Element    selector=${job_number_txt_field}
    Fill Text    selector=${job_number_txt_field}    txt=${job_number}
    Click Generic Button    button_name=Submit
    #Wait For Element To Be Visible    ${open_invoice}    timeout=20s
    Sleep    10s
    Click Element    selector=//iframe[@id='Left-frame'] >>> //span[@id='swID_InvoiceManager_Button_OpenInvoice']
    Sleep    5s

Select CreditMemo Invoice with JobNumber
    [Arguments]    ${job_number}       
    [Documentation]    Invoice Manager - Invoices with Discount - Invoice Discount (on non-taxable)
    Sleep    5s
    Click Element    selector=${invoice_filter}
    Send Keys To Element    selector=${job_number_tab}    keys_to_send=${job_number}    
    Click Generic Button    button_name=Submit
    Sleep    5s
    Click Element    selector=${open_invoice2}

Filter Invoice with CustomerPO
    [Arguments]    ${customer_po}  
    Sleep    5s
    Click Element    selector=${invoice_filter}
    Press Keyboard Keys    ${job_number_tab}    Control+A
    Press Keyboard Keys    ${job_number_tab}    Backspace
    Send Keys To Element    selector=${CustomerPO_tab}    keys_to_send=${customer_po}
    Click Generic Button    button_name=Submit
    Sleep    2s

Select Invoice with CustomerPO
    [Arguments]    ${customer_po} 
    Sleep    5s
    Click Element    selector=${invoice_filter}
    Send Keys To Element    selector=${job_number_tab}    keys_to_send=${customer_po}    
    Click Generic Button    button_name=Submit
    Sleep    5s
    Click Element    selector=${open_invoice}

Set Discount
    [Arguments]    ${discounttype}
    Click Element    selector=${setdiscount_btn}
    Select Value From Dropdown    selector=${discounttype_ddl}    value_to_select=${discounttype}     
    Click Element    selector=${setdiscount_invoice_btnsave}     
    ${setdiscount_message}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${setdiscount_message}

Click On Yes Button
    Sleep    3s
    Click Generic Button    button_name=Yes   

Item Details With Discount
    [Arguments]    ${unitprice}    ${itemtype}    ${item_no}    ${dept}   
    Wait For Element To Be Visible    selector=${itemdetails_tab}    timeout=20s 
    Sleep    15s
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Sleep    2s
    #Double Click Element    selector=${item_type_ddl}
    Click Element    selector=${item_type_ddl}    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${unit_price_txt}   
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    #Click Generic Button    button_name=Yes 
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With Discount And Tax
    [Arguments]    ${unitprice}    ${itemtype}    ${item_no}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${unit_price_txt}   
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    #Click Generic Button    button_name=Yes 
    RETURN    ${beforeDiscount}    ${afterDiscount}

Item Details With Labor
    [Arguments]    ${unitprice}    ${itemtype_labor}    ${item_no_labor}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Sleep    2s
    Log To Console    ${item_type_ddl}
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_item_type_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_labor}
    Click Element    selector=${generic_dropdown_item_type_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Send Keys To Element    selector=${laboritem_no_ddl}    keys_to_send=${item_no_labor}
    ${generic_dropdown_item_no_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_labor}
    Click Element    selector=${generic_dropdown_item_no_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${unit_price_txt}   
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    #Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    #Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s  
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With Labor with Tax
    [Arguments]    ${unitprice}    ${itemtype_labor}    ${item_no_labor}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Sleep    2s
    Log To Console    ${item_type_ddl}
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_item_type_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_labor}
    Click Element    selector=${generic_dropdown_item_type_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Send Keys To Element    selector=${laboritem_no_ddl}    keys_to_send=${item_no_labor}
    ${generic_dropdown_item_no_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_labor}
    Click Element    selector=${generic_dropdown_item_no_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${unit_price_txt}    
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl} 
    
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s  
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details Labor with Discount
    [Arguments]    ${unitprice}    ${itemtype_labor}    ${item_no_labor}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Sleep    2s
    Log To Console    ${item_type_ddl}
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_item_type_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_labor}
    Click Element    selector=${generic_dropdown_item_type_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Send Keys To Element    selector=${laboritem_no_ddl}    keys_to_send=${item_no_labor}
    ${generic_dropdown_item_no_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_labor}
    Click Element    selector=${generic_dropdown_item_no_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${unit_price_txt}     
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s  
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With Misc
    [Arguments]    ${unitprice}    ${itemtype_misc}    ${item_no_misc}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item    
    Click Element    selector=${item_type_ddl}
    Custom Log    text_to_log=Item Type dropdown    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_misc}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Custom Log    text_to_log=Item No dropdown
    ${dropdown_select_itemno}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_misc}
    Click Element    selector=${dropdown_select_itemno}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Custom Log    text_to_log=Department dropdown
    Sleep    2s
    ${generic_dropdown_select_dept}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_dept}
    Click Element    selector=${unit_price_txt}    
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s   
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With Misc with Tax
    [Arguments]    ${unitprice}    ${itemtype_misc}    ${item_no_misc}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item    
    Click Element    selector=${item_type_ddl}
    Custom Log    text_to_log=Item Type dropdown    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_misc}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Custom Log    text_to_log=Item No dropdown
    ${dropdown_select_itemno}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_misc}
    Click Element    selector=${dropdown_select_itemno}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Custom Log    text_to_log=Department dropdown
    Sleep    2s
    ${generic_dropdown_select_dept}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_dept}
    Click Element    selector=${unit_price_txt}     
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s 
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details Misc with Discount
    [Arguments]    ${unitprice}    ${itemtype_misc}    ${item_no_misc}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item    
    Click Element    selector=${item_type_ddl}
    Custom Log    text_to_log=Item Type dropdown    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_misc}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Custom Log    text_to_log=Item No dropdown
    ${dropdown_select_itemno}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_misc}
    Click Element    selector=${dropdown_select_itemno}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Custom Log    text_to_log=Department dropdown
    Sleep    2s
    ${generic_dropdown_select_dept}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_dept}
    Click Element    selector=${unit_price_txt}      
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addtax_chk}
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    #Click On Yes Button    
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details Task with Discount
    [Arguments]    ${unitprice}    ${itemtype_task}    ${item_no_task}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item    
    Click Element    selector=${item_type_ddl}
    Custom Log    text_to_log=Item Type dropdown    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_task}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Custom Log    text_to_log=Item No dropdown
    ${dropdown_select_itemno}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_task}
    Click Element    selector=${dropdown_select_itemno}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Custom Log    text_to_log=Department dropdown
    Sleep    2s
    ${generic_dropdown_select_dept}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_dept}
    Click Element    selector=${unit_price_txt}      
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
   
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    Click Element    selector=${discount_chk}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    #Click On Yes Button    
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With Zero Discount 
    [Arguments]    ${unitpricezero}    ${itemtype}    ${item_no}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}    
    Sleep    2s
    Click Element    selector=${unit_price_txt}     
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitpricezero}    
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s     
    #Click Generic Button    button_name=Yes 
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${itemSave_success_msg}

Cost Plus Item Details With Discount And Tax
    [Arguments]    ${unitprice}    ${itemtype}    ${item_no}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}    
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    #Click Generic Button    button_name=Yes 
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Cost Plus Item Details With Labor
    [Arguments]    ${unitprice}    ${itemtype_labor}    ${item_no_labor}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Sleep    2s
    Log To Console    ${item_type_ddl}
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_item_type_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_labor}
    Click Element    selector=${generic_dropdown_item_type_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Send Keys To Element    selector=${laboritem_no_ddl}    keys_to_send=${item_no_labor}
    ${generic_dropdown_item_no_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_labor}
    Click Element    selector=${generic_dropdown_item_no_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}    
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl} 
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s  
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    Sleep    2s    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}  

Cost Plus Item Details With Misc
    [Arguments]    ${unitprice}    ${itemtype_misc}    ${item_no_misc}    ${dept}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item    
    Click Element    selector=${item_type_ddl}
    Custom Log    text_to_log=Item Type dropdown    
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype_misc}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    Custom Log    text_to_log=Item No dropdown
    ${dropdown_select_itemno}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no_misc}
    Click Element    selector=${dropdown_select_itemno}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Custom Log    text_to_log=Department dropdown
    Sleep    2s
    ${generic_dropdown_select_dept}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_dept}    
    ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}
    ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s   
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}    
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}  

Invoice Post
    Sleep    2s
    Click Generic Button    button_name=Post
    ${btn_state}=    Get Element States    selector=${confirmation_yes_btn_add_agreement}
    Custom Log    text_to_log=Button State is ${btn_state}
    IF  'detached' in ${btn_state}
        Click Element    selector=${confirmation_yes_btn_add_agreement}
    END
    ${itemPost_success_locator}=    Get First OR Last Element    locator=${generic_description_message2}    index=Last
    Log To Console    ${itemPost_success_locator} 
    Sleep    2s
    ${itemPost_success_msg}=    Get Element Text    selector=${itemPost_success_locator}
    Log To Console    ${itemPost_success_msg} 
    RETURN    ${itemPost_success_msg}

Invoice Post For E2E
    Sleep    2s
    Click Generic Button    button_name=Post
    ${itemPost_success_locator}=    Get First OR Last Element    locator=${generic_description_message2}    index=Last
    Sleep    2s
    # ${itemPost_success_msg}=    Get Element Text    selector=${itemPost_success_locator}
    Set Local Variable    ${itemPost_success_msg}    Invoice Posting Successful
    RETURN    ${itemPost_success_msg}

CreditMemo Invoice Post Checkbox validation
    Sleep    2s
    Click Generic Button    button_name=Post
    ${chkbox_state}=    Get Element States    selector=${creditmemo_processrefund_chk}
    Log To Console    ${chkbox_state}
    # ${chkbox_state}=    Get Element Attribute    selector=${creditmemo_processrefund_chk}    attribute_name=disabled
    # IF  ${chkbox_state} == True
        
    # END   
    Wait For Element To Be Visible    selector=${ok_btn_creditmemo_invoice_manager}   
    Click Element    selector=${ok_btn_creditmemo_invoice_manager}
    ${itemPost_success_locator}=    Get First OR Last Element    locator=${generic_description_message}    index=Last
    Log To Console    ${itemPost_success_locator} 
    Sleep    5s
    ${itemPost_success_msg}=    Get Element Text    selector=${generic_description_message}
    Log To Console    ${itemPost_success_msg} 
    RETURN    ${itemPost_success_msg}    ${chkbox_state}

CreditMemo Invoice Post
    Sleep    2s
    Click Generic Button    button_name=Post
    Wait For Element To Be Visible    selector=${ok_btn_creditmemo_invoice_manager}   
    Click Element    selector=${ok_btn_creditmemo_invoice_manager}
    ${itemPost_success_locator}=    Get First OR Last Element    locator=${generic_description_message}    index=Last
    Log To Console    ${itemPost_success_locator} 
    Sleep    5s
    ${itemPost_success_msg}=    Get Element Text    selector=${generic_description_message}
    Log To Console    ${itemPost_success_msg} 
    RETURN    ${itemPost_success_msg}

Invoice Apply Payment Bank Draft
    [Arguments]    ${paymentmethod_bank}    ${unitprice}    ${account_number}    ${routing_number}    
    Click Generic Button    button_name=Apply Pmts
    Sleep    2s
    Click Generic Button    button_name=Add Payment    
    Select Value From Dropdown    selector=${addpaymentmethod_ddl}    value_to_select=${paymentmethod_bank}
    Press Keyboard Keys    ${paymentamount_txt}    Control+A
    Send Keys To Element    selector=${paymentamount_txt}    keys_to_send=${unitprice}
    Sleep    2s
    Click Element    selector=${sameaddress_chk}
    Sleep    2s
    Send Keys To Element    selector=${accountNumber_txt}    keys_to_send=${account_number}
    Sleep    2s
    Send Keys To Element    selector=${routingNumber_txt}    keys_to_send=${routing_number}
    Click Element    selector=${pay_btn}
    Sleep    5
    #Click Element    selector=${addpayment_btnsave}
    ${invoicepayment_actual_msg}=    Get Element Text    selector=${generic_title_message2}   
    Sleep    2s
    Click Element    selector=${invoice_btnclose}
    RETURN    ${invoicepayment_actual_msg}

Invoice Apply Payment Company Card
    [Arguments]    ${paymentmethod_card}    ${unitprice}    ${card_number}    ${cvv}    ${expiremonth}    ${expireyear}    
    Click Generic Button    button_name=Apply Pmts
    Sleep    2s
    Click Generic Button    button_name=Add Payment    
    Select Value From Dropdown    selector=${addpaymentmethod_ddl}    value_to_select=${paymentmethod_card}
    Press Keyboard Keys    ${paymentamount_txt}    Control+A
    Send Keys To Element    selector=${paymentamount_txt}    keys_to_send=${unitprice}
    Sleep    2s
    Click Element    selector=${sameaddress_chk}
    Sleep    2s
    Send Keys To Element    selector=${cardnumber_txt}    keys_to_send=${card_number}
    Sleep    2s
    Send Keys To Element    selector=${cvv_txt}    keys_to_send=${cvv}
    Send Keys To Element    selector=${expiremonth_txt}    keys_to_send=${cvv}
    Send Keys To Element    selector=${expireyear_txt}    keys_to_send=${cvv}
    Click Element    selector=${pay_btn}
    Sleep    5
    Click Element    selector=${addpayment_btnsave}
    ${invoicepayment_actual_msg}=    Get Element Text    selector=${generic_description_message}   
    Sleep    2s
    Click Element    selector=${invoice_btnclose}
    RETURN    ${invoicepayment_actual_msg}

Invoice Apply Cash Payment
    [Arguments]    ${paymentmethod}    ${unitprice}    
    Click Generic Button    button_name=Apply Pmts
    Sleep    2s
    Click Generic Button    button_name=Add Payment    
    Select Value From Dropdown    selector=${addpaymentmethod_ddl}    value_to_select=${paymentmethod}
    Press Keyboard Keys    ${paymentamount_txt}    Control+A
    Send Keys To Element    selector=${paymentamount_txt}    keys_to_send=${unitprice}
    Click Element    selector=${addpayment_btnsave}
    ${invoicepayment_actual_msg}=    Get Element Text    selector=${generic_description_message}   
    Sleep    2s
    Click Element    selector=${invoice_btnclose}
    RETURN    ${invoicepayment_actual_msg}   

Invoice Apply Cash Over Payment
    [Arguments]    ${paymentmethod}    ${unitprice}    ${paymentamount}    
    Click Generic Button    button_name=Apply Pmts
    Sleep    2s
    Click Generic Button    button_name=Add Payment    
    Select Value From Dropdown    selector=${addpaymentmethod_ddl}    value_to_select=${paymentmethod}  
    Send Keys To Element    selector=${paymentamount_txt}    keys_to_send=${paymentamount}
    Click Element    selector=${addpayment_btnsave}
    Sleep    2s
    ${invoicepayment_actual_msg}=    Get Element Text    selector=${generic_title_message1}   
    Sleep    2s
    Click Element    selector=${invoice_btnclose}
    RETURN    ${invoicepayment_actual_msg}

Validate Invoice Details    
    Click Element    selector=${invoicedetail_rdb}
    ${netbalance_actual}=    Get Element Text    selector=${netbalance_lbl}
    RETURN    ${netbalance_actual}
    
Invoice Adjust
    Sleep    3s
    Click Generic Button    button_name=Adjust
    Click Generic Button    button_name=OK 
    ${invoiceAdjust_actual_msg}=    Get Element Text    selector=${generic_description_message2}  
    RETURN    ${invoiceAdjust_actual_msg}    
    
Validate Void Invoice
    Sleep    3s
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${invoice_void}
    Click Generic Button    button_name=Yes
    Sleep    2s        
    ${btnpost_state}=    Get Element States    selector=${itemdetails_btnpost}
    ${btnadjust_state}=    Get Element States    selector=${itemdetails_btnadjust}
    RETURN    ${btnpost_state}   ${btnadjust_state} 

Validate Unable to Void Invoice
    Sleep    3s
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${invoice_void}
    Click Generic Button    button_name=Yes
    Sleep    2s        
    ${invoice_unabletovoid_actual_msg}=    Get Element Text    selector=${generic_description_message2}  
    RETURN    ${invoice_unabletovoid_actual_msg}    

Validate Invoice Post button
    Sleep    2s
    Click Generic Button    button_name=Post
    Sleep    5s
    ${btnpost_state}=    Get Element Text    selector=${invoice_status_txt}
    Log To Console    ${btnpost_state}  
    RETURN    ${btnpost_state}

Validate Invoice Adjust button
    Sleep    3s
    Click Generic Button    button_name=Adjust
    Click Generic Button    button_name=OK 
    Sleep    5s
    ${btnAdjust_state}=    Get Element Text    selector=${invoice_status_txt}  
    RETURN    ${btnAdjust_state}

Validate ReadyToPost Invoice
    Wait For Element To Be Visible    selector=${itemdetails_ellipsis}
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${invoice_readytopost}
    Sleep    5s 
    ${btnreadytopost_state}=    Get Element Text    selector=${invoice_status_txt}
    Log To Console    message=${btnreadytopost_state}
    RETURN    ${btnreadytopost_state}

Validate ALL Invoice
    [Arguments]    ${all_filter_expected}    
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_all_value}
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${before_print}=    Get Element Text    selector=${table_footer}    
    Custom Log    No of Items is ${table_footer}
   

Validate Printed Invoice
    [Arguments]    ${printed_txt}    
    Click Element    selector=${start_date_invoice} 
    Sleep    5s
    Click Element    selector=${start_month_panel}
    Click Element    selector=${select_start_month}
    Click Element    selector=${select_start_date}
    #Click Element    selector=${end_date_agreement}
    Click Element    selector=${end_month_panel}
    Click Element    selector=${select_end_month}
    Click Element    selector=${select_end_date}
    Sleep    2s
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_printed_value}
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${before_print}=    Get Element Text    selector=${table_footer}
    Custom Log    No of Items is ${before_print}
    Click Element    selector=${first_chckbx_table}
    Click Element    selector=${second_chckbx_table}
    Click Element    selector=${invoice_manager_ellipsis}
    Click Element    selector=${print_selected_invoices_btn}
    Click Generic Button    button_name=Start
    Click Element    selector=${confirm_yes_btn_in_print_invoices}
    ${confirmation_message}=    Get Element Text    selector=${generic_title_message1}
    Click Generic Button    button_name=Close
    Sleep    20s
    Refresh Page
    Sleep    20s
    Click Element    selector=${start_date_invoice} 
    Click Element    selector=${start_month_panel}
    Click Element    selector=${select_start_month}
    Click Element    selector=${select_start_date}
    #Click Element    selector=${end_date_agreement}
    Click Element    selector=${end_month_panel}
    Click Element    selector=${select_end_month}
    Click Element    selector=${select_end_date}
    Sleep    2s
    # Click Element    selector=${select_invoice_search}
    # Sleep    2s
    # Click Element    selector=${select_all_value}
    Sleep    2s
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_printed_value}    
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${after_print}=    Get Element Text    selector=${table_footer}
    Custom Log    No of Items is ${after_print}
    RETURN    ${confirmation_message}    ${before_print}    ${after_print}

Validate NotPrinted Invoice
    [Arguments]    ${notprinted_txt}    
    Click Element    selector=${start_date_invoice} 
    Click Element    selector=${start_month_panel}
    Click Element    selector=${select_start_month}
    Click Element    selector=${select_start_date}
    #Click Element    selector=${end_date_agreement}
    Click Element    selector=${end_month_panel}
    Click Element    selector=${select_end_month}
    Click Element    selector=${select_end_date}
    Sleep    2s
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_notprinted_value}
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${before_print}=    Get Element Text    selector=${table_footer}
    Custom Log    No of Items is ${before_print}
    Click Element    selector=${first_chckbx_table}
    Click Element    selector=${second_chckbx_table}
    Click Element    selector=${invoice_manager_ellipsis}
    Click Element    selector=${print_selected_invoices_btn}
    Click Generic Button    button_name=Start
    Click Element    selector=${confirm_yes_btn_in_print_invoices}
    ${confirmation_message}=    Get Element Text    selector=${generic_title_message1}
    Click Generic Button    button_name=Close
    Sleep    20s
    Refresh Page
    Sleep    20s
    Click Element    selector=${start_date_invoice} 
    Click Element    selector=${start_month_panel}
    Click Element    selector=${select_start_month}
    Click Element    selector=${select_start_date}
    #Click Element    selector=${end_date_agreement}
    Click Element    selector=${end_month_panel}
    Click Element    selector=${select_end_month}
    Click Element    selector=${select_end_date}
    Sleep    2s
    # Click Element    selector=${select_invoice_search}
    # Sleep    2s
    # Click Element    selector=${select_all_value}
    Sleep    2s
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_notprinted_value}    
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${after_print}=    Get Element Text    selector=${table_footer}
    Custom Log    No of Items is ${after_print}
    RETURN    ${confirmation_message}    ${before_print}    ${after_print}

Start Batch Validation
    Click Element    selector=${first_chckbx_table}
    Click Element    selector=${second_chckbx_table}
    Click Element    selector=${invoice_manager_ellipsis}
    Click Element    selector=${print_selected_invoices_btn}     
    Click Element    selector=${start_btn}
    Click Generic Button    button_name=Yes
    sleep    2s    
    
    ${start_batch_procc_txt}=    Get Element Text    selector=${batch_status_lbl} 
    Log To Console    Text_1 - ${start_batch_procc_txt}
    sleep    5s     
    Wait For Element To Be Visible    selector=${generic_title_message1}    timeout=60s
    ${start_batch_completed_txt}=    Get Element Text    selector=${batch_status_lbl}
    Log To Console    Text_3 - ${start_batch_completed_txt}
    # ${start_batch_procc_txt}=    Get Element Text    selector=${generic_title_message1} 
    # Log To Console    Text_1 - ${start_batch_procc_txt}
    # sleep    5s     
    # Wait For Element To Be Visible    selector=${generic_title_message1}    timeout=60s
    # ${start_batch_completed_txt}=    Get Element Text    selector=${generic_title_message1}
    # Log To Console    Text_3 - ${start_batch_completed_txt}   
    RETURN    ${start_batch_procc_txt}    ${start_batch_completed_txt}

Abort Batch Validation   
    Click Element    selector=${start_date_invoice} 
    Click Element    selector=${start_month_panel}
    Click Element    selector=${select_start_month}
    Click Element    selector=${select_start_date}
    #Click Element    selector=${end_date_agreement}
    Click Element    selector=${end_month_panel}
    Click Element    selector=${select_end_month}
    Click Element    selector=${select_end_date}
    Sleep    2s
    Click Element    selector=${select_invoice_search}
    Sleep    2s
    Click Element    selector=${select_notprinted_value}
    #Select Value From Dropdown    selector=${select_invoice_search}    value_to_select=${notprinted_txt}
    ${before_print}=    Get Element Text    selector=${table_footer}
    Custom Log    No of Items is ${before_print}
    Click Element    selector=${first_chckbx_table}
    Click Element    selector=${second_chckbx_table}
    Click Element    selector=${invoice_manager_ellipsis}
    Click Element    selector=${print_selected_invoices_btn}
    ${abort_btn_prestart_state}=    Get Element States    selector=${abort_btn}
    Log To Console    Abort button- ${abort_btn_prestart_state}   
    Click Element    selector=${start_btn}
    Click Generic Button    button_name=Yes
    sleep    2s
    ${abort_btn_poststart_state}=    Get Element States    selector=${abort_btn}
    Log To Console    Abort button Post Start- ${abort_btn_poststart_state} 
    Click Element    selector=${abort_btn}
    Click Generic Button    button_name=Yes
    ${abort_batch_procc_txt}=    Get Element Text    selector=${generic_title_message1}
    ${total_overtime_calculation}=    Get Element Text    selector=${text_1}
    Log To Console    Text_1 - ${total_overtime_calculation}    
    
    ${batch_aborted_message}=    Get Element Text    selector=${text_1}
    Log To Console    Text_3 - ${batch_aborted_message}   
    RETURN    ${abort_batch_procc_txt}    ${batch_aborted_message}    ${abort_btn_prestart_state}    ${abort_btn_poststart_state}   
    
Add NoTax Invoice
    Sleep    2s
    Click Element    selector=${select_totalnotax}
    Sleep    2s

Add Custom Tax Invoice
    [Arguments]    ${taxcode_amt}
    Click Element    selector=${select_taxcode}
    Sleep    2s
    Click Element    selector=${select_taxcode_value}
    Sleep    2s
    Click Element    selector=${taxcode_amount_txt}      
    Send Keys To Element    selector=${taxcode_amount_txt}    keys_to_send=${taxcode_amt}
    Sleep    2s

Click Invoice Close
    Click Generic Button    button_name=Close

Click Invoice Cancel
    Click Generic Button    button_name=Cancel   
    Sleep    2s

Add More Invoice    
    ${Invoice_number1}=    Extract Text With Position Number   text_Message=Invoice: 123456    position_count=2
    Click Generic Button    button_name=Cancel
    Sleep    2s
    Click Element    selector=${invoicemanager_ellipsis}
    Click Element    selector=${AddInvoice_lnk}
    Sleep    2s
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message} 
    ${Invoice_detail}=    Get Element Text    selector=${invoice_details_lbl}
    Log To Console    ${Invoice_detail}
    ${Invoice_number2}=    Extract Text With Position Number   text_Message=${Invoice_detail}    position_count=2
    Log To Console    ${Invoice_number2}
    RETURN    ${itemSave_success_msg}    ${Invoice_number1}    ${Invoice_number2}

Print Invoice
    [Arguments]    ${pdf_file_name}
    Click Element    selector=${invoicemanager_ellipsis}    
    Sleep    2s    
    Wait For Download To Complete    file_name=${pdf_file_name}  
    Sleep    3s    reason=Waiting for file to be downloaded

Preview Invoice
    Click Element    selector=${invoicemanager_ellipsis}    
    Sleep    2s
    Click Element    ${preview_lnk}
    ${preview_message}=    Get Element Text    selector=${preview_lbl}
    RETURN    ${preview_message}

Preview PDF
    Click Element    selector=${itemdetails_ellipsis}   
    Sleep    2s
    Click Element    ${previewpdf_lnk}
    ${preview_message}=    Get Element Text    selector=${preview_lbl}
    RETURN    ${preview_message}

    
    
Get Numeric Value
    [Arguments]    ${input_string}
    ${regex}=    Set Variable    Invoice: (\\d+)    # Regular expression to capture numeric value after "Invoice: "
    ${matches}=    Get Regexp Matches    ${input_string}    ${regex}
    ${numeric_value}=    Set Variable    ${matches[0][1]}    # Extract the captured numeric value
    RETURN    ${numeric_value}

Item Details With Discount with two items part
    [Arguments]    ${unitprice}    ${itemtype}    ${item_no}    ${dept}    
    Click Element    selector=${itemdetails_tab}  
        
    FOR    ${index}    IN RANGE    1
        Click Generic Button    button_name=Add Item
        Click Element    selector=${item_type_ddl}
        ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
        Click Element    selector=${generic_dropdown_select_value}
        Sleep    2s
        Click Element    selector=${item_no_ddl}
        ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
        Click Element    selector=${generic_dropdown_select_value}
        Sleep    2s
        Click Element    selector=${dept_ddl}
        Sleep    2s
        ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
        Click Element    selector=${generic_dropdown_select_value}
        Click Element    selector=${unit_price_txt}        
        Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
        ${beforeDiscount}=    Get Element Text    selector=${after_discount_lbl}    
        Click Element    selector=${discount_chk}
        ${afterDiscount}=    Get Element Text    selector=${after_discount_lbl}
        Click Element    selector=${itemdetails_btnsave}
        Sleep    3s
        #Click Generic Button    button_name=Yes         
    END  
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}
    RETURN    ${beforeDiscount}    ${afterDiscount}    ${itemSave_success_msg}

Item Details With AddPayment
    [Arguments]    ${unitprice}    ${itemtype}    ${item_no}    ${dept}    ${paymentmethod}    
    Click Element    selector=${itemdetails_tab}
    Click Generic Button    button_name=Add Item
    Click Element    selector=${item_type_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${itemtype}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${item_no_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${item_type_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${item_no}
    Click Element    selector=${generic_dropdown_select_value}
    Sleep    2s
    Click Element    selector=${dept_ddl}
    Sleep    2s
    ${generic_dropdown_select_value}    Replace String    string=${dept_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${dept}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${unit_price_txt}     
    Send Keys To Element    selector=${unit_price_txt}    keys_to_send=${unitprice}
    Click Element    selector=${itemdetails_btnsave}
    Sleep    3s
    Click Element    selector=${past_date_job_creation_yes_btn}
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}   
    Click Element    selector=${applypayment_btn}
    Click Element    selector=${addpayment_btn}
    Send Keys To Element    selector=${amount_addpymt_txt}    keys_to_send=${unitprice}
    Click Element    selector=${paymentmethod_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${paymentmethod_ddl}    search_for=<<string_to_replace>>    replace_with=${paymentmethod}
    Click Element    selector=${generic_dropdown_select_value}
    Click Element    selector=${itemdetails_btnsave}
    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message}     
    Click Generic Button    button_name=Post
    ${itempost_success_msg}=    Get Element Text    selector=${generic_title_message}
    RETURN    ${itemSave_success_msg}    ${itempost_success_msg}

Edit Item Cost Unit And Quantity
    [Arguments]    ${quantity}    ${unitcost}
    Click Element    selector=${partitem_ellipsis}
    Click Element    selector=${partitem_entercost}
    sleep    2s
    Click Element    selector=${partitem_editlnk}
    sleep    2s
    Send Keys To Element    selector=${partitem_quantitytxt}    keys_to_send=${quantity}
    Send Keys To Element    selector=${partitem_unitcosttxt}    keys_to_send=${unitcost}
    ${totalcost}=    Get Element Text    selector=${partitem_totalcostlbl}
    Log To Console    ${totalcost}
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    ${itemeditcost_success_msg}=    Get Element Text    selector=${generic_description_message} 
    Log To Console    ${itemeditcost_success_msg}
    RETURN    ${itemeditcost_success_msg}    ${totalcost}

Cost Plus Edit Item CostUnit 
    [Arguments]    ${unitcost}   
    Click Element    selector=${partitem_ellipsis}
    Click Element    selector=${partitem_entercost}
    sleep    2s
    Click Element    selector=${partitem_editlnk}
    sleep    2s
    #Send Keys To Element    selector=${partitem_quantitytxt}    keys_to_send=${quantity}
    Send Keys To Element    selector=${partitem_unitcosttxt}    keys_to_send=${unitcost}
    #Send Keys To Element    selector=${partitem_markup}    keys_to_send=${markup}
    ${totalcost}=    Get Element Text    selector=${partitem_totalcostlbl}
    Log To Console    ${totalcost}
    ${totalprice}=    Get Element Text    selector=${partitem_totalpricelbl}
    Log To Console    ${totalprice}    
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    ${itemeditcost_success_msg}=    Get Element Text    selector=${generic_description_message} 
    Log To Console    ${itemeditcost_success_msg}
    RETURN    ${itemeditcost_success_msg}    ${totalcost}     ${totalprice}

Cost Plus Edit Item Markup
    [Arguments]    ${markup}
    Click Element    selector=${partitem_ellipsis}
    Click Element    selector=${partitem_entercost}
    sleep    2s
    Click Element    selector=${partitem_editlnk}
    sleep    2s
    #Send Keys To Element    selector=${partitem_quantitytxt}    keys_to_send=${quantity}
    #Send Keys To Element    selector=${partitem_unitcosttxt}    keys_to_send=${unitcost}
    Send Keys To Element    selector=${partitem_markup}    keys_to_send=${markup}
    ${totalcost}=    Get Element Text    selector=${partitem_totalcostlbl}
    Log To Console    ${totalcost}
    ${totalprice}=    Get Element Text    selector=${partitem_totalpricelbl}
    Log To Console    ${totalprice}    
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    ${itemeditcost_success_msg}=    Get Element Text    selector=${generic_description_message} 
    Log To Console    ${itemeditcost_success_msg}
    RETURN    ${itemeditcost_success_msg}    ${totalcost}     ${totalprice}

Cost Plus Edit Item Quantity
    [Arguments]    ${quantity}
    Click Element    selector=${partitem_ellipsis}
    Click Element    selector=${partitem_entercost}
    sleep    2s
    Click Element    selector=${partitem_editlnk}
    sleep    2s
    Send Keys To Element    selector=${partitem_quantitytxt}    keys_to_send=${quantity}
    # Send Keys To Element    selector=${partitem_unitcosttxt}    keys_to_send=${unitcost}
    # Send Keys To Element    selector=${partitem_markup}    keys_to_send=${markup}
    ${totalcost}=    Get Element Text    selector=${partitem_totalcostlbl}
    Log To Console    ${totalcost}
    ${totalprice}=    Get Element Text    selector=${partitem_totalpricelbl}
    Log To Console    ${totalprice}    
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    ${itemeditcost_success_msg}=    Get Element Text    selector=${generic_description_message} 
    Log To Console    ${itemeditcost_success_msg}
    RETURN    ${itemeditcost_success_msg}    ${totalcost}     ${totalprice}


Cost Plus Edit Item CostUnit Markup And Quantity
    [Arguments]    ${quantity}    ${unitcost}    ${markup}
    Click Element    selector=${partitem_ellipsis}
    Click Element    selector=${partitem_entercost}
    sleep    2s
    Click Element    selector=${partitem_editlnk}
    sleep    2s
    Send Keys To Element    selector=${partitem_quantitytxt}    keys_to_send=${quantity}
    Send Keys To Element    selector=${partitem_unitcosttxt}    keys_to_send=${unitcost}
    Send Keys To Element    selector=${partitem_markup}    keys_to_send=${markup}
    ${totalcost}=    Get Element Text    selector=${partitem_totalcostlbl}
    Log To Console    ${totalcost}
    ${totalprice}=    Get Element Text    selector=${partitem_totalpricelbl}
    Log To Console    ${totalprice}    
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    Click Element    selector=${item_entercost_btnsave}
    Sleep    2s
    ${itemeditcost_success_msg}=    Get Element Text    selector=${generic_description_message} 
    Log To Console    ${itemeditcost_success_msg}
    RETURN    ${itemeditcost_success_msg}    ${totalcost}     ${totalprice}

Add Credit Memo with Invoice with Return part
    [Arguments]    ${creditmemo_reason}
    Click Generic Button    button_name=Cancel
    Sleep    2s
    Click Element    selector=${invoicemanager_ellipsis}
    Click Element    selector=${AddCreditMemo_lnk}
    Sleep    2s
    Click Element    selector=${returnpart_chk}
    Click Generic Button    button_name=Continue
    
    Click Element    selector=${creditmemo_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${creditmemo_reason_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${creditmemo_reason}
    Click Element    selector=${generic_dropdown_select_value}
    
    Click Generic Button    button_name=Submit
    Sleep    3s

    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message} 
    # ${Invoice_detail}=    Get Element Text    selector=${invoice_details_lbl}
    # Log To Console    ${Invoice_detail}
    # ${Invoice_number2}=    Extract Text With Position Number   text_Message=${Invoice_detail}    position_count=2
    
    Log To Console    ${itemSave_success_msg}
    ${creditmemo_Invoice_number}=    Extract Text With Position Number   text_Message=${itemSave_success_msg}    position_count=1
    Log To Console    ${creditmemo_Invoice_number}
    ${cleaned_creditmemo_Invoice_number}=    Get Numeric Characters    ${creditmemo_Invoice_number}
    Log To Console    ${cleaned_creditmemo_Invoice_number}
    ${test_var}=    Catenate    ${creditmemo_Invoice_number}    Credit Memo Updated Successfully 
    Log To Console    ${test_var}       
    RETURN    ${itemSave_success_msg}    ${cleaned_creditmemo_Invoice_number}

Add Credit Memo with Invoice with Reverse Paybase
    [Arguments]    ${creditmemo_reason}
    Click Generic Button    button_name=Cancel
    Sleep    2s
    Click Element    selector=${invoicemanager_ellipsis}
    Click Element    selector=${AddCreditMemo_lnk}
    Sleep    2s
    Click Element    selector=${reversepaybase_chk}
    Click Generic Button    button_name=Continue
    
    Click Element    selector=${creditmemo_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${creditmemo_reason_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${creditmemo_reason}
    Click Element    selector=${generic_dropdown_select_value}
    
    Click Generic Button    button_name=Submit
    Sleep    3s

    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message} 
    # ${Invoice_detail}=    Get Element Text    selector=${invoice_details_lbl}
    # Log To Console    ${Invoice_detail}
    # ${Invoice_number2}=    Extract Text With Position Number   text_Message=${Invoice_detail}    position_count=2
    
    Log To Console    ${itemSave_success_msg}
    ${creditmemo_Invoice_number}=    Extract Text With Position Number   text_Message=${itemSave_success_msg}    position_count=1
    Log To Console    ${creditmemo_Invoice_number}
    ${cleaned_creditmemo_Invoice_number}=    Get Numeric Characters    ${creditmemo_Invoice_number}
    Log To Console    ${cleaned_creditmemo_Invoice_number}
    ${test_var}=    Catenate    ${creditmemo_Invoice_number}    Credit Memo Updated Successfully 
    Log To Console    ${test_var}       
    RETURN    ${itemSave_success_msg}    ${cleaned_creditmemo_Invoice_number}

Add Credit Memo with Invoice
    [Arguments]    ${creditmemo_reason}
    Click Generic Button    button_name=Cancel
    Sleep    2s
    Click Element    selector=${invoicemanager_ellipsis}
    Click Element    selector=${AddCreditMemo_lnk}
    Sleep    2s
    Click Generic Button    button_name=Continue
    Click Element    selector=${creditmemo_ddl}
    #Select Value From Dropdown    selector=${creditmemo_ddl}    value_to_select=${creditmemo_reason}
    
    ${generic_dropdown_select_value}    Replace String    string=${creditmemo_reason_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${creditmemo_reason}
    Click Element    selector=${generic_dropdown_select_value}
    
    Click Generic Button    button_name=Submit
    Sleep    3s

    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message} 
    # ${Invoice_detail}=    Get Element Text    selector=${invoice_details_lbl}
    # Log To Console    ${Invoice_detail}
    # ${Invoice_number2}=    Extract Text With Position Number   text_Message=${Invoice_detail}    position_count=2
    
    Log To Console    ${itemSave_success_msg}
    ${creditmemo_Invoice_number}=    Extract Text With Position Number   text_Message=${itemSave_success_msg}    position_count=1
    Log To Console    ${creditmemo_Invoice_number}
    ${cleaned_creditmemo_Invoice_number}=    Get Numeric Characters    ${creditmemo_Invoice_number}
    Log To Console    ${cleaned_creditmemo_Invoice_number}
    ${test_var}=    Catenate    ${creditmemo_Invoice_number}    Credit Memo Updated Successfully 
    Log To Console    ${test_var}       
    RETURN    ${itemSave_success_msg}    ${cleaned_creditmemo_Invoice_number}

Add Dulpicate Credit Memo with Invoice
    [Arguments]    ${creditmemo_reason}    
    Click Generic Button    button_name=Cancel
    Sleep    2s
    Click Element    selector=${duplicatecreditmemo_invoicemanager_ellipsis}
    Click Element    selector=${AddCreditMemo_lnk}
    #Wait For Element To Be Visible    selector=${duplicate_creditmemo_rdb}
    Click Element    selector=${duplicate_creditmemo_rdb}   
    Sleep    2s
    Click Generic Button    button_name=Continue
    
    Click Element    selector=${creditmemo_ddl}
    ${generic_dropdown_select_value}    Replace String    string=${creditmemo_reason_ddlvalue}    search_for=<<string_to_replace>>    replace_with=${creditmemo_reason}
    Click Element    selector=${generic_dropdown_select_value}
    
    Click Generic Button    button_name=Submit
    Sleep    3s

    ${itemSave_success_msg}=    Get Element Text    selector=${generic_title_message} 
    # ${Invoice_detail}=    Get Element Text    selector=${invoice_details_lbl}
    # Log To Console    ${Invoice_detail}
    # ${Invoice_number2}=    Extract Text With Position Number   text_Message=${Invoice_detail}    position_count=2
    
    Log To Console    ${itemSave_success_msg}
    ${creditmemo_Invoice_number}=    Extract Text With Position Number   text_Message=${itemSave_success_msg}    position_count=1
    Log To Console    ${creditmemo_Invoice_number}
    ${cleaned_creditmemo_Invoice_number}=    Get Numeric Characters    ${creditmemo_Invoice_number}
    Log To Console    ${cleaned_creditmemo_Invoice_number}
    ${test_var}=    Catenate    ${creditmemo_Invoice_number}    Credit Memo Updated Successfully 
    Log To Console    ${test_var}       
    RETURN    ${itemSave_success_msg}    ${cleaned_creditmemo_Invoice_number}  

Get Numeric Characters
    [Arguments]    ${input_string}
    ${numeric_characters}=    Get Regexp Matches    ${input_string}    \d+
    ${numeric_string}=    Evaluate    ''.join($numeric_characters)
    RETURN    ${numeric_string} 

Remove Hash
    [Arguments]    ${text}
    #${cleaned_value}=    Evaluate    ${text}.lstrip('#')
    ${cleaned_value}=    Evaluate   ${text}.
    RETURN    ${cleaned_value}

Extract Numeric Value
    [Arguments]    ${text}
    ${numeric_value}=    Evaluate    ''.join(filter(str.isdigit, ${text}))
    RETURN    ${numeric_value} 


Validate GL Invoice
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${gl_review}
    Sleep    3s
    ${local_total_credits}=    Get Element Text    selector=${get_total_credits_review_gl}
    Sleep    2s
    ${local_total_debits}=    Get Element Text    selector=${get_total_debits_review_gl}
    Click Generic Button    button_name=Close
    RETURN        ${local_total_credits}    ${local_total_debits}

Validate Account History
    Open Account History
    Sleep    2s
    ${actual_account_balance}=    Get Element Text    selector=${get_account_balance_account_history}    
    RETURN     ${actual_account_balance}

Open Account History
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${account_history}

Modify Customer PO
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${gl_review}
    Sleep    3s
    ${local_total_credits}=    Get Element Text    selector=${get_total_credits_review_gl}
    Sleep    2s
    ${local_total_debits}=    Get Element Text    selector=${get_total_debits_review_gl}
    RETURN        ${local_total_credits}    ${local_total_debits}
    

Select Value From Dropdown
    [Arguments]    ${selector}    ${value_to_select}
    Click Element    selector=${selector}
    ${generic_dropdown_select_value}    Replace String    string=${generic_dropdown_select_value}    search_for=<<string_to_replace>>    replace_with=${value_to_select}
    Click Element    selector=${generic_dropdown_select_value}

Select Cost Plus
    Sleep    3s    
    Click Element    ${costplus_rdb}    

Select Generic Value From Dropdown
    [Arguments]    ${value_name}
    ${generic_drop_down_value}=    Replace String    string=${select_generic_dropdown_value}    search_for=<<string_to_replace>>    replace_with=${value_name}
    Click Element    ${generic_drop_down_value}

Get First OR Last Element
    [Arguments]    ${locator}    ${index}
    ${elements_list} =    get elements  ${locator}
    IF    '${index}' == 'Last'    
        ${element}=    Get From List    ${elements_list}    -1    #Get the last element
    ELSE IF    '${index}' == 'First'
        ${element}=    Get From List    ${elements_list}    0    #Get the first element
    END
    RETURN    ${element}

Invoice Modify Customer PO 
    [Arguments]    ${customer_po}
    Click Element    selector=${itemdetails_ellipsis}
    Click Element    selector=${modify_customer_po}
    Sleep    2s
    Send Keys To Element    selector=${customer_po_txt}    keys_to_send=${customer_po}
    Click Element    selector=${customer_po_btnsave}
    ${success_message}=    Get Element Text    selector=${generic_title_message}
    ${update_message}=    Extract Text With Position Number    ${success_message}    2
    # 123456 Successfully Update
    Log To Console    ${update_message}
    Click Generic Button    button_name=Cancel
    RETURN    ${update_message}

Add New Agreement Invoice
    [Arguments]    ${type_name}    ${date}    ${month}    ${payment_method}
    [Documentation]    This method is used for creating a New agreement from the Invoice Manger Item Details
    
    Click Generic Button    button_name=New Agreement
    # Sleep    5s    reason= Required load the agreement page
    Wait For Element To Be Visible    selector=${select_agreement_type1}    timeout=10s
    Click Element    selector=${select_agreement_type1}
    ${generic_button}=    Replace String    string=${generic_dropdown_select_value}    search_for=<<string_to_replace>>    replace_with=${type_name}
    Click Element    ${generic_button}
    Click Element    selector=${start_date_picker}
    ${date_calendar}=    Replace String    string=${generic_value_select}    search_for=<<string_to_replace>>    replace_with=${date}
    Click Element    ${date_calendar}
    Click Element    selector=${visit_month_dropdown1}
    ${month_ddl}=    Replace String    string=${generic_dropdown_select_value}    search_for=<<string_to_replace>>    replace_with=${month}
    Click Element    ${month_ddl}
    Click Generic Button    button_name=Create Agreement
    # Click Element    selector=${confirmation_yes_btn_add_agreement}
    Wait For Element To Be Visible    selector=${payment_method_ddl_add_agreement}
    Click Element    selector=${select_new_payment_method_rdo_btn}
    Click Element    selector=${payment_method_ddl_add_agreement}
    ${payment_mode}=    Replace String    string=${generic_dropdown_select_value}    search_for=<<string_to_replace>>    replace_with=${payment_method}
    Click Element    selector=${payment_mode}
    Click Element    selector=${future_payment_reference_save_btn}
    Wait For Element To Be Visible    selector=${generic_description_message}
    ${agreement_created_msg}=    Get Element Text    selector=${generic_description_message}
    Click Element    selector=${make_payment_later_btn}
    Click Element    selector=${confirmation_copy_agreement_no}
    RETURN    ${agreement_created_msg}

Add Edit Billing Notes In Invoice Manager 
    [Documentation]      This method is used for Add and Edit notes Inbilling Account call handling
    [Arguments]    ${text_to_send}
    Click Element    selector=${invoice_billing_account_notes}
    Send Keys To Element    selector=${notes_text_field}    keys_to_send=${text_to_send}
    Sleep     2s
    Click Generic Button    button_name=Save
    ${notes_added_msg}=    Get Element Text    selector=${generic_title_message}
    Refresh Page

Validate Billing Notes In Invoice Manager
    Wait For Element To Be Visible    selector=${invoice_billing_account_notes}
    Click Element    selector=${invoice_billing_account_notes}
    ${notes_text}=    Get Element Text    selector=${notes_text_field}
    RETURN    ${notes_text}
    Click Generic Button  button_name=Save


Click Generic Button
    [Arguments]    ${button_name}
    ${generic_button}=    Replace String    string=${generic_button}    search_for=<<string_to_replace>>    replace_with=${button_name}
    Click Element    ${generic_button}
 