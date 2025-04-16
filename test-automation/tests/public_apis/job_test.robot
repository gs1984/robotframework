#** API Calls in this file
#** cancelJob
#** createJob
# createUpdateJobClasses
# createUpdateJobType
# getJobAndCall
# getJobClasses
# getJobClassesList
# jobAdd
# queryJobAndCalls
# queryJobClasses
# queryJobClassJobType
# searchJobs
# updateJobDetail
# updateJobNotesById

*** Settings ***
Resource    ../../public_api_objects/job_objects.robot
Resource    ../../utils/csv_utils.robot

Suite Setup    Get Data from CSV  folder_name=public_apis  file_name=job_public_api.csv

*** Test Cases ***
Validate cancelJob API
  [Documentation]  cancelJob [SWPL-T4143|SWR3-T3022|SWR3-T3021]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/f0ebcbaa-9f42-401a-8517-97658755562f 
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/fb680e3c-2668-4ff3-bf1c-71b09d7e812b 
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4143
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_mutation  
  ...     uid_cancelJob  uid_SWPL-T4143  uid_SWR3-T3022  uid_SWR3-T3021

  # Check that an invalid job gives proper message
  ${keyword_response}=  cancelJob API  ${global_test_data}[invalid_job_id_1]  ${global_test_data}[canceled_notes_1]  ${global_test_data}[replace_notes_1]
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]
  ${testData}=  Convert To Upper Case  ${global_test_data}[canceled_invalid_status_1]
  Should Start With  ${upcaseMessage}  ${testData}  msg=Invalid job check unsuccessful

  # Check that a nonexistant job gives proper message  job_canceled_not_found_1
  ${keyword_response}=  cancelJob API  ${global_test_data}[nonexistant_job_id_1]  ${global_test_data}[canceled_notes_1]  ${global_test_data}[replace_notes_1]
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]
  ${testData}=  Convert To Upper Case  ${global_test_data}[canceled_not_found_1]
  Should Start With  ${upcaseMessage}  ${testData}  msg=Nonexistant job check unsuccessful

Validate createJob API
  [Documentation]  createJob [SWPL-T4165|SWR3-T3044]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/dcea2ae6-7529-49f8-b7a5-1bc626a181d0 
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4165
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_mutation  atr_not_finished
  ...     uid_createJob  uid_SWPL-T4165  uid_SWR3-T3044
  ${create_estimatedDuration}=  Convert To Integer     ${global_test_data}[create_estimatedDuration_1]
  ${create_priority}=  Convert To Boolean     ${global_test_data}[create_priority_1]
  ${isSalesEst}=  Convert To Boolean  ${global_test_data}[create_saleEst_1]
  ${create_employeeCode}    Set Variable    null
  #${create_employeeCode}=  Convert To Integer     ${global_test_data}[create_employeeCode_1]      
  # Check that a Job can be created and store id in jobId variable
  ${keyword_response}=  createJob API  ${global_test_data}[create_jobClass_1]  ${global_test_data}[create_jobType_1]  ${global_test_data}[create_jobTypeDescription_1]
  ...  ${global_test_data}[create_timePreference_1]  ${global_test_data}[create_locationId_1]  ${create_estimatedDuration}
  ...  ${global_test_data}[create_callbackJobNumber_1]  ${global_test_data}[create_category_1]  ${global_test_data}[create_scheduledFor_1]
  ...  ${global_test_data}[create_zoneId_1]  ${global_test_data}[create_departmentId_1]  ${global_test_data}[create_startTimePreference_1]
  ...  ${global_test_data}[create_endTimePreference_1]  ${create_employeeCode}  ${global_test_data}[create_leadSourceTypeId_1]
  ...  ${global_test_data}[create_leadSourceId_1]  ${global_test_data}[create_status_1]  ${global_test_data}[create_arBillingCustomerId_1]
  ...  ${isSalesEst}  ${global_test_data}[create_customerPONumber_1]  ${global_test_data}[create_contact_1]  ${global_test_data}[create_claimNo_1]
  ...  ${global_test_data}[create_contractNo_1]  ${global_test_data}[create_sendBooked_1]  ${global_test_data}[create_sendReminder_1]  ${global_test_data}[create_callId_1]
  ...  ${create_priority}  ${global_test_data}[create_serviceAccountId_1]  ${global_test_data}[create_workRequestNotes_1]
  ...  ${global_test_data}[create_isNotified_1]  ${global_test_data}[create_priorityLevel_1]

  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]
  ${testData}=  Convert To Upper Case  ${global_test_data}[public_api_success_create]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Job not created successfully

  # Save for later cancel job
  #&{jobData}=  Create Dictionary  ${keyword_response}[jobData]
  Set Local Variable  ${jobData}    ${keyword_response}[jobData]
  Set Local Variable  ${jobId}  ${jobData}[id]

  # Test Job data
  ### this section is for verification of job data, not currently done for test rigor

  # Cancel the newly created job
  ${keyword_response}=  cancelJob API  ${jobId}  ${global_test_data}[canceled_notes_2]  ${global_test_data}[replace_notes_1]
  ${upcaseMessage}=  Convert To Upper Case  ${keyword_response}[message]
  ${testData}=  Convert To Upper Case  ${global_test_data}[canceled_successfully_1]
  Should Be Equal As Strings  ${upcaseMessage}  ${testData}  msg=Job not cancelled successfully

