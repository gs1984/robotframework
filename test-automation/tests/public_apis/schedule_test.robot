#** API Calls in this file
# getScheduleBlocks
# getTimeSlotDetail
#** queryTimeSlot
# scheduleJob
# searchAssignments
# searchScheduledCalls

*** Settings ***
Resource  ../../public_api_objects/schedule_objects.robot
Resource  ../../utils/csv_utils.robot

Suite Setup  Get Data from CSV  folder_name=public_apis  file_name=schedule_public_api.csv

*** Test Cases ***
Validate getScheduleBlocks API
  [Documentation]  getScheduleBlocks [SWPL-T4159|SWR3-T3038]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/19a02502-6b63-4d5b-819b-576bce9cdc1c
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038
  ${groupTimeSlotID}=  Set Variable  ${global_test_data}[groupTimeSlotID]
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${jobType}=  Set Variable  ${global_test_data}[jobType]
  ${startDate}=  Set Variable  ${global_test_data}[startDate]
  ${endDate}=  Set Variable  ${global_test_data}[endDate]
  ${response}=  GetScheduleBlocks API  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  2022-09-01  msg=Response does not contain expected date "2022-09-01".

Validate getScheduleBlocks With Invalid groupTimeSlotID API
  [Documentation]  Validate getScheduleBlocks With Invalid groupTimeSlotID API [SWPL-T4159|SWR3-T3038]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038
  ${groupTimeSlotID}=  Set Variable  12345
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${jobType}=  Set Variable  ${global_test_data}[jobType]
  ${startDate}=  Set Variable  ${global_test_data}[startDate]
  ${endDate}=  Set Variable  ${global_test_data}[endDate]
  ${response}=  GetScheduleBlocks API  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  2022-09-01  msg=Response does not contain expected date "2022-09-01".

Validate getScheduleBlocks With Invalid JobClass API
  [Documentation]  Validate getScheduleBlocks With Invalid JobClass API [SWPL-T4159|SWR3-T3038]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038
  ${groupTimeSlotID}=  Set Variable  ${global_test_data}[groupTimeSlotID]
  ${jobClass}=  Set Variable  TEST
  ${jobType}=  Set Variable  ${global_test_data}[jobType]
  ${startDate}=  Set Variable  ${global_test_data}[startDate]
  ${endDate}=  Set Variable  ${global_test_data}[endDate]
  ${response}=  GetScheduleBlocks API  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  2022-09-01  msg=Response does not contain expected date "2022-09-01".

Validate getScheduleBlocks With Invalid JobType API
  [Documentation]  Validate getScheduleBlocks With Invalid JobType API [SWPL-T4159|SWR3-T3038]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038
  ${groupTimeSlotID}=  Set Variable  ${global_test_data}[groupTimeSlotID]
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${jobType}=  Set Variable  TEST
  ${startDate}=  Set Variable  ${global_test_data}[startDate]
  ${endDate}=  Set Variable  ${global_test_data}[endDate]
  ${response}=  GetScheduleBlocks API  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  2022-09-01  msg=Response does not contain expected date "2022-09-01".

Validate getScheduleBlocks With Invalid Start Date and End Date API
  [Documentation]  Validate getScheduleBlocks With Invalid Start Date and End Date API [SWPL-T4159|SWR3-T3038]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038
  ${groupTimeSlotID}=  Set Variable  ${global_test_data}[groupTimeSlotID]
  ${jobClass}=  Set Variable  ${global_test_data}[jobClass]
  ${jobType}=  Set Variable  ${global_test_data}[jobType]
  ${startDate}=  Set Variable  12340567
  ${endDate}=  Set Variable  12340567
  ${response}=  GetScheduleBlocks API  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  
  ${response_string}=  Convert To String  ${response}
  Log To Console    ${response_string}
  Should Contain  ${response_string}  errors  msg=Response does not contain expected date "2022-09-01".

Validate getScheduleBlocks Without Param API
  [Documentation]  Validate getScheduleBlocks Without Param API [SWPL-T4159|SWR3-T3038]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4159
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getScheduleBlocks  uid_SWPL-T4159  uid_SWR3-T3038

  ${response}=  GetScheduleBlocks Without Param API
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value


