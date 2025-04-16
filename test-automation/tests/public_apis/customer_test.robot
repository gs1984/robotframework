#** API Calls in this file
#** getBillingCustomerById
# getCustomerTitle
# getEquipmentList
# listChangedCustomer
# queryCustomerFlexData
# queryCustomerTitle
# listChangedEquipment
# listOfChangedCustomersWithAgreementDetails

*** Settings ***
Resource  ../../public_api_objects/customer_objects.robot
Resource  ../../utils/csv_utils.robot

Suite Setup  Get Data from CSV  folder_name=public_apis  file_name=customer_public_api.csv

*** Test Cases ***
Validate GetBillingCustomerById API
  [Documentation]  GetBillingCustomerById [SWPL-T4148|SWR3-T3027]
  #  Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/3a20ea32-b868-4454-aa4c-43bf84ab8be7
  #  Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4148
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  atr_query  
  ...     uid_getBillingCustomerById  uid_SWPL-T4148  uid_SWR3-T3027
  ${keyword_response}=  GetBillingCustomerById API  ${global_test_data}[bc_id_1]
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]
  ${testData}=  Convert To Upper Case  ${global_test_data}[public_api_fetch_successful]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Billing customer id is not as expected.

Validate GetBillingCustomerById API Negative
  [Documentation]  Tests GetBillingCustomerById API with invalid inputs [SWPL-T4148-NEG|SWR3-T3027-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  atr_query
  ...     uid_getBillingCustomerById  uid_SWPL-T4148_negative  uid_SWR3-T3027_negative  negative_tc

  ${non_existent_id}=    Generate Random String    10    [NUMBERS]
  ${getBillingCustomerById_response}=    GetBillingCustomerById API    ${non_existent_id}
  
  Should Be Equal    ${getBillingCustomerById_response}[billingCustomer]    ${None}    msg=Response should be None for non-existent billing customer ID
  
  Run Keyword And Expect Error    *    Evaluate    $getBillingCustomerById_response['title']

Validate getCustomerTitle API
  [Documentation]  getCustomerTitle [SWPL-T4206|SWR3-T3085]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/280aba89-94af-4afc-a962-fb53ad0fd2aa
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4206
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  grp_annie  atr_query  atr_not_finished
  ...     uid_getCustomerTitle  uid_SWPL-T4206  uid_SWR3-T3085

  ${keyword_response}=  getCustomerTitle API  ${global_test_data}[customer_id_1]    ${global_test_data}[title]
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}
  ${testData}=  Convert To Upper Case  ${global_test_data}[title]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Customer title is not as expected.

Validate getEquipmentList API
  [Documentation]  getEquipmentList [SWPL-T4200|SWR3-T3079]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/b9537815-f612-43ee-ab72-1218c5dba136
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4200
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  grp_annie  atr_query  atr_not_finished
  ...     uid_getEquipmentList  uid_SWPL-T4200  uid_SWR3-T3079

    ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
    ${size}=  Convert To Integer  ${global_test_data}[size]
    ${unitType}=  getEquipmentList API  ${pageId}  ${size}  ${global_test_data}[unitType]
    Should Be Equal As Strings  ${unitType}  AIRH  msg=Unit type is not as expected.

