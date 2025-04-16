*** Settings ***
Resource    ../../utils/playwright_utils.robot
Resource    ../../utils/string_utils.robot
Resource    ../../page_objects/reports/dashboard_page.robot
Library    Browser

*** Variables ***
${generic_button}=    //iframe[@id='Left-frame'] >>> //span[text()='<<string_to_replace>>']
${generic_input_field}=    //iframe[@id='Left-frame'] >>> //input[@id='<<string_to_replace>>']
${phone_number_input}=    //iframe[@id='Left-frame'] >>> //input[@name='phoneNumber']
${phone_number_input_2}=    //iframe[@id='Left-frame'] >>> (//input[@name='phoneNumber'])[2]
${generic_dropdown_select_value}=    //iframe[@id='Left-frame'] >>> //div[text()='<<string_to_replace>>']
${select_generic_dropdown_value}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'<<string_to_replace>>')]
${select_generic_dropdown_value_1}=    //iframe[@id='Left-frame'] >>> (//div[contains(text(),'<<string_to_replace>>')])[1]
${select_generic_dropdown_value_2}=    //iframe[@id='Left-frame'] >>> (//div[contains(text(),'<<string_to_replace>>')])[2]
${select_generic_dropdown_value_3}=    //iframe[@id='Left-frame'] >>> (//div[contains(text(),'<<string_to_replace>>')])[3]
${lead_soruce_type_dropdown}=    //iframe[@id='Left-frame'] >>> div[class='customerForm_required__VyV8C'] span[class='ant-select-selection-item']
${lead_source_id_dropdown}=    //iframe[@id='Left-frame'] >>> //span[@class='ant-select-selection-search']//input[@id='leadSourceId']
${job_class_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_JobForm_Select_JobClass']
${job_type_dropdown}=    //iframe[@id='Left-frame'] >>> //input[@data-test-id='swTestID_JobForm_Input_JobType']
${equipment_dropdown}=    //iframe[@id='Left-frame'] >>> //input[@id='equipmentId']
${lead_source_type_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_JobForm_Select_LeadSourceType']
${job_lead_source_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_JobForm_Select_JobSourceType']
${select_ticket_type_dropdown}=    //iframe[@id='Left-frame'] >>> (//span[@class='ant-select-selection-search']//..//span[@class='ant-select-selection-item'])[3] 
${payment_method_dropdown}=     //iframe[@id='Left-frame'] >>> //input[@id='paymentMethod']
${payment_save_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//span[text()='Save']
${message_popup}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_description')]
${message_popup1}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_description')]
${ticket_success_mesage_title}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_title')]
${payment_method_confirmarion}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-header']
${yes_btn_payment_method}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-modal-content']//span[text()='Yes'])
${no_btn_payment_method}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//div[@class='ant-modal-footer']//span[text()='No']
${add_customer_existing_address_confirmation_popup}=    //iframe[@id='Left-frame'] >>> //span[@class="ant-modal-confirm-title"]
${cancel_btn_existing_customer_popup}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//span[text()='Cancel']
${back_to_search_button}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Back to Search']
${find_customer_searchtab}=    //iframe[@id='Left-frame'] >>> //span[text()='Find Your Customer']//..//..//../following-sibling::div[contains(@class,'ant-row')]//div[contains(@class,'searchLocation_searchBar')]//span[@class='ant-select-selection-search']//input
${call_direction_dropdown}=    //iframe[@id='Left-frame'] >>> //span[@title='Inbound Call']
${select_callType_indrpdown}=   //iframe[@id='Left-frame'] >>> //div[text()='<<string_to_replace>>']
${call_notes_textarea}=    //iframe[@id='Left-frame'] >>> //textarea[@data-test-id='swTestID_CallLeftPane_TextArea_Notes']
${select_agreement_type}=     //div[@class='ant-drawer-content-wrapper']//label[@title='Type Name']//..//..//div[@class='ant-select-selector']           #(//span[@class='ant-select-selection-item'])[4]
${click_date_picker}=    //div[@class='swPaddingAll']//label[text()='Sale Date']//../following-sibling::div//div[@class='ant-picker-input']
${select_date}=    //div[@class='ant-picker-footer']//a[contains(@class ,'ant-picker-now-btn') and text()='Today']
${visit_month_dropdown}=    //div[@class='ant-select-selection-overflow']
${select_visit_month}=    //div[text()='March']
${negative_tc_select_visit_month}=    //div[text()='May']
${create_agreement_button}=    //div[contains(@class,'ant-row swDrawerFooter')]//span[text()='Create Agreement']
${open_agreement_payment_dropdown}=    //div[@class='ant-drawer-content-wrapper']//label[text()='Payment Method']//../following-sibling::div//input
${agreement_payment_dropdown}=    //iframe[@id='Left-frame'] >>> //label[text()='Payment Method']//../following-sibling::div//input
${select_agreement_payment_method}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Cash')]
${agreement_payment_mode}=    //div[contains(text(),'Cash')]
${agreemnet_payment_mode_save_button}=    //div[text()='Future Payment Preference']//..//..//..//span[text()='Save']
${agreement_update_primery_billing_account_checkbox}=   //span[text()='Update primary billing account payment method with this payment method']
${select_agreement_new_payment_method_checkbox}=    //div[@class='ant-drawer-content-wrapper']//span[@class='swBold']
${agreement_NOW_button}=    //div[@class='ant-modal-confirm-btns']//span[text()='Now']
${payment_periodic_button}=    //div[@class='ant-drawer-content-wrapper']//span[text()='Use Agreement Periodic Billing Payment Method']  
${periodic_payment_save_button}=   //div[contains(@class ,'swDrawerFooterRgtBtn')]/../..//span[text()='Pay']
${post_pending_note}=    //iframe[@id='Left-frame'] >>> //form[@id='form']
${abort_code_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//span[@class='ant-select-selection-item']
${select_abort_code_from_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='AutoM']
${abort_note_form}=    //iframe[@id='Left-frame'] >>> //label[text()='Add Abort Notes (Optional)']
${payment_RHN_save_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-title']//ancestor::div[@class='ant-drawer-wrapper-body']//div[@class='ant-drawer-footer']//button//span[text()='Save']
${commercial_checkbox}=    //iframe[@id='Left-frame'] >>> //span[text()='Commercial']//..//input
${company_name_locator}=    //iframe[@id='Left-frame'] >>> //label[text()='Company Name']//..//input
${billing_account_button}=   //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_CustomerInfo_Panel_BillingAccounts']
${billing_account_button}=   //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_CustomerInfo_Panel_BillingAccounts']    #//div[@id='swID_CallHandling_ServiceLocationDetail_CustomerInfo_BillingAccounts_Panel']
${link_billing_account_button}=   //iframe[@id='Left-frame'] >>> //span[normalize-space()='Link Billing Account']
${lastname_name_to_link_account}=   //iframe[@id='Left-frame'] >>> //input[@id='lastName']
${select_button}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='Select']
${billing_confirmation_yes_button}=    //iframe[@id='Left-frame'] >>> (//div[@role='document']//button[@class='ant-btn ant-btn-primary']//..//span[text()='Yes'])[1]
${billing_confirmation_yes_button_2}=    //iframe[@id='Left-frame'] >>> (//div[@role='document']//button[@class='ant-btn ant-btn-primary']//..//span[text()='Yes'])[2]
${billing_confirmation_yes_button_3}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-modal-content']//div[contains(text(),'Are you sure you want to link')]//..//..//..//..//div[@class='ant-modal-footer']//span[text()='Yes'])[1]
${unlink_primery_button}=    //iframe[@id='Left-frame'] >>> //span[text()='Unlink']
${unlink_confirmation_yes_button}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-modal-content']//div[text()='Are you sure you want to unlink robot robot account?']//..//..//..//..//div[@class='ant-modal-footer']//span[text()='Yes'])[1]    
${ticket_description}=    //iframe[@id='Left-frame'] >>> //label[@title='Description']/../following-sibling::div//textarea
${create_job_yes}=    //iframe[@id='Left-frame'] >>> //div[text()='Ticket Confirmation']//../following-sibling::div//input[@id='rc_select_7']
${ticket_creation_success_message}    //iframe[@id='Left-frame'] >>>//p[contains(@class,'message_description__1BjCf')]
${opportunity_type_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_Sales_SearchableDropdown_SalesOpportunityCode']                 #//label[text()='Sales Opportunity Code']//..//..//span[@class='ant-select-selection-item']
${sales_opportunity_type_selection}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'ant-select-item-option-content')][normalize-space()='Agreement - Estimate for Agreement'])[1]
${sales_job_class_dropdown}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'SalesSection_salesTypeRow')]//div[contains(@class,'createInput_inputContainer')]//span[@class='ant-select-selection-item']
${sales_visitType_1}=		//iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='AC']
${salesopportunity_code}=	//iframe[@id='Left-frame'] >>> div[title='AC'] div[class='ant-select-item-option-content']
${sales_dePartment_dropdown}=		//iframe[@id='Left-frame'] >>> //input[@id='swID_CallHandling_Sales_Estimate_SearchableDropdown_Department']
${sales_dePartment_value}=	//iframe[@id='Left-frame'] >>> div[title='00 - Administrative'] div[class='ant-select-item-option-content']   
${sales_job_type}=    //iframe[@id='Left-frame'] >>>  //div[contains(@class,'ant-col ant-col-11')]//div[contains(@class,'EstimateFields_estimateRequiredColumn')]//span[@class='ant-select-selection-item']
${sales_lead_source_type}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-col ant-col-15')]//div//span[@class='ant-select-selection-item']
${sales_lead_source_type_2}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-col ant-col-8 ant-col-offset-1')]//span[@class='ant-select-selection-item']
${sales_equipment_type}=    //iframe[@id='Left-frame'] >>> (//label[text()='Sales Opportunity Type']//..//..//..//../following-sibling::div//input)[8]
${technician_dropdown}=    //iframe[@id='Left-frame'] >>> //label[text()='Assign Ticket']//../following-sibling::div//input[@placeholder='Search by Employee Name']
${select_technician}=    //iframe[@id='Left-frame'] >>> //i[normalize-space()='BRANDI']
${back_to_search_button}=     //iframe[@id='Left-frame'] >>> //span[text()='Back to Search']
${click_customer_search_result_callhandlingpage}=    //iframe[@id='Left-frame'] >>> (//span[contains(@class,'customerButton_text')])[1]
${edit_bill_acc-edit_button_billing_account}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-collapse-content ant-collapse-content-active']//span[contains(text(),'Edit')]
${edit_bill_acc-billing_account_payment_information_tab}=    //iframe[@id='Left-frame'] >>> //div[text()='Payment Information']
${edit_bill_acc-billing_Payment Information_tab}=    //iframe[@id='Left-frame'] >>>  //div[text()='Account Information']
${edit_bill_acc-billing_account_payment_method}=    //iframe[@id='Left-frame'] >>> //label[text()='Payment Method']//..//..//input[@id='paymentMethod']
${edit_billing_acc-payment_method}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Cash')]
${edit_billing_acc-save_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//div[contains(@class,'ant-row swDrawerFooter')]//span[text()='Save']
${edit_billing_acc-payment_method_Amex}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'CARD_READER')]
${negative_tc_agreement_validation_message}=    //div[contains(@class,'message_description')]
${schedule_page_technician_dropdown}=    //iframe[@id='Left-frame'] >>> //div[text()='(Optional) Select a preferred technician']//../div[contains(@class,'scheduleJobDrawer_customSelect')]//input
${schedule_button}    //iframe[@id='Left-frame'] >>> //div[text()='Schedule Job']//..//../following-sibling::div//span[text()='Schedule']
${schedule_confirmation_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-footer']//span[text()='Confirm']
${job_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ServiceLocationDetail_TabPan_Jobs']
${unlink_primery_button}=    //iframe[@id='Left-frame'] >>> //span[text()='Unlink']
${unkonwn_phone_number}=    //iframe[@id='Left-frame'] >>> //div[text()='Unknown Phone Number']
${invoices_tab}=    //iframe[@id='Left-frame'] >>> //div[@role='tabpanel' and @aria-hidden='false']//span[text()='Invoices']
#${invoices_tab}=    //iframe[@id='Left-frame'] >>> //div[@aria-controls='swID_ServiceLocationDetail_Tabs-panel-Invoices']
#${invoices_tab}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_ServiceLocationDetail_TabPan_Invoices']
${equipment_tab}=    //iframe[@id='Left-frame'] >>> //div[@role='tabpanel' and @aria-hidden='false']//span[text()='Equipment']
${service_locations_invoices_tab}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//div[normalize-space()='Service Locations']
${save_btn_invoices_tab}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//span[text()='Save']
${right_drawer_close_btn_invoice_manager}=    //button[@aria-label='Close']
${right_drawer_close_btn_customer_name}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Customer Name:')]/..//button[@aria-label='Close']
${cancel_job_button}=    //iframe[@id='Left-frame'] >>> //span[text()='Cancel Job']
${confirmation_cancel_job_button}=    //iframe[@id='Left-frame'] >>> //span[text()='Yes, cancel job']
${job_request}=    //iframe[@id='Left-frame'] >>> //div[@role='tabpanel' and @aria-hidden='false']//span[text()='Job Request']
${ticket}=    //iframe[@id='Left-frame'] >>> //button[@data-test-id='swTestID_CallLeftPane_Button_Ticket']     #//div[@role='tabpanel' and @aria-hidden='false']//span[text()='Ticket']
${sales}=    //iframe[@id='Left-frame'] >>> //div[@role='tabpanel' and @aria-hidden='false']//span[text()='Sales']
${new_customer}=    //iframe[@id='Left-frame'] >>> //div[@role='tabpanel' and @aria-hidden='false']//span[text()='New Customer']
${confirmation_message_description}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'message_description')])[1]
${invoice_number}=    (//label[text()='Invoice #']/../following-sibling::div//input[contains(@class,'ant-input')])[2]
${job_confirmation_id_message}=    //iframe[@id='Left-frame'] >>> //p[@class='message_description__1BjCf']
${reschedule_button}=    //iframe[@id='Left-frame'] >>> //div[@class='swDrawerFooterRgtBtn']//span[text()='Reschedule']
${sales_confirmation_screen}=    //iframe[@id='Left-frame'] >>> //div[text()='Sales Opportunity Confirmation: ']
${sales_create_job_dropdown_yes/no_selection}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//label[text()='Create Job?']//..//..//span[@title='No']
${sales_selection_yes_from_create_job_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='Yes']
${sales_selection_no_from_create_job_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='No']
${sales_assign_emplyee_dropdown}=     //iframe[@id='Left-frame'] >>> //label[text()='Assign Employee ']//../following-sibling::div//input[@placeholder='Search by Employee Name']
${sales_employee_selection}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'employeeSearch_dropdownMain')]//i[normalize-space()='BRANDI']
${select_agreement_type}=    xpath=//div[@class='swBlockCond']//label[text()='Type Name']//../following-sibling::div//div[@title='11TC6 - ']
${text}=    //iframe[@id='Left-frame'] >>> //input[@id='firstName']
${home_tab}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHandling_tabBarWrapper')]//div[@class='ant-tabs-nav-list']//*[text()='Home']
${job_records_tab}=    //iframe[@id='Left-frame'] >>> //li[@role='menuitem']//span[text()='Job Records']
${sales_records_tab}=    //iframe[@id='Left-frame'] >>> //li[@role='menuitem']//span[text()='Sales Record']
${job_records_tab_phonnumber_serach_tab}=    //iframe[@id='Left-frame'] >>> (//span[@role='button'])[6]
${sales_records_tab_phonnumber_serach_tab}=    //iframe[@id='Left-frame'] >>> (//span[text()='Phone Number']//..//..//..//span[@role='button'])[5]
${job_records_tab_phonnumber_serach_space}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobRecordsTable_filterContainer')]//input[@placeholder='Search filters…']
${sales_records_tab_phonnumber_serach_space}=    //iframe[@id='Left-frame'] >>> //div[@class='salesRecordTable_filterContainer__AwyXY']//input[@placeholder='Search filters…']
${job_record_search_check_box}=    //iframe[@id='Left-frame'] >>> //li[@class="ant-dropdown-menu-item"]//input[@type='checkbox']
${ok_button_below_checkbox}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobRecordsTable_actionsContainer')]//span[text()='OK']
${sales_ok_btn_checkbox}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'salesRecordTable_actionsContainer')]//span[text()='OK']
${click_search_result}=    //iframe[@id='Left-frame'] >>> (//tr[@class='ant-table-row ant-table-row-level-0']//td[@class='ant-table-cell'])[5]
${abort_message}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_title')]
${message_description_xpath}=    //iframe[@id='Left-frame'] >>> //p[contains(@class,'message_description')]
${agreement_creation_success_message}=    (//div[contains(@class,'message_description')])[1]
${agreement_creation_success_message_1}=    //div[contains(@class,'message_description')]
${agreement_payment_detail}=    (//div[contains(@class,'message_description')])[2]
${generic_cust_name_dispatch}=    //iframe[@id='Left-frame'] >>> //div[text()='<<string_to_replace>>']
${add_assignment_btn_dispatch_scr}=    //iframe[@id='Left-frame'] >>> //span[text()='Add Assignment']
${dispatch_purchase_order}=    //iframe[@id='Left-frame'] >>> //span[text()='Purchase Order']
${dispatch_add_purchase_orde}=    //iframe[@id='Left-frame'] >>> //li[text()='Add Purchase Order']
${dispatch_Equipment_Warranties}=    //iframe[@id='Left-frame'] >>> //span[text()='Equipment / Warranties']
${abort_yes_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-wrap ant-modal-confirm-centered ant-modal-centered']//button[2]
${abort_sales_yes_button}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//div[text()='Are you sure you want to abort the call?']//../following-sibling::div//span[text()='Yes']
${copy_agreement_btn}=    //div[@class='ant-modal-confirm-btns']//span[text()='Copy Agreement #']
${custonmer_information_btn}=    //iframe[@id='Left-frame'] >>> (//div[@role='tabpanel' and @aria-hidden='false']//div[normalize-space()='Customer Information'])[1]
${customer_information_edit_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-collapse-content ant-collapse-content-active']//span[contains(text(),'Edit')]
${title_dropdown}=    //iframe[@id='Left-frame'] >>> (//input[@id='title'])[1]
${customer_information_save_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-legacy-form-item-control']//span[text()='Save']
${job_number_path}=    //iframe[@id='Left-frame'] >>> (//p[contains(@class,'message_description')])[2]
${service_locations_btn}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_CustomerInfo_Panel_ServiceLocation']
${address_2}=    //iframe[@id='Left-frame'] >>> //input[@id='address2']
${service_location_save_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='swRgtBtn']//span[text()='Save']
${all_tabs}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'callHandling_tabBarWrapper')]//div[contains(@class,'ant-tabs-nav-wrap')]//div[contains(@class,'ant-tabs-tab')]//..//div[@role='tab'])
${cancel_button}=    //iframe[@id='Left-frame'] >>> //div[@aria-hidden='false']//span[text()='Cancel']
${tab_closer_after_job_creation}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'callTabTitle_tabTitle')])[1]
${save_calhandlingpage_button}=    //iframe[@id='Left-frame'] >>> //header[contains(@class,'header_header')]//span[text()='Save']
${past_date_job_creation_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-confirm-btns']//span[text()='Yes']
${payment_method_dropdown_value}=    //iframe[@id='Left-frame'] >>> //div[text()='Cash']
${agreement_type_dropdown}=    //div[@class='swBlockCond']//label[text()='Type Name']//../following-sibling::div//div[@title='11TC6 - ']
${lead_source_type_dropdown_height}=    //iframe[@id='Left-frame'] >>> //div[@style='max-height: 160px; overflow-y: auto; overflow-anchor: none;']
${lead_source_type_dropdown_scroll}=    //iframe[@id='Left-frame'] >>> //div[@style='max-height: 160px; overflow-y: auto; overflow-anchor: none;']
${job_class_dropdown_height}=    //iframe[@id='Left-frame'] >>> (//div[@style='height: 160px; overflow-y: auto; overflow-anchor: none;']//div)[1]|//div[@style='max-height: 160px; overflow-y: auto; overflow-anchor: none;']
${job_class_dropdown_scroll}=    //iframe[@id='Left-frame'] >>> //div[@style='height: 160px; overflow-y: auto; overflow-anchor: none;']|//div[@style='max-height: 160px; overflow-y: auto; overflow-anchor: none;']
${job_lead_source_type_dropdown_height}=    //iframe[@id='Left-frame'] >>> (//div[@style='height: 256px; overflow-y: auto; overflow-anchor: none;']//div)[1]|//div[@style='max-height: 256px; overflow-y: auto; overflow-anchor: none;']
${job_lead_source_type_dropdown_scroll}=    //iframe[@id='Left-frame'] >>> //div[@style='height: 256px; overflow-y: auto; overflow-anchor: none;']|//div[@style='max-height: 256px; overflow-y: auto; overflow-anchor: none;']
${department_dropdwon_invoice_manager}=    //label[@title='Department']/../following-sibling::div//input
${department_dropdwon_value_invoice_manager}=    //div[contains(@class,'ant-select-dropdown')]//tr//td[text()='00']
${save_btn_invoice_manager}=    //span[text()='Save']
${post_btn_invoice_manager}=    //div[contains(text(),'Counter Sale Invoice')]/../../..//span[text()='Post']
${ok_btn_invoice_manager}=    //span[text()='OK']
${confirmation_message_description_invoice_manager}=    (//div[contains(@class,'message_description')])[1]
${right_drawer_cancel_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Customer Name:')]/../..//span[text()='Cancel']
${cancel_changes_yes_btn}=    //iframe[@id='Left-frame'] >>> //div[text()='Cancel Changes']/../following-sibling::div//span[text()='Yes']
${update_node_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobRecord_footer')]//span[text()='Update Notes']
${updatenote_text_area}=    //iframe[@id='Left-frame'] >>> //div[text()='Job Notes']/..//following-sibling::div//textarea
${priority_btn}=    //iframe[@id='Left-frame'] >>> //span[@data-test-id='swTestID_CallLeftPane_CheckBox_HighPriority']
${ticket_records_tab}=    //iframe[@id='Left-frame'] >>> (//ul[@role='menu'])[1]//span[text()='Ticket Record']
${contact_history_tab}    //iframe[@id='Left-frame'] >>> //span[text()='Contact History']
${ticket_records_tab_phonnumber_serach_space}=    //iframe[@id='Left-frame'] >>> //span[contains(@class,'ticketRecordTable_search')]//input[@placeholder='Search filters…']
${ticket_records_tab_phonnumber_serach_tab}=    //iframe[@id='Left-frame'] >>> (//span[text()='Phone Number']//..//..//..//span[@role='button'])[7]
${ticket_ok_btn_checkbox}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ticketRecordTable_actionsContainer')]//span[text()='OK']
${ticket_id}=    //iframe[@id='Left-frame'] >>> //label[text()='Call Number']/../following-sibling::div//p[contains(@class,'ticketRecordDetails')]
${fetch_email_sales}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//p[normalize-space()='admin@automation.com']
${fetch_common_job_type}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//p[normalize-space()='Agreement']
${other_call_btn}=    //iframe[@id='Left-frame'] >>> //button[@value='OTHERS']
${other_call_type}=    //iframe[@id='Left-frame'] >>> //label[text()='Call Reason']//..//span[@title='Other']
${other_desc}=    //iframe[@id='Left-frame'] >>> //label[text()='Description']//following-sibling::div//textarea
${priority_tab}=    //iframe[@id='Left-frame'] >>> (//span[@role='button'])[1]
${low}=    //iframe[@id='Left-frame'] >>> //span[text()='Low']
${low_ok_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'filterDropdown_actionsContainer')]//span[text()='Ok']
${clickfirst_record}=    //iframe[@id='Left-frame'] >>> (//td[text()='admin@automation.com'])[1]
${checkbox_status}=    //iframe[@id='Left-frame'] >>> (//input[@type='checkbox'])[4]
${close_drore}=    //iframe[@id='Left-frame'] >>> //div[text()='Contact Record']/..//..//span[@class='anticon anticon-close']
${clear_priority_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Clear']
${high}=    //iframe[@id='Left-frame'] >>> (//span[normalize-space()='High'])[1]
${call_status}=    //iframe[@id='Left-frame'] >>> (//span[text()='Call Status']//..//..//..//span[@role='button'])[7]
${receiveby_status}=    //iframe[@id='Left-frame'] >>> (//span[@role='button'])[6]
${call_date_tab}=    //iframe[@id='Left-frame'] >>> (//span[@role='button'])[2]
${abort_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Aborted']
${abort_filter_ok_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'filterDropdown_actionsContainer')]//span[text()='Ok']
${abort_checkbox_status}=    //iframe[@id='Left-frame'] >>> (//input[@type='checkbox'])[4]
${abort_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_callStatusAborted')]
${postpending_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Post Pending']
${post_pending_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_callStatusPostPending')]
${other_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Other']
${other_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_callStatusJobCreated')]
${opprtunity_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Opportunity Created']
${opprtunity_type_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_callStatusJobCreated')]
${Jobcreated_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Job Created']
${ticket_type_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_callStatusJobCreated')]
${tickettype_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='Ticket Created']
${received_by_filter}=    //iframe[@id='Left-frame'] >>> //span[text()='admin@automation.com']
${received_by_filter_ok_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'filterDropdown_actionsContainer')]//span[text()='Ok']
${recreicedby_email_txt}=    //iframe[@id='Left-frame'] >>> (//span[text()='admin@automation.com'])[1]
${start_date}=    //iframe[@id='Left-frame'] >>> //input[@placeholder='Start date']
${date_filter_ok_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistory_actionsContainer')]/..//span[text()='OK']
${start_date_select}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-picker-cell-inner'][normalize-space()='1'])[1]
${end_date_select}=    //iframe[@id='Left-frame'] >>> (//div[@class='ant-picker-cell-inner'][normalize-space()='1'])[3]
${actual_call_date}=    //iframe[@id='Left-frame'] >>> //label[text()='Call Date']/../..//div[contains(@class,'ant-col ant-col-11 ant-col-offset-2')]
${close_btn}=    //iframe[@id='Left-frame'] >>> //button[@aria-label='Close' and contains(@class, 'ant-drawer-close')]
${add_location_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Add Location']
${phone_delete_icon}=    //iframe[@id='Left-frame'] >>> (//button[contains(@class,'button_link__lgWNh button_button__ktA4d swLink dangerButton')])[2]
${deletephone_confirmation_scr}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-modal-confirm-btns')]//span[text()='Yes']
${address_dropdown}=    //iframe[@id='Left-frame'] >>> //input[@id="address1"]
${select_addresfromDropdown}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='1234 Steelwood Road, Columbus, OH, USA']
${property_type}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-form-item-control-input-content']//div[contains(@class,'ant-select ant-select-outlined createInput_in')]//span[@class='ant-select-selection-item']
${address_generic_ddl_select_value}=    //iframe[@id='Left-frame'] >>> //div[@aria-selected='false']//div[contains(text(),"<<string_to_replace>>")]
${addresss_validation_class}=    //iframe[@id='Left-frame'] >>> (//p[contains(@class,'customerInfo_locationName')])[1]
${no_email_btn}=        //iframe[@id='Left-frame'] >>> //input[@id='noEmail']
${email_checkbox_status}=    (//input[@id='email'])[2]
${remove_address_btn}=    //iframe[@id='Left-frame'] >>> //*[text()='Remove']
${payment_information_note}=        //iframe[@id='Left-frame'] >>> //label[@title='Notes']/../following-sibling::div//textarea
${communication_panel}=         //iframe[@id='Left-frame'] >>> //button[contains(@class,'omnisCall_swOmniCallIconPositionWrapper')]//i[@class='icon_icon__wLA0B']
${communication_panel_heading}=      //iframe[@id='Left-frame'] >>> //div[text()='Incoming Phone Calls']
${extract_secondr_phone_number}=        //iframe[@id='Left-frame'] >>> (//div[text()='Phone Number :']//..//div[contains(@class,'swWordBreak')])[8]
${job_number_search_filter}=        //iframe[@id='Left-frame'] >>> (//span[@role='button'])[2]
${job_records_tab_job_status_tab}=    //iframe[@id='Left-frame'] >>> (//span[@role='button'])[4]
${job_records_tab_jobstatus_serach_space}=    //iframe[@id='Left-frame'] >>> //span[@class='filterDropdown_searchInput__2fVkj ant-input-affix-wrapper']//input[@placeholder='Search filters…']
${ok_button_job_status_below_checkbox}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'filterDropdown_actionsContainer')]//span[text()='Ok']
${cancell_text}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,' jobRecord_alignStatusButton')]//div[contains(@class,'jobRecord_statusCancelled')]
${click_cancelled_option}=        //iframe[@id='Left-frame'] >>> //span[text()='CANCELED']
${token_save_btn}=        //iframe[@id='Left-frame'] >>> //div[contains(@class,'swDrawerFooterRgtBtn')]//span[text()='Save']
${payment_note_1}=    test data
${job_txt_1}=    //iframe[@id='Left-frame'] >>> //label[text()='Job Number']/../following-sibling::div
${department_dropdown}=    //iframe[@id='Left-frame'] >>> //div[@data-test-id='swTestID_JobForm_Select_DepartmentName']
${select_department}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='00-Administrative']
${email_text}=    admin@automation.com
${extract_callfilter_data}=    //iframe[@id='Left-frame'] >>> //label[text()='Call Taken By']/..//..//span
${view_more_notes_btn}=    //iframe[@id='Left-frame'] >>> //span[normalize-space()='View More']
${add_new_customer_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Add New Customer']
${note_save_button_1}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//div[contains(@class,' jobRecord_btnRgtAlg')]//span[text()='Save']
${yes_btn_confirm_close_call_tab}=    //iframe[@id='Left-frame'] >>> //span[text()='Confirm']/../following-sibling::div//span[text()='Yes']
${select_service_location_equipment_ddl}=    //iframe[@id='Left-frame'] >>> //label[text()='Select a Service Location']/..//div//input
${equipment_type_equipment_ddl}=    //iframe[@id='Left-frame'] >>> //span[text()='Equipment Type']/..//input
${visits_dropdown}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class, 'createInput_inputContainer')]/div[contains(@class, 'ant-select-show-arrow')]//div[contains(@class, 'ant-select-selector')])[10]
${visits_option}=    //iframe[@id='Left-frame'] >>> (//div[contains(text(),'Annual Cooling')])[1]
${agreement_number}=    //iframe[@id='Left-frame'] >>> (//span[contains(@class, 'agreementNumber_agreementNumber')])[1]
${department_dropwdown}=    //iframe[@id='Left-frame'] >>> //input[@id='departmentName']
${department_option}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-select-item')]//div[text()='00']
${click_job_number_on_jobtab}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'jobNumber_jobNumberArea')])[1]
${job_detail_opportuniy_tab}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_backDrop')]//div[text()='Opportunities']
${job_detail_Jobinfo_notes_tab}=    //iframe[@id='Left-frame'] >>> //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_backDrop')]//div[text()='Job Info/Notes']
${job_detail_invoice_sales_quote_tab}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_backDrop')]//div[text()='Invoice/Sales Quote']
${job_detail_tech_credit_tab}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_backDrop')]//div[text()='Tech Credit']
${job_detail_happy_check_tab}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_backDrop')]//div[text()='Happy Check']
${job_detail_closer_btn}=    //iframe[@id='Left-frame'] >>> //button[contains(@class,'jobDetailsDrawer_collapseButton__3BnEH')]
${view_record_btn}=    //iframe[@id='Left-frame'] >>> //div[contains(@class,'callHistoryDetail_footer')]//span[text()='View Record']
${tax_code_dropdown}=	//iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-col ant-col-6')]//div[@class='ant-select-selector']         #//div[contains(@class,'ant-col ant-col-6')]//span[@class='ant-select-selection-item']
${select_tax_code}=     //iframe[@id='Left-frame'] >>> (//div[@class='ant-select-item-option-content'][normalize-space()='Auto'])[1]
${selct_customer}=    //iframe[@class='swLeftFrame'] >>> (//div[text()='nitin Nitin'])[1] 
${tax_code_shoul_be}=    Auto
${filter_btn}=    //span[text()='Filter']
${job_filter}=     //div[@class='ant-drawer-content-wrapper']//label[@title='Invoice Type :']//..//..//div[@class='ant-select-selector']
${click_job}=    //div[@class='ant-select-item-option-content' and text()='Job']
${click_submit}=    //span[text()='Submit']
${open_invoice}=    (//span[contains(@class,'swActionIcon')])[1]
${actual_tax_code}=    //span[@title='Auto']
${save_address_btn}=    //iframe[@id='Left-frame'] >>> //div[@class='swRgtBtn']//span[contains(text(),'Save')]
${ellipses}=    //iframe[@id='Left-frame'] >>> (//span[@aria-label='more']//*[name()='svg'])[1]
${agreement_edit_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[1]
${agreement_Viewagreement_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[2]
${agreement_agreementProfitability_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[3]
${agreement_adjustReserve_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[4]
${agreement_previewSinglenotice_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[5]
${agreement_PrintsingleNotice_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[6]
${agreement_renewAgreement_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[7]
${agreement_Createperiodicinvoice_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[8]
${agreement_Terminate/Cancel_option_underellipses}=		//iframe[@id='Left-frame'] >>> (//li[contains(@class,'ant-dropdown-menu-item-only-child')])[9]
${backate_actula_text}=    Are you sure you want to schedule for past date?
${later_btn}=	//div[@class='ant-modal-confirm-btns']//span[text()='Later']
${cancel_button1}=    //div[@class='ant-modal-confirm-btns']//span[text()='Cancel']
${invoice_manager_jobfilter}=	//div[@class='ant-drawer-content-wrapper']//label[@title='Job Number :']//..//..//input[contains(@id,'swID_InvoiceManagerFiltering_Input_JobNumber')]
${zone_tab_btn_1}=    //iframe[@id='Left-frame'] >>> //span[text()='Select Zone']
${select_zone2}=	//iframe[@id='Left-frame'] >>> input[id='location.zone']
${tax_exempt_checkbox}=    //iframe[@id='Left-frame'] >>> //span[text()='Tax Exempt']
${select_taxcode_from_dropdown}=	//iframe[@id='Left-frame'] >>> //label[text()='Select Tax Code']
${location_taxcode_3}=		//iframe[@id='Left-frame'] >>> input[id='location.taxCode']
${select_location_taxcode_3}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='Auto']
${job_button_customermanager}=		//iframe[@id='Left-frame'] >>> (//div[normalize-space()='Jobs'])[2]
${jobnumber_extraction_1}=    //iframe[@id='Left-frame'] >>> (//td[@class='ant-table-cell'])[1]
${extract_invoice_number}=    //iframe[@id='Left-frame'] >>> //span[@class='agreementNumber_agreementNumber__1O8Vb']
${back_date_icon}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//span[@aria-label='left']
${backdate_selection}=		//iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper']//div[text()='01'])[1]
${extract_backdate_selectionvalidation_message}=    //div[@class='ant-modal-confirm-content']
${clickno_on_backdate_selectionvalidation_message}=    //iframe[@id='Left-frame'] >>> //div[@class='ant-modal-confirm-btns']//span[text()='No']
${selectdate_2}=	//iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper']//div[text()='14'])[1]
${viewJob_btn}=		//iframe[@id='Left-frame'] >>> //span[text()='View Job']
${jobdrawer_ellipsesbbutton}=	//iframe[@id='Left-frame'] >>> //div[contains(@class,'jobDetailsDrawer_floatingPane')]//span[@id='swID_Dispatch_Modules_JobDetailsActionMenu_MoreOutlined']
${editjob_button}=	//iframe[@class='swLeftFrame'] >>> //*[text()='Edit Job']
${editjob_title_text}=		//iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-drawer-content-wrapper')]//div[@class='ant-drawer-title']
${actual_editjob_text}=		Edit Job Details and Notes
${visit_dropdown_editjobscreen}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//label[@title='Visits']//..//..//div[@class='ant-select-selector']
${visittype_value}=	//iframe[@id='Left-frame'] >>> //div[contains(text(),'AC;Annual Cooling;June 2025; 2 Hrs ; Agr#')]
${visittype_validatioText}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//div[@class='ant-modal-body']
${actual_ValidatioText}=	Would you like to change the Job Class for this job to AgreementVisit ?
${actualjobclass_dropdown}=	//iframe[@id='Left-frame'] >>> //input[@id='jobDetailsInformation_jobClass']//..//..//span[text()='AgreementVisit']
${jobclassdropdown_actualValue}=	AgreementVisit
${jobtype_dropdowtext}=	     //iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//span[@title='AC-Annual Cooling']
${jobtypedropdown_value}=	AC-Annual Cooling
${edit_job_screenSaveButton}=		//iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-drawer-content-wrapper')]//span[text()='Save']
${callhandling_serachresult_firstrecord}=	//iframe[@id='Left-frame'] >>> (//div[contains(@class,'ant-select-item')])[1]
${sales_persondropdown_callhandling}=    //iframe[@id='Left-frame'] >>> //input[@id='swID_JobCreateDrawer_SalesPersonList_Select_salesPerson']    
${salesperson_nameCallhandling}=    //iframe[@id='Left-frame'] >>> //div[@title='RICK - Richard Blaine']
${backdate_confirmationtext}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-modal-confirm-content']
${technician_name_callhaling_jobtab}=    //iframe[@id='Left-frame'] >>> //div[contains(text(),'Brandi Kramer')]
${actualtechnican_name}=	Brandi Kramer
${select_user_dispatch}=    //iframe[@id='Left-frame'] >>> (//div[contains(@class,'jobTitle_jobTitleDispatchNew')])[1]
${openOmnis}=	//iframe[@id='Left-frame'] >>> //button[contains(@class,'omnisCall_swOmniCallIconPositionWrapper')]//i[contains(@class,'icon_icon')]
${extract_ominstitle}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//div[@class='ant-drawer-title']
${selectcall}=	//iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper']//*[name()='svg'])[6]
${omnisredirection_text_1}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//div[@class='ant-modal-body']
${omnis_yesbtn}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-modal-content']//span[text()='Yes']
${nocumster_text_verification}=		//iframe[@id='Left-frame'] >>> (//div[@class='ant-modal-content']//div[@class='ant-modal-body'])[2]
${nocumster_text_verification_yesbtn}=		//iframe[@id='Left-frame'] >>> (//div[@class='ant-modal-content']//span[text()='Yes'])[2]
${allcall_checkbox}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//thead[@class='ant-table-thead']//input[@type='checkbox']
${individualcall_checkbox}=	//iframe[@id='Left-frame'] >>> (//div[@class='ant-drawer-content-wrapper']//input[@type='checkbox'])[3]
${serachesuly_validation}=	//iframe[@id='Left-frame'] >>> (//span[@class='swTitleText'][normalize-space()='ddd sdsds'])[1]
${yes_proceed_btn}=    //iframe[@id='Left-frame'] >>> //span[text()='Yes, proceed']
${browse_addons-tab}=	//iframe[@id='Left-frame'] >>> //div[text()='Browse Add-Ons']
${click_swconnect}=	//iframe[@id='Left-frame'] >>> (//span[text()='Add Item'])[8]
${enable_sw_connect_btn}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//a[normalize-space()='Enable SW Connect']
${taxdropdown_editaddress}=	//iframe[@id='Left-frame'] >>> //div[contains(@class,'ant-col ant-col-6')]//div[@class='ant-select-selector']
${taxvalue_editaddress}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='Auto']
${call_handling_billing_address_edit_btn}=    //iframe[@id='Left-frame'] >>> //button[contains(@class,'button_link')]//span[text()='Edit ']
${notes_text_field}=    //iframe[@id='Left-frame'] >>> //textarea[@name='comments']
${alternate_address_checkbox_btn}=     //iframe[@id='Left-frame'] >>>    (//input[@class='ant-checkbox-input'])[4]
${alternate_address_heading}=    //iframe[@id='Left-frame'] >>>    //div[text()='Alternate Address']
${alternate_address}=    //iframe[@id='Left-frame'] >>>    //input[@name='alternateAddress1']
${alternate_state}=    //iframe[@id='Left-frame'] >>>    //input[@name='alternateState']
${alternate_city}=    //iframe[@id='Left-frame'] >>>    //input[@name='alternateCity']
${alternate_zip_code}=    //iframe[@id='Left-frame'] >>>    //input[@name='alternateZip']
${alternate_notes_text_field}=    //iframe[@id='Left-frame'] >>>    //textarea[@name='notes']
${tab_3}=	//iframe[@id='Left-frame'] >>> (//div[contains(@class,'callHandling_tabBarWrapper')]//div[contains(@class,'ant-tabs-nav-wrap')]//div[contains(@class,'ant-tabs-tab')]//..//div[@role='tab'])[3]
${tab_Home_2}=	  //iframe[@id='Left-frame'] >>> (//div[contains(@class,'callHandling_tabBarWrapper')]//div[contains(@class,'ant-tabs-nav-wrap')]//div[contains(@class,'ant-tabs-tab')]//..//div[@role='tab'])[2]
${billingInformationTab}=	//div[text()='Billing Information']
${addtax_checkbox}=	//span[text()='Add Tax']
${addtax_dropdown}=	//span[text()='Add Tax']//..//..//span[@class='ant-select-selection-item']
${taxValue}=	//div[contains(text(),'Auto')]
${extractiontaxValue}=		//span[@title='Auto']
${addserviceloaction_confirmationTes_button}=		//iframe[@id='Left-frame'] >>> //button[@id='swID_CustomerForm_ServiceLocationForm_Existing_Button_Yes']
${tax_zone}=	//iframe[@id='Left-frame'] >>> (//span[@class='ant-select-selection-item'])[5]
${zonevalue_selection}=		//iframe[@id='Left-frame'] >>> //div[@title='automation']
${menu_btn_withoutbutton}=	//span[@name='menu-open']//*[name()='svg']
${customer_service_btn_withoutbutton}=	//span[normalize-space()='Customer Service']
${invoice_manager_btn_withoutbutton}=		//a[normalize-space()='Invoice Manager']
${menu_btn_withiframe}=		//iframe[@id='Left-frame'] >>> //span[@name='menu-open']//*[name()='svg']
${customer_service_btn_withiframe}=		//iframe[@id='Left-frame'] >>> //span[normalize-space()='Customer Service']
${invoice_manager_btn_withiframe}=	//iframe[@id='Left-frame'] >>> //a[normalize-space()='Invoice Manager']
${filter_without_frame}=	//iframe[@id='Left-frame'] >>> //span[text()='Filter']
${filter_invoice_type_inputarea}=		//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//label[@title='Invoice Type :']//..//..//div[@class='ant-select-selector']
${filter_invoice_job-selectionValue}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content' and text()='Job']
${filter_job_text_area}=	//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//label[@title='Job Number :']//..//..//input[contains(@id,'swID_InvoiceManagerFiltering_Input_JobNumber')]
${filter_submit_button}=	//iframe[@id='Left-frame'] >>> //span[text()='Submit']
${jobmanager_openJob}=		//iframe[@id='Left-frame'] >>> (//span[contains(@class,'swActionIcon')])[1]
${taxcode_extraction}=		//iframe[@id='Left-frame'] >>> //span[@title='Auto']

*** Keywords ***

Add Customer
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    2s
    Click New Customer
    Sleep    3s
    IF    '${company_name}' != ''
        Click Element    selector=${commercial_checkbox}
        Fill Generic Input Field    name_of_field=companyName    value_of_field=${company_name}
    END
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button    button_name=Create Customer
    IF  '${phone_number}' == ''
        Log    Please enter a valid phone number
        ${phone_number_empty}=    Get Element Text    selector=${message_description_xpath}
        Should Be Equal    first=${phone_number_empty}    second=Please enter a valid phone number.    values=${True}    msg= Phone Number is empty
    END
    Sleep    3s
    Click Element    selector=${add_customer_existing_address_confirmation_popup}
    IF    ${add_customer_existing_address} == ${True}
        Click Generic Button    Yes, proceed
    ELSE
        Click Element    selector=${cancel_btn_existing_customer_popup}
    END
    ${message_popup_text}=    Get Element Text    selector=${message_popup}
    Sleep    10s    reason= Required to display confirmation page
    Click Element    selector=${payment_method_confirmarion}
    IF    ${add_payment} == ${True}
        Click Element    selector=${yes_btn_payment_method}
    ELSE
        Click Element    selector=${no_btn_payment_method}
    END
    RETURN    ${message_popup_text}

Add Customer - With Random Address 
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    5s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    3s
    Click New Customer
    Sleep    3s
    IF    '${company_name}' != ''
        Click Element    selector=${commercial_checkbox}
        Fill Generic Input Field    name_of_field=companyName    value_of_field=${company_name}
    END
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    #Wait For Element To Be Visible    ${lead_soruce_type_dropdown}    timeout=10s
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button    button_name=Create Customer
    IF  '${phone_number}' == ''
        Log    Please enter a valid phone number
        ${phone_number_empty}=    Get Element Text    selector=${message_description_xpath}
        Should Be Equal    first=${phone_number_empty}    second=Please enter a valid phone number.    values=${True}    msg= Phone Number is empty
    END
    ${yes_proceed_btn_state}=    Get Element States    selector=${yes_proceed_btn}
    IF    'visible' in ${yes_proceed_btn_state}
        Click Element    selector=${yes_proceed_btn}
    END
    ${message_popup_text}=    Get Element Text    selector=${message_popup}
    Sleep    2s    reason= Required to display confirmation page
    Click Element    selector=${payment_method_confirmarion}
    IF    ${add_payment} == ${True}
        Click Element    selector=${yes_btn_payment_method}
    ELSE
        Click Element    selector=${no_btn_payment_method}
    END
    RETURN    ${message_popup_text}

High Priority
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    5s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    3s
    Click New Customer
    Sleep    3s
    Click Element    selector=${priority_btn}
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button    button_name=Create Customer
    Sleep    3s
    Click Element    selector=${yes_proceed_btn}
    ${message_popup_text}=    Get Element Text    selector=${message_popup}
    Sleep    3s
    Click Element    selector=${no_btn_payment_method}
    RETURN    ${message_popup_text}

Not Filling Data In Phone Number Tab
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Click New Customer
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button    button_name=Create Customer
    ${phone_number_empty}=    Get Element Text    selector=${message_description_xpath}
    RETURN    ${phone_number_empty}



Add Payment Method
    [Arguments]    ${payment_method}
    [Documentation]        This method is used for add payment method into the Customer
    Click Element          selector=${payment_method_dropdown}
    Sleep    2s            reason= Required to load values in payment method dropdown
    Click Element          selector=${payment_method_dropdown_value}    wait_for_enabled=${False}
    Click Element          selector=${payment_save_button}
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    RETURN                ${job_request_success_message}

Create Job Request
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}  
    [Documentation]    This method is used for Create Job Request
    Custom Log    Creating job request with Job Class: ${job_class}, Job Type: ${job_type}, Lead Source Type: ${lead_source_type}, Job Lead Soruce: ${job_lead_source}
    Sleep    5s
    Click Element                selector=${job_request}
    Sleep    5s
    Click Element                selector=${job_class_dropdown}
    Select Generic Value From Dropdown    value_name=${job_class}
    Click Element             ${job_type_dropdown}
    Select Generic Value From Dropdown    value_name=${job_type}
    Click Element                selector=${department_dropdown}
    Click Element        selector=${select_department}
    Click Element                    selector=${lead_source_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element         selector=${job_lead_source_dropdown}
    Select Generic Value From Dropdown    value_name=${job_lead_source}
    Click Generic Button        Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    
    ${job_message}=    Get Element Text    selector=${job_number_path}
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    Wait For Element To Be Visible    selector=${tab_3}    timeout=20s
    Click Element		selector=${tab_3}
    Click Element    ${cancel_button}
    Click Generic Button    button_name=Proceed
    Sleep    3s
    Click Element		selector=${tab_Home_2}
    Sleep    5s
    RETURN    ${job_request_success_message}    ${job_number}


Create Job Request For Cancel Job
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}  
    [Documentation]    This method is used for Create Job Request
    Custom Log    Creating job request with Job Class: ${job_class}, Job Type: ${job_type}, Lead Source Type: ${lead_source_type}, Job Lead Soruce: ${job_lead_source}
    Wait For Element To Be Visible        selector=${job_request}
    Click Element                selector=${job_request}
    Sleep    3s
    Click Element        selector=${job_class_dropdown}
    Select Generic Value From Dropdown    value_name=${job_class}
    Click Element                ${job_type_dropdown}
    Select Generic Value From Dropdown    value_name=${job_type}
    Click Element    selector=${department_dropdown}
    Click Element    selector=${select_department}
    Click Element              selector=${lead_source_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element        selector=${job_lead_source_dropdown}
    Select Generic Value From Dropdown    value_name=${job_lead_source}
    Click Generic Button        Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    
    ${job_message}=    Get Element Text    selector=${job_number_path}
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    Wait For Element To Be Visible    selector=${tab_3}    timeout=10s
    Click Element		selector=${tab_3}
    Click Element    ${cancel_button}
    Click Generic Button    button_name=Proceed
    Sleep    3s
    Click Element		selector=${tab_Home_2}
    Sleep    5s
    RETURN    ${job_request_success_message}    ${job_number}

Create Job Request with Schedule Job
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    ${equipment}=''
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    Select value From Dropdown    ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown    ${job_type_dropdown}    value_to_select=${job_type}
    IF    '${equipment}' != ''
        Select value From Dropdown    ${equipment_dropdown}    value_to_select=${equipment}
    END
    Select value From Dropdown    ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown    ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button    button_name=Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console    Yes button is ${yes_button}
    IF    '${yes_button}' == "True"
        Click ELement    ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console    Yes button is not visible
    END
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    Click Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    ${job_message}=    Get Element Text    selector=${job_number_path}   
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    ${result} =    Create List    ${job_request_success_message}    ${job_number}
    RETURN    ${result}
    # Click Element    selector=${yes_btn_confirm_close_call_tab}
    # RETURN        ${job_number}
    # RETURN    ${job_request_success_message}    ${job_number}

Create Job Request with Schedule Job For E2E
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    ${equipment}=''
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    Select value From Dropdown    ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown    ${job_type_dropdown}    value_to_select=${job_type}
    IF    '${equipment}' != ''
        Select value From Dropdown    ${equipment_dropdown}    value_to_select=${equipment}
    END
    Select value From Dropdown    ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown    ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button    button_name=Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console    Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement    ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console    Yes button is not visible
    END
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    Click Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Close
    ${job_message}=    Get Element Text    selector=${job_number_path}   
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    RETURN    ${job_number}

Schedule Job in Job Request
    [Arguments]    ${technician}
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    Click Generic Button    button_name=Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console    Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement    ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console    Yes button is not visible
    END
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    Click Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    ${job_message}=    Get Element Text    selector=${job_number_path}
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    RETURN    ${job_request_success_message}    ${job_number}

Create Job Request with Visit and Schedule Job
    [Arguments]    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    ${agreement}=    Get Element Text    selector=${agreement_number}
    ${agreement_value}=    Split String From Right    ${agreement}
    Wait For Element To Be Visible    ${visits_dropdown}
    Click Element    ${visits_dropdown}    
    Select Generic Value From Dropdown    ${agreement_value}[1]
    Click Generic Button    Yes
    Select value From Dropdown    ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown    ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown    ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Element    ${department_dropwdown}
    Click Element    ${department_option}
    Click Generic Button    button_name=Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console    Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement    ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console    Yes button is not visible
    END
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    Click Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    ${job_message}=    Get Element Text    selector=${job_number_path}
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    Click Element    selector=${yes_btn_confirm_close_call_tab}
    RETURN    ${job_request_success_message}    ${job_number}    ${agreement_value}

Create Ticket
    [Arguments]            ${ticket_Type}    ${description}
    [Documentation]        This method is used for Create Ticket and assingn technician
    Click Element          selector=${ticket}
    Sleep    3s
    Select Value From Dropdown    selector=${select_ticket_type_dropdown}    value_to_select=${ticket_Type}
    Send Keys To Element          selector=${ticket_description}      keys_to_send=${description}
    Click Element                 selector=${technician_dropdown}
    Send Keys To Element          selector=${technician_dropdown}      keys_to_send=BRANDI
    Click Element                 selector=${select_technician}
    Click Generic Button          button_name=Create Ticket
    Sleep    2s                   reason= Required to load dropdown
    Click Element                 selector=${sales_create_job_dropdown_yes/no_selection}
    Click Element                 selector=${sales_selection_yes_from_create_job_dropdown}
    Click Generic Button          button_name=Save Ticket
    ${success_message_title}=     Get Element Text    selector=${ticket_success_mesage_title}
    ${job_request_success_message}=    Get Element Text    selector=${message_description_xpath}
    RETURN    ${success_message_title}    ${job_request_success_message}
    
Create Ticket-Self Assign
    [Arguments]                ${ticket_Type}    ${description}
    [Documentation]            This method is used for Create Ticket
    Click generic Button       Ticket
    Select Value From Dropdown    selector=${select_ticket_type_dropdown}    value_to_select=${ticket_Type}
    Send Keys To Element        selector=${ticket_description}    keys_to_send=${description}
    Click Generic Button        Create Ticket
    Click Generic Button        Save Ticket
    ${success_message_title}=   Get Element Text    selector=${ticket_success_mesage_title}
    Should Be Equal              first=${success_message_title}    second=Ticket record updated successfully.    values=${True}
    ${icket_Self_Assign_success_message}=    Get Element Text    selector=${message_popup}
    RETURN                       ${icket_Self_Assign_success_message}
    
Find Customer By PhoneNumber
    [Arguments]            ${phone_number} 
    [Documentation]        This method is used for searching a customer by phonemuber
    Click Element    selector=${back_to_search_button}
    Sleep    3s
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Custom Log    Element Clicked

Find Customer By PhoneNumber_2
    [Arguments]            ${phone_number} 
    [Documentation]        This method is used for searching a customer by phonemuber
    Sleep    3s
    Click Element              selector=${back_to_search_button}
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}    timeout=10s
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Custom Log    Element Clicked

Find Customer By PhoneNumber_3
    [Arguments]            ${phone_number} 
    [Documentation]        This method is used for searching a customer by phonemuber
    Click Element              selector=${back_to_search_button}
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s

Find Customer By PhoneNumber For Tax Code_1
    [Arguments]            ${phone_numberr} 
    [Documentation]        This method is used for searching a customer by phonemuber
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_numberr}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    
Add New Customer on same address
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}
    [Documentation]     This method is created to add new customer on same address 
    Click Element    selector=${add_new_customer_btn}
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    selector=//iframe[@id='Left-frame'] >>> //input[@id='leadSourceTypeId']
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=//iframe[@id='Left-frame'] >>> //input[@id='leadSourceId']
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Create Customer
    ${user_created}=    Get Element Text    selector=${message_popup}
    RETURN    ${user_created}

Add Multiple phone numbers and create a customer Part_1
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    7s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Click New Customer
    IF    '${company_name}' != ''
        Click Element    selector=${commercial_checkbox}
        Fill Generic Input Field    name_of_field=companyName    value_of_field=${company_name}
    END
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}

Add Multiple phone numbers and create a customer Part_3
    [Arguments]                     ${phone_numberr}
    Click Generic Button            button_name=Add Phone
    Send Keys To Element            selector=${phone_number_input_2}    keys_to_send=${phone_numberr}
    Click Generic Button            button_name=Create Customer
    Click Generic Button            Yes, proceed
    ${user_created}=                Get Element Text    selector=${message_popup}
    Sleep    3s
    Click Element                   selector=${no_btn_payment_method}
    
    RETURN                          ${user_created}

Add Multiple phone numbers and create a customer Part_2
    [Arguments]                     ${phone_number}
    Click Generic Button            button_name=Add Phone
    Send Keys To Element            selector=${phone_number_input_2}   keys_to_send=${phone_number}
    Click Generic Button            button_name=Create Customer
    Click Generic Button            Yes, proceed
    Sleep    5s
    Click Element                   selector=${no_btn_payment_method}
    ${user_created}=                Get Element Text    selector=${message_popup}
    Click Element          selector=${custonmer_information_btn}
    Sleep    3s
    ${check_phonenumber}=    Get Element Text    selector=${extract_secondr_phone_number}
    Custom Log    ${check_phonenumber}
    RETURN                          ${user_created}

Delete Add Phone Number
    [Arguments]                     ${phone_number}
    Click Generic Button            button_name=Add Phone
    Send Keys To Element            selector=${phone_number_input_2}   keys_to_send=${phone_number}
    Click Generic Button            button_name=Add Phone
    Click Element                   selector=${phone_delete_icon}
    Click Element                   selector=${deletephone_confirmation_scr}
    Custom Log                     Added Phone Successfully deleted

Click No Email Checkbox
    Click Element               selector=${no_email_btn}
    ${element_state}=    Get Element States    selector=${email_checkbox_status}
    Log To Console    'Checkbox "disabled" Element state: ${element_state}'
    Should Be True    ${element_state}


Create Customer Without Emmail ID
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Click New Customer
    IF    '${company_name}' != ''
        Click Element    selector=${commercial_checkbox}
        Fill Generic Input Field    name_of_field=companyName    value_of_field=${company_name}
    END
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Click No Email Checkbox
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button    button_name=Create Customer
    Sleep    3s
    Click Generic Button            Yes, proceed
    Sleep    5s
    Click Element                   selector=${no_btn_payment_method}
    ${user_created}=                Get Element Text    selector=${message_popup}
    RETURN                          ${user_created}

Create Call
    [Arguments]    ${customer_type}=new customer    ${call_direction}=Outbound Call    ${call_notes}=None    ${call_reason}=Job Request    ${phone_number}=None
    [Documentation]    This method is used to create Outbound call for Job Request   
    IF    '${customer_type}' != 'new customer'
        Click Generic Button    button_name=New Phone Call
        Find Customer By PhoneNumber    ${phone_number}
    END
    Select Value From Dropdown    selector=${call_direction_dropdown}    value_to_select=${call_direction}
    Send Keys To Element    selector=${call_notes_textarea}    keys_to_send=${call_notes}
    Click Generic Button    ${call_reason}

Post Pending
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}   
    [Documentation]    This method is used for make job request as post pending
    Sleep    5s
    Click Element    selector=${job_request}
    Select value From Dropdown    ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown    ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown    ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown    ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click generic Button    button_name=Post Pending
    Click Generic Button    button_name=Save
    ${post_pending_success_message_title}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN    ${post_pending_success_message_title}

Add Agreement
    [Arguments]    ${start_date}    ${month}    ${payment_method}
    [Documentation]    This method is used for creating a agreement
    Click Generic Button    Add Agreement
    Sleep    5s    reason= Required load the agreement page
    Switch Page    NEW    
    Sleep    30s
    Click Element    selector=${select_agreement_type}
    Wait For Element To Be Visible    selector=${agreement_type_dropdown}    timeout=30s
    Click Element    selector=${agreement_type_dropdown}    wait_for_enabled=${False}
    Click Element    selector=${click_date_picker}
    Click Element    selector=${select_date}
    Click Element    selector=${visit_month_dropdown}
    CLick Element    selector=${select_visit_month}
    Click Element    selector=${billingInformationTab}
    Click Element    selector=${addtax_checkbox}
    Click Element    selector=${addtax_dropdown}
    Click Element    selector=${taxValue}
    Sleep    3s
    ${tax_code}=    Get Element Text    selector=${extractiontaxValue}
    Custom Log    ${tax_code}
    Should Be Equal As Strings    ${tax_code}    ${tax_code_shoul_be}
    Click Element    selector=${create_agreement_button}
    Sleep    3s    reason= Required to load values in payment mode dropdown
    Custom Log    Element ${agreemnet_payment_mode_save_button} is disable
    Click Element    selector=${select_agreement_new_payment_method_checkbox}
    Click Element    selector=${agreement_update_primery_billing_account_checkbox}
    Click Element    selector=${open_agreement_payment_dropdown}
    Click Element    selector=${agreement_payment_mode}
    CLick Element    selector=${agreemnet_payment_mode_save_button}
    ${agreementC_created_success}=    Get Element Text    selector=${agreement_creation_success_message}
    Sleep    2s
    ${future_payment_detail}=    Get Element Text    selector=${agreement_payment_detail}
    Should Contain Any            ${future_payment_detail}    Future Payment Details    Agreement created successfully                      
    RETURN    ${agreementC_created_success}
    
Add Agreement-Make Payment
    [Documentation]    This method is used to create argument with periodc payment method
    Custom Log    we are clicking
    Click Element    selector=${agreement_NOW_button}
    Click Element    selector=${payment_periodic_button}
    Click Element    selector=${periodic_payment_save_button}
    ${make_payment_success}=    Get Element Text    selector=${agreement_creation_success_message}
    Custom Log    ${make_payment_success}
    RETURN    ${make_payment_success}
    

Job Request-Abort Functionality
    [Arguments]             ${abort_note}=None
    [Documentation]          This method is abort the job
    Click Element            selector=${job_request}
    Click Generic Button     button_name=Abort
    Sleep    3s
    Click Element            selector=${abort_code_dropdown}
    Click Element            selector=${select_abort_code_from_dropdown}
    Click Generic Button     button_name=Save
    Sleep    2s
    Click Element            selector=${abort_yes_button}
    ${success_message_title}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN                   ${success_message_title}

Cancel job -callhandling screen
    [Arguments]      ${phone_number}  
    [Documentation]    This method is created for cancel job from callhandling sreen
    Sleep    5s                reason=Required to load the cancel job button
    Custom Log    Element Clicked
    Click Element                selector=${job_request}
    Click Element              selector=${cancel_job_button}
    Sleep    3s
    Click Generic Button       button_name=Yes, cancel job
    ${job_cancelled_succ_msg}=    Get Element Text    selector=${message_popup}
    RETURN                     ${job_cancelled_succ_msg}

Ticket-Abort Functionality
    [Arguments]             ${abort_note}=None
    [Documentation]         This method is abort the job
    Click Element           selector=${ticket}
    Click Generic Button    Abort
    Click Element           selector=${abort_code_dropdown}
    Click Element           selector=${select_abort_code_from_dropdown}
    Click Generic Button    Save
    Click Element           selector=${abort_sales_yes_button}
    ${ticket_abort_succ_msg}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN                  ${ticket_abort_succ_msg}

Sales-Abort Functionality
    [Arguments]           ${abort_note}=None
    [Documentation]         This method is abort the job
    Click Generic Button    Sales
    Click Element           selector=${sales}
    Click Generic Button    Abort
    Click Element           selector=${abort_code_dropdown}
    Click Element           selector=${select_abort_code_from_dropdown}
    Click Generic Button    Save
    Click Element           selector=${abort_sales_yes_button}
    ${sales_abort_succ_msg}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN                  ${sales_abort_succ_msg}

Link Primery Billing account
    [Arguments]            ${last_name}    
    [Documentation]         This method is used to link primery billing account
    Click Element           selector=${billing_account_button} 
    Click Element           selector=${link_billing_account_button}
    Send Keys To Element    ${lastname_name_to_link_account}    keys_to_send=${last_name}
    Click Generic Button    button_name=Search
    Sleep    3s             reason= Required to load the serach results
    Click Generic Button    button_name=Select
    Sleep    3s
    Click Element           selector=${billing_confirmation_yes_button_3}
    ${success_message_title}=    Get Element Text    selector=${message_popup}
    RETURN                  ${success_message_title}

Unlink Primery Billing account
    [Arguments]    
    [Documentation]    This method is used for unlink the billing account
    Sleep    5s        reason= Required to load the page
    Click Element      selector=${unlink_primery_button}
    Sleep    3s
    Click Element      selector=${unlink_confirmation_yes_button}
    ${unlink_success_msg}=    Get Element Text    selector=${message_popup}
    RETURN             ${unlink_success_msg}

Link Primary Billing Account with Account ID
    [Arguments]        ${account_number}
    [Documentation]    This method is Linked the Billing Account with using Account ID
    Wait For Element To Be Visible    ${billing_account_button}    timeout=10s
    Click Element               selector=${billing_account_button}
    Sleep    10s
    Click Element               selector=${link_billing_account_button}
    Fill Generic Input Field    name_of_field=billingCustomerId    value_of_field=${account_number}
    Click Generic Button        Search
    Sleep    3s                 reason= Required to load the serach results
    Click Generic Button        Select
    #Click Generic Button    Yes
    Click Element               ${billing_confirmation_yes_button_3}    wait_for_enabled=${False}
    ${message_popup_text}=      Get Element Text    selector=${message_popup}
    RETURN    ${message_popup_text}

Create New Counter Sale Invoice
    [Documentation]      This method is used for Create New Counter Sale Invoice in Invoices tab Call Handling.
    Sleep    10s
    Click Element        selector=${invoices_tab}
    Click Generic Button    Create New Counter Sale Invoice
    Click Element        selector=${service_locations_invoices_tab}
    Sleep    2s          reason=Require for loading right drawer.
    Click Element        selector=${save_btn_invoices_tab}
    ${previous_page}=    Switch Page    NEW
    ${grabbed_invoice_number}=    Get Element Attribute    selector=${invoice_number}    attribute_name=value
    # Click Element        selector=${department_dropdwon_invoice_manager}
    # Click Element        selector=${department_dropdwon_value_invoice_manager}
    #Wait For Element To Be Enabled    selector=${save_btn_invoice_manager}    timeout=10s
    Sleep    10s
    Click Element        selector=${save_btn_invoice_manager}
    Sleep    8s
    Sleep    5s
    ${post_btn_states}=    Get Element States    selector=${post_btn_invoice_manager}
    Custom Log    Post Button States are ${post_btn_states}
    Wait For Element To Be Visible    ${post_btn_invoice_manager}    timeout=10s
    Click Element        selector=${post_btn_invoice_manager}
    Wait For Element To Be Enabled    selector=${ok_btn_invoice_manager}
    Click Element        selector=${ok_btn_invoice_manager}
    Wait For Element To Be Enabled    selector=${confirmation_message_description_invoice_manager}
    ${confirmation_message}=    Get Element Text    selector=${confirmation_message_description_invoice_manager}
    Wait For Element To Be Visible    ${right_drawer_close_btn_invoice_manager}    timeout=10s
    Click Element        selector=${right_drawer_close_btn_invoice_manager}
    Close Page
    Sleep    2s
    Click Element        selector=${right_drawer_close_btn_customer_name}
    RETURN               ${grabbed_invoice_number}    ${confirmation_message}

Find Customer By Name
    [Arguments]        ${first_name}    ${user_test_data}
    [Documentation]    This method is used for searching a customer by first_name
    
    Press Keys    body    Home
    Sleep    8s
    Click Generic Button    button_name=New Phone Call
    Click Element      selector=${find_customer_searchtab} 
    Send Keys To Element    selector=${find_customer_searchtab}    keys_to_send=${first_name}
    Click Element      ${find_customer_searchtab}
    Press Keyboard Keys    ${find_customer_searchtab}    Enter
    Sleep    5s
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Click Element      selector=${back_to_search_button}
    Click Element      selector=${find_customer_searchtab}
    Send Keys To Element    selector=${find_customer_searchtab}    keys_to_send=${user_test_data}    force=${False}
    Sleep    5s        reason= Required to display the search result
    Press Keyboard Keys    ${find_customer_searchtab}    Enter
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Sleep    3s        reason= Required to wait until serach result get load

Purchasing Order-Quick View
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    Select value From Dropdown    ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown    ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown    ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown    ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button    button_name=Schedule
    Click Element    selector=${back_date_icon}
    Click Element    selector=${backdate_selection}
    ${backdate_schedule_confirmation_text}=    Get Element Text    selector=${backdate_confirmationtext}
    Should Be Equal As Strings    ${backdate_schedule_confirmation_text}    ${backate_actula_text}
    Click Element    selector=${clickno_on_backdate_selectionvalidation_message}
    Click Element    selector=${selectdate_2}
    Click Element    selector=${clickno_on_backdate_selectionvalidation_message}
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    CLick Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Go to Dispatch

Purchasing Order-Quick View-Part_2
    [Arguments]                ${firstname}    ${lastname}
    [Documentation]            This method is used to click on name on dispatch page -logic- created - variable - concatenated and click on that 
    ${firstpluslastname}=      Catenate    ${firstname}    ${lastname}    
    Log To Console             ${firstpluslastname}
    Wait For Page To Load    timeout=15s
    Wait For Element To Be Visible    selector=${select_user_dispatch}    timeout=30s

    Click Element              selector=${select_user_dispatch}
    Sleep    5s                reason= Required to load the linkservice buttons
    Wait For Element To Be Visible    selector=${dispatch_purchase_order}    timeout=30s
    Click Element              selector=${dispatch_purchase_order}
    Click Element              selector=${dispatch_add_purchase_orde}
    Sleep    5s                reason= Required to load the screen

Equipment/Warranties-Quick View
    [Arguments]                    ${firstname}    ${lastname}
    [Documentation]                This method is used to click on  Equipment/Warranties in Quick View links
    ${firstpluslastname}=          Catenate    ${firstname}    ${lastname}    
    Log To Console                 ${firstpluslastname}
    ${new_cust_name_dispatch}=     Replace String    string=${generic_cust_name_dispatch}    search_for=<<string_to_replace>>    replace_with=${firstpluslastname}
    Set Viewport Size              1920    1080
    Wait For Page To Load    timeout=15s
    Wait For Element To Be Visible    selector=${select_user_dispatch}    timeout=30s
    Click Element              selector=${select_user_dispatch}
    Click Element                  selector=${dispatch_Equipment_Warranties}
    Sleep    3s                    reason=Required to load the screen
        
Add Assignment -Quick View
    [Arguments]                   ${firstname}    ${lastname}
    [Documentation]               This method is used to click on  Equipment/Warranties in Quick View links
    ${firstpluslastname}=         Catenate    ${firstname}    ${lastname}    
    Log To Console                ${firstpluslastname}
    Wait For Element To Be Visible      ${firstpluslastname}
    ${new_cust_name_dispatch}=    Replace String    string=${generic_cust_name_dispatch}    search_for=<<string_to_replace>>    replace_with=${firstpluslastname}
    Set Viewport Size             1920    1080
    Click Element                 selector=${new_cust_name_dispatch}
    Click Element                 selector=${add_assignment_btn_dispatch_scr}
    ${Assignment_Successfully_Added}=    Get Element Text    selector=${abort_message}
    RETURN                        ${Assignment_Successfully_Added}

Create Sales Without Job
    [Arguments]                    ${job_class}    ${job_type}    ${lead_source_type}    ${lead_source_type_2}    ${equipment}
    [Documentation]                This method is used to create a sales 
    Click Element    selector=${sales}
    Click Element                  selector=${opportunity_type_dropdown}
    Click Element                  selector=${sales_opportunity_type_selection}
    Click Element    selector=${sales_job_class_dropdown}
    Click Element    selector=${salesopportunity_code}
    Click Element    selector=${sales_dePartment_dropdown}     
    Click Element       selector=${sales_dePartment_value}
    Select Value from Dropdown     selector=${sales_lead_source_type}    value_to_select=${lead_source_type}
    Select Value from Dropdown     selector=${sales_lead_source_type_2}    value_to_select=${lead_source_type_2}
    Click Element                  selector=${sales_assign_emplyee_dropdown}
    Send Keys To Element          selector=${sales_assign_emplyee_dropdown}      keys_to_send=BRANDI
    Click Element                  selector=${sales_employee_selection}
    Click Element                  selector=${sales_persondropdown_callhandling}
    Send Keys To Element          selector=${sales_persondropdown_callhandling}      keys_to_send=RICK
    Click Element                  selector=${salesperson_nameCallhandling}
    Click Generic Button           Create Opportunity
    ${confirmation_screen}=        Get Element Text    selector=${sales_confirmation_screen}
    #Click Element                  selector=${sales_create_job_dropdown_yes/no_selection}
    #Click Element                  selector=${sales_selection_no_from_create_job_dropdown}
    Click Generic Button           button_name=Save Opportunity
    ${sales_creation_success_message}=    Get Element Text    selector=${message_popup}
    RETURN                         ${confirmation_screen}    ${sales_creation_success_message}

Create Sales
    [Arguments]                    ${job_class}    ${job_type}    ${lead_source_type}    ${lead_source_type_2}    ${equipment}
    [Documentation]                This method is used to create a sales 
    Click Generic Button           Sales
    Click Element                  selector=${opportunity_type_dropdown}
    Click Element                  selector=${sales_opportunity_type_selection}
    Select Value From Dropdown     selector=${sales_job_class_dropdown}    value_to_select=${job_class}
    Select Value from Dropdown     selector=${sales_job_type}    value_to_select=${job_type}
    Select Value from Dropdown     selector=${sales_lead_source_type}    value_to_select=${lead_source_type}
    Select Value from Dropdown     selector=${sales_lead_source_type_2}    value_to_select=${lead_source_type_2}
    Click Element                  selector=${sales_assign_emplyee_dropdown}
    Click Element                  selector=${sales_employee_selection}
    Click Element                  selector=${sales_persondropdown_callhandling}
    Click Element                  selector=${salesperson_nameCallhandling}
    Click Generic Button           button_name=Create Opportunity
    ${confirmation_screen}=        Get Element Text    selector=${sales_confirmation_screen}
    Click Element                  selector=${sales_create_job_dropdown_yes/no_selection}
    Click Element                  selector=${sales_selection_yes_from_create_job_dropdown}
    Click Generic Button           button_name=Save Opportunity
    ${sales_creation_success_message}=    Get Element Text    selector=${message_popup}
    RETURN                         ${confirmation_screen}    ${sales_creation_success_message}

Create Sales-Self_Assign 
    [Arguments]                    ${job_class}    ${job_type}    ${lead_source_type}    ${lead_source_type_2}
    [Documentation]                This method is used to create a sales
    Sleep    5s
    Click Generic Button           button_name=Sales
    Click Element                  selector=${opportunity_type_dropdown}
    Click Element                  selector=${sales_opportunity_type_selection}
    Click Element    selector=${sales_dePartment_dropdown}     
    Click Element       selector=${sales_dePartment_value}
    Click Element    selector=${sales_job_class_dropdown}
    Click Element    selector=${sales_visitType_1}
    Select Value from Dropdown     selector=${sales_lead_source_type}    value_to_select=${lead_source_type}
    Select Value from Dropdown     selector=${sales_lead_source_type_2}    value_to_select=${lead_source_type_2}
    Click Generic Button           button_name=Create Opportunity
    Click Element                  selector=${sales_create_job_dropdown_yes/no_selection}
    Click Element                  selector=${sales_selection_yes_from_create_job_dropdown}
    Click Generic Button           button_name=Save Opportunity
    ${confirmation_screen}=        Get Element Text    selector=${sales_confirmation_screen}
    ${sales_creation_success_message}=    Get Element Text    selector=${message_popup}
    RETURN    ${confirmation_screen}    ${sales_creation_success_message}
   
    
Create Sales-Job Request Together
    [Arguments]     ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${phone_number}    ${technician_2}
    [Documentation]                This method is used to crete Sales and job request together
    Sleep    5s
    Select value From Dropdown             ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown             ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown             ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown             ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button           Schedule
    ${yes_button} =                Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console                 Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement           ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console          Yes button is not visible
    END
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician_2}
    Click Element                 selector=${schedule_button}
    CLick Element                 selector=${schedule_confirmation_button}
    Click Generic Button          Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_description_xpath}
    RETURN                        ${job_request_success_message}
    
Add Agreement-Negative_tc
    [Arguments]        ${start_date}    ${month}
    [Documentation]    This method is used for creating a agreement with adding more that required visist month
    Click Generic Button    Add Agreement
    Sleep    5s      reason= Required to load the screen in another window
    Switch To Tab    tab_number=0
    Sleep    15s      reason= Required to load the screen and values in dropdown
    Wait For Element To Be Visible     selector=${select_agreement_type}    timeout=10s
    Click Element    selector=${select_agreement_type}
    Click Element    selector=//div[@class='swBlockCond']//label[text()='Type Name']//../following-sibling::div//div[@title='11TC6 - ']    wait_for_enabled=${False}
    Click Element    selector=${click_date_picker}
    Click Element    selector=${select_date}
    Click Element    selector=${visit_month_dropdown}
    CLick Element    selector=${select_visit_month}
    CLick Element    selector=${negative_tc_select_visit_month}
    Click Element    selector=${create_agreement_button}
    ${validation_message}=    Get Element Text    selector=${negative_tc_agreement_validation_message}
    RETURN           ${validation_message}

Edit Primery Billing account
    [Arguments]        ${payment_note}
    [Documentation]    This method is used for unlink the billing account
    Click Element    selector=${billing_account_button}
    Click Element    selector=${edit_bill_acc-edit_button_billing_account}
    Click Element    selector=${edit_bill_acc-billing_account_payment_information_tab}
    Click Element    selector=${edit_bill_acc-billing_account_payment_method}
    Click Element    selector=${edit_billing_acc-payment_method}
    Sleep    2s
    Click Element    selector=${edit_bill_acc-billing_Payment Information_tab}
    Sleep    3s
    Send Keys To Element       selector=${payment_information_note}    keys_to_send=${payment_note}
    Click Element    selector=${edit_billing_acc-save_button}
    ${billing_acccount_validation_message}=    Get Element Text    selector=${message_popup}
    Click Element    selector=${view_more_notes_btn}
    RETURN    ${billing_acccount_validation_message}

Edit Primery Billing account-select Amex
    [Documentation]    This method is used for unlink the billing account-Amex payment method (Negative TC)
    Sleep    3s    reason= Required to load the screen
    Click Element    selector=${billing_account_button}
    Click Element    selector=${edit_bill_acc-edit_button_billing_account}
    Click Element    selector=${edit_bill_acc-billing_account_payment_information_tab}
    Click Element    selector=${edit_bill_acc-billing_account_payment_method}
    Click Element    selector=${edit_billing_acc-payment_method_Amex}
    Click Element    selector=${token_save_btn}
    ${amex_tokenization_validation_message}=    Get Element Text    selector=${message_popup}
    RETURN    ${amex_tokenization_validation_message}   
    
Job Tab on Call Handling Page
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    ${phone_number} 
    [Documentation]                        This method is created to check technician name under job on tab and check customer detail  on call handling page
    Sleep    5s
    Click Element                          selector=${job_request}
    Sleep    5s
    Select value From Dropdown             ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown             ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown             ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown             ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button                   Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console                         Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement                       ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console                       Yes button is not visible
    END
    Select value From Dropdown               selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element                            selector=${schedule_button}
    CLick Element                            selector=${schedule_confirmation_button}
    Click Generic Button                     button_name=Save & Close
    ${job_request_success_message}=          Get Element Text    selector=${message_popup}
    Sleep    5s
    Wait For Element To Be Visible    selector=${tab_3}    timeout=10s
    Click Element		selector=${tab_3}
    Click Element    ${cancel_button}
    Click Generic Button    button_name=Proceed
    Sleep    3s
    Click Element		selector=${tab_Home_2}
    Press Keys    body    Home
    Sleep    3s
    Click Generic Button    button_name=New Phone Call
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Custom Log    Element Clicked
    Sleep    5s
    Click Element                            selector=${job_tab}
    Sleep    10s
    ${new_cust_name_dispatch}=               Replace String    string=${generic_cust_name_dispatch}    search_for=<<string_to_replace>>    replace_with=${technician}
    Log To Console                           ${new_cust_name_dispatch}
    ${extractTechnicianName}=    Get Element Text    ${technician_name_callhaling_jobtab}
    Should Be Equal As Strings    ${extractTechnicianName}    ${actualtechnican_name}

    Click Element                            selector=${new_cust_name_dispatch}
    Sleep    3s                              reason= Reason to load the data in job tab
    Click Element    selector=${click_job_number_on_jobtab}
    Click Element    selector=${job_detail_closer_btn}
    RETURN        ${job_request_success_message}

Reschedule Job-Create Job
    [Arguments]    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}    ${technician}    ${phone_number} 
    [Documentation]                        This method is created to check technician name under job on tab and check customer detail  on call handling page
    Sleep    5s
    Click Element                          selector=${job_request}
    Sleep    5s
    Select value From Dropdown             ${job_class_dropdown}    value_to_select=${job_class}
    Select value From Dropdown             ${job_type_dropdown}    value_to_select=${job_type}
    Select value From Dropdown             ${lead_source_type_dropdown}    value_to_select=${lead_source_type}
    Select value From Dropdown             ${job_lead_source_dropdown}    value_to_select=${job_lead_source}
    Click Generic Button                   Schedule
    ${yes_button} =    Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console                         Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement                       ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console                       Yes button is not visible
    END
    Select value From Dropdown               selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element                            selector=${schedule_button}
    CLick Element                            selector=${schedule_confirmation_button}
    Click Generic Button                     button_name=Save & Close
    ${job_request_success_message}=          Get Element Text    selector=${message_popup}
    Wait For Element To Be Visible    selector=${tab_3}    timeout=10s
    Click Element		selector=${tab_3}
    Click Element    ${cancel_button}
    Click Generic Button    button_name=Proceed
    Sleep    3s
    Click Element		selector=${tab_Home_2}
    RETURN        ${job_request_success_message}
    
Reschedule Job From Call Handling Page
    [Arguments]            ${technician_2}
    [Documentation]        This method is created to reschedule job from call handling page
    Click Element                selector=${reschedule_button}
    Sleep    2s                  reason= Required to load the page
    ${yes_button} =              Run Keyword And Return Status    Does Element Exist    ${past_date_job_creation_yes_btn}
    Log To Console               Yes button is ${yes_button}
    IF    '${yes_button}' == 'True'
        Click ELement            ${past_date_job_creation_yes_btn}
    ELSE
        Log To Console            Yes button is not visible
    END
    Select value From Dropdown    selector=//iframe[@id='Left-frame'] >>> //div[@class='ant-drawer-content-wrapper']//span[@title='Brandi Kramer']    value_to_select=${technician_2}          #${schedule_page_technician_dropdown}
    Click Element                 selector=${schedule_button}
    CLick Element                 selector=${schedule_confirmation_button}
    ${reschedule_success_message_title}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN    ${reschedule_success_message_title}

Navigation Job Record Tab-Home
    [Arguments]            ${phone_number}
    [Documentation]        This method is created to Job tabe valiadate whether job is created or not
    Sleep    5s                reason= Required to load the data 
    Click Element              selector=${home_tab}
    Click Element              selector=${job_records_tab}
    Sleep    8s
    Click Element              selector=${job_records_tab_phonnumber_serach_tab}
    Send Keys To Element       selector=${job_records_tab_phonnumber_serach_space}    keys_to_send=${phone_number}
    Sleep    2s
    Click Element              selector=${job_record_search_check_box}
    Click Element              selector=${ok_button_below_checkbox}
    ${result}=    Run Keyword And Return Status    Does Element Exist   selector=${click_search_result}
    Log To Console    Cancel button is ${result}
    IF    '${result}' == 'False'
        Click Element            selector=${home_tab}
    END
    Click Element              selector=${click_search_result}
    Sleep     5s               reason= Required to load the customer detail

Navigation Job Record Tab-Home - Job Status
    [Documentation]        This method is created to chekc job cancel status
    Sleep    5s                reason= Required to load the data 
    Click Element              selector=${home_tab}
    Click Element              selector=${job_records_tab}
    Wait For Element To Be Visible    selector=${job_records_tab_job_status_tab}    timeout=30s
    Click Element              selector=${job_records_tab_job_status_tab}
    Wait For Element To Be Visible    selector=${click_cancelled_option}    timeout=30s
    Click Element        selector=${click_cancelled_option}
    Click Element              selector=${ok_button_job_status_below_checkbox}
    Wait For Element To Be Visible    ${clickfirst_record}    timeout=30s
    Click Element              selector=${clickfirst_record}
    Wait For Element To Be Visible    selector=${cancell_text}    timeout=30s
    ${expected_txt}=    Get Element Text    selector=${cancell_text}
    RETURN    ${expected_txt}


Navigation Job Record Tab-Home-Job Tab
    [Arguments]            ${job_number} 
    [Documentation]        This method is created to Job tabe valiadate whether job is created or not
    Sleep    5s                reason= Required to load the dataCall Status Job Created Filter
    Click Element              selector=${home_tab}
    Wait For Page To Load
    Click Element              selector=${job_records_tab}
    Click Element              selector=${job_number_search_filter}
    Send Keys To Element       selector=${job_records_tab_phonnumber_serach_space}    keys_to_send=${job_number} 
    Click Element              selector=${job_record_search_check_box}
    Click Element              selector=${ok_button_below_checkbox}
    Click Element              selector=${click_search_result}
    Sleep     5s               reason= Required to load the customer detail
    ${job_created_number}    Get Element Text    selector=${job_txt_1}
    Should Be Equal    ${job_created_number}    ${job_number}
 
Navigation Sales Record Tab-Home
    [Arguments]   ${phone_number}    ${expected_jobtype}
    [Documentation]        This Method is created to navigate to Sales record tab
    Sleep    5s
    Click Element              selector=${home_tab}
    Click Element              selector=${sales_records_tab}
    Click Element              selector=${sales_records_tab_phonnumber_serach_tab}
    Send Keys To Element       selector=${sales_records_tab_phonnumber_serach_space}    keys_to_send=${phone_number}
    Click Element              selector=${job_record_search_check_box}
    Click Element              selector=${sales_ok_btn_checkbox}
    Click Element              selector=${click_search_result}
    Sleep     5s               reason= Required to load the customer detail
    ${created_by}=             Get Element Text     selector=${fetch_email_sales}
    Should Be Equal As Strings            ${created_by}    admin@automation.com
    ${job_type_sales_page}=    Get Element Text     selector=${fetch_common_job_type}
    Should Be Equal As Strings            ${job_type_sales_page}    Agreement
    Custom Log                 Both the job type are same 
    RETURN                     ${created_by}    ${job_type_sales_page}

    
Navigation Ticket Record Tab-Home
    [Arguments]    ${phone_number}    ${ticket_Type}
    [Documentation]          This Method is created to navigate to Sales record tab
    Sleep    5s
    Click Element            selector=${home_tab}
    Click Element            selector=${ticket_records_tab}
    Click Element            selector=${ticket_records_tab_phonnumber_serach_tab}
    Send Keys To Element     selector=${ticket_records_tab_phonnumber_serach_space}    keys_to_send=${phone_number}
    Sleep    2s
    Click Element            selector=${job_record_search_check_box}
    Click Element            selector=${ticket_ok_btn_checkbox}
    Click Element            selector=${click_search_result}
    Sleep     5s             reason= Required to load the customer detail
    ${new_cust_name_dispatch}=    Replace String    string=${generic_cust_name_dispatch}    search_for=<<string_to_replace>>    replace_with=${ticket_Type}
    Custom Log               ${new_cust_name_dispatch}
    ${allocate_value}=       Get Element Text     selector=${ticket_id}
    RETURN                   ${allocate_value}     ${new_cust_name_dispatch}

Call Status Abort-Filter
    [Arguments]           ${expected_txt}
    Click Element         selector=${home_tab}
    Click Element         selector=${contact_history_tab}
    Click Element         selector=${call_status}
    Click Element         selector=${abort_filter}
    Click Element         ${abort_filter_ok_btn}
    Click Element         selector=${clickfirst_record}
    Sleep    5s
    ${checked}=           Get Checkbox State    ${abort_checkbox_status}
    Log To Console        Checkbox is ${checked}
    Custom Log            This Job Is Aborted
    ${text_abort}=        Get Element Text    selector=${abort_text}
    RETURN                ${text_abort}

Call Status Post-Pending Filter
    [Arguments]      ${expected_txt}
    Click Element    selector=${home_tab}
    Click Element    selector=${contact_history_tab}
    Click Element    selector=${call_status}
    Click Element    selector=${postpending_filter}
    Click Element    selector=${abort_filter_ok_btn}
    Click Element    selector=${clickfirst_record}
    ${text_abort}=    Get Element Text    selector=${post_pending_text}
    RETURN           ${text_abort}

Call Status Other Filter    
    [Arguments]    ${other_text}
    Click Element    selector=${home_tab}
    Click Element    selector=${contact_history_tab}
    Click Element    selector=${call_status}
    Click Element    selector=${other_filter}
    Click Element    selector=${abort_filter_ok_btn}
    Click Element    selector=${clickfirst_record}
    ${text_abort}=    Get Element Text    selector=${other_text}
    RETURN           ${text_abort}

Call Status Opportunity Created Filter    
    [Arguments]       ${opportunity_txt}
    [Documentation]  THis method is create to check opportunity filter
    Click Element    selector=${close_btn}
    Click Element    selector=${home_tab}
    Click Element    selector=${contact_history_tab}
    Click Element    selector=${call_status}
    Click Element    selector=${opprtunity_filter}
    Click Element    selector=${abort_filter_ok_btn}
    Click Element    selector=${clickfirst_record}
    ${opportunity}=    Get Element Text    selector=${opprtunity_type_text}
    RETURN    ${opportunity}

Call Status Job Created Filter    
    [Arguments]            ${job_exp_txt}
    [Documentation]        This method is create to check opportunity filter
    Click Element          selector=${close_btn}
    Click Element          selector=${home_tab}
    Click Element          selector=${contact_history_tab}
    Sleep    5s
    Click Element          selector=${call_status}
    Click Element          selector=${Jobcreated_filter}
    Click Element          ${abort_filter_ok_btn}
    Click Element          selector=${clickfirst_record}
    ${job}=                Get Element Text    selector=${ticket_type_text}
    RETURN    ${job}

Call Status Ticket Type Filter    
    [Arguments]          ${ticket_exp_txt}
    [Documentation]      This method is create to check Ticket Type filter functionality
    Click Element        selector=${close_btn}
    Click Element        selector=${home_tab}
    Click Element        selector=${contact_history_tab}
    Click Element        selector=${call_status}
    Click Element        selector=${tickettype_filter}
    Click Element        ${abort_filter_ok_btn}
    Click Element        selector=${clickfirst_record}
    ${ticket}=           Get Element Text    selector=${opprtunity_type_text}
    RETURN               ${ticket}

Received By Filter
    [Arguments]    ${receivedby}
    [Documentation]    Tis method is create to check Received By Filter functionality
    Click Element        selector=${home_tab}
    Click Element        selector=${contact_history_tab}
    Click Element        selector=${receiveby_status}
    Click Element        selector=${received_by_filter}
    Click Element        selector=${received_by_filter_ok_btn}
    Click Element        selector=${clickfirst_record}
    ${received_email}=    Get Element Text    selector=${recreicedby_email_txt}
    RETURN    ${received_email}

Date OF Call FIlter
    [Arguments]    ${job_number}
    [Documentation]    This method is create to check Date OF Call FIlter functionality
    Click Element        selector=${home_tab}
    Click Element        selector=${call_date_tab}
    Wait For Page To Load
    Click Element        selector=${start_date}
    Sleep    2s
    Click Element        selector=${start_date_select}
    Click Element        selector=${end_date_select}
    Click Element        selector=${date_filter_ok_btn}
    Click Element        selector=${home_tab}
    Wait For Page To Load
    Click Element        selector=${clickfirst_record}
    Wait For Page To Load
    ${datefilter_validation_jobnumber}=     Get Element Text    selector=${extract_callfilter_data}
    Should Be Equal As Strings    ${datefilter_validation_jobnumber}    ${email_text}

Priority Filter
    [Documentation]    This method is created to apply Priority filter
    Click Element    selector=${home_tab}
    Click Element    selector=${contact_history_tab}
    Click Element    selector=${priority_tab}
    Click Element    selector=${low}
    Click Element    selector=${low_ok_btn}
    Click Element    selector=${clickfirst_record}
    ${checked}=      Get Checkbox State    ${checkbox_status}
    Custom Log       Checkbox is ${checked}
    Custom Log       This is a low Priority Job
    Click Element    selector=${close_drore}
    Click Element    selector=${priority_tab}
    Click Element    selector=${clear_priority_filter}
    Sleep    5s
    Click Element    selector=${priority_tab}
    Sleep    2s
    Click Element    selector=${high}
    Click Element    selector=${low_ok_btn}
    Click Element    selector=${clickfirst_record}
    ${checked}=      Get Checkbox State    ${checkbox_status}
    Custom Log       Checkbox is ${checked}
    Custom Log       This is a High Priority Job

Edit Customer Information
    [Arguments]            ${title}
    [Documentation]        This method is created to edit customer information
    Click Element          selector=${custonmer_information_btn}
    Click Element          selector=${customer_information_edit_btn}
    Select Value From Dropdown    selector=${title_dropdown}    value_to_select=${title}
    Click Element          selector=${customer_information_save_btn}
    ${custoner_information_updated_success_popup}=    Get Element Text    selector=${message_popup}
    RETURN                 ${custoner_information_updated_success_popup}

Edit Service Location
    [Arguments]            ${address}
    [Documentation]        This method is created to edit Service Location
    Click Element            selector=${service_locations_btn}
    Click Element            selector=${customer_information_edit_btn}
    Send Keys To Element     selector=${address_2}    keys_to_send=${address}
    Click Element            selector=${service_location_save_btn}
    ${edit_location_succ_mess}=    Get Element Text    selector=${message_popup}
    Custom Log               ${edit_location_succ_mess}
    RETURN                   ${edit_location_succ_mess}


Edit Service Location With Tax Code
    [Arguments]            ${address}
    [Documentation]        This method is created to edit Service Location
    Click Element            selector=${service_locations_btn}
    Click Element            selector=${customer_information_edit_btn}
    Send Keys To Element     selector=${address_2}    keys_to_send=${address}
    Click Element    selector=${taxdropdown_editaddress}
    Click Element    selector=${taxvalue_editaddress}
    Click Element            selector=${service_location_save_btn}
    ${edit_location_succ_mess}=    Get Element Text    selector=${message_popup}
    Custom Log               ${edit_location_succ_mess}
    RETURN                   ${edit_location_succ_mess}
    
Add New Service Location
    [Arguments]            ${send_address}    ${property_type_value}
    [Documentation]         This Method is used to add new service location
    Click Element           selector=${service_locations_btn}
    Click Element           selector=${add_location_btn}
    Click Element           selector=${address_dropdown}
    Send Keys To Element    selector=${address_dropdown}    keys_to_send=${send_address}
    Sleep    5s
    #commenting out and keeping in script for future use anc changes-    ${select_address_value}=    Replace String    string=${address_generic_ddl_select_value}    search_for=<<string_to_replace>>    replace_with=${send_address}
    Click Element           selector=//iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='1234 Steelwood Road, Columbus, OH, USA']
    Select Value From Dropdown    selector=${property_type}    value_to_select=${property_type_value}
    Sleep    3s
    Click Element           selector=${service_location_save_btn}
    Click Element    selector=${addserviceloaction_confirmationTes_button}
    ${add_service_loc_succ_mess}=    Get Element Text    selector=${message_popup}
    Sleep    3s
    ${add_validation}=    Get Element Text    selector=${addresss_validation_class}
    Custom Log    ${add_validation}
    Should Not Be Equal As Strings     ${add_validation}        1234 Steelwood Road, Columbus, OH 43212
    RETURN                  ${add_service_loc_succ_mess}        ${add_validation}

Add New Service Location With Tax Code
    [Arguments]            ${send_address}    ${property_type_value}
    [Documentation]         This Method is used to add new service location
    Click Element           selector=${service_locations_btn}
    Click Element           selector=${add_location_btn}
    Click Element           selector=${address_dropdown}
    Send Keys To Element    selector=${address_dropdown}    keys_to_send=${send_address}
    ${select_address_value}=    Replace String    string=${address_generic_ddl_select_value}    search_for=<<string_to_replace>>    replace_with=${send_address}
    Click Element           selector=${select_address_value}
    Select Value From Dropdown    selector=${property_type}    value_to_select=${property_type_value}
    Click Element    selector=${taxdropdown_editaddress}
    Click Element    selector=${taxvalue_editaddress}
    Sleep    3s
    Click Element           selector=${service_location_save_btn}
    ${add_service_loc_succ_mess}=    Get Element Text    selector=${message_popup}
    ${add_validation}=    Get Element Text    selector=${addresss_validation_class}
    Custom Log    ${add_validation}
    Should Not Be Equal As Strings     ${add_validation}        1234 Steelwood Road, Columbus, OH 43212
    RETURN                  ${add_service_loc_succ_mess}        ${add_validation}

Add New Service Location2
    [Arguments]            ${send_address}    ${property_type_value}
    [Documentation]         This Method is used to add new service location
    Click Element           selector=${service_locations_btn}
    Click Element           selector=${add_location_btn}
    Click Element           selector=${address_dropdown}
    Send Keys To Element    selector=${address_dropdown}    keys_to_send=${send_address}
    Sleep    5s
    Click Element           selector=//iframe[@id='Left-frame'] >>> //div[@class='ant-select-item-option-content'][normalize-space()='1234 Steelwood Road, Columbus, OH, USA']
    Select Value From Dropdown    selector=${property_type}    value_to_select=${property_type_value}
    Sleep    3s
    Click Element           selector=${service_location_save_btn}
    Click Element    selector=${addserviceloaction_confirmationTes_button}
    ${add_service_loc_succ_mess}=    Get Element Text    selector=${message_popup}
    ${add_validation}=    Get Element Text    selector=${addresss_validation_class}
    Custom Log      ${add_validation}
    RETURN                  ${add_service_loc_succ_mess}        ${add_validation}

Remove Address
    [Documentation]    This method is created to remove user service location
    Click Element        selector=${remove_address_btn}
    Sleep        5s
    Click Generic Button      button_name=Proceed
    ${location_removed_msg}=    Get Element Text    selector=${message_popup}
    RETURN    ${location_removed_msg}
    
Update Note
    [Arguments]                 ${updatenote}
    Click Element               selector=${update_node_btn}
    Send Keys To Element        selector=${updatenote_text_area}     keys_to_send=${updatenote}
    Click Element    selector=${note_save_button_1}
    ${noteupdate}=              Get Element Text    selector=${message_popup}
    RETURN                      ${noteupdate}

Create Other Job
    [Arguments]                    ${other_call_reason}    ${note_update_succc_msg}
    Click Element                  selector=${other_call_btn}
    Sleep    2s
    Select Value From Dropdown     selector=${other_call_type}    value_to_select=${other_call_reason}
    Send Keys To Element           selector=${other_desc}    keys_to_send=${note_update_succc_msg}
    Click Generic Button           button_name=Save
    ${other_job_success_message_title}=    Get Element Text    selector=${ticket_success_mesage_title}
    ${other_job_success_message}=          Get Element Text    selector=${message_description_xpath}
    RETURN                         ${other_job_success_message_title}    ${other_job_success_message}

Find Customer By Company Name
    [Arguments]        ${company_name}
    [Documentation]    This method is used for searching a customer by first_name
    Click Element      selector=${back_to_search_button}
    Click Element      selector=${find_customer_searchtab} 
    Send Keys To Element    selector=${find_customer_searchtab}    keys_to_send=${company_name}
    Click Element      ${find_customer_searchtab}
    Press Keyboard Keys    ${find_customer_searchtab}    Enter
    Sleep    3s
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Sleep    3s        reason= Required to wait until serach result get load


Create Customer With 240 Character in Email Address
    [Arguments]    ${first_name}    ${last_name}    ${phone_number}    ${email_id}    ${lead_source_type}    ${lead_source}    
    ...    ${address1}    ${city}    ${state}    ${zip_code}    ${add_customer_existing_address}=${True}    ${add_payment}=${False}    ${company_name}=''
    [Documentation]        This Method is used for Creating Customer and Validate Customer is Created with Popup Message
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Click New Customer
    Fill Generic Input Field    name_of_field=firstName    value_of_field=${first_name}
    Fill Generic Input Field    name_of_field=lastName    value_of_field=${last_name}
    Send Keys To Element   selector=${phone_number_input}   keys_to_send=${phone_number}
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Click Element    ${lead_soruce_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element    selector=${lead_source_id_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source}
    Click Generic Button    button_name=Enter address manually
    Fill Generic Input Field    name_of_field=location.address1    value_of_field=${address1}
    Fill Generic Input Field    name_of_field=location.city    value_of_field=${city}
    Fill Generic Input Field    name_of_field=location.state    value_of_field=${state}
    Fill Generic Input Field    name_of_field=location.zipCode    value_of_field=${zip_code}
    Click Generic Button           button_name=Create Customer
    Sleep    3s
    Click Generic Button           button_name=Yes, proceed
    Sleep    3s
    Click Element                  selector=${no_btn_payment_method}
    ${message_popup_text}=         Get Element Text    selector=${message_popup}
    RETURN    ${message_popup_text}
    
Edit Customer Information-Email Address Field
    [Arguments]            ${email_id}
    [Documentation]        This method is created to edit customer information
    Click Element          selector=${custonmer_information_btn}
    Click Element          selector=${customer_information_edit_btn}
    Press Keyboard Keys    //iframe[@id='Left-frame'] >>> //input[@id='email']    Control+A
    Press Keyboard Keys    //iframe[@id='Left-frame'] >>> //input[@id='email']    Backspace
    Fill Generic Input Field    name_of_field=email    value_of_field=${email_id}
    Sleep    6s
    Click Element          selector=${customer_information_save_btn}
    ${custoner_information_updated_success_popup}=    Get Element Text    selector=${message_popup}
    RETURN                 ${custoner_information_updated_success_popup}

Search Existing Customer
    [Arguments]    ${old_customer}
    [Documentation]    This methpd is created to search Existing Customer
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button           button_name=New Phone Call
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${old_customer}
    Click Element              ${find_customer_searchtab}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Sleep    3s

Open Communication Panel
    Sleep    5s
    Click Element    selector=${communication_panel}
    ${exp_txt}=    Get Element Text    selector=${communication_panel_heading}
    RETURN        ${exp_txt}

Add Equipment
    [Arguments]    ${service_location}    ${equipment_type}
    Click Element    selector=${equipment_tab}
    Click Generic Button    button_name=Add Equipment
    Click Element    selector=${select_service_location_equipment_ddl}
    ${generic_drop_down_value}=    Replace String    string=${select_generic_dropdown_value_3}    search_for=<<string_to_replace>>    replace_with=${service_location}
    Click Element    ${generic_drop_down_value}
    Click Element    selector=${equipment_type_equipment_ddl}
    ${equipment_type_value}=    Replace String    string=${select_generic_dropdown_value_2}    search_for=<<string_to_replace>>    replace_with=${equipment_type}
    Click Element    ${equipment_type_value}
    Click Generic Button    button_name=Add Equipment
    ${success_message}=    Get Element Text    selector=${message_description_xpath}
    RETURN    ${success_message}

Contact History - View More Button
    [Documentation]
    Click Element    selector=${view_record_btn}
    Click Element                selector=${job_request}
    Sleep    12s
    Click Element                selector=${job_request}
    Click Generic Button        Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    RETURN    ${job_request_success_message}

Contact History - View More Button_2
    [Documentation]
    Click Element    selector=${view_record_btn}
    Sleep    2s
    Click Element    selector=//iframe[@id='Left-frame'] >>> (//div[contains(@class,'callHandling_tabBarWrapper')]//div[contains(@class,'ant-tabs-nav-wrap')]//div[contains(@class,'ant-tabs-tab')]//..//div[@role='tab'])[2]
    Sleep    3s
    Click Element                selector=${job_request}
    Sleep    3s
    Click Element    selector=//iframe[@id='Left-frame'] >>> //span[normalize-space()='Post Pending']
    Click Generic Button    button_name=Save
    ${post_pending_success_message_title}=    Get Element Text    selector=${ticket_success_mesage_title}
    RETURN    ${post_pending_success_message_title}

Tax Code
    [Documentation]    This Method Is Created To Check Tax Code Dropdown
    Click Element           selector=${service_locations_btn}
    Click Element            selector=${customer_information_edit_btn}
    Click Element    selector=${tax_code_dropdown}
    Click Element     selector=${select_tax_code}
    Click Element    selector=${save_address_btn}

Customer Manager
    [Documentation]    This Method Is Created To Check Tax Code Dropdown On Customer Manager Screen
    [Arguments]    ${tax_code}
    Navigate To LHN Option    navigation=Customer Service>>Customer Manager
    Wait For Page To Load    timeout=15s
    Click Element    selector=${selct_customer}
    Sleep    5s
    Click Element           selector=${service_locations_btn}
    Click Element           selector=${customer_information_edit_btn}
    Click Element    selector=${tax_code_dropdown}
    Custom Log    pass
    Click Element     selector=${select_tax_code}
    Click Element    selector=${save_address_btn}
    

Add Agreement_1
    [Arguments]    ${start_date}    ${month}    ${payment_method}
    [Documentation]    This method is used for creating a agreement
    Click Generic Button    Add Agreement
    Sleep    5s    reason= Required load the agreement page
    Switch Page    NEW    
    Sleep    25s
    Click Element    selector=${select_agreement_type}
    Click Element    selector=${agreement_type_dropdown}    wait_for_enabled=${False}
    Click Element    selector=${click_date_picker}
    Click Element    selector=${select_date}
    Click Element    selector=${visit_month_dropdown}
    CLick Element    selector=${select_visit_month}
    Click Element    selector=${billingInformationTab}
    Click Element    selector=${addtax_checkbox}
    ${tax_code}=    Get Element Text    selector=${actual_tax_code}
    Custom Log    ${tax_code}
    Should Be Equal As Strings    ${tax_code}    ${tax_code_shoul_be}
    Click Element    selector=${create_agreement_button}
    Sleep    3s    reason= Required to load values in payment mode dropdown
    Custom Log    Element ${agreemnet_payment_mode_save_button} is disable
    Click Element    selector=${select_agreement_new_payment_method_checkbox}
    Click Element    selector=${agreement_update_primery_billing_account_checkbox}
    Click Element    selector=${open_agreement_payment_dropdown}
    Click Element    selector=${agreement_payment_mode}
    CLick Element    selector=${agreemnet_payment_mode_save_button}
    ${agreementC_created_success}=    Get Element Text    selector=${agreement_creation_success_message}
    # ${future_payment_detail}=    Get Element Text    selector=${agreement_payment_detail}
    Sleep    5s
    Click Element    selector=${later_btn}
    Click Element    selector=${cancel_button1}         
    RETURN    ${agreementC_created_success}        #${future_payment_detail}

Validate Tax Code On Invoive Manager
    [Documentation]    This Method Is Created To Validate Tax Code on Invoice Manager Screen
    [Arguments]    ${job_number}
    Sleep    15s
    Click Element    selector=${menu_btn_withoutbutton}
    Click Element    selector=${customer_service_btn_withoutbutton}
    Click Element    selector=${invoice_manager_btn_withoutbutton}
    Sleep    20s
    Click Element    selector=${filter_btn}
    Click Element    selector=${job_filter}
    Click Element    selector=${click_job}
    Send Keys To Element    ${invoice_manager_jobfilter}     keys_to_send=${job_number}
    Click Element    selector=${click_submit}
    Wait For Element To Be Visible    selector=${open_invoice}    timeout=20s
    Click Element    selector=${open_invoice}
    ${tax_code}=    Get Element Text    selector=${actual_tax_code}
    Custom Log    ${tax_code}
    Should Be Equal As Strings    ${tax_code}    ${tax_code_shoul_be}

TaxCode Zone and tax Exmept
    [Documentation]    This Method Is Created To Validate TaxCode Zone and tax Exmept
    [Arguments]    ${zone}
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    2s
    Click New Customer
    ${extract_zone_txt}=    Get Element Text    ${zone_tab_btn_1}
    Should Be Equal As Strings        ${extract_zone_txt}    Select Zone
    Select Value From Dropdown    ${select_zone2}    value_to_select=${zone}
    ${extract_exempt_taxcode_checkbox}=    Get Element Text    ${tax_exempt_checkbox}
    Should Be Equal As Strings        ${extract_exempt_taxcode_checkbox}    Tax Exempt
    ${extract_select_taxcode}=    Get Element Text    ${select_taxcode_from_dropdown}
    Should Be Equal As Strings        ${extract_select_taxcode}    Select Tax Code
    Sleep    3s
    Click Element    selector=${location_taxcode_3}
    Sleep    2s
    Click Element    selector=${select_location_taxcode_3}

Create Job From Customer manager Page
    [Documentation]    Thie Method Is Created To Create Job From Customer Manager Screen
    Click Element    selector=${job_button_customermanager}
    Sleep    5s
    ${extract_job_number}=    Get Element Text    ${jobnumber_extraction_1}
    Custom Log    ${extract_job_number}
    RETURN    ${extract_job_number}
    
Validate Tax Code On Invoive Manager2
    [Documentation]    This Method is Created To Validate The Tax Code on Invoice Manager
    Click Element    selector=${job_button_customermanager}
    Sleep    5s
    ${extract_job_number}=    Get Element Text    ${jobnumber_extraction_1}
    Custom Log    ${extract_job_number}
    Wait For Element To be Visible    ${menu_btn_withiframe}    timeout=30s
    Click Element    selector=${menu_btn_withiframe}
    Click Element    selector=${customer_service_btn_withiframe}
    Click Element    selector=${invoice_manager_btn_withiframe}
    Wait For Page To Load     timeout=15
    Sleep    15s
    Click Element       selector=${filter_without_frame}
    Click Element    selector=${filter_invoice_type_inputarea}
    Click Element    selector=${filter_invoice_job-selectionValue}
    Send Keys To Element    ${filter_job_text_area}     keys_to_send=${extract_job_number}
    Click Element    selector=${filter_submit_button}
    Wait For Element To Be Visible    ${jobmanager_openJOb}    timeout=20s
    Click Element    selector=${jobmanager_openJob}
    Wait For Element To Be Visible    ${jobmanager_openJOb}    timeout=20s
    ${tax_code}=    Get Element Text    selector=${taxcode_extraction}
    Custom Log    ${tax_code}
    Should Be Equal As Strings    ${tax_code}    ${tax_code_shoul_be}
    RETURN    ${extract_job_number}

Find Customer By Name To Check Agreement Functionality
    [Documentation]     This Method Is Created To Check Agreement Functionality
    [Arguments]    ${testname}
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    2s
    Click Element      selector=${find_customer_searchtab} 
    Send Keys To Element    selector=${find_customer_searchtab}    keys_to_send=${testname}
    Click Element      ${find_customer_searchtab}
    Press Keyboard Keys    ${find_customer_searchtab}    Enter
    Sleep    3s
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Sleep    10s
    Click Element    selector=${ellipses}

Validate Agreement Options Under Ellipses
    [Documentation]
    ${extract_txt_1}=    Get Element Text    selector=${agreement_edit_option_underellipses}
    ${extract_txt_2}=    Get Element Text    selector=${agreement_Viewagreement_option_underellipses}
    ${extract_txt_3}=    Get Element Text    selector=${agreement_agreementProfitability_option_underellipses}
    ${extract_txt_4}=    Get Element Text    selector=${agreement_adjustReserve_option_underellipses}
    ${extract_txt_5}=    Get Element Text    selector=${agreement_previewSinglenotice_option_underellipses}
    ${extract_txt_6}=    Get Element Text    selector=${agreement_PrintsingleNotice_option_underellipses}
    ${extract_txt_7}=    Get Element Text    selector=${agreement_renewAgreement_option_underellipses}
    ${extract_txt_8}=    Get Element Text    selector=${agreement_Createperiodicinvoice_option_underellipses}
    ${extract_txt_9}=    Get Element Text    selector=${agreement_Terminate/Cancel_option_underellipses}
    RETURN    ${extract_txt_1}    ${extract_txt_2}    ${extract_txt_3}    ${extract_txt_4}    ${extract_txt_5}    ${extract_txt_6}    ${extract_txt_7}    ${extract_txt_8}    ${extract_txt_9}

Schedule Job in Job Request_2
    [Arguments]    ${technician}
    [Documentation]    This method is used for Create Job Request
    Click Element    selector=${job_request}
    Click Generic Button    button_name=Schedule
    Click Element    selector=${back_date_icon}
    Click Element    selector=${backdate_selection}
    ${backdate_schedule_confirmation_text}=    Get Element Text    selector=${extract_backdate_selectionvalidation_message}
    Should Be Equal As Strings    ${backdate_schedule_confirmation_text}    ${backate_actula_text}
    Click Element    selector=${clickno_on_backdate_selectionvalidation_message}
    Click Element    selector=${selectdate_2}
    Select value From Dropdown    selector=${schedule_page_technician_dropdown}    value_to_select=${technician}  
    Click Element     selector=${schedule_button}
    Click Element    selector=${schedule_confirmation_button}
    Click Generic Button    button_name=Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    ${job_message}=    Get Element Text    selector=${job_number_path}
    ${job_number}=    Extract Text With Position Number    ${job_message}    2
    Log To Console    ${job_number}
    Click Element    selector=${yes_btn_confirm_close_call_tab}
    RETURN    ${job_request_success_message}    ${job_number}

Edit Job - Job Screen Select Visist Type
    [Arguments]    ${phone_number_1}    ${job_class}    ${job_type}    ${lead_source_type}    ${job_lead_source}      
    [Documentation]    This Method Is Created To Edit Job And  Add Visist Type
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    2s
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number_1}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Click Element    selector=${callhandling_serachresult_firstrecord}
    Sleep    3s
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Click Element                selector=${job_request}
    Sleep    5s
    Click Element                selector=${job_class_dropdown}
    Select Generic Value From Dropdown    value_name=${job_class}
    Click Element                ${job_type_dropdown}
    Select Generic Value From Dropdown    value_name=${job_type}
    Click Element    selector=${department_dropdown}
    Click Element    selector=${select_department}
    Click Element                ${lead_source_type_dropdown}
    Select Generic Value From Dropdown    value_name=${lead_source_type}
    Click Element        ${job_lead_source_dropdown}
    Select Generic Value From Dropdown    value_name=${job_lead_source}
    Click Generic Button        Save & Close
    ${job_request_success_message}=    Get Element Text    selector=${message_popup}
    Wait For Element To Be Visible    selector=${tab_3}    timeout=10s
    Click Element		selector=${tab_3}
    Click Element    ${cancel_button}
    Click Generic Button    button_name=Proceed
    Sleep    3s
    Click Element		selector=${tab_Home_2}
    Sleep    5s
    Click Element    selector=${viewJob_btn}
    Wait For Element To Be Visible    selector=${jobdrawer_ellipsesbbutton}    timeout=20s
    Click Element    selector=${jobdrawer_ellipsesbbutton}
    Click Element    selector=${editjob_button}
    Wait For Element To Be Visible    selector=${editjob_title_text}    timeout=30s
    ${jobeddit_screen_header_title}=    Get Element Text    selector=${editjob_title_text}
    Should Be Equal As Strings    ${jobeddit_screen_header_title}    ${actual_editjob_text}
    Click Element    selector=${visit_dropdown_editjobscreen}
    Click Element    selector=${visittype_value}
    ${extract_visittype_Validation_text}=    Get Element Text    selector=${visittype_validatioText}
    Should Be Equal As Strings     ${extract_visittype_Validation_text}    ${actual_ValidatioText}
    Click Generic Button    button_name=Yes
    ${extract_jobclassAfter_visistselection}=    Get Element Text    selector=${actualjobclass_dropdown}
    Should Be Equal As Strings    ${extract_jobclassAfter_visistselection}    ${jobclassdropdown_actualValue}
    ${extract_jobtypeAfter_visistselection}=    Get Element Text    selector=${jobtype_dropdowtext}
    Should Be Equal As Strings    ${extract_jobtypeAfter_visistselection}    ${jobtypedropdown_value}
    Click Element    selector=${edit_job_screenSaveButton}
    RETURN    ${job_request_success_message}

Edit Address- Update Tax Code
    [Documentation]
    [Arguments]    ${phone_number_2}    ${zone}
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Sleep    3s    reason=required to load the upper header
    Clear Phone Tabs
    Click Generic Button    button_name=New Phone Call
    Sleep    2s
    Click Element              selector=${find_customer_searchtab}    
    Send Keys To Element       selector=${find_customer_searchtab}    keys_to_send=${phone_number_2}
    Press Keyboard Keys        ${find_customer_searchtab}    Enter
    Sleep    3s
    Click Element    selector=${callhandling_serachresult_firstrecord}
    Sleep    3s
    Wait For Element To Be Visible        ${click_customer_search_result_callhandlingpage}
    Click Element      selector=${click_customer_search_result_callhandlingpage}
    Click Element    selector=${service_locations_btn}
    Click Element          selector=${customer_information_edit_btn}
    Sleep    5s
    Click Element    selector=${tax_zone}
    Click Element    selector=${zonevalue_selection}
    Click Element            selector=${service_location_save_btn}
    ${edit_location_succ_mess}=    Get Element Text    selector=${message_popup}
    Custom Log               ${edit_location_succ_mess}
    RETURN                   ${edit_location_succ_mess}

Open Incoming Phone - Omnis Icon
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Wait For Page To Load
    Sleep    5s
    Click Element    selector=${openOmnis}
    ${omins_title}=    Get Element Text    selector=${extract_ominstitle}
    Should Be Equal As Strings    ${omins_title}    Incoming Phone Calls

Take Call-Redirection To CallHandling Screen
    Navigate To LHN Option    navigation=Customer Service>>Comm Center
    Wait For Page To Load
    Sleep    5s
    Click Element    selector=${openOmnis}
    ${omins_title}=    Get Element Text    selector=${extract_ominstitle}
    Should Be Equal As Strings    ${omins_title}    Incoming Phone Calls
    Click Element    selector=${selectcall}
    ${extract_omins_callhandlingredirectiontext}=    Get Element Text    selector=${omnisredirection_text_1}
    RETURN    ${extract_omins_callhandlingredirectiontext}
    
Omnis- Pop Up For New Customer
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Wait For Page To Load
    Click Element    selector=${openOmnis}
    Click Element    selector=${selectcall}
    ${extract_omins_continue_txt}=    Get Element Text    selector=${omnisredirection_text_1}
    Should Be Equal As Strings    ${extract_omins_continue_txt}    Do you want to continue?
    Click Element    selector=${omnis_yesbtn}
    ${extract_nocustomerfound_text}=    Get Element Text     selector=${nocumster_text_verification}
    Click Element    selector=${nocumster_text_verification_yesbtn}
    Sleep    3s
    ${phonenumber}=    Get Element Text     selector=${phone_number_input}
    Custom Log    ${phonenumber}
    Should Contain    ${phonenumber}    119898
    RETURN    ${extract_nocustomerfound_text}
    
Check Uncheck Functionality
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Wait For Page To Load    timeout=10s
    Click Element    selector=${openOmnis}
    Click Element    selector=${allcall_checkbox}
    Click Element    selector=${allcall_checkbox}
    Click Element    selector=${individualcall_checkbox}
    Click Element    selector=${individualcall_checkbox}

Take Call' Click For Different Tenant
    Navigate To LHN Option    navigation=Customer Service>>Comm Center
    Wait For Page To Load
    Click Element    selector=${openOmnis}
    ${omins_title}=    Get Element Text    selector=${extract_ominstitle}
    Should Be Equal As Strings    ${omins_title}    Incoming Phone Calls
    Click Element    selector=${selectcall}

Show Customer List For Exact / Multiple Matches
    Navigate To LHN Option    navigation=Customer Service>>Call Handling
    Wait For Page To Load
    Clear Phone Tabs
    Sleep    6s
    Click Element    selector=${openOmnis}
    Sleep    4s
    Click Element    selector=${selectcall}
    Click Element    selector=${omnis_yesbtn}

Omnis & Sinch Not Enabled
    Navigate To LHN Option    navigation=Setup>>Add-On Manager
    Wait For Element To Be Visible    ${browse_addons-tab}    timeout=20s
    Click Element    selector=${browse_addons-tab}
    Sleep    5s
    Click Element    selector=${click_swconnect}
    Click Generic Button    button_name=Next
    Click Element    selector=${enable_sw_connect_btn}

Add Edit Notes In Call Handling Billing Account
    [Documentation]      This method is used for Add and Edit notes In billing Account call handling
    [Arguments]    ${text_to_send}       
    Click Element    selector=${billing_account_button}
    Wait For Element To Be Visible    selector=${call_handling_billing_address_edit_btn} 
    Click Element    selector=${call_handling_billing_address_edit_btn} 
    Send Keys To Element    selector=${notes_text_field}    keys_to_send=${text_to_send}
    Sleep    3s
    # Scroll Until Element Visible    ${alternate_zip_code}
    # #Scroll To Element    selector=${alternate_address_checkbox_btn}
    # #Wait For Element To Be Visible     selector=${alternate_address_checkbox_btn}
    # Click Element    selector=${alternate_address_checkbox_btn}
    # Sleep    10s
    # Fill Generic Input Field    alternate_address    ${alternate_address}
    # Fill Generic Input Field    alternate_city    ${alternate_city} 
    # Fill Generic Input Field    alternate_state    ${alternate_state}
    # Fill Generic Input Field    alternate_zip_code    ${alternate_zip_code}
    # Send Keys To Element    selector=${alternate_notes_text_field}    keys_to_send=${text_to_send}
    Click Element  selector=${edit_billing_acc-save_button}    
    ${notes_added_msg}=    Get Element Text    selector=${message_popup}
    RETURN    ${notes_added_msg}
    Refresh Page

Validate Notes In Call Handling Billing Account
    Wait For Element To Be Visible    selector=${billing_account_button}
    Click Element    selector=${billing_account_button}
    Click Element    selector==${call_handling_billing_address_edit_btn}
    ${notes_text}=    Get Element Text    selector=${notes_text_field}
    RETURN    ${notes_text}
    ${alternate_notes_text}=    Get Element Text    selector=${alternate_notes_text_field}
    RETURN    ${alternate_notes_text}


##Generic Methods
Click Generic Button
    [Arguments]    ${button_name}
    ${generic_button}=    Replace String    string=${generic_button}    search_for=<<string_to_replace>>    replace_with=${button_name}
    Click Element    ${generic_button}

Fill Generic Input Field
    [Arguments]    ${name_of_field}    ${value_of_field}
    ${generic_input_field}=    Replace String    string=${generic_input_field}    search_for=<<string_to_replace>>    replace_with=${name_of_field}
    Send Keys To Element    ${generic_input_field}    keys_to_send=${value_of_field}

Select Value From Dropdown
    [Arguments]    ${selector}    ${value_to_select}
    Click Element    selector=${selector}
    ${generic_dropdown_select_value}    Replace String    string=${select_generic_dropdown_value_1}    search_for=<<string_to_replace>>    replace_with=${value_to_select}
    Click Element    selector=${generic_dropdown_select_value}

Select Generic Value From Dropdown
    [Arguments]    ${value_name}
    ${generic_drop_down_value}=    Replace String    string=${select_generic_dropdown_value}    search_for=<<string_to_replace>>    replace_with=${value_name}
    Click Element    ${generic_drop_down_value}

Click New Customer
    Wait For Page To Load
    ${element_count}=    Get Element Count    ${unkonwn_phone_number}
    Custom Log    New customer element count: ${element_count}
    IF    ${element_count} > 0
        Click Element    selector=${new_customer}
    ELSE
        Click Generic Button    button_name=New Phone Call
        Click Element    selector=${new_customer}
    END

Clear Phone Tabs
    ${element_count}=    Get Element Count    ${all_tabs}
    FOR    ${index}    IN RANGE    ${element_count}    0    -1
        Log To Console    Tab count is ${index}
        Click Element    selector=//iframe[@id='Left-frame'] >>> (//div[contains(@class,'callHandling_tabBarWrapper')]//div[contains(@class,'ant-tabs-nav-wrap')]//div[contains(@class,'ant-tabs-tab')]//..//div[@role='tab'])[${index}]
        Sleep    5s
        ${cancel_button_exists} =    Run Keyword And Return Status    Does Element Exist    ${cancel_button}
        Log To Console    Cancel button is ${cancel_button_exists}
        ${save_button_exists} =    Run Keyword And Return Status    Does Element Exist    ${save_calhandlingpage_button}
        Log To Console    Save button is ${save_button_exists}
        IF    '${cancel_button_exists}' == 'True' 
            Click Element    ${cancel_button}
            Click Generic Button    button_name=Proceed
        ELSE IF    '${save_button_exists}' == 'True'
            Click Element    ${save_calhandlingpage_button}
        END
        Log To Console    Tab no. ${index} is cleared.
    END

Validation Check Message
    [Arguments]    ${selector}    ${message}
    ${order_created}=    Get Element Text    selector=${selector}
    Should Be Equal    first=${order_created}    second=${message}
    Custom Log    Validated Message: ${order_created}

Get Numeric Characters
    [Arguments]    ${input_string}
    ${numeric_characters}=    Get Regexp Matches    ${input_string}    \d+
    ${numeric_string}=    Evaluate    ''.join($numeric_characters)
    RETURN    ${numeric_string}

Get Popup Message Description In Call Handling
    [Documentation]    This method is used for get the Success message.
    ${confirmation_message_description}=    Get Element Text    selector=${confirmation_message_description}
    RETURN    ${confirmation_message_description}

Find Name In Dropdown
    [Arguments]    ${name_select}    ${height}    ${scroll_selector}
    Custom Log    Height for ${name_select} is ${height}
    FOR    ${index}    IN RANGE    ${height} 
        ${is_visible}=    Run Keyword And Return Status   Wait For Elements State    selector=${name_select}    state=visible   timeout=.1 s
        Custom Log    Value of is_visible is ${is_visible}
        IF  not ${is_visible}
            Custom Log    text_to_log=Check element for index = ${index}
            IF    ${index} == int(${height}-1)
                Custom Log    text_to_log=Element ${name_select} is not found while scrolling
                Sleep    10s    msg=To check
            END
        ELSE
            Custom Log    text_to_log=Element ${name_select} is found at ${index}
            Click With Options    selector=${name_select}    force=True
            Exit For Loop
        END
        Scroll By    selector=${scroll_selector}    vertical=256
    END


Generate 7 Digit
    ${random_number}=    Generate Random String    5    numbers
    RETURN   ${random_number}
    


Scroll Until Element Visible
    [Arguments]    ${selector}    ${max_scrolls}=10
    ${i}=    Set Variable    0
    WHILE    ${i} < ${max_scrolls}
        ${visible}=    Run Keyword And Return Status    Wait For Elements State    ${selector}    visible    timeout=1s
        IF    ${visible}
            Log    Element is visible after ${i} scrolls
            Exit For Loop
        END
        # Scroll the element into view (Playwright handles it natively)
        Scroll To Element    selector=${selector}
        Sleep    0.5s
        ${i}=    Evaluate    ${i} + 1
    END
     IF    not ${visible}
        Fail    Element not visible after ${max_scrolls} scroll attempts
    END



