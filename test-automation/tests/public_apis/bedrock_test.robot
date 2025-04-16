#** API Calls in this file
#** getAgreementById
#** getBedrockTaxCode
#** getPaymentMethod
#** queryAgreementById
#** searchArBillingCustomers

*** Settings ***
Resource    ../../public_api_objects/bedrock_objects.robot
Resource    ../../utils/csv_utils.robot

Suite Setup    Get Data from CSV  folder_name=public_apis  file_name=bedrock_public_api.csv

*** Test Cases ***
Validate getAgreementById API
    [Documentation]    getAgreementById    [SWPL-T4163 | SWR3-T3042]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/7dc01763-d422-4d83-b007-6cffc147847a
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4163
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_bedrock    grp_annie    grp_hello_booked    grp_sunland    grp_pulsem    atr_query    
    ...    uid_getAgreementById    uid_SWPL-T4163    uid_SWR3-T3042

    ${getAgreementById_response}=    getAgreementById API    ${global_test_data}[agreement_id_1]
    Should Be Equal As Strings    ${getAgreementById_response}[billingAgreement][id]    ${global_test_data}[agreement_id_1]    msg=Agreement Id is not as expected

*** Test Cases ***
Validate getAgreementById API Negative
    [Documentation]    Tests getAgreementById API with various invalid inputs [SWPL-T4163-NEG | SWR3-T3042-NEG]
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_bedrock    grp_annie    grp_hello_booked    grp_sunland    grp_pulsem    atr_query    
    ...    uid_getAgreementById   uid_SWPL-T4163_negative    uid_SWR3-T3042_negative    negative_tc

    ${non_existent_id}=    Generate Random String    10    [NUMBERS]
    ${getAgreementById_response}=    getAgreementById API    ${non_existent_id}

    Should Be Equal    ${getAgreementById_response}    ${None}    msg=Response should be None for non-existent agreement ID

Validate getBedrockTaxCode API
    [Documentation]    getBedrockTaxCode    [SWPL-T4198 | SWR3-T3077]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/57cb2005-b007-4d4b-8b9b-8c137b7fb950
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4198
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_bedrock    grp_annie    atr_query    uid_getBedrockTaxCode    uid_SWPL-T4198    uid_SWR3-T3077

    ${keyword_response}=    getBedrockTaxCode API    ${global_test_data}[page_1]    ${global_test_data}[size_1]
    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=No elements returned by getBedrockTaxCode

    Match In JSON List    ${keyword_response}[content]    code    ${global_test_data}[tax_code_1]    stateCode    ${global_test_data}[state_code_1]


Validate getPaymentMethod API
    [Documentation]  getPaymentMethod [SWPL-T4207|SWR3-T3086]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/848c64c0-1509-4bc5-b3a7-db77edd59400
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4207
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_bedrock  grp_annie  atr_query    uid_getPaymentMethod  uid_SWPL-T4207  uid_SWR3-T3086

    ${keyword_response}=  getPaymentMethod API  ${global_test_data}[page_1]  ${global_test_data}[size_1]
    ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
    Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getPaymentMethod

    Match In JSON List  ${keyword_response}[content]  paymentMethod  ${global_test_data}[pmt_method_1]  paymentType  ${global_test_data}[pmt_type_1]


Validate queryAgreementById API
    [Documentation]  queryAgreementById [SWPL-T4162|SWR3-T3041]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/9abf5bf2-517f-43ab-96a8-58edfae0b1d7
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4162
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_bedrock    grp_pulsem    atr_query    uid_queryAgreementById    uid_SWPL-T4162    uid_SWR3-T3041

    ${keyword_response}=  queryAgreementById API  ${global_test_data}[agreement_id_1]

    Case Insensitive Left Match  ${global_test_data}[public_api_fetch_successful]  ${keyword_response}[message]  Agreement id not fetched successfully
 
    Set Local Variable  ${agreement}  ${keyword_response}[agreement]
    Should Start With  ${agreement}[billingAgreement][id]  ${global_test_data}[agreement_id_1]  msg=Billing agreement does not match agreement
    Should Start With  ${agreement}[accountingAgreement][id]  ${global_test_data}[agreement_id_1]  msg=Accounting agreement does not match agreement

