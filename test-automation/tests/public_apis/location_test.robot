#** API Calls in this file
#** fetchLocation
#** getCommunicationPrefererenceByLocationId
#** getLocationById
#** getLocationInfoByLocationId
#** getLocations
#** getZones
#** queryCities
#** queryCitiesByZipCode
#** queryCommunicationPrefererenceByLocationId
#** queryLocationById

*** Settings ***
Resource    ../../public_api_objects/location_objects.robot
Resource    ../../utils/csv_utils.robot
Library           JSONLibrary

Suite Setup    Get Data from CSV  folder_name=public_apis  file_name=location_public_api.csv

*** Test Cases ***
Validate fetchLocation API
  [Documentation]  fetchLocation [SWPL-T4214|SWR3-T3093]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/58480ae9-c521-4300-877a-9909bc685d7b
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4214
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  grp_annie  grp_hello_booked  atr_query
  ...     uid_fetchLocation  uid_SWPL-T4214  uid_SWR3-T3093

  ${keyword_response}=    FetchLocation API    ${global_test_data}[page_1]  ${global_test_data}[size_1]
  Should Not Be Equal As Integers  ${keyword_response}[numberOfElements]  0  msg=Location count is zero  
  Match In JSON List  ${keyword_response}[content]  id  ${global_test_data}[location_id_2]

Validate getCommunicationPrefererenceByLocationId API
  [Documentation]  getCommunicationPrefererenceByLocationId [SWPL-T4139|SWR3-T3018]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/1c2b7cf3-4ae8-40ef-b010-3a288bc8396f
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4139
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_getCommunicationPrefererenceByLocationId  uid_SWPL-T4139  uid_SWR3-T3018
  ${keyword_response}=  getCommunicationPrefererenceByLocationId API  ${global_test_data}[location_id_1]
  Should Not Be Empty  ${keyword_response}  msg=getCommunicationPreferenceByLocationId not returning any data
#  successful response does not return any data beyond getCommunicationPreferenceByLocationId node, so check for 200 is the only test.

Validate getCommunicationPrefererenceByLocationId with InvalidId API
  [Documentation]  Validate getCommunicationPrefererenceByLocationId with InvalidId API [SWPL-T4139|SWR3-T3018]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4139
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_getCommunicationPrefererenceByLocationId  uid_SWPL-T4139  uid_SWR3-T3018
  ${location_invalidid}=    Convert To Integer    12345
  ${keyword_response}=  getCommunicationPrefererenceByLocationId API  ${global_test_data}[location_id_1]
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  #${json_data}=    Load Json From String    ${response}
  ${data}=         Get Value From JSON    ${response}    getCommunicationPreferenceByLocationId
  #Log To Console    DATA:${data}
  Length Should Be    ${data}    0 

Validate getCommunicationPrefererenceByLocationId Without LocationId API
  [Documentation]  Validate getCommunicationPrefererenceByLocationId Without LocationId API [SWPL-T4139|SWR3-T3018]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/1c2b7cf3-4ae8-40ef-b010-3a288bc8396f
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4139
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_getCommunicationPrefererenceByLocationId  uid_SWPL-T4139  uid_SWR3-T3018
  ${keyword_response}=  getCommunicationPrefererenceByLocationIdWithoutParam API 
  #Log To Console    RESPONSE${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value


Validate getLocationById API
  [Documentation]  getLocationById [SWPL-T4154|SWR3-T3033]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/b308ecd9-a928-4cbf-90e8-3d196eefc852
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4154
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  grp_annie  grp_hello_booked  grp_schedule_engine  grp_sunland  atr_query
  ...     uid_getLocationById  uid_SWPL-T4154  uid_SWR3-T3033
  
  TRY
    ${keyword_response}=  getLocationById API  ${global_test_data}[location_id_1]
  EXCEPT  AS  ${error_message}
    Fail  msg=${error_message}
  END
  Set Local Variable  ${locationId}  ${keyword_response}[id]
  Should Be Equal As Integers  ${locationId}  ${global_test_data}[location_id_1]  msg=Location id doesn't match
  Set Test Variable  ${error_message}  ${None}
  ${keyword_response}=  getLocationById API  ${global_test_data}[bad_location_id_1]
  Should Be Equal As Strings  '${keyword_response}'  '${None}'

Validate getLocationById with InvalidID API
  [Documentation]  Validate getLocationById with InvalidID API [SWPL-T4154|SWR3-T3033]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/b308ecd9-a928-4cbf-90e8-3d196eefc852
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4154
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  grp_annie  grp_hello_booked  grp_schedule_engine  grp_sunland  atr_query
  ...     uid_getLocationById  uid_SWPL-T4154  uid_SWR3-T3033
  
  ${location_invalidid}=    Convert To Integer    12345
  TRY
    ${keyword_response}=  getLocationById API  ${location_invalidid}
  EXCEPT  AS  ${error_message}
    Fail  msg=${error_message}
  END
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     None


Validate getLocationById Without locationId API
  [Documentation]  Validate getLocationById Without locationId API [SWPL-T4154|SWR3-T3033]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4154
  [Tags]  plt_GEN2_API  tsn_regression    cmp_integration   grp_api_location  grp_annie  grp_hello_booked  grp_schedule_engine  grp_sunland  atr_query
  ...     uid_getLocationById  uid_SWPL-T4154  uid_SWR3-T3033
  
  #${location_id}=    Set Variable    null
  ${keyword_response}=  getLocationByIdWithoutParam API  
  #Validate JSON Error Message    ${keyword_response}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value


Validate getLocationInfoByLocationId API
  [Documentation]  getLocationInfoByLocationId [SWPL-T4153|SWR3-T3032]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/bb761c7f-2f37-48b9-8917-d194a8112282
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4153
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocationInfoByLocationId  uid_SWPL-T4153  uid_SWR3-T3032
  
  Set Local Variable  ${lid}  ${global_test_data}[location_id_1]
  ${keyword_response}=  getLocationInfoByLocationId API  ${lid}

  Case Insensitive Left Match  ${global_test_data}[public_api_fetch_successful]  ${keyword_response}[message]  Agreement id not fetched successfully  
  Set Local Variable  ${locationInfo}  ${keyword_response}[locationInfo]
  Should Start With  ${locationInfo}[id]  ${lid}  msg=${lid} does not match location id
  Match In JSON List  ${locationInfo}[equipments]  id  ${lid}

Validate getLocationInfoByLocationId with InvalidID API
  [Documentation]  Validate getLocationInfoByLocationId with InvalidID API [SWPL-T4153|SWR3-T3032]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/bb761c7f-2f37-48b9-8917-d194a8112282
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4153
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocationInfoByLocationId  uid_SWPL-T4153  uid_SWR3-T3032
  
  ${location_invalidid}=    Convert To Integer    12345
  ${keyword_response}=  getLocationInfoByLocationId API  ${location_invalidid}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     Location id does not exists

  
Validate getLocationInfoByLocationId Without LocationId API
  [Documentation]  Validate getLocationInfoByLocationId Without Param API [SWPL-T4153|SWR3-T3032]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4153
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocationInfoByLocationId  uid_SWPL-T4153  uid_SWR3-T3032
  
  ${keyword_response}=  getLocationInfoByLocationId without Param API
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value


Validate getLocations API
  [Documentation]  getLocations [SWPL-T4146|SWR3-T3025]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/03e8e8dc-bb6b-4591-829a-172446527bd2
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4146
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocations  uid_SWPL-T4146  uid_SWR3-T3025

  Set Local Variable  ${lid}  ${global_test_data}[location_id_1]
  ${keyword_response}=  getLocations API  ${lid}
  Match In JSON List  ${keyword_response}[jobDetail]  locationId  ${lid}

Validate getLocations With InvalidID API
  [Documentation]  Validate getLocations With InvalidID API [SWPL-T4146|SWR3-T3025]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4146
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocations  uid_SWPL-T4146  uid_SWR3-T3025

  ${location_invalidid}=    Convert To Integer    12345
  ${keyword_response}=  getLocations API  ${location_invalidid}
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     None

Validate getLocations Without LocationId API
  [Documentation]  Validate getLocations Without LocationId API [SWPL-T4146|SWR3-T3025]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/03e8e8dc-bb6b-4591-829a-172446527bd2
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4146
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_getLocations  uid_SWPL-T4146  uid_SWR3-T3025

  ${keyword_response}=  getLocations Without Param API
  ${response}=    Convert To String    ${keyword_response}
  #Log To Console    ${response}
  Should Contain    ${response}     invalid value
 
Validate getZones API
  [Documentation]  getZones [SWPL-T4213|SWR3-T3092]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/5c6a8e41-4f05-4d9c-8295-1ae86feea29e
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4213
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  grp_annie  grp_schedule_engine  atr_query
  ...     uid_getZones  uid_SWPL-T4213  uid_SWR3-T3092

  ${keyword_response}=  getZones API
  Match In JSON List  ${keyword_response}  zone  ${global_test_data}[zone_1]

Validate queryCities API
  [Documentation]  queryCities [SWPL-T4199|SWR3-T3078]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/08043196-8648-4227-91af-7d2a12c20d4b
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4199
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_queryCities  uid_SWPL-T4199  uid_SWR3-T3078

  Set Local Variable  ${city}  ${global_test_data}[city_1]
  ${keyword_response}=  queryCities API  ${city}
  #Log To Console    ${keyword_response}
  #Match In JSON List  ${keyword_response}[cities]  city  ${city}
  Should Contain  ${keyword_response}  successful  msg=Response does not contain the expected value.

Validate queryCities With Invalid City API
  [Documentation]  Validate queryCities With Invalid City API [SWPL-T4199|SWR3-T3078]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4199
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_queryCities  uid_SWPL-T4199  uid_SWR3-T3078

  Set Local Variable  ${city}  Invalid City
  ${keyword_response}=  queryCities API  ${city}
  Should Contain  ${keyword_response}  successful  msg=Response does not contain the expected value.

Validate queryCities Without City API
  [Documentation]  Validate queryCities Without City API [SWPL-T4199|SWR3-T3078]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4199
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query
  ...     uid_queryCities  uid_SWPL-T4199  uid_SWR3-T3078

  ${keyword_response}=  queryCities Without Param API  
  Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value

Validate queryCitiesByZipCode API
  [Documentation]  queryCitiesByZipCode [SWPL-T4157|SWR3-T3036]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/a26e1df0-1deb-44ae-8706-08915e100704
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4157
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCitiesByZipCode  uid_SWPL-T4157  uid_SWR3-T3036

  Set Local Variable  ${zip}  ${global_test_data}[zip_1]
  ${keyword_response}=  queryCitiesByZipCode API  ${zip}
  #Match In JSON List  ${keyword_response}[cities]  zip  ${zip}
  ${response_string}=  Convert To String  ${keyword_response}
  Should Contain  ${response_string}    successful  msg=Response does not contain the expected value.

Validate queryCitiesByZipCode With Invalid ZipCode API
  [Documentation]  Validate queryCitiesByZipCode With Invalid ZipCode API [SWPL-T4157|SWR3-T3036]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4157
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCitiesByZipCode  uid_SWPL-T4157  uid_SWR3-T3036

  Set Local Variable  ${zip}  00000
  ${keyword_response}=  queryCitiesByZipCode API  ${zip}
  #Match In JSON List  ${keyword_response}[cities]  zip  ${zip}
  ${response_string}=  Convert To String  ${keyword_response}
  Should Contain  ${response_string}    successful  msg=Response does not contain the expected value.

Validate queryCitiesByZipCode Wihout ZipCode API
  [Documentation]  queryCitiesByZipCode [SWPL-T4157|SWR3-T3036]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/a26e1df0-1deb-44ae-8706-08915e100704
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4157
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCitiesByZipCode  uid_SWPL-T4157  uid_SWR3-T3036

  ${keyword_response}=  queryCitiesByZipCode Without Param API
  Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value


Validate queryCommunicationPrefererenceByLocationId API
  [Documentation]  queryCommunicationPrefererenceByLocationId [SWPL-T4158|SWR3-T3037]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/908f9d68-13dc-4d67-afe6-08c935f67c48
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4158
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCommunicationPrefererenceByLocationId  uid_SWPL-T4158  uid_SWR3-T3037

  ${keyword_response}=  queryCommunicationPrefererenceByLocationId API  ${global_test_data}[location_id_1]
  Case Insensitive Left Match  ${global_test_data}[public_api_fetch_successful]  ${keyword_response}[message]  Communication preference not found

Validate queryCommunicationPrefererenceByLocationId With InvalidID API
  [Documentation]  Validate queryCommunicationPrefererenceByLocationId With InvalidID API [SWPL-T4158|SWR3-T3037]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4158
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCommunicationPrefererenceByLocationId  uid_SWPL-T4158  uid_SWR3-T3037

  ${location_invalidid}=    Convert To Integer    12345  
  ${keyword_response}=  queryCommunicationPrefererenceByLocationId API  ${global_test_data}[location_id_1]
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     None

Validate queryCommunicationPrefererenceByLocationId Without LocationId API
  [Documentation]  Validate queryCommunicationPrefererenceByLocationId Without LocationId API [SWPL-T4158|SWR3-T3037]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4158
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query  
  ...     uid_queryCommunicationPrefererenceByLocationId  uid_SWPL-T4158  uid_SWR3-T3037
  
  ${keyword_response}=  queryCommunicationPrefererenceByLocationId Without Param API  
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value
  
Validate queryLocationById API
  [Documentation]  queryLocationById [SWPL-T4196|SWR3-T3075]
  # Test Rigor: https://app.testrigor.com/test-suites/HWSsdk23X4yfNPtfx/test-cases/e9634ef5-1169-4b25-bfb0-4bfb29dd687a
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4196
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query    cmp_chiirp_api  
  ...     uid_queryLocationById  uid_SWPL-T4196  uid_SWR3-T3075

  Set Local Variable  ${locId}  ${global_test_data}[location_id_1] 
  ${keyword_response}=  queryLocationById API  ${locId}
  Set Local Variable  ${locationId}  ${keyword_response}[location][id]
  Should Be Equal As Integers  ${locationId}  ${locId}  msg=Location id ${locId} doesn't match

Validate queryLocationById With InvalidID API
  [Documentation]  Validate queryLocationById With InvalidID API[SWPL-T4196|SWR3-T3075]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4196
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query    cmp_chiirp_api  
  ...     uid_queryLocationById  uid_SWPL-T4196  uid_SWR3-T3075

  ${location_invalidid}=    Convert To Integer    12345
  ${keyword_response}=  queryLocationById API    ${location_invalidid}    
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     Location not found

Validate queryLocationById Without LocationId API
  [Documentation]  Validate queryLocationById Without LocationId API [SWPL-T4196|SWR3-T3075]
  # Zephyr: https://successware.atlassian.net/projects/SWPL?selectedItem=com.atlassian.plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/SWPL-T4196
  [Tags]  plt_GEN2_API  tsn_regression  cmp_integration  grp_api_location  atr_query    cmp_chiirp_api  
  ...     uid_queryLocationById  uid_SWPL-T4196  uid_SWR3-T3075

  ${keyword_response}=  queryLocationById Without Param API
  #Log To Console    RESPONSE:${keyword_response}
  ${response}=    Convert To String    ${keyword_response}
  Should Contain    ${response}     invalid value
  