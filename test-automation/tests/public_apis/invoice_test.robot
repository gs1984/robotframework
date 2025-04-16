#** API Calls in this file
#** getCustomInvoiceById
#** listChangedInvoice
# queryCustomInvoiceById
# updateARInvoice
# updateARInvoiceItem - not available yet

*** Settings ***
Resource  ../../utils/csv_utils.robot
Resource  ../../public_api_objects/invoice_objects.robot

Suite Setup  Get Data from CSV  folder_name=public_apis  file_name=invoice_public_api.csv

*** Test Cases ***
Validate GetCustomInvoiceById API
  [Documentation]  GetCustomInvoiceById [SWPL-T4193|SWR3-T3072]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/c6b3727b-e299-4873-a15d-20d30bf69df3
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4193
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  grp_hello_booked
  ...     uid_getCustomInvoiceById  uid_SWPL-T4193  uid_SWR3-T3072  atr_query
    ${keyword_response}=  GetCustomInvoiceById API  ${global_test_data}[custom_inv_id_1]
    Should Be Equal As Strings  ${keyword_response}[id]  ${global_test_data}[custom_inv_id_1]  msg=Custom invoice id is not as expected.

Validate GetCustomInvoiceById API Negative
  [Documentation]  Tests GetCustomInvoiceById API with invalid inputs [SWPL-T4193-NEG|SWR3-T3072-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  grp_hello_booked
  ...     uid_getCustomInvoiceById  uid_SWPL-T4193_negative  uid_SWR3-T3072_negative  negative_tc  atr_query

  ${non_existent_id}=    Generate Random String    10    [NUMBERS]
  ${keyword_response}=    GetCustomInvoiceById API    ${non_existent_id}
  
  Should Be Equal    ${keyword_response}[id]    ${None}    msg=Response should be None for non-existent custom invoice ID

Validate listChangedInvoice API
  [Documentation]  listChangedInvoice [SWPL-T4164|SWR3-T3043]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/75d948ea-c628-4e8a-a689-138e0e3088fb
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4164
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_query
  ...     uid_listChangedInvoice  uid_SWPL-T4164  uid_SWR3-T3043

  ${keyword_response}=  listChangedInvoice API  ${global_test_data}[modify_date_1]  ${global_test_data}[page_1]  ${global_test_data}[size_1]  ${global_test_data}[sort_1]
  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Set Local Variable  ${content}  ${keyword_response}[content]
  IF  ${totalElements}==0
    Pass Execution  message=No elements found
  END  
  IF  ${totalElements}!=0
    Should Not Be Empty  ${content}  msg=No content for listChangedInvoice  
  END

Validate listChangedInvoice With InvalidID API
  [Documentation]  listChangedInvoice With InvalidID API [SWPL-T4164|SWR3-T3043]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/75d948ea-c628-4e8a-a689-138e0e3088fb
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4164
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_query
  ...     uid_listChangedInvoice  uid_SWPL-T4164  uid_SWR3-T3043
  ${modify_date_invalid}=    Convert Date    "1212-12-12" 
  ${keyword_response}=  listChangedInvoice API  ${modify_date_invalid}  ${global_test_data}[page_1]  ${global_test_data}[size_1]  ${global_test_data}[sort_1]
   #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     None

Validate listChangedInvoice Without Modify Date API
  [Documentation]  Validate listChangedInvoice Without Modify Date API [SWPL-T4164|SWR3-T3043]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/75d948ea-c628-4e8a-a689-138e0e3088fb
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4164
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_query
  ...     uid_listChangedInvoice  uid_SWPL-T4164  uid_SWR3-T3043

  ${keyword_response}=  listChangedInvoice Without Param API  
  Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value 

Validate queryCustomInvoiceById API
  [Documentation]  queryCustomInvoiceById [SWPL-T4192|SWR3-T3071]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/f5a21203-74f2-4f78-b01f-f4cb319672b5
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4192
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_mutation  atr_not_finished
  ...     uid_queryCustomInvoiceById  uid_SWPL-T4192  uid_SWR3-T3071

  ${keyword_response}=  queryCustomInvoiceById API    ${global_test_data}[custom_inv_id_1]

  Log  Response Data: ${keyword_response}
  Should Contain  ${keyword_response}  ${global_test_data}[custom_inv_id_1]  msg=Invoice ID does not match expected value.

Validate queryCustomInvoiceById API Negative
  [Documentation]  Tests queryCustomInvoiceById API with invalid inputs [SWPL-T4192-NEG|SWR3-T3071-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_mutation
  ...     uid_queryCustomInvoiceById  uid_SWPL-T4192_negative  uid_SWR3-T3071_negative  negative_tc

  ${non_existent_id}=    Generate Random String    10    [NUMBERS]
  
  ${keyword_response}=  queryCustomInvoiceById API    ${non_existent_id}
  Should Be Equal    ${keyword_response}    ${None}    msg=Response should be None for non-existent custom invoice ID

Validate updateARInvoice API
##stub
  [Documentation]  updateARInvoice  [SWPL-T4130|SWR3-T3009]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ed3e520b-b10a-44ec-ae4e-e8635e1e6e8e
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4130
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_invoice  atr_mutation  atr_not_finished
  ...     uid_updateARInvoice  uid_SWPL-T4130  uid_SWR3-T3009

  # Test Case 1: Invoice already posted
  ${result}=  UpdateARInvoice API    ${global_test_data}[ar_inv_id_1]  ${global_test_data}[ar_inv_number_1]
  Log  Result: ${result}
  Should Contain  ${result}  Invoice already Posted  msg=Expected message not found.

  # # Test Case 2: Invoice number is not unique
  # ${result}=  UpdateARInvoice API  ${global_test_data}[ar_inv_id_2]  ${global_test_data}[ar_inv_number_2]
  # Log  Result: ${result}
  # Should Contain  ${result}  canceled/voided  msg=Expected message not found.
  # Should Contain  ${result}  Invoice Number is not unique  msg=Expected message not found.

  # # Test Case 3: Invoice does not match
  # ${result}=  UpdateARInvoice API  ${global_test_data}[ar_inv_id_3]  ${global_test_data}[ar_inv_number_3]
  # Log  Result: ${result}
  # Should Contain  ${result}  does not match  msg=Expected message not found.

  # # Test Case 4: Invoice updated successfully
  # ${result}=  UpdateARInvoice API  ${global_test_data}[ar_inv_id_4]  ${global_test_data}[ar_inv_number_4]
  # Log  Result: ${result}
  # Should Contain  ${result}  Updated successfully  msg=Expected message not found.

Validate updateARInvoiceItem API
##stub
  [Documentation]  updateARInvoiceItem
  # Test Rigor: none
  # Zephyr: none
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_mutation  atr_not_finished
  ...     uid_updateARInvoiceItem  uid_SWPL-T

  ${keyword_response}=  updateARInvoiceItem API