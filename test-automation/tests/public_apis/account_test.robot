#** API Calls in this file
#** createARBillingAccount
#** createBillingAccount
#** createServiceAccount
#** createServiceAccountForAnnie
#** findBillingAccountsByServiceAccountId
#** findByBillingAccountId
#** queryAccountById
#** searchEquipmentsByServiceAccountId
#** searchServiceAccounts
#** updateBillingAccount
#** updateServiceAccount
#** updateServiceAccountForAnnie


*** Settings ***
Resource  ../../public_api_objects/account_objects.robot

#Suite Setup    Get Data from CSV    folder_name=public_apis    file_name=account_public_api.csv
Suite Setup    Get API Data from CSV    folder_name=public_apis    file_name=account_public_api.csv

*** Variables ***
${serviceContact}    ${None}
${creditLimit}    ${None}
${balanceDue}    ${None}
${CCName}    ${None}
${CCNumber}    ${None}
${billingCustomer}    ${None}

*** Test Cases ***
Validate createARBillingAccount API
    [Documentation]  createARBillingAccount    [SWPL-T4149 | SWR3-T3028]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e66d3d4d-68ff-4b5e-aa26-23637817ab92
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4149
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    grp_annie    grp_hello_booked    grp_sunland    atr_mutation
    ...     uid_createArBillingAccount    uid_SWPL-T4149    uid_SWR3-T3028

    Set Local Variable    ${serviceContact}    ${ts_data}[a_serv_contact_1]
    Set Local Variable    ${creditLimit}    ${ts_data}[a_credit_limit_1]
    Set Local Variable    ${balanceDue}    ${ts_data}[a_balance_1]
    Set Local Variable    ${CCName}    ${ts_data}[a_CC_name_1]
    Set Local Variable    ${CCNumber}    ${ts_data}[a_CC_num_1]

    ${keyword_response}=    createARBillingAccount API    ${ts_data}[a_serv_acct_id_1]    ${ts_data}[a_cust_id_1]    ${ts_data}[a_cust_first_1]
    ...    ${ts_data}[a_cust_last_1]    ${ts_data}[a_cust_dnis_1]    ${ts_data}[a_cust_ext_1]    ${ts_data}[a_cust_email_1]
    ...    ${ts_data}[a_cust_title_1]    ${ts_data}[a_cust_src_type_1]    ${ts_data}[a_active_1]    ${balanceDue}
    ...    ${ts_data}[a_check_bank_acc_1]    ${ts_data}[a_counter_sale_1]    ${ts_data}[a_CC_exp_month_1]    ${ts_data}[a_CC_exp_year_1]
    ...    ${CCName}    ${CCNumber}    ${creditLimit}    ${ts_data}[a_no_solicit_1]
    ...    ${ts_data}[a_finance_charge_1]    ${ts_data}[a_happy_check_1]    ${serviceContact}    ${ts_data}[a_statement_1]
    ...    ${ts_data}[a_tax_exempt_num_1]    ${ts_data}[a_company_name_1]

    Set Local Variable    ${billingCustomer}    ${keyword_response}[billingCustomer]
    Case Insensitive Left Match    ${ts_data}[public_api_success_create]    ${keyword_response}[message]    ARBillingAccount not created successfully

    ${temp}=    Convert To Integer    ${billingCustomer}[serviceContact]
    Should Be Equal As Integers    ${serviceContact}    ${temp}    msg=Service contact doesn't match
    ${temp}=    Convert To Number    ${billingCustomer}[creditLimit]
    Should Be Equal As Numbers    ${creditLimit}    ${temp}    msg=Credit limit doesn't match
    ${temp}=    Convert To Number    ${billingCustomer}[balanceDue]
    Should Be Equal As Numbers    ${balanceDue}    ${temp}    msg=Balance due doesn't match
    ${temp}=    Convert To String    ${billingCustomer}[creditCardName]
    Should Be Equal As Strings    ${CCName}    ${temp}    msg=Customer name on credit card doesn't match
    ${temp}=    Convert To String    ${billingCustomer}[creditCardNumber]
    Should Be Equal As Strings    ${CCNumber}    ${temp}    msg=Customer credit card number contact doesn't match