Validate getTimeSlotDetail API
  [Documentation]  getTimeSlotDetail [SWPL-T4203|SWR3-T3082]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/ce89e21c-70f6-467b-8f34-ef8178123374
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4203
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query  atr_not_finished
  ...     uid_getTimeSlotDetail  uid_SWPL-T4203  uid_SWR3-T3082
  ${groupName}=  Set Variable  ${global_test_data}[groupName]
  ${response}=  GetTimeSlotDetail API  ${groupName}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Maintenance  msg=Response does not contain expected value "Maintenance".

Validate getTimeSlotDetail API Negative
  [Documentation]  Tests getTimeSlotDetail API with invalid inputs [SWPL-T4203-NEG|SWR3-T3082-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_schedule_engine  atr_query
  ...     uid_getTimeSlotDetail  uid_SWPL-T4203_negative  uid_SWR3-T3082_negative  negative_tc

  ${non_existent_group}=    Set Variable    NONEXISTENT_GROUP_XYZ
  ${response}=    GetTimeSlotDetail API    ${non_existent_group}
  
  ${data_is_null}=    Run Keyword And Return Status    Should Be Equal    ${response}[data][getTimeSlotDetail]    ${None}
  
  ${validation_passed}=    Evaluate    $data_is_null
  Should Be True    ${validation_passed}    msg=Response should have null data for non-existent group name
  
  ${response_string}=    Convert To String    ${response}
  Should Not Contain    ${response_string}    Maintenance    msg=Response should not contain expected positive test values for invalid input

Validate QueryTimeSlot API
  [Documentation]  QueryTimeSlot [SWPL-T4160|SWR3-T3039]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/c5988a77-4daa-4c1e-979e-7f1636848580
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4160
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  
  ...     uid_queryTimeSlot  uid_SWPL-T4160  uid_SWR3-T3039  atr_query
  ${queryTimeSlot_response}=  QueryTimeSlot API  ${global_test_data}[schedule_group_name_1]
  ${upperMessage}=  Convert To Upper Case  ${queryTimeSlot_response}[message]
  ${correct}=  Convert To Upper Case  ${global_test_data}[public_api_fetch_successful]
  Should Be Equal As Strings  ${upperMessage}  ${correct}  msg=QueryTimeSlot not returning successfully

Validate QueryTimeSlot API Negative
  [Documentation]  Tests QueryTimeSlot API with invalid inputs [SWPL-T4160-NEG|SWR3-T3039-NEG]
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule
  ...     uid_queryTimeSlot  uid_SWPL-T4160_negative  uid_SWR3-T3039_negative  negative_tc  atr_query

  ${non_existent_group}=    Set Variable    NONEXISTENT_GROUP_XYZ
  ${queryTimeSlot_response}=    QueryTimeSlot API    ${non_existent_group}
  
  ${has_no_timeslots}=    Run Keyword And Return Status    Should Be Equal    ${queryTimeSlot_response}[timeSlot]    ${None}
  
  ${validation_passed}=    Evaluate    $has_no_timeslots
  Should Be True    ${validation_passed}    msg=TimeSlots should be null for non-existent group name

Validate scheduleJob API
##stub
  [Documentation]  scheduleJob [SWPL-T4140|SWR3-T3019]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/563b10d9-d2d6-4585-8c95-a24be00e504f
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4140
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  atr_query  atr_not_finished
  ...     uid_scheduleJob  uid_SWPL-T4140  uid_SWR3-T3019
  ${jobId}=  Set Variable  ${global_test_data}[jobId]
  ${scheduledFor}=  Set Variable  ${global_test_data}[scheduledFor]
  ${notes}=  Set Variable  ${global_test_data}[notes]
  ${response}=  ScheduleJob API  ${jobId}  ${scheduledFor}  ${notes}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  successful  msg=Response does not contain expected value "successfully".

Validate searchAssignments API
  [Documentation]  searchAssignments [SWPL-T4161|SWR3-T3040]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/4ab3434f-2ac2-4a8f-88c5-4e6d9ccb9c9f
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4161
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_pulsem  atr_query  atr_not_finished
  ...     uid_searchAssignments  uid_SWPL-T4161  uid_SWR3-T3040
  ${jobId}=  Set Variable  ${global_test_data}[jobId]
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_1]
  ${response}=  SearchAssignments API  ${jobId}  ${page}  ${size}  ${sort}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Fetched successfully  msg=Response does not contain expected value "Fetched successfully".

Validate searchAssignments With InvalidID API
  [Documentation]  Validate searchAssignments With InvalidID API [SWPL-T4161|SWR3-T3040]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4161
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_pulsem  atr_query  atr_not_finished
  ...     uid_searchAssignments  uid_SWPL-T4161  uid_SWR3-T3040
  ${jobId}=    Convert To Integer    12345  
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_1]
  ${response}=  SearchAssignments API  ${jobId}  ${page}  ${size}  ${sort}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     None

Validate searchAssignments Without JobID API
  [Documentation]  Validate searchAssignments Without JobID API [SWPL-T4161|SWR3-T3040]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4161
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_pulsem  atr_query  atr_not_finished
  ...     uid_searchAssignments  uid_SWPL-T4161  uid_SWR3-T3040
  ${jobId}=  Set Variable  ${global_test_data}[jobId]
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_1]
  ${response}=  SearchAssignments Without Param API  
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value

Validate searchScheduledCalls API
  [Documentation]  searchScheduledCalls [SWPL-T4138|SWR3-T3017]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/886dc69f-ed97-4652-a466-95e90fbccf1a
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4138
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_hello_booked  atr_query  atr_not_finished
  ...     uid_searchScheduledCalls  uid_SWPL-T4138  uid_SWR3-T3017
  ${assignmentDate}=  Set Variable  ${global_test_data}[assignmentDate]
  ${callDate}=  Set Variable  ${global_test_data}[callDate]
  ${callDateThru}=  Set Variable  ${global_test_data}[callDateThru]
  ${jobId}=  Set Variable  ${global_test_data}[jobId]
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_2]
  ${response}=  SearchScheduledCalls API  ${assignmentDate}  ${callDate}  ${callDateThru}  ${jobId}  ${page}  ${size}  ${sort}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Fetched successfully  msg=Response does not contain expected value "Fetched successfully".

Validate searchScheduledCalls with Invalid JobId API
  [Documentation]  Validate searchScheduledCalls with Invalid JobId API [SWPL-T4138|SWR3-T3017]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4138
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_hello_booked  atr_query  atr_not_finished
  ...     uid_searchScheduledCalls  uid_SWPL-T4138  uid_SWR3-T3017
  ${assignmentDate}=  Set Variable  ${global_test_data}[assignmentDate]
  ${callDate}=  Set Variable  ${global_test_data}[callDate]
  ${callDateThru}=  Set Variable  ${global_test_data}[callDateThru]
  ${jobId}=  Set Variable  12345
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_2]
  ${response}=  SearchScheduledCalls API  ${assignmentDate}  ${callDate}  ${callDateThru}  ${jobId}  ${page}  ${size}  ${sort}
  ${response_string}=  Convert To String  ${response}
  Should Contain  ${response_string}  Fetched successfully  msg=Response does not contain expected value "Fetched successfully".

Validate searchScheduledCalls With Invalid Dates API
  [Documentation]  Validate searchScheduledCalls With Invalid Dates API [SWPL-T4138|SWR3-T3017]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4138
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_hello_booked  atr_query  atr_not_finished
  ...     uid_searchScheduledCalls  uid_SWPL-T4138  uid_SWR3-T3017
  ${invalidDate}=  Set Variable  12121000
  ${callDate}=  Set Variable  ${global_test_data}[callDate]
  ${callDateThru}=  Set Variable  ${global_test_data}[callDateThru]
  ${jobId}=  Set Variable  ${global_test_data}[jobId]
  ${page}=  Convert To Integer  ${global_test_data}[page]
  ${size}=  Convert To Integer  ${global_test_data}[size]
  ${sort}=  Evaluate  ${global_test_data}[sort_opt_2]
  ${response}=  SearchScheduledCalls API  ${invalidDate}  ${invalidDate}  ${invalidDate}  ${jobId}  ${page}  ${size}  ${sort}
  ${response_string}=  Convert To String  ${response}
  Log To Console    ${response_string}
  Should Contain  ${response_string}  errors  msg=Response does not contain expected value "errors".

Validate searchScheduledCalls WithOut Param API
  [Documentation]  Validate searchScheduledCalls WithOut Param API [SWPL-T4138|SWR3-T3017]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4138
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_schedule  grp_hello_booked  atr_query  atr_not_finished
  ...     uid_searchScheduledCalls  uid_SWPL-T4138  uid_SWR3-T3017

  ${response}=  SearchScheduledCalls Without Param API  
  ${response}=    Convert To String    ${response}
  Should Contain    ${response}     invalid value