#** API Calls in this file
#** createUpdateLeadSources
#** createUpdateLeadSourceTypes
#** fetchReferenceLibraryCities
#** fetchReferenceLibraryLeadSources
#** fetchReferenceLibraryLeadSourceTypes
#** getCityZip
#** getDepartments
#** getLeadSourcesPageable
#** getLeadSourceTypesPageable
#** queryLeadSources
#** queryLeadSourceTypes

*** Settings ***
Resource  ../../public_api_objects/core_objects.robot

Suite Setup  Get Data from CSV  folder_name=public_apis  file_name=core_public_api.csv

*** Test Cases ***
Validate createUpdateLeadSources API
  [Documentation]  createUpdateLeadSources [SWPL-T4134|SWR3-T3013]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/1c859730-3aec-49ed-a6b6-6d3e2cac980e
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4134
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_mutation
  ...     uid_createUpdateLeadSources  uid_SWPL-T4134  uid_SWR3-T3013

  ${new_dnis}=  Create Random String  10  NUMBERS
  Set Local Variable  ${LeadSourceId}  ${global_test_data}[lead_source_id_1]
  ${keyword_response}=  createUpdateLeadSources API  ${LeadSourceId}  ${global_test_data}[lead_source_code_1]  ${global_test_data}[lead_source_type_1]  
  ...  ${global_test_data}[lead_source_active_1]  ${new_dnis}

  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]  
  ${testData}=  Convert To Upper Case  ${global_test_data}[successful]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Lead Source Create/Update not successful

  Set Global Variable  ${testId}   ${keyword_response}[leadSource][id]
  Should Be Equal As Integers  ${testId}  ${LeadSourceId}  msg=Lead Source Id is not the same

  Set Global Variable  ${testDnis}   ${keyword_response}[leadSource][dnis]
  Should Be Equal As Integers  ${testDnis}  ${new_dnis}  msg=Generated DNIS is not the same

Validate createUpdateLeadSourceTypes API
  [Documentation]  createUpdateLeadSourceTypes [SWPL-T4133|SWR3-T3012]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/728ae322-dcb2-4cfa-b1e2-6e7ac4d254d8
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4133
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_mutation
  ...     uid_createUpdateLeadSourceTypes  uid_SWPL-T4133  uid_SWR3-T3012

  Set Local Variable  ${Id}  ${global_test_data}[lead_source_id_1]
  Set Local Variable  ${Code1}  ${global_test_data}[lead_source_code_1]
  Set Local Variable  ${Code2}  ${global_test_data}[lead_source_code_2]
  Set Local Variable  ${active}  ${global_test_data}[lead_source_active_1]

  # change code
  ${keyword_response}=  createUpdateLeadSourceTypes API  ${Id}  ${Code2}  ${active}
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]  
  ${testData}=  Convert To Upper Case  ${global_test_data}[public_api_success_create]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=First Lead Source Type Create/Update not successful

  Set Local Variable  ${testCode}  ${keyword_response}[leadSourceType][code]
  Should Be Equal As Strings  ${testCode}  ${Code2}  msg=Code did not change

  # change code back
  ${keyword_response}=  createUpdateLeadSourceTypes API  ${Id}  ${Code1}  ${active}    
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]  
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Second Lead Source Type Create/Update not successful

  Set Local Variable  ${testCode}  ${keyword_response}[leadSourceType][code]
  Should Be Equal As Strings  ${testCode}  ${Code1}  msg=Code did not change

Validate fetchReferenceLibraryCities API
  [Documentation]  fetchReferenceLibraryCities [SWPL-T4202|SWR3-T3081]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/2a6a0efe-d6da-44d4-ab83-4d1385523b71
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4202
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_fetchReferenceLibraryCities  uid_SWPL-T4202  uid_SWR3-T3081
  Set Local Variable  ${zip}  ${global_test_data}[zip_3]
  ${keyword_response}=  fetchReferenceLibraryCities API  ${zip}
  #Match In JSON List  ${keyword_response}  zip  ${global_test_data}[zip_3]
 