Validate createBillingAccount API
    [Documentation]    createBillingAccount    [SWPL-T4141 | SWR3-T3020]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/48b2c2e4-5ab9-47ff-bafe-773811402da8
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4141
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation
    ...     uid_createBillingAccount    uid_SWPL-T4141    uid_SWR3-T3020

    Set Local Variable    ${checkAcctNumber}    ${ts_data}[a_check_bank_acc_2]
    Set Local Variable    ${balanceDue}    ${ts_data}[a_balance_due_1]
    Set Local Variable    ${CCName}    ${ts_data}[a_CC_name_2]
    Set Local Variable    ${CCNumber}    ${ts_data}[a_CC_num_2]

    ${keyword_response}=    createBillingAccount API    ${ts_data}[a_active_2]    ${balanceDue}    ${checkAcctNumber}
    ...    ${ts_data}[a_counter_sale_2]    ${ts_data}[a_CC_exp_month_2]    ${ts_data}[a_CC_exp_year_2]    ${CCName}
    ...    ${CCNumber}    ${ts_data}[a_credit_limit_2]    ${ts_data}[a_no_solicit_2]    ${ts_data}[a_finance_charge_2]
    ...    ${ts_data}[a_happy_check_2]    ${ts_data}[a_serv_contact_2]    ${ts_data}[a_statement_2]    ${ts_data}[a_tax_exempt_num_2]    ${ts_data}[a_xcharge_alias_1]
    ...    ${ts_data}[a_xcharge_clean_1]    ${ts_data}[a_first_name_1]    ${ts_data}[a_last_name_1]    ${ts_data}[a_company_name_2]

    Set Local Variable    ${billingCustomer}    ${keyword_response}[billingCustomer]
    Case Insensitive Left Match    ${ts_data}[public_api_success_create]    ${keyword_response}[message]    Create billing account check unsuccessful

    ${temp}=    Convert To Integer    ${billingCustomer}[checkBankAccountNumber]
    Should Be Equal As Strings    ${checkAcctNumber}    ${temp}    msg=Check bank account number doesn't match
    ${temp}=    Convert To Number    ${billingCustomer}[balanceDue]
    Should Be Equal As Numbers    ${balanceDue}    ${temp}    msg=Balance due doesn't match
    ${temp}=    Convert To String    ${billingCustomer}[creditCardName]
    Should Be Equal As Strings    ${CCName}    ${temp}    msg=Customer name on credit card doesn't match
    ${temp}=    Convert To String    ${billingCustomer}[creditCardNumber]
    Should Be Equal As Strings    ${CCNumber}    ${temp}    msg=Customer credit card number contact doesn't match


Validate createServiceAccount API
    [Documentation]    createServiceAccount    [SWPL-T4152 | SWR3-T3031]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/7e5e5a02-721b-4a3d-af7c-040fc64fdea8
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4152
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation    cmp_chiirp_api
    ...         uid_createServiceAccount    uid_SWPL-T4152    uid_SWR3-T3031

    ${keyword_response}=    createServiceAccount API    ${ts_data}[a_cust_first_2]    ${ts_data}[a_cust_last_2]    ${ts_data}[a_cust_dnis_2]
    ...    ${ts_data}[a_cust_email_2]    ${ts_data}[a_lead_source_type_id_1]    ${ts_data}[a_lead_source_id_1]    ${ts_data}[a_no_email_1]
    ...    ${ts_data}[a_loc_type_1]    ${ts_data}[a_loc_addr_1]    ${ts_data}[a_loc_city_1]    ${ts_data}[a_loc_state_1]
    ...    ${ts_data}[a_loc_zip_1]    ${ts_data}[a_loc_own_occ_1]

    # only test available for this api, all other data returned is new
    Case Insensitive Left Match    ${ts_data}[public_api_success_create]    ${keyword_response}[message]    Create service account check unsuccessful


Validate createServiceAccountForAnnie API
    [Documentation]    createServiceAccountForAnnie    [SWPL-T4114 | SWR3-T2993]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/5a228f2c-9899-4c20-afd5-0f36e019c701
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4114
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation 
    ...         uid_createServiceAccountForAnnie    uid_SWPL-T4114    uid_SWR3-T2993

    ${keyword_response}=    createServiceAccountForAnnie API    ${ts_data}[a_cust_first_2]    ${ts_data}[a_cust_last_2]    ${ts_data}[a_cust_dnis_2]
    ...    ${ts_data}[a_cust_email_2]    ${ts_data}[a_lead_source_type_id_1]    ${ts_data}[a_lead_source_id_1]    ${ts_data}[a_no_email_1]
    ...    ${ts_data}[a_loc_type_1]    ${ts_data}[a_loc_addr_1]    ${ts_data}[a_loc_city_1]    ${ts_data}[a_loc_state_1]
    ...    ${ts_data}[a_loc_zip_1]    ${ts_data}[a_loc_own_occ_1]

    # only test available for this api, all other data returned is new
    Case Insensitive Left Match    ${ts_data}[public_api_success_create]    ${keyword_response}[message]    Create service account check unsuccessful