Validate getEquipmentList API Negative
  [Documentation]  Tests getEquipmentList API with invalid inputs [SWPL-T4200-NEG|SWR3-T3079-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  grp_annie  atr_query
  ...     uid_getEquipmentList  uid_SWPL-T4200_negative  uid_SWR3-T3079_negative  negative_tc

  ${valid_pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${valid_size}=  Convert To Integer  ${global_test_data}[size]
  ${valid_unitType}=  Set Variable  ${global_test_data}[unitType]

  ${invalid_unitType}=  Set Variable  NONEXISTENT_TYPE
  ${response}=  getEquipmentList API  ${valid_pageId}  ${valid_size}  ${invalid_unitType}
  
  ${content_length}=  Get Length  ${response}[content]
  Should Be Equal As Integers  ${content_length}  0  msg=Content array should be empty for invalid unitType

Validate listChangedCustomer API
  [Documentation]  listChangedCustomer [SWPL-T4190|SWR3-T3069]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/8a266b9d-72d1-4a31-9f74-785341570083
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4190
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  grp_customer_lobby  atr_query  atr_not_finished
  ...     uid_listChangedCustomer  uid_SWPL-T4190  uid_SWR3-T3069

  ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${keyword_response}=  listChangedCustomer API  ${global_test_data}[changedAfter]  ${pageId}  ${size}  ${global_test_data}[sortBy]
  
  ${keys}=  Get Dictionary Keys  ${keyword_response['data']['listChangedCustomer']}
  Log  Keys: ${keys}

  ${total_field_present}=  Set Variable  ${False}
  FOR  ${key}  IN  @{keys}
      IF  'total' in $key
          Set Test Variable  ${total_field_present}  ${True}
          Exit For Loop
      END
  END

  Should Be True  ${total_field_present}  msg=Total field is not present in the response.

Validate listChangedCustomer API Negative
  [Documentation]  Tests listChangedCustomer API with invalid inputs [SWPL-T4190-NEG|SWR3-T3069-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  grp_customer_lobby  atr_query
  ...     uid_listChangedCustomer  uid_SWPL-T4190_negative  uid_SWR3-T3069_negative  negative_tc

  ${valid_changedAfter}=  Set Variable  ${global_test_data}[changedAfter]
  ${valid_pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${valid_size}=  Convert To Integer  ${global_test_data}[size]
  ${valid_sortBy}=  Set Variable  ${global_test_data}[sortBy]

  # Test 1: Invalid changedAfter
  ${invalid_changedAfter}=  Set Variable  INVALID-DATE-FORMAT
  ${response1}=  listChangedCustomer API  ${invalid_changedAfter}  ${valid_pageId}  ${valid_size}  ${valid_sortBy}
  
  ${is_content_none1}=  Run Keyword And Return Status  Should Be Equal  ${response1}[data][listChangedCustomer][content]  ${None}
  ${is_content_empty1}=  Run Keyword And Return Status  Should Be Empty  ${response1}[data][listChangedCustomer][content]
  ${validation_passed1}=  Evaluate  $is_content_none1 or $is_content_empty1
  Should Be True  ${validation_passed1}  msg=Response should have null data or empty content for invalid changedAfter

  # Test 2: Invalid pageId
  ${invalid_pageId}=  Evaluate  -1
  ${response2}=  listChangedCustomer API  ${valid_changedAfter}  ${invalid_pageId}  ${valid_size}  ${valid_sortBy}
  
  ${is_content_none2}=  Run Keyword And Return Status  Should Be Equal  ${response2}[data][listChangedCustomer][content]  ${None}
  ${is_content_empty2}=  Run Keyword And Return Status  Should Be Empty  ${response2}[data][listChangedCustomer][content]
  ${validation_passed2}=  Evaluate  $is_content_none2 or $is_content_empty2
  Should Be True  ${validation_passed2}  msg=Response should have null data or empty content for invalid pageId

  # Test 3: Invalid size
  ${invalid_size}=  Evaluate  -1
  ${response3}=  listChangedCustomer API  ${valid_changedAfter}  ${valid_pageId}  ${invalid_size}  ${valid_sortBy}
  
  ${is_content_none3}=  Run Keyword And Return Status  Should Be Equal  ${response3}[data][listChangedCustomer][content]  ${None}
  ${is_content_empty3}=  Run Keyword And Return Status  Should Be Empty  ${response3}[data][listChangedCustomer][content]
  ${validation_passed3}=  Evaluate  $is_content_none3 or $is_content_empty3
  Should Be True  ${validation_passed3}  msg=Response should have null data or empty content for invalid size
Validate queryCustomerFlexData API
##stub
  [Documentation]  queryCustomerFlexData []
  # Test Rigor: none
  # Zephyr: None
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  atr_query  atr_not_finished
  ...     uid_queryCustomerFlexData

  ${keyword_response}=  queryCustomerFlexData API

Validate queryCustomerTitle API
  [Documentation]  queryCustomerTitle [SWPL-T4156|SWR3-T3035]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/3ce3f760-e731-4b8d-b5ef-6c8a35534d8e
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4156
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  atr_query  atr_not_finished
  ...     uid_queryCustomerTitle  uid_SWPL-T4156  uid_SWR3-T3035

  ${keyword_response}=  queryCustomerTitle API    ${global_test_data}[title]

  Log  Response Title: ${keyword_response}
  Should Be Equal As Strings  ${keyword_response}  ${global_test_data}[title]  msg=Title does not match expected value.

Validate listChangedEquipment API
  [Documentation]  Validate listChangedEquipment API 
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api
  ...     uid_queryCustomerTitle  
  #${modifyDate}=    Convert T     ${global_test_data}[modifyDate]
  ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${keyword_response}=  listChangedEquipment API  ${global_test_data}[modifyDate]  ${pageId}  ${size}  ${global_test_data}[sortBy_id]

  Log To Console    RESPONSE: ${keyword_response}
  
  ${keys}=  Get Dictionary Keys  ${keyword_response['data']['listChangedEquipment']}
  Log  Keys: ${keys}

  ${total_field_present}=  Set Variable  ${False}
  FOR  ${key}  IN  @{keys}
      IF  'total' in $key
          Set Test Variable  ${total_field_present}  ${True}
          Exit For Loop
      END
  END
  Should Be True  ${total_field_present}  msg=Total field is not present in the response.

Validate listChangedEquipment with Invalid Date API
  [Documentation]  Validate listChangedEquipment API 
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api
  ...     uid_queryCustomerTitle  
  ${modifyDate}=    Set Variable    12121000
  ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${keyword_response}=  listChangedEquipment API  ${modifyDate}  ${pageId}  ${size}  ${global_test_data}[sortBy_id]

  Log To Console    RESPONSE: ${keyword_response}
  
  ${keys}=  Get Dictionary Keys  ${keyword_response['data']['listChangedEquipment']}
  Log  Keys: ${keys}

  ${total_field_present}=  Set Variable  ${False}
  FOR  ${key}  IN  @{keys}
      IF  'total' in $key
          Set Test Variable  ${total_field_present}  ${True}
          Exit For Loop
      END
  END
  Should Be True  ${total_field_present}  msg=Total field is not present in the response.

Validate listChangedEquipment Without Param API
  [Documentation]  Validate listChangedEquipment API 
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api
  ...     uid_queryCustomerTitle  
  
  ${keyword_response}=  listChangedEquipment Withput Param API  

  Log To Console    RESPONSE: ${keyword_response}  
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value

Validate listOfChangedCustomersWithAgreementDetails API
  [Documentation]  Validate listOfChangedCustomersWithAgreementDetails API 
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api
  ...     uid_queryCustomerTitle  
  #${modifyDate}=    Convert T     ${global_test_data}[modifyDate]
  ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${keyword_response}=  listOfChangedCustomersWithAgreementDetails API  ${global_test_data}[changedAfter]  ${pageId}  ${size}  ${global_test_data}[sortBy]

  Log To Console    RESPONSE: ${keyword_response}
  
  ${keys}=  Get Dictionary Keys  ${keyword_response['data']['listOfChangedCustomersWithAgreementDetails']}
  Log  Keys: ${keys}

  ${total_field_present}=  Set Variable  ${False}
  FOR  ${key}  IN  @{keys}
      IF  'total' in $key
          Set Test Variable  ${total_field_present}  ${True}
          Exit For Loop
      END
  END
  Should Be True  ${total_field_present}  msg=Total field is not present in the response.

Validate listOfChangedCustomersWithAgreementDetails with Invalid Date API
  [Documentation]  Validate listOfChangedCustomersWithAgreementDetails API 
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api
  ...     uid_queryCustomerTitle  
  ${changedAfter}=    Set Variable    12121000
  ${pageId}=  Convert To Integer  ${global_test_data}[pageId]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${keyword_response}=  listOfChangedCustomersWithAgreementDetails API  ${changedAfter}  ${pageId}  ${size}  ${global_test_data}[sortBy]

  Log To Console    RESPONSE: ${keyword_response}
  
  ${keys}=  Get Dictionary Keys  ${keyword_response['data']['listOfChangedCustomersWithAgreementDetails']}
  Log  Keys: ${keys}
  ${total_field_present}=  Set Variable  ${False}
  FOR  ${key}  IN  @{keys}
      IF  'total' in $key
          Set Test Variable  ${total_field_present}  ${True}
          Exit For Loop
      END
  END
  Should Be True  ${total_field_present}  msg=Total field is not present in the response.

Validate listOfChangedCustomersWithAgreementDetails Without Param API
  [Documentation]  Validate listOfChangedCustomersWithAgreementDetails Without Param API
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_customer  cmp_chiirp_api    
  ...     uid_queryCustomerTitle  
 
  ${keyword_response}=  listOfChangedCustomersWithAgreementDetails Without Param API  
  Log To Console    RESPONSE: ${keyword_response}
  
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value
  