Validate fetchReferenceLibraryCities API Negative
  [Documentation]  Tests fetchReferenceLibraryCities API with invalid inputs [SWPL-T4202-NEG|SWR3-T3081-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_fetchReferenceLibraryCities  uid_SWPL-T4202_negative  uid_SWR3-T3081_negative  negative_tc

  ${invalid_zip}=  Set Variable  99999  # Using 99999 as an invalid zip code
  ${fetchReferenceLibraryCities_response}=  fetchReferenceLibraryCities API  ${invalid_zip}
  
  ${response_length}=  Get Length  ${fetchReferenceLibraryCities_response}
  Should Be Equal As Integers  ${response_length}  0  msg=Response should be an empty list for non-existent zip code

Validate fetchReferenceLibraryLeadSources API
  [Documentation]  fetchReferenceLibraryLeadSources [SWPL-T4218|SWR3-T3097]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4218
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query    cmp_chiirp_api
  ...     uid_fetchReferenceLibraryLeadSources  uid_SWPL-T4218  uid_SWR3-T3097

  ${keyword_response}=  fetchReferenceLibraryLeadSources API
  Match In JSON List  ${keyword_response}  id  ${global_test_data}[lead_source_id_1]  code  ${global_test_data}[lead_source_code_1]

Validate fetchReferenceLibraryLeadSourcesTypes API
  [Documentation]  fetchReferenceLibraryLeadSourcesTypes [SWPL-T4212|SWR3-T3091]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4212
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query    cmp_chiirp_api
  ...     uid_fetchReferenceLibraryLeadSourcesTypes  uid_SWPL-T4212  uid_SWR3-T3091

  ${keyword_response}=  fetchReferenceLibraryLeadSourceTypes API

  Match Double JSON List  ${keyword_response}  leadSource  id  ${global_test_data}[lead_source_id_1]  type  ${global_test_data}[lead_source_code_1]

Validate getCityZip API
  [Documentation]  getCityZip [SWPL-T4219|SWR3-T3099]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/9354f988-83dd-44c8-a1fe-8cc17cc9553f
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4219
  ...    Zephyr  TBD
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  grp_annie  grp_hello_booked  grp_schedule_engine  atr_query  
  ...     uid_getCityZip  uid_SWPL-T4219  uid_SWR3-T3099

  ${keyword_response}=  GetCityZip API  

  #Match In JSON List  ${keyword_response}  zip  ${global_test_data}[zip_2]  city  ${global_test_data}[city_2]
  
Validate getDepartments API
  [Documentation]  getDepartments [SWPL-T4221|SWR3-T3101]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/15208dd2-a728-45f9-b6cb-b9d293f6449b
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4221
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_getDepartments  uid_SWPL-T4221  uid_SWR3-T3101

  ${keyword_response}=  getDepartments API

  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getDepartments
  Match In JSON List  ${keyword_response}[content]  id  ${global_test_data}[department_id_1]  departmentName  ${global_test_data}[department_name_1]

Validate getDepartmentsWithDname API
  [Documentation]  getDepartmentsWithDname API 
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/15208dd2-a728-45f9-b6cb-b9d293f6449b
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4221
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_getDepartmentswithDname  uid_SWPL-T4221  uid_SWR3-T3101

  #Set Local Variable  ${department_name}  ${global_test_data}[department_name]
  ${keyword_response}=  getDepartmentsWithDname API    ${global_test_data}[page_1]  ${global_test_data}[size_1]    ${global_test_data}[department_name]     

  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getDepartments
  Match In JSON List  ${keyword_response}[content]  departmentName  ${global_test_data}[department_name]

Validate getDepartmentsWithDnamewithNumber API
  [Documentation]  getDepartmentsWithDname API 
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/15208dd2-a728-45f9-b6cb-b9d293f6449b
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4221
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_getDepartmentswithDname  uid_SWPL-T4221  uid_SWR3-T3101

  #Set Local Variable  ${department_name}  ${global_test_data}[department_name]
  ${keyword_response}=  getDepartmentsWithDnamewithNumber API    ${global_test_data}[page_1]  ${global_test_data}[size_1]    ${global_test_data}[department_name]     

  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getDepartments
  Match In JSON List  ${keyword_response}[content]  departmentName  ${global_test_data}[department_name]
  #Match In JSON List  ${keyword_response}[content]  id  ${global_test_data}[department_id_1]  departmentName  ${global_test_data}[department_name]

Validate getLeadSourcesPageable API
  [Documentation]  getLeadSourcesPageable [SWPL-T4216|SWR3-T3095]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/4cc3e21b-cec4-448e-9b46-6bb0d4b6403c
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4216
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_getLeadSourcesPageable  uid_SWPL-T4216  uid_SWR3-T3095

  ${keyword_response}=  getLeadSourcesPageable API  ${global_test_data}[page_1]  ${global_test_data}[size_1]

  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getLeadSourcesPageable
  Match In JSON List  ${keyword_response}[content]  id  ${global_test_data}[lead_source_id_1]  code  ${global_test_data}[lead_source_code_1]

Validate getLeadSourceTypesPageable API
  [Documentation]  getLeadSourceTypesPageable [SWPL-T4191|SWR3-T3070]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/95f304ac-59bc-4c42-b7ff-6167db880fcd
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4191
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_getLeadSourceTypesPageable  uid_SWPL-T4191  uid_SWR3-T3070

  ${keyword_response}=  getLeadSourceTypesPageable API  ${global_test_data}[page_1]  ${global_test_data}[size_1]
  
  ${totalElements}=  Convert To Integer  ${keyword_response}[totalElements]
  Should Not Be Equal As Integers  ${totalElements}  0  msg=No elements returned by getLeadSourceTypesPageable
  Match In JSON List  ${keyword_response}[content]  id  ${global_test_data}[lead_source_id_1]  code  ${global_test_data}[lead_source_code_1]

Validate queryLeadSources API
  [Documentation]  queryLeadSources [SWPL-T4204|SWR3-T3083]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/70c7815b-d703-4cad-8377-ca858fb103d6
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4204
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_queryLeadSources  uid_SWPL-T4204  uid_SWR3-T3083

  ${keyword_response}=  queryLeadSources API

  Case Insensitive Left Match  ${global_test_data}[public_api_fetch_successful]  ${keyword_response}[message]  queryLeadSources not successful
  Match In JSON List  ${keyword_response}[leadSources]  id  ${global_test_data}[lead_source_id_1]  code  ${global_test_data}[lead_source_code_1]

Validate queryLeadSourceTypes API
  [Documentation]  queryLeadSourceTypes [SWPL-T4194|SWR3-T3073]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/bc95c19c-54f2-43b6-98cf-5e755a5ae2c6
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4194
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_queryLeadSourceTypes  uid_SWPL-T4194  uid_SWR3-T3073

  ${keyword_response}=  queryLeadSourceTypes API  ${global_test_data}[lead_source_code_1]
  Case Insensitive Left Match  ${global_test_data}[public_api_fetch_successful]  ${keyword_response}[message]  queryLeadSourceTypes not successful
#  Match In JSON List  ${keyword_response}[leadSourceTypes][0]  id  ${global_test_data}[lead_source_id_1]  code  ${global_test_data}[lead_source_code_1]
  Match Double JSON List  ${keyword_response}[leadSourceTypes]  leadSource  id  ${global_test_data}[lead_source_id_1]  type  ${global_test_data}[lead_source_code_1]

Validate queryLeadSourceTypes API Negative
  [Documentation]  Tests queryLeadSourceTypes API with invalid inputs [SWPL-T4194-NEG|SWR3-T3073-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_core  atr_query
  ...     uid_queryLeadSourceTypes  uid_SWPL-T4194_negative  uid_SWR3-T3073_negative  negative_tc

  ${invalid_code}=  Set Variable  NONEXISTENT_CODE
  ${queryLeadSourceTypes_response}=  queryLeadSourceTypes API  ${invalid_code}
  
  ${is_empty}=  Evaluate  len($queryLeadSourceTypes_response['leadSourceTypes']) == 0
  Should Be True  ${is_empty}  msg=Response leadSourceTypes array should be empty for non-existent code