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
Resource    ../utils/public_api_utils.robot
Library    JSONLibrary
Library    Collections
Library    BuiltIn
Library    OperatingSystem

*** Variables ***
${error_message}=  ${None}
${fetchLocation_body1}=
...  query FetchLocation($page:Int!,$size:Int!){
...    fetchLocation(page:$page, size:$size){totalElements totalPages pageSize pageNumber numberOfElements content{id locationTypes locationTypeDescription}}}
${fetchLocation_body}=
...  query FetchLocation($page:Int!,$size:Int!){
...    fetchLocation(page:$page, size:$size){totalElements totalPages pageSize pageNumber numberOfElements content{id locationTypes locationTypeDescription}}}
${getCommunicationPrefererenceByLocationId_body}=
...  query GetCommunicationPreferenceByLocationId($locationId: Long!){
...    getCommunicationPreferenceByLocationId(locationId: $locationId){
...      locationId id communicationClass{id className optInRequired} optOut optIn serviceAccountId}}
${getLocationById_body}=
...  query GetLocationByID($id: Long!) {getLocationById(id: $id) {
...    id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode invoiceDetailLevel isCounterSale
...    isPrintLabor isPrintMisc isPrintParts isApproxLatLong latitude longitude legacyLocationId legacyLotId notes previousOwner contact
...    contractArBillingCustomerId contractComment contractNo priority serviceType sizeOfService zone mapCode preferredTech phaseSpec}}
${getLocationByIdWithoutParam_body}=
...  query {getLocationById{
...    id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode invoiceDetailLevel isCounterSale
...    isPrintLabor isPrintMisc isPrintParts isApproxLatLong latitude longitude legacyLocationId legacyLotId notes previousOwner contact
...    contractArBillingCustomerId contractComment contractNo priority serviceType sizeOfService zone mapCode preferredTech phaseSpec}}
${getLocationInfoByLocationId_body}=
...  query GetLocationInfoByLocationId($locationId: Long!){getLocationInfoByLocationId(locationId: $locationId){successful message errors{path errorMessage} 
...    locationInfo{id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode invoiceDetailLevel 
...      isCounterSale isPrintLabor isPrintMisc isPrintParts latitude longitude isApproxLatLong priority lastAgreeDate lastAgreeType lastAgreeTypeDesc 
...      lastWarrantyDate activeAgreementId legacyLocationId legacyLotId notes previousOwner contact contractArBillingCustomerId contractComment 
...      contractNo sizeOfService zone mapCode preferredTech phaseSpec hasActiveAgreement hasInstalledEq hasActiveWarranty activeJobCount openMarketingCount 
...      customerAccounts{serviceAccountId} jobDetails{id} jobHistory{id} equipments{id} agreements{id} billingAgreements{id}}}}
${getLocations_body}=
...  query GetLocations($locationId: Long!){getLocations(locationId: $locationId){
...    serviceLocation{id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode invoiceDetailLevel isCounterSale isPrintLabor isPrintMisc isPrintParts isApproxLatLong latitude longitude notes previousOwner contact contractArBillingCustomerId contractComment contractNo priority serviceType sizeOfService zone mapCode preferredTech phaseSpec}
...    jobDetail{id number jobClass jobType jobTypeDescription status serviceAccountId locationId department leadSourceType zoneId startDate endDate scheduledFor callId departmentId phoneNumber leadSourceTypeId leadSourceId customerPONumber contact claimNo contractNo sendBooked sendReminder
...      visits{id agreementId visitScheduleId serviceAccountId type scheduleDate status notes jobId zoneId}
...      invoices{id jobId type number taxCode employeeCode totalAmount arInvoiceId serviceAccountId locationId workCompletedNotes workSuggestedNotes
...        invoiceItems{agreementId chargeToAgreementId code department description equipmentId id invoiceId price quantity taxable type visitId warrantyId}}
...      assignments{id employeeCode primaryEmployeeCode status estimatedDuration confirmedAt assignedAt scheduledFor notifiedAt dispatchedAt onSiteAt completedAt attentionNote isPrimary timePreference startTimePreference endTimePreference}
...      notes priority isNotified priorityLevel dnis}
...    history{id number jobClass jobType jobTypeDescription notes status serviceAccountId department primaryEmployeeCode callbackJobNumber invoices{id}}
...    agreement{billingAgreement{id} accountingAgreement{id}} equipments{id} communicationPreference{locationId}}}
${getZones_body}= 
...  query{getZones{id zone zoneId description}}
${queryCities_body}=
...  query QueryCities($city: String!){queryCities(city: $city){successful message errors{path errorMessage} cities{id city state zip zone taxCode zoneId}}}
${queryCitiesByZipCode_body}=
...  query QueryCitiesByZipCode($zipCode: String!){queryCitiesByZipCode(zipCode: $zipCode){
...    successful message errors{path errorMessage} cities{id city state zip zone taxCode zoneId}}}
${queryCommunicationPrefererenceByLocationId_body}=
...  query QueryCommunicationPreferenceByLocationId($locationId: Long!){
...    queryCommunicationPreferenceByLocationId(locationId: $locationId){successful message errors{path errorMessage}
...      communicationPreference{locationId id communicationClass{id className optInRequired} optOut optIn serviceAccountId}}}
${queryLocationById_body}=
...  query QueryLocationByID($id: Long!){queryLocationById(id: $id){successful message errors{path errorMessage} location{
...    id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode invoiceDetailLevel isCounterSale 
...    isPrintLabor isPrintMisc isPrintParts isApproxLatLong latitude longitude legacyLocationId legacyLotId notes previousOwner contact contractArBillingCustomerId 
...    contractComment contractNo priority serviceType sizeOfService zone mapCode preferredTech phaseSpec}}}

*** Keywords ***
FetchLocation API
    [Arguments]  ${location_page}  ${location_size}
    IF  '${api_token}' == '${None}'
      Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
    ${location_page}=    Convert To Integer    ${location_page}
    ${location_size}=    Convert To Integer    ${location_size}
    ${variables}=  Create Dictionary
     ...  page=${location_page}
     ...  size=${location_size}
    
    Log To Console    ${variables}
    
    ${body}=  Create Dictionary
    ...  query=${fetchLocation_body}
    ...  variables=${variables}
  
    Log To Console    ${body}
    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    Log To Console    ${response.json()}
    #${response_body_length}=  Get Length  ${response.json()['data']}
    RETURN  ${response.json()['data']['fetchLocation']}

getCommunicationPrefererenceByLocationId API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"locationId": ${locationId}}
  ${variables}=  Create Dictionary
    ...  locationId=${locationId}
    
  ${body}=  Create Dictionary
    ...  query=${getCommunicationPrefererenceByLocationId_body}
    ...  variables=${variables}
    
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  #RETURN  ${response.json()}[data][getCommunicationPrefererenceByLocationId] no data, use below
  RETURN  ${response.json()}[data]

getCommunicationPrefererenceByLocationIdWithoutParam API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
   
  ${body}=  Create Dictionary
    ...  query=${getCommunicationPrefererenceByLocationId_body}
    
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  
  RETURN  ${response.json()}

getLocationById API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  id=${locationId}
  ${body}=  Create Dictionary
    ...  query=${getLocationById_body}
    ...  variables=${variables}
  Log To Console    ${body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  Set Local Variable  ${json_response}  ${response.json()}
  Set Local Variable  ${result}  ${json_response}[data][getLocationById]
  RETURN  ${result}

getLocationByIdWithoutParam API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary    Authorization=bearer ${api_token}
  # ${variables}=  Create Dictionary
  #   ...  id=${locationId}
  ${body}=  Create Dictionary    query=${getLocationById_body}
    # ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  Set Local Variable  ${json_response}  ${response.json()}
  Set Local Variable  ${result}  ${json_response}[errors]
  RETURN  ${result}

getLocationInfoByLocationId API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  locationId=${locationId}
  ${body}=  Create Dictionary
    ...  query=${getLocationInfoByLocationId_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Set Local Variable  ${json_response}  ${response.json()}
  Set Local Variable  ${result}  ${json_response}[data][getLocationInfoByLocationId]
  RETURN  ${result}

getLocationInfoByLocationId without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${getLocationInfoByLocationId_body}
 
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Set Local Variable  ${json_response}  ${response.json()}
  Set Local Variable  ${result}  ${json_response}
  RETURN  ${result}

getLocations API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
 
  ${variables}=  Create Dictionary
    ...  locationId=${locationId}

  ${body}=  Create Dictionary
    ...  query=${getLocations_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getLocations]

getLocations Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
 
  ${body}=  Create Dictionary
    ...  query=${getLocations_body}
 
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}

getZones API
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${getZones_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getZones]

queryCities API
  [Arguments]  ${city}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  city=${city}
  ${body}=  Create Dictionary
    ...  query=${queryCities_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][queryCities]

queryCities Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${queryCities_body}
  
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}  

queryCitiesByZipCode API
  [Arguments]  ${zip}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"zipCode": "${zip}"}
  ${variables}=  Create Dictionary
    ...  zipCode=${zip}

  ${body}=  Create Dictionary
    ...  query=${queryCitiesByZipCode_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  #RETURN  ${response.json()}[data][queryCitiesByZipCode]
  RETURN  ${response.json()}

queryCitiesByZipCode Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${queryCitiesByZipCode_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}

queryCommunicationPrefererenceByLocationId API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
   
  ${variables}=  Create Dictionary
    ...  locationId=${locationId}
  ${body}=  Create Dictionary
    ...  query=${queryCommunicationPrefererenceByLocationId_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Set Local Variable  ${result}  ${response.json()}[data]
  RETURN  ${result}[queryCommunicationPreferenceByLocationId]

queryCommunicationPrefererenceByLocationId Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${queryCommunicationPrefererenceByLocationId_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}

queryLocationById API
  [Arguments]  ${locationId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"id": ${locationId}}

  ${variables}=  Create Dictionary
    ...  id=${locationId}

  ${body}=  Create Dictionary
    ...  query=${queryLocationById_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][queryLocationById]

queryLocationById Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${queryLocationById_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}