Validate createUpdateJobClasses API
  [Documentation]  createUpdateJobClasses [SWPL-T4136|SWR3-T3015]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/b911b1c4-be76-4ca1-beec-9f2e99eccde6
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4136
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_mutation  atr_not_finished
  ...     uid_createUpdateJobClasses  uid_SWPL-T4136  uid_SWR3-T3015

  ${jobClassId}=  Set Variable  ${global_test_data}[jobClassId]
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${active}=  Convert To Boolean  ${global_test_data}[active]
  ${isSalesEst}=  Convert To Boolean  ${global_test_data}[isSalesEst]

  ${response}=  CreateUpdateJobClasses API  ${jobClassId}  ${jobClass}  ${active}  ${isSalesEst}

  ${response_string}=  Convert To String  ${response}
  Should Contain Any  ${response_string}  JOB_CLASS_CODE_TENANT_ID_UNIQUE  JOB_CLASS_CODE_UNIQUE
  ...  msg=Response does not contain expected values.

Validate createUpdateJobType API
  [Documentation]  createUpdateJobType [SWPL-T4135|SWR3-T3014]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e157a682-869f-46e7-8d18-87dd71835aa6
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4135
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_mutation  atr_not_finished
  ...     uid_createUpdateJobType  uid_SWPL-T4135  uid_SWR3-T3014

  ${jobTypeId}=  Set Variable  ${global_test_data}[jobTypeId]
  ${code}=  Set Variable  ${global_test_data}[code]
  ${description}=  Set Variable  ${global_test_data}[description]
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${department}=  Set Variable  ${global_test_data}[department]
  ${estimatedDuration}=  Set Variable  ${global_test_data}[estimatedDuration]
  ${estimatedDays}=  Set Variable  ${global_test_data}[estimatedDays]
  ${estimatedDayHours}=  Set Variable  ${global_test_data}[estimatedDayHours]
  ${estimatedDayManHours}=  Set Variable  ${global_test_data}[estimatedDayManHours]
  ${isPermitRequired}=  Convert To Boolean  ${global_test_data}[isPermitRequired]
  ${active}=  Convert To Boolean  ${global_test_data}[active]

  ${response}=  CreateUpdateJobType API  ${jobTypeId}  ${code}  ${description}  ${jobClass}  ${department}  ${estimatedDuration}  ${estimatedDays}  ${estimatedDayHours}  ${estimatedDayManHours}  ${isPermitRequired}  ${active}

  ${response_string}=  Convert To String  ${response}
  Should Contain Any  ${response_string}  Created successfully  JOB_TYPE_CODE_JOB_CLASS_ID_UNIQUE
  ...  msg=Response does not contain expected values.

Validate getJobAndCall API
  [Documentation]  getJobAndCall [SWPL-T217|SWR3-T3096]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ce1098f3-9ba8-401e-8326-2c40801f86f9
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4217
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getJobAndCall  uid_SWPL-T4217  uid_SWR3-T3096    cmp_chiirp_api

  ${code}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobAndCall API  ${code}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  ElRep  msg=Response does not contain expected value "ElRep".