alidate queryAgreementById API Negative
    [Documentation]  Tests queryAgreementById API with invalid inputs [SWPL-T4162-NEG|SWR3-T3041-NEG]
    [Tags]    plt_GEN2_API    tsn_regression    cmp_integration    grp_api_bedrock    grp_pulsem    atr_query    
    ...    uid_queryAgreementById    uid_SWPL-T4162_negative    uid_SWR3-T3041_negative    negative_tc

    ${non_existent_id}=    Generate Random String    10    [NUMBERS]
    ${queryAgreementById_response}=    queryAgreementById API    ${non_existent_id}
    
    Should Be Equal    ${queryAgreementById_response}[agreement]    ${None}    msg=Response should be None for non-existent agreement ID

Validate searchArBillingCustomers API
    [Documentation]  searchArBillingCustomers [SWPL-T4208|SWR3-T3087]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/58e4669f-072f-4b3b-8597-dcea3caf0fea
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4208
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_bedrock  atr_mutation    uid_searchArBillingCustomers  uid_SWPL-T4208  uid_SWR3-T3087

    Set Local Variable    ${billCustId}    ${global_test_data}[billing_customer_id_1] 

    # This one should return a set of customers
    ${keyword_response}=  searchArBillingCustomers API    ${global_test_data}[page_1]    
    ...    ${global_test_data}[size_1]    ${global_test_data}[sort_1]    ${billCustId}    ${None}    
    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=No elements returned by searchArBillingCustomers
    Match In JSON List    ${keyword_response}[content]    billingCustomerId    ${billCustId}

    # This one should return only 1 customer
    ${keyword_response}=    searchArBillingCustomers API    ${global_test_data}[page_1]    ${global_test_data}[size_1]    ${global_test_data}[sort_1]    
    ...    ${billCustId}    ${global_test_data}[sort_type_1]
    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Be Equal As Integers    ${totalElements}    1    msg=searchArBillingCustomers didn't return a singleton element
    Match In JSON List    ${keyword_response}[content]    billingCustomerId    ${billCustId}

Validate searchArBillingCustomers With Invalid CustomerID API
    [Documentation]  searchArBillingCustomers With Invalid CustomerID API [SWPL-T4208|SWR3-T3087]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4208
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_bedrock  atr_mutation    uid_searchArBillingCustomers  uid_SWPL-T4208  uid_SWR3-T3087

    Set Local Variable    ${billCustId}    12345 

    # This one should return a set of customers
    ${keyword_response}=  searchArBillingCustomers API    ${global_test_data}[page_1]    
    ...    ${global_test_data}[size_1]    ${global_test_data}[sort_1]    ${billCustId}    ${None}

    Log To Console    ${keyword_response}    
    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=No elements returned by searchArBillingCustomers
    #Match In JSON List    ${keyword_response}[content]    billingCustomerId    ${billCustId}
    No Match In JSON List    ${keyword_response}[content]    billingCustomerId    ${billCustId}

Validate searchArBillingCustomers Without CustomerID API
    [Documentation]  searchArBillingCustomers [SWPL-T4208|SWR3-T3087]
    # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/58e4669f-072f-4b3b-8597-dcea3caf0fea
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4208
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_bedrock  atr_mutation    uid_searchArBillingCustomers  uid_SWPL-T4208  uid_SWR3-T3087

    Set Local Variable    ${billCustId}    ${global_test_data}[billing_customer_id_1] 

    # This one should return a set of customers
    ${keyword_response}=  searchArBillingCustomers Without CustomerId API    ${global_test_data}[page_1]    
    ...    ${global_test_data}[size_1]    ${global_test_data}[sort_1]    ${None}    
    ${totalElements}=    Convert To Integer    ${keyword_response}[totalElements]
    Should Not Be Equal As Integers    ${totalElements}    0    msg=No elements returned by searchArBillingCustomers
    Match In JSON List    ${keyword_response}[content]    billingCustomerId    ${billCustId}

Validate searchArBillingCustomers Without Param API
    [Documentation]  searchArBillingCustomers Without Param API [SWPL-T4208|SWR3-T3087]
    # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4208
    [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_bedrock  atr_mutation    uid_searchArBillingCustomers  uid_SWPL-T4208  uid_SWR3-T3087

    # This one should return a set of customers
    ${keyword_response}=    searchArBillingCustomers Without Param API
    ${response}=    Convert To String    ${keyword_response}
    Should Contain    ${response}     invalid value