Validate findBillingAccountsByServiceAccountId API
    [Documentation]    findBillingAccountsByServiceAccountId    [SWPL-T4112 | SWR3-T2991]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/94c9b2ff-aa2d-4155-ae31-302041ddb287
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4112
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query    cmp_chiirp_api
    ...     uid_findBillingAccountsByServiceAccountId    uid_SWPL-T4112    uid_SWR3-T2991

    
    # Nonexistent service account
    Set Local Variable    ${servAcct}    ${ts_data}[a_serv_acct_id_3]
    ${keyword_response}=    findBillingAccountsByServiceAccountId API    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_1]
    ...    ${servAcct}    ${ts_data}[a_is_billing_accounts_1]

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Be Equal As Integers    ${totalElements}    0    msg=Elements returned by ${servAcct}

    # Existing service account
    Set Local Variable    ${servAcct}    ${ts_data}[a_serv_acct_id_2]
    ${keyword_response}=    findBillingAccountsByServiceAccountId API    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_1]
    ...    ${servAcct}    ${ts_data}[a_is_billing_accounts_1] 

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=Elements not returned by ${servAcct}
 
    Match In JSON List    ${keyword_response}[content]    id    ${ts_data}[a_bill_acct_id_1]

Validate findBillingAccountsByServiceAccountId With Invalid ServiceAccount Id API
    [Documentation]    Validate findBillingAccountsByServiceAccountId With Invalid ServiceAccount Id API    [SWPL-T4112 | SWR3-T2991]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4112
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query    cmp_chiirp_api
    ...     uid_findBillingAccountsByServiceAccountId    uid_SWPL-T4112    uid_SWR3-T2991
    
    # Nonexistent service account
    ${servAcct}    Convert To Integer    12345
    ${keyword_response}=    findBillingAccountsByServiceAccountId API    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_1]
    ...    ${servAcct}    ${ts_data}[a_is_billing_accounts_1]

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Be Equal As Integers    ${totalElements}    0    msg=Elements returned by ${servAcct}

    # Existing service account
    Set Local Variable    ${servAcct}    ${ts_data}[a_serv_acct_id_2]
    ${keyword_response}=    findBillingAccountsByServiceAccountId API    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_1]
    ...    ${servAcct}    ${ts_data}[a_is_billing_accounts_1] 

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=Elements not returned by ${servAcct}
 
    Match In JSON List    ${keyword_response}[content]    id    ${ts_data}[a_bill_acct_id_1]

Validate findBillingAccountsByServiceAccountId Without Param API
    [Documentation]    Validate findBillingAccountsByServiceAccountId Without Param API    [SWPL-T4112 | SWR3-T2991]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4112
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query    cmp_chiirp_api
    ...     uid_findBillingAccountsByServiceAccountId    uid_SWPL-T4112    uid_SWR3-T2991
    
    # Nonexistent service account
    Set Local Variable    ${isbillingaccount}  True
    Set Local Variable    ${servAcct}    ${ts_data}[a_serv_acct_id_3]
    ${keyword_response}=    findBillingAccountsByServiceAccountId Without Param API
    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     invalid value
    
 Validate findByBillingAccountId API
    [Documentation]    findByBillingAccountId    [SWPL-T4205 | SWR3-T3084]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/893d5513-0b91-4832-8430-c9439f06c4db
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4205
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...    uid_findByBillingAccountId    uid_SWPL-T4205    uid_SWR3-T3084

    Set Local Variable    ${billAcctId}    ${ts_data}[a_bill_acct_id_1]
    ${keyword_response}=    findByBillingAccountId API    billingAccountId=${billAcctId}

    ${id}=    Convert To String    ${keyword_response}[id]
    ${billAcctIdStr}=     Convert To String    item=${billAcctId}
    Should Be Equal As Strings    ${id}    ${billAcctIdStr}    msg=Billing account id doesn't match the id

    Match In JSON List    ${keyword_response}[arReceivableDto]    balance    ${ts_data}[a_balance_2]
    Match In JSON List    ${keyword_response}[arBillingCustomerCommunicationPreferenceDto]    arBillingCustomerId    ${billAcctIdStr}

Validate findByBillingAccountId With InvalidID API
    [Documentation]    Validate findByBillingAccountId With InvalidID API    [SWPL-T4205 | SWR3-T3084]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4205
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...    uid_findByBillingAccountId    uid_SWPL-T4205    uid_SWR3-T3084

    ${account_invalidid}=    Convert To Integer    12345
    ${keyword_response}=    findByBillingAccountId API    billingAccountId=${account_invalidid}

    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     None

Validate findByBillingAccountId Without AccountID API
    [Documentation]   findByBillingAccountId Without AccountID  API    [SWPL-T4205 | SWR3-T3084]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4205
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...    uid_findByBillingAccountId    uid_SWPL-T4205    uid_SWR3-T3084

    ${keyword_response}=    findByBillingAccountId Without Param API
    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     invalid value


Validate queryAccountById API
    [Documentation]    queryAccountById    [SWPL-T4145 | SWR3-T3024]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/f0afa409-63c0-4371-abdd-4d8042433fd7
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4145
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...     uid_queryAccountById    uid_SWPL-T4145    uid_SWR3-T3024

    # Non-existent account
    ${keyword_response}=    queryAccountById API    ${ts_data}[a_bill_acct_id_2]
    Set Local Variable    ${account}    ${keyword_response}[account]
    Case Insensitive Left Match    ${ts_data}[public_api_fetch_successful]    ${keyword_response}[message]    queryAccountById not fetched successfully
    Should Be Equal As Strings    '${account}'    'None'    msg= Account should be empty

    # Existing account
    Set Local Variable    ${billAcctId}    ${ts_data}[a_bill_acct_id_1]
    ${keyword_response}=    queryAccountById API    ${billAcctId}

    Set Local Variable    ${account}    ${keyword_response}[account]
    Case Insensitive Left Match    ${ts_data}[public_api_fetch_successful]    ${keyword_response}[message]    queryAccountById not fetched successfully

    ${id}=    Convert To String    ${account}[id]
    ${billAcctIdStr}=    Convert To String    ${billAcctId}
    Should Be Equal As Strings    ${id}    ${billAcctIdStr}    msg=Billing account id doesn't match the id

    Match In JSON List    ${account}[arReceivableDto]    id    ${ts_data}[a_ar_receivable_id_1]
    Match In JSON List    ${account}[arBillingCustomerCommunicationPreferenceDto]    id    ${ts_data}[a_ar_customer_id_1]

Validate queryAccountById With InvalidID API
    [Documentation]    Validate queryAccountById With InvalidID API    [SWPL-T4145 | SWR3-T3024]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4145
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...     uid_queryAccountById    uid_SWPL-T4145    uid_SWR3-T3024

    ${account_invalidid}=    Convert To Integer    12345
    ${keyword_response}=    queryAccountById API    ${account_invalidid}
    Log To Console    RESPONSE:${keyword_response}
    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     None


Validate queryAccountById Without AccountID API
    [Documentation]    Validate queryAccountById Without AccountID API    [SWPL-T4145 | SWR3-T3024]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4145
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...     uid_queryAccountById    uid_SWPL-T4145    uid_SWR3-T3024

    # Non-existent account
    ${keyword_response}=    queryAccountById API    ${ts_data}[a_bill_acct_id_2]
    Set Local Variable    ${account}    ${keyword_response}[account]
    Case Insensitive Left Match    ${ts_data}[public_api_fetch_successful]    ${keyword_response}[message]    queryAccountById not fetched successfully
    Should Be Equal As Strings    '${account}'    'None'    msg= Account should be empty

    ${keyword_response}=    queryAccountById Without Param API
    Log To Console    RESPONSE:${keyword_response}
    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     invalid value
   

Validate searchEquipmentsByServiceAccountId API
    [Documentation]    searchEquipmentsByServiceAccountId    [SWPL-T4144 | SWR3-T3023]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/87274d63-24d6-4d74-8224-6c66bfbfffaa
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4144
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query  
    ...     uid_searchEquipmentsByServiceAccountId    uid_SWPL-T4144    uid_SWR3-T3023

    Set Local Variable    ${servAcct}    ${ts_data}[a_serv_acct_id_2]
    ${keyword_response}=    searchEquipmentsByServiceAccountId API    ${servAcct}    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_2]    

    Case Insensitive Left Match    ${ts_data}[public_api_fetch_successful]    ${keyword_response}[message]    searchEquipmentsByServiceAccountId not fetched successfully

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=Elements returned by ${servAcct}
    Match In JSON List    ${keyword_response}[content]    id    ${servAcct}    unitType    ${ts_data}[a_unit_type_1]

Validate searchEquipmentsByServiceAccountId With InvalidID API
    [Documentation]    Validate searchEquipmentsByServiceAccountId With InvalidID API    [SWPL-T4144 | SWR3-T3023]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4144
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query  
    ...     uid_searchEquipmentsByServiceAccountId    uid_SWPL-T4144    uid_SWR3-T3023

    ${servAcct}=    Convert To Integer    12345  
    ${keyword_response}=    searchEquipmentsByServiceAccountId API    ${servAcct}    ${ts_data}[a_page_1]    ${ts_data}[a_size_1]    ${ts_data}[a_sort_2]

    Case Insensitive Left Match    ${ts_data}[public_api_fetch_successful]    ${keyword_response}[message]    searchEquipmentsByServiceAccountId not fetched successfully

    #Log To Console    RESPONSE:${keyword_response}
   ${response}=    Convert To String    ${keyword_response}
   Should Contain    ${response}     None

Validate searchEquipmentsByServiceAccountId Without ServiceAccountId API
    [Documentation]    Validate searchEquipmentsByServiceAccountId Without ServiceAccountId API    [SWPL-T4144 | SWR3-T3023]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4144
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query  
    ...     uid_searchEquipmentsByServiceAccountId    uid_SWPL-T4144    uid_SWR3-T3023

    ${keyword_response}=    searchEquipmentsByServiceAccountId Wihtout Param API

    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     invalid value

Validate searchServiceAccounts API
    [Documentation]    searchServiceAccounts    [SWPL-T4210 | SWR3-T3089]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/7903fd85-c24f-4e20-870c-a36518689411
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4210
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...     uid_searchServiceAccounts    uid_SWPL-T4210    uid_SWR3-T3089    cmp_chiirp_api

    ${myIds}=    Create List    ${ts_data}[a_serv_acct_id_1]

    ${keyword_response}=    searchServiceAccounts API
    ...    ${ts_data}[a_address_1]
    ...    ${ts_data}[a_company_name_3]
    ...    ${ts_data}[a_cust_id_3]
    ...    ${ts_data}[a_cust_last_1]
    ...    ${ts_data}[a_loc_id_1]
    ...    ${ts_data}[a_loc_ids_1]
    ...    ${ts_data}[a_dnis_1]
    ...    @{myIds}
    ...    ${ts_data}[a_phone_empty_1]
    ...    ${ts_data}[a_own_occ_1]
    ...    ${ts_data}[a_page_1]
    ...    ${ts_data}[a_size_1]
    ...    ${ts_data}[a_sort_3]

    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=Elements returned by the service account search

    ${content}=    Set Variable    ${keyword_response}[content][0]

    ${id}=    Convert To String    ${content}[id]
    ${servAcctId}=    Convert To String    ${ts_data}[a_serv_acct_id_1]
    Should Be Equal As Strings    ${id}    ${servAcctId}    msg=Service account id doesn't match the id

    ${id}=    Convert To String    ${content}[customer][id]
    Should Be Equal As Strings    ${id}    ${ts_data}[a_cust_id_3]    msg=Customer account id doesn't match the id

    ${address}=    Set Variable    ${content}[primaryBillingAddress]
    Run Keyword If    '${address}' == 'None'    Log    Billing address is null
    ...    ELSE
    ...    Should Be Equal As Strings    ${address}[id]    ${ts_data}[a_loc_id_1]

    ${ids}=    Set Variable    ${ts_data}[a_loc_ids_1]
    Run Keyword If    '${ids}' == '[]'
    ...    Should Be True    ${content}[serviceLocations] == []    msg=Expected no service locations
    ...    ELSE
    ...    Match In JSON List    ${content}[serviceLocations]    id    ${ids}

    ${jsonVal}=    Set Variable    ${content}[billingAccountOutput][mainArBillingCustomer]
    ${csvVal}=     Set Variable    ${ts_data}[a_ar_customer_id_2]

    Run Keyword If    '${csvVal}' == 'null'
    ...    Should Be Equal As Strings    None    ${jsonVal}    msg=Expected mainArBillingCustomer to be null
    ...    ELSE IF    '${csvVal}' == '[]'
    ...    Should Be True    ${jsonVal} == []    msg=Expected no AR Customers
    ...    ELSE
    ...    Match In JSON List    ${jsonVal}    id    ${csvVal}

Validate searchServiceAccounts API Negative
    [Documentation]    Tests searchServiceAccounts API with invalid inputs [SWPL-T4210-NEG | SWR3-T3089-NEG]
    # Test validates the API's error handling for various invalid parameters
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_query
    ...     uid_searchServiceAccounts    uid_SWPL-T4210_negative    uid_SWR3-T3089_negative    negative_tc    cmp_chiirp_api

    ${valid_address}=     Set Variable    ${ts_data}[a_address_1]
    ${valid_cName}=       Set Variable    ${ts_data}[a_company_name_3]
    ${valid_cId}=         Set Variable    ${ts_data}[a_cust_id_3]
    ${valid_lName}=       Set Variable    ${ts_data}[a_cust_last_1]
    ${valid_locId}=       Set Variable    ${ts_data}[a_loc_id_1]
    ${valid_locIds}=      Set Variable    ${ts_data}[a_loc_ids_1]
    ${valid_dnis}=        Set Variable    ${ts_data}[a_dnis_1]
    ${valid_servAcctId}=  Create List    ${ts_data}[a_serv_acct_id_1]
    ${valid_phoneEmpty}=  Set Variable    ${ts_data}[a_phone_empty_1]
    ${valid_ownOcc}=      Set Variable    ${ts_data}[a_own_occ_1]
    ${valid_page}=        Set Variable    ${ts_data}[a_page_1]
    ${valid_size}=        Set Variable    ${ts_data}[a_size_1]
    ${valid_sort}=        Set Variable    ${ts_data}[a_sort_3]

    # Test 1: Invalid address with all other parameters valid
    ${random_address}=    Generate Random String    15    [LETTERS][NUMBERS]
    ${response1}=    searchServiceAccounts API
    ...    ${random_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements1}=    Convert To Integer    ${response1}[totalElements]
    Should Be Equal As Integers    ${totalElements1}    0    msg=Should return 0 elements for invalid address

    # Test 2: Invalid company name with all other parameters valid
    ${random_company}=    Generate Random String    15    [LETTERS]
    ${response2}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${random_company}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements2}=    Convert To Integer    ${response2}[totalElements]
    Should Be Equal As Integers    ${totalElements2}    0    msg=Should return 0 elements for invalid company name

    # Test 3: Invalid customer ID with all other parameters valid
    ${random_cust_id}=    Generate Random String    10    [NUMBERS]
    ${response3}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${random_cust_id}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements3}=    Convert To Integer    ${response3}[totalElements]
    Should Be Equal As Integers    ${totalElements3}    0    msg=Should return 0 elements for invalid customer ID

    # Test 4: Invalid last name with all other parameters valid
    ${random_last_name}=    Generate Random String    10    [LETTERS]
    ${response4}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${random_last_name}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements4}=    Convert To Integer    ${response4}[totalElements]
    Should Be Equal As Integers    ${totalElements4}    0    msg=Should return 0 elements for invalid last name

    # Test 5: Invalid location ID with all other parameters valid
    ${random_loc_id}=    Generate Random String    8    [NUMBERS]
    ${response5}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${random_loc_id}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements5}=    Convert To Integer    ${response5}[totalElements]
    Should Be Equal As Integers    ${totalElements5}    0    msg=Should return 0 elements for invalid location ID

    # Test 6: Invalid location IDs with all other parameters valid
    ${invalid_loc_ids}=    Set Variable    [999999, 888888]
    ${response6}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${invalid_loc_ids}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements6}=    Convert To Integer    ${response6}[totalElements]
    Should Be Equal As Integers    ${totalElements6}    0    msg=Should return 0 elements for invalid location IDs

    # Test 7: Invalid phone number (DNIS) with all other parameters valid
    ${random_phone}=    Generate Random String    10    [NUMBERS]
    ${response7}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${random_phone}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements7}=    Convert To Integer    ${response7}[totalElements]
    Should Be Equal As Integers    ${totalElements7}    0    msg=Should return 0 elements for invalid phone number

    # Test 8: Invalid service account ID with all other parameters valid
    ${random_serv_acct_id}=    Generate Random String    10    [NUMBERS]
    ${invalid_serv_acct_id}=    Create List    ${random_serv_acct_id}
    ${response8}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{invalid_serv_acct_id}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements8}=    Convert To Integer    ${response8}[totalElements]
    Should Be Equal As Integers    ${totalElements8}    0    msg=Should return 0 elements for invalid service account ID

    ${invalid_phone_empty}=    Set Variable    notABoolean

    ${status}=    Set Variable    FAIL
    ${error_msg}=    Set Variable    No error occurred

    # We expect this to fail with a 400 status code
    ${status}    ${error_msg}=    Run Keyword And Ignore Error    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${invalid_phone_empty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}

    Should Be Equal    ${status}    FAIL    msg=Should fail when invalid phoneEmpty value is provided
    Should Contain    ${error_msg}    400    msg=Error should include 400 status code for invalid phoneEmpty value

    # Test 10: Invalid ownOcc flag with all other parameters valid
    ${invalid_own_occ}=    Set Variable    notABoolean

    ${status10}=    Set Variable    FAIL
    ${error_msg10}=    Set Variable    No error occurred

    # We expect this to fail with a 400 status code
    ${status10}    ${error_msg10}=    Run Keyword And Ignore Error    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${invalid_own_occ}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${valid_sort}

    # Check that it failed and the error contains 400
    Should Be Equal    ${status10}    FAIL    msg=Should fail when invalid ownOcc value is provided
    Should Contain    ${error_msg10}    400    msg=Error should include 400 status code for invalid ownOcc value

    # Test 11: Invalid page with all other parameters valid
    ${invalid_page}=    Evaluate    -1
    ${response11}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${invalid_page}
    ...    ${valid_size}
    ...    ${valid_sort}
    
    ${totalElements11}=    Convert To Integer    ${response11}[totalElements]
    Should Be Equal As Integers    ${totalElements11}    0    msg=Should return 0 elements for invalid page number

    # Test 12: Invalid size with all other parameters valid
    ${invalid_size}=    Evaluate    -1
    ${response12}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${invalid_size}
    ...    ${valid_sort}
    
    ${has_error}=    Run Keyword And Return Status    Should Contain    ${response12}    error
    ${has_zero_elements}=    Run Keyword And Return Status    Should Be Equal As Integers    ${response12}[totalElements]    0
    ${validation_passed}=    Evaluate    $has_error or $has_zero_elements
    Should Be True    ${validation_passed}    msg=Should either return error or 0 elements for invalid size

    # Test 13: Invalid sort with all other parameters valid
    ${invalid_sort}=    Set Variable    INVALID_SORT_FIELD
    ${response13}=    searchServiceAccounts API
    ...    ${valid_address}
    ...    ${valid_cName}
    ...    ${valid_cId}
    ...    ${valid_lName}
    ...    ${valid_locId}
    ...    ${valid_locIds}
    ...    ${valid_dnis}
    ...    @{valid_servAcctId}
    ...    ${valid_phoneEmpty}
    ...    ${valid_ownOcc}
    ...    ${valid_page}
    ...    ${valid_size}
    ...    ${invalid_sort}
    
    ${has_error}=    Run Keyword And Return Status    Should Not Contain    ${response13}    error
    ${has_zero_elements}=    Run Keyword And Return Status    Should Be Equal As Integers    ${response13}[totalElements]    0
    ${validation_passed}=    Evaluate    $has_error or $has_zero_elements
    Should Be True    ${validation_passed}    msg=Should either return error or 0 elements for invalid sort field

Validate updateBillingAccount API
  [Documentation]    updateBillingAccount    [SWPL-T4132 | SWR3-T3011]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/10c3eb72-ccea-4683-bbe3-0a01973fee83
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4132
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation
    ...     uid_updateBillingAccount    uid_SWPL-T4132    uid_SWR3-T3011

    Set Local Variable    ${billAcctId}    ${ts_data}[a_bill_acct_id_3]
    Set Local Variable    ${billCustId}    ${ts_data}[a_bill_cust_id_2]
    ${keyword_response}=    updateBillingAccount API    ${billAcctId}    ${billCustId}    ${ts_data}[a_active_3]    ${ts_data}[a_happy_check_3]

    Set Local Variable    ${billingCustomer}    ${keyword_response}[billingCustomer]

    Case Insensitive Left Match    ${ts_data}[public_api_update_successful]    ${keyword_response}[message]    updateBillingAccount not updating successfully

    ${id}=    Convert To String    ${billingCustomer}[id]
    Should Be Equal As Strings    ${id}    ${billAcctId}    msg=Billing account id doesn't match the id

    ${id}=    Convert To String    ${billingCustomer}[billingCustomerId]
    Should Be Equal As Strings    ${id}    ${billCustId}    msg=Billing customer id doesn't match the id


Validate updateServiceAccount API
    [Documentation]    updateServiceAccount    [SWPL-T4151 | SWR3-T3030]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/af2360af-7991-407c-919f-9430c1fef3bf
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4151
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation    cmp_chiirp_api
    ...     uid_updateServiceAccount    uid_SWPL-T4151    uid_SWR3-T3030

    Set Local Variable    ${servAcctId}    ${ts_data}[a_serv_acct_id_6]
    Set Local Variable    ${firstName}    ${ts_data}[a_first_name_2]
    Set Local Variable    ${lastName}    ${ts_data}[a_last_name_3]
    Set Local Variable    ${dnis}    ${ts_data}[a_dnis_2]
    Set Local Variable    ${email}    ${ts_data}[a_email_1]
    ${keyword_response}=    updateServiceAccount API    ${servAcctId}    ${firstName}    ${lastName}    ${dnis}
    ...    ${ts_data}[a_extension_1]    ${email}    ${ts_data}[a_title_1]    ${ts_data}[a_no_email_2]
    Set Local Variable    ${servAcct}    ${keyword_response}[serviceAccount]
    Set Local Variable    ${customer}    ${servAcct}[customer]

    Case Insensitive Left Match    ${ts_data}[public_api_update_successful]    ${keyword_response}[message]    updateServiceAccount not updating successfully

    ${id}=    Convert To String    ${servAcct}[id]
    Should Be Equal As Strings    ${id}    ${servAcctId}    msg=Service account id doesn't match the id

    ${value}=    Convert To String    ${customer}[firstName]
    Should Be Equal As Strings    ${value}    ${firstName}    msg=First name doesn't match the customer first name

    ${value}=    Convert To String    ${customer}[lastName]
    Should Be Equal As Strings    ${value}    ${lastName}    msg=Last name doesn't match the customer first name

    ${value}=    Convert To String    ${customer}[phoneNumber]
    Should Be Equal As Strings    ${value}    ${dnis}    msg=Phone number doesn't match the customer phone number (dnis)

    ${value}=    Convert To String    ${customer}[email]
    Should Be Equal As Strings    ${value}    ${email}    msg=Email doesn't match the customer email


Validate updateServiceAccountForAnnie API
    [Documentation]    updateServiceAccountForAnnie    [SWPL-T4115 | SWR3-T2994]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/cb2b3282-3180-45c5-b703-6e4d59de7028
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4115
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_account    atr_mutation
    ...     uid_updateServiceAccountForAnnie    uid_SWPL-T4115    uid_SWR3-T2994

    Set Local Variable    ${servAcctId}    ${ts_data}[a_serv_acct_id_6]
    Set Local Variable    ${firstName}    ${ts_data}[a_first_name_2]
    Set Local Variable    ${lastName}    ${ts_data}[a_last_name_3]
    Set Local Variable    ${dnis}    ${ts_data}[a_dnis_2]
    Set Local Variable    ${email}    ${ts_data}[a_email_1]

    ${keyword_response}=    updateServiceAccountForAnnie API    ${servAcctId}    ${firstName}    ${lastName}    ${dnis}
    ...    ${ts_data}[a_extension_1]    ${email}    ${ts_data}[a_title_1]    ${ts_data}[a_lead_source_type_id_1]    ${ts_data}[a_lead_source_id_1]
    ...    ${ts_data}[a_alt_first_1]    ${ts_data}[a_alt_last_1]    ${ts_data}[a_referral_1]    ${ts_data}[a_no_email_2]

    Set Local Variable    ${servAcct}    ${keyword_response}[serviceAccount]
    Set Local Variable    ${customer}    ${servAcct}[customer]

    Case Insensitive Left Match    ${ts_data}[public_api_update_successful]    ${keyword_response}[message]    updateServiceAccount not updating successfully

    ${id}=    Convert To String    ${servAcct}[id]
    Should Be Equal As Strings    ${id}    ${servAcctId}    msg=Service account id doesn't match the id

    ${value}=    Convert To String    ${customer}[firstName]
    Should Be Equal As Strings    ${value}    ${firstName}    msg=First name doesn't match the customer first name

    ${value}=    Convert To String    ${customer}[lastName]
    Should Be Equal As Strings    ${value}    ${lastName}    msg=Last name doesn't match the customer first name

    ${value}=    Convert To String    ${customer}[phoneNumber]
    Should Be Equal As Strings    ${value}    ${dnis}    msg=Phone number doesn't match the customer phone number (dnis)

    ${value}=    Convert To String    ${customer}[email]
    Should Be Equal As Strings    ${value}    ${email}    msg=Email doesn't match the customer email