Validate getJobAndCall API Negative
  [Documentation]  Tests getJobAndCall API with invalid inputs [SWPL-T217-NEG|SWR3-T3096-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_schedule_engine  atr_query
  ...     uid_getJobAndCall  uid_SWPL-T4217_negative  uid_SWR3-T3096_negative  negative_tc    cmp_chiirp_api

  # Test 1: Non-existent code with valid inactive
  ${non_existent_code}=    Set Variable    NONEXISTENT_CODE_XYZ
  ${inactive}=    Convert To Boolean    ${global_test_data}[inactive]
  
  ${response1}=    GetJobAndCall API    ${non_existent_code}    ${inactive}
  Log To Console    RESPONSE1: ${response1}
  ${is_empty}=    Run Keyword And Return Status    Should Be Empty    ${response1}[data][getJobAndCall]
  Should Be True    ${is_empty}    msg=Response should be an empty array for non-existent code

  # Test 2: Valid code with opposite inactive value
  ${code}=    Set Variable    ${global_test_data}[code]
  ${opposite_inactive}=    Evaluate    not ${inactive}
  
  ${response2}=    GetJobAndCall API    ${code}    ${opposite_inactive}
  
  ${response_string}=    Convert To String    ${response2}
  Log To Console    RESPONSE2: ${response_string}
  
  ${has_expected_value}=    Run Keyword And Return Status    Should Contain    ${response_string}    ElRep
  ${is_null}=    Run Keyword And Return Status    Should Be Equal    ${response2}[data][getJobAndCall]    ${None}
  
  ${validation_passed}=    Evaluate    $has_expected_value or $is_null
  Log To Console    Validation: ${validation_passed}
  Should Be True    ${validation_passed}    msg=Response should either not contain expected value or be null for opposite inactive value

Validate getJobClasses API
  [Documentation]  getJobClasses [SWPL-T4215|SWR3-T3094]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/1971af27-62d9-4311-957b-014578c29998
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4215
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  cmp_chiirp_api
  ...     uid_getJobClasses  uid_SWPL-T4215  uid_SWR3-T3094

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${code}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClasses API  ${jobClass}  ${code}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain expected value "Electrical".

Validate getJobClasses With Inactive Status API
  [Documentation]  Validate getJobClasses With Inactive Status API [SWPL-T4215|SWR3-T3094]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4215
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  cmp_chiirp_api
  ...     uid_getJobClasses  uid_SWPL-T4215  uid_SWR3-T3094

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${code}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  True

  ${response}=  GetJobClasses API  ${jobClass}  ${code}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain expected value "Electrical".

Validate getJobClasses With Invalid Job Class API
  [Documentation]  Validate getJobClasses With Invalid Job Class API [SWPL-T4215|SWR3-T3094]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4215
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  cmp_chiirp_api
  ...     uid_getJobClasses  uid_SWPL-T4215  uid_SWR3-T3094

  ${jobClass}=  Set Variable  12345
  ${code}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClasses API  ${jobClass}  ${code}  ${inactive}
  Log To Console    RESPONSE:${response}
  Length Should Be    ${response}    0

Validate getJobClasses With Invalid Code API
  [Documentation]  Validate getJobClasses With Invalid Code API [SWPL-T4215|SWR3-T3094]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4215
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  cmp_chiirp_api
  ...     uid_getJobClasses  uid_SWPL-T4215  uid_SWR3-T3094

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${code}=  Set Variable  TESTAUTO
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClasses API  ${jobClass}  ${code}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain expected value "Electrical".

Validate getJobClasses Without Param API
  [Documentation]  getJobClasses Without Param API [SWPL-T4215|SWR3-T3094]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4215
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  cmp_chiirp_api
  ...     uid_getJobClasses  uid_SWPL-T4215  uid_SWR3-T3094

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${code}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClasses Without Param API

  Log To Console    RESPONSE:${response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value

Validate getJobClassesList API
  [Documentation]  getJobClassesList [SWPL-T4147|SWR3-T3026]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e393520d-a424-4773-b789-2773197544f3
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4147
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_getJobClassesList  uid_SWPL-T4147  uid_SWR3-T3026

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClassesList API  ${jobClass}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain expected value "Electrical".

Validate getJobClassesList With Inactive Status API
  [Documentation]  Validate getJobClassesList With Inactive Status API [SWPL-T4147|SWR3-T3026]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4147
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_getJobClassesList  uid_SWPL-T4147  uid_SWR3-T3026

  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${inactive}=  Convert To Boolean  True

  ${response}=  GetJobClassesList API  ${jobClass}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain expected value "Electrical".

Validate getJobClassesList With Invalid Job Class API
  [Documentation]  alidate getJobClassesList With Invalid Job Class API [SWPL-T4147|SWR3-T3026]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4147
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_getJobClassesList  uid_SWPL-T4147  uid_SWR3-T3026

  ${jobClass}=  Set Variable  12345
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  GetJobClassesList API  ${jobClass}  ${inactive}
  Log To Console    RESPONSE:${response}
  Length Should Be    ${response}    0
  
Validate getJobClassesList Without Job Class API
  [Documentation]  Validate getJobClassesList Without Job Class API [SWPL-T4147|SWR3-T3026]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4147
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_getJobClassesList  uid_SWPL-T4147  uid_SWR3-T3026

  # ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  # ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]

  ${response}=  GetJobClassesList Without Param API 

  Log To Console    RESPONSE:${response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value

Validate jobAdd API
##stub
  [Documentation]  jobAdd [SWPL-T4113|SWR3-T2992]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/5f39bdbc-1814-46fd-af5b-75d2d6ffdd96
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4113
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_jobAdd  uid_SWPL-T4113  uid_SWR3-T2992

    ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
    ${jobType}=  Set Variable  ${global_test_data}[jobType]
    ${jobTypeDescription}=  Set Variable  ${global_test_data}[jobTypeDescription]
    ${locationId}=  Set Variable  ${global_test_data}[locationId]
    ${estimatedDuration}=  Set Variable  ${global_test_data}[estimatedDuration]
    ${category}=  Set Variable  ${global_test_data}[category]
    ${scheduledFor}=  Set Variable  ${global_test_data}[scheduledFor]
    ${departmentId}=  Set Variable  ${global_test_data}[departmentId]
    ${leadSourceTypeId}=  Set Variable  ${global_test_data}[leadSourceTypeId]
    ${leadSourceId}=  Set Variable  ${global_test_data}[leadSourceId]
    ${status}=  Set Variable  ${global_test_data}[status]
    ${serviceAccountId}=  Set Variable  ${global_test_data}[serviceAccountId]
    ${workRequestNotes}=  Set Variable  ${global_test_data}[workRequestNotes]

    ${response}=  jobAdd API  ${jobClass}  ${jobType}  ${jobTypeDescription}  ${locationId}  ${estimatedDuration}  ${category}  ${scheduledFor}  ${departmentId}  ${leadSourceTypeId}  ${leadSourceId}  ${status}  ${serviceAccountId}  ${workRequestNotes}
    ${response_string}=  Convert To String  ${response}
    Should Contain  ${response_string}  CREATED SUCCESSFULLY  msg=Response does not contain the expected value.

Validate queryJobAndCalls API
  [Documentation]  queryJobAndCalls [SWPL-T4137|SWR3-T3016]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ee9174a1-52cf-48ee-a8a4-0ccc93ed99ae
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4137
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobAndCalls  uid_SWPL-T4137  uid_SWR3-T3016
  
  ${jobCode}=  Set Variable  ${global_test_data}[code]
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobAndCalls API    ${jobCode}    ${inactive}
  Log To Console    RESPONSE:${response}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Fetched successfully  msg=Response does not contain the expected value.

Validate queryJobAndCalls With Inactive Status API
  [Documentation]  Validate queryJobAndCalls With Inactive Status API [SWPL-T4137|SWR3-T3016]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4137
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobAndCalls  uid_SWPL-T4137  uid_SWR3-T3016

  ${inactive}=  Convert To Boolean  True
  ${jobCode}=  Set Variable  ${global_test_data}[code]
  #${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobAndCalls API    ${jobCode}    ${inactive}

  ${response_string}=  Convert To String  ${response}
  Log To Console    RESPONSE:${response}
  Should Contain  ${response_string}  Fetched successfully  msg=Response does not contain the expected value.

Validate queryJobAndCalls with Invalid Job Code API
  [Documentation]  alidate queryJobAndCalls with Invalid Job Code API [SWPL-T4137|SWR3-T3016]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ee9174a1-52cf-48ee-a8a4-0ccc93ed99ae
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4137
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobAndCalls  uid_SWPL-T4137  uid_SWR3-T3016
  
  ${jobCode}=  Set Variable  12345
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobAndCalls API    ${jobCode}    ${inactive}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  None  msg=Response does not contain the expected value.

Validate queryJobAndCalls Without JobCode API
  [Documentation]  Validate queryJobAndCalls Without JobCode API [SWPL-T4137|SWR3-T3016]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ee9174a1-52cf-48ee-a8a4-0ccc93ed99ae
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4137
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobAndCalls  uid_SWPL-T4137  uid_SWR3-T3016  

  ${response}=  queryJobAndCalls Without Param API
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value
  

Validate queryJobClasses API
  [Documentation]  queryJobClasses [SWPL-T4201|SWR3-T3080]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/6bbe3997-b846-4f98-9c92-c3754b19f351
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4201
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  atr_not_finished
  ...     uid_queryJobClasses  uid_SWPL-T4201  uid_SWR3-T3080

  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClasses API  ${global_test_data}[jobClass]  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.

Validate queryJobClasses With Inactive Status API
  [Documentation]  Validate queryJobClasses With Inactive Status API [SWPL-T4201|SWR3-T3080]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4201
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  atr_not_finished
  ...     uid_queryJobClasses  uid_SWPL-T4201  uid_SWR3-T3080

  ${inactive}=  Convert To Boolean  True
  ${response}=  queryJobClasses API  ${global_test_data}[jobClass]  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.

Validate queryJobClasses With Invalid Job Class API
  [Documentation]  Validate queryJobClasses With Invalid Job Class API [SWPL-T4201|SWR3-T3080]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4201
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  atr_not_finished
  ...     uid_queryJobClasses  uid_SWPL-T4201  uid_SWR3-T3080

  ${jobClass}=  Set Variable  12345
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClasses API  ${jobClass}  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  None  msg=Response does not contain the expected value.

Validate queryJobClasses Without Job Class API
  [Documentation]  Validate queryJobClasses Without Job Class API [SWPL-T4201|SWR3-T3080]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4201
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_query  atr_not_finished
  ...     uid_queryJobClasses  uid_SWPL-T4201  uid_SWR3-T3080

  ${response}=  queryJobClasses Without Param API  

  Log To Console    RESPONSE:${response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value

Validate queryJobClassJobType API
  [Documentation]  queryJobClassJobType [SWPL-T4155|SWR3-T3034]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e7878073-13d2-44df-ae95-855aafea46d9
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034

  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType API  ${global_test_data}[jobClassCode]  ${global_test_data}[jobTypeCode]  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.

Validate queryJobClassJobType With Invalid JobClass API
  [Documentation]  Validate queryJobClassJobType With JobClass API [SWPL-T4155|SWR3-T3034]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034
  ${JobClass_invalidid}=    Convert To Integer    12345 
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType API  ${JobClass_invalidid}  ${global_test_data}[jobTypeCode]  ${inactive}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid

Validate queryJobClassJobType With Invalid JobCode API
  [Documentation]  Validate queryJobClassJobType With JobCode API [SWPL-T4155|SWR3-T3034]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034
  ${JobCode_invalidid}=    Convert To Integer    12345 
  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType API  ${global_test_data}[jobClassCode]  ${JobCode_invalidid}  ${inactive}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid

Validate queryJobClassJobType With Inactive Status API
  [Documentation]  Validate queryJobClassJobType With Inactive Status API [SWPL-T4155|SWR3-T3034]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034

  ${inactive}=  Convert To Boolean  True
  ${response}=  queryJobClassJobType API  ${global_test_data}[jobClassCode]  ${global_test_data}[jobTypeCode]  ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.
  

Validate queryJobClassJobType Without Job Class API
  [Documentation]  queryJobClassJobType [SWPL-T4155|SWR3-T3034]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e7878073-13d2-44df-ae95-855aafea46d9
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034

  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType Without JobClass API    ${global_test_data}[jobTypeCode]  ${inactive}
  Log To Console    ${response}  
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.

Validate queryJobClassJobType Without Job Type API
  [Documentation]  Validate queryJobClassJobType Without Job Type API [SWPL-T4155|SWR3-T3034]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034

  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType Without JobType API    ${global_test_data}[jobClassCode]    ${inactive}

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Electrical  msg=Response does not contain the expected value.

Validate queryJobClassJobType Without Param API
  [Documentation]  Validate queryJobClassJobType Without Param API [SWPL-T4155|SWR3-T3034]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4155
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_query  atr_not_finished
  ...     uid_queryJobClassJobType  uid_SWPL-T4155  uid_SWR3-T3034

  ${inactive}=  Convert To Boolean  ${global_test_data}[inactive]
  ${response}=  queryJobClassJobType Without Param API

  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  invalid value  msg=Response does not contain the expected value.

Validate searchJobs API
  [Documentation]  searchJobs [SWPL-T4209|SWR3-T3088]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/12af72f6-1fab-4d8c-8399-cc2cb6a4d137
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4209
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_pulsem  grp_schedule_engine  atr_query  cmp_chiirp_api
  ...     uid_searchJobs  uid_SWPL-T4209  uid_SWR3-T3088

    ${response}=  searchJobs API  ${global_test_data}[jobNumbers]  ${global_test_data}[page]  ${global_test_data}[size]

      ${response_string}=  Convert To String  ${response}
      Should Contain  ${response_string}  200012  msg=Response does not contain the expected value.

Validate searchJobs With InvalidID API
  [Documentation]  Validate searchJobs With InvalidID API [SWPL-T4209|SWR3-T3088]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4209
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_pulsem  grp_schedule_engine  atr_query  cmp_chiirp_api
  ...     uid_searchJobs  uid_SWPL-T4209  uid_SWR3-T3088
  
  ${Job_InvalidId}=    Set Variable    12345 
  ${response}=  searchJobs API  ${Job_InvalidId}  ${global_test_data}[page]  ${global_test_data}[size]
  Log To Console    RESPONSE:${response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value

Validate searchJobs Without JobID API
  [Documentation]  Validate searchJobs Without JobID API [SWPL-T4209|SWR3-T3088]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4209
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_pulsem  grp_schedule_engine  atr_query  cmp_chiirp_api
  ...     uid_searchJobs  uid_SWPL-T4209  uid_SWR3-T3088

  ${keyword_response}=  searchJobs Without Param API
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value

Validate updateJobDetail API
##stub
  [Documentation]  updateJobDetail [SWPL-T4150|SWR3-T3029]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/6424c399-9730-47fb-8beb-3085820d0dc1
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4150
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  grp_annie  grp_hello_booked  grp_sunland  atr_mutation  atr_not_finished
  ...     uid_updateJobDetail  uid_SWPL-T4150  uid_SWR3-T3029

  ${var_null}    Set Variable    null  
  ${response}=  updateJobDetail API  ${global_test_data}[id]  ${global_test_data}[jobClass_2]  ${global_test_data}[jobType_2]
  ...  ${global_test_data}[jobTypeDescription_2]  ${global_test_data}[locationId_2]  ${global_test_data}[timePreference]
  ...  ${global_test_data}[estimatedDuration_3]  ${global_test_data}[scheduledFor_2]  ${global_test_data}[departmentId_2]
  ...  ${global_test_data}[leadSourceTypeId_2]  ${global_test_data}[leadSourceId_2]  ${var_null}
  ...  ${global_test_data}[status_2]  ${global_test_data}[zoneId]  ${global_test_data}[isJobHavingIssue]
  ...  ${global_test_data}[serviceAccountId_2]  ${global_test_data}[priority]  ${var_null}
  ...  ${var_null}  ${var_null}  ${var_null}
  ...  ${global_test_data}[visitIds]  ${global_test_data}[category_2]  ${var_null}
  ...  ${global_test_data}[isNotified]  ${global_test_data}[sendReminder]  ${global_test_data}[priorityLevel]
  ...  ${global_test_data}[replaceNotes]

  ${response_string}=  Convert To String  ${response}
  Log To Console    ${response_string}
  Should Contain  ${response_string}  UPDATE SUCCESSFUL  msg=Response does not contain the expected value.

Validate updateJobNotesById API
  [Documentation]  updateJobNotesById [SWPL-T4131|SWR3-T3010]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/2fe188bf-8d22-44ec-a4f1-c63acf5cd61d
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4131
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_job  atr_mutation  atr_not_finished
  ...     uid_updateJobNotesById  uid_SWPL-T4131  uid_SWR3-T3010

    ${response}=  updateJobNotesById API  ${global_test_data}[jobId]  ${global_test_data}[jobNotes]  ${global_test_data}[replaceNotes]

    ${response_string}=  Convert To String  ${response}
    Should Contain  ${response_string}  Job notes updated successfully  msg=Response does not contain the expected value.