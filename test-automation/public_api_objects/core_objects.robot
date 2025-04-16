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
Resource  ../utils/public_api_utils.robot

*** Variables ***
${createUpdateLeadSources_body}=
...  mutation CreateUpdateLeadSources($input: LeadSourceRequest!){
...    createUpdateLeadSources(input: $input) {successful message
...      leadSource {id code type dnis description isActive legacyLeadSourceId legacyLeadSourceTypeId}
...      errors {path errorMessage}}}
${createUpdateLeadSourceTypes_body}=
...  mutation CreateUpdateLeadSourceTypes($input: LeadSourceTypeRequest!){
...    createUpdateLeadSourceTypes(input: $input) {successful message
...      leadSourceType {id code isActive} errors {path errorMessage}}}
${fetchReferenceLibraryCities_body}=
...  query FetchReferenceLibraryCities($zipCode: String!) {
...    fetchReferenceLibraryCities(zipCode: $zipCode) {id city state zip zone taxCode}}
${fetchReferenceLibraryLeadSources_body}=
...  query{fetchReferenceLibraryLeadSources{id code type description}}
${fetchReferenceLibraryLeadSourceTypes_body}=
...  query{fetchReferenceLibraryLeadSourceTypes{id code isActive
...    leadSource {id code type dnis description}}}
${getCityZip_body}=  query{getCityZip{id zip city state zone zoneId taxCode}}
${getDepartments_body}=
...  query{getDepartments(page: 0, size: 1000){totalElements totalPages pageSize pageNumber numberOfElements
...    content {id departmentName description}}}
${getDepartmentsWithDname_body}=
...    query getDepartments( $departmentName:String,$page:Int!,$size:Int!) {
...    getDepartments (page:$page, size:$size,  departmentName:$departmentName) {
...    totalElements totalPages pageSize pageNumber numberOfElements successful message errors {
...    path errorMessage } content {id departmentName description }}}

${getLeadSourcesPageable_body}=
...  query GetLeadSourcesPageable($page:Int!,$size:Int!){getLeadSourcesPageable(page:$page, size:$size){
...    totalElements totalPages pageSize pageNumber numberOfElements
...    content{id code type description}}}
${getLeadSourceTypesPageable_body}=
...  query getLeadSourceTypesPageable($page:Int!, $size:Int!, $inactive: Boolean, $code: String){
...    getLeadSourceTypesPageable(page: $page, size: $size, inactive: $inactive, code: $code){
...      totalElements totalPages pageSize pageNumber numberOfElements content{id code isActive leadSource {id code type dnis description}}}}
${queryLeadSources_body}=
...  query{ queryLeadSources{successful message errors{path errorMessage}
...    leadSources{id code type dnis description isActive legacyLeadSourceId legacyLeadSourceTypeId}}}
${queryLeadSourceTypes_body}=
...  query QueryLeadSourceTypes($leadSourceTypeCode: String, $inactive: Boolean = false){
...    queryLeadSourceTypes(leadSourceTypeCode: $leadSourceTypeCode, inactive: $inactive){
...      successful message errors{path errorMessage} leadSourceTypes{id code isActive,
...        leadSource{id code type dnis description isActive legacyLeadSourceId legacyLeadSourceTypeId} legacyLeadSourceTypeId}}}

*** Keywords ***
createUpdateLeadSources API
  [Arguments]  ${id}  ${code}  ${type}  ${isActive}  ${dnis}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"input": {"id": ${id},"code": "${code}","type": "${type}","isActive": ${isActive},"dnis": "${dnis}"}}
  ${body}=  Create Dictionary
    ...  query=${createUpdateLeadSources_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][createUpdateLeadSources]

createUpdateLeadSourceTypes API
  [Arguments]  ${id}  ${code}  ${isActive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"input": {"id": ${id},"code": "${code}","isActive": ${isActive}}}
  ${id}=    Convert To Integer    ${id}
  ${isActive} =    Convert To Boolean    ${isActive} 
  ${input}=  Create Dictionary
    ...  id=${id}    code=${code}    isActive=${isActive}    
 
  ${variables}=  Create Dictionary
    ...  input=${input}
  
  Log To Console    ${variables}

  ${body}=  Create Dictionary
    ...  query=${createUpdateLeadSourceTypes_body}
    ...  variables=${variables}
  
  Log To Console    ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}[data][createUpdateLeadSourceTypes]

fetchReferenceLibraryCities API
  [Arguments]  ${zip}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"zipCode":"${zip}"}
  ${body}=  Create Dictionary
    ...  query=${fetchReferenceLibraryCities_body}
    ...  variables=${variables}
  Log To Console    ${body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}[data][fetchReferenceLibraryCities]

fetchReferenceLibraryLeadSources API
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${fetchReferenceLibraryLeadSources_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][fetchReferenceLibraryLeadSources]

fetchReferenceLibraryLeadSourceTypes API
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${fetchReferenceLibraryLeadSourceTypes_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][fetchReferenceLibraryLeadSourceTypes]

GetCityZip API
    [Arguments]
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
    ${body}=  Create Dictionary
    ...  query=${getCityZip_body}
    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
    #${response_body_length}=  Get Length  ${response.json()['data']}
    Log To Console    ${response.json()}
    RETURN  ${response.json()['data']['getCityZip']}

getDepartments API
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${getDepartments_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getDepartments]

getDepartmentsWithDname API
  [Arguments]    ${page}    ${size}    ${deparment_name}      
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${page}=    Convert To Integer    ${page}
  ${size}=    Convert To Integer    ${size}
  ${variables}=  Create Dictionary    page=${page}    size=${size}    departmentName=${deparment_name}

  ${body}=  Create Dictionary
    ...  query=${getDepartmentsWithDname_body}
    ...  variables=${variables}
  
  Log To Console    ${body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getDepartments]

getDepartmentsWithDnamewithNumber API
  [Arguments]    ${page}    ${size}    ${deparment_name}    
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${page}=    Convert To Integer    ${page}
  ${size}=    Convert To Integer    ${size}
  ${deparment_name}=    Convert To Integer    ${deparment_name}
  ${variables}=  Create Dictionary    page=${page}    size=${size}    departmentName=${deparment_name}

  ${body}=  Create Dictionary
    ...  query=${getDepartmentsWithDname_body}
    ...  variables=${variables}
  
  Log To Console    ${body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}[data][getDepartments]

getLeadSourcesPageable API
  [Arguments]  ${page}  ${size}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"page":${page}, "size":${size}}
  ${body}=  Create Dictionary
    ...  query=${getLeadSourcesPageable_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getLeadSourcesPageable]

getLeadSourceTypesPageable API
  [Arguments]  ${page}  ${size}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"page":${page}, "size":${size}}
  ${body}=  Create Dictionary
    ...  query=${getLeadSourceTypesPageable_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][getLeadSourceTypesPageable]

queryLeadSources API
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${queryLeadSources_body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][queryLeadSources]

queryLeadSourceTypes API
  [Arguments]  ${code}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"leadSourceTypeCode":"${code}"}
  ${body}=  Create Dictionary
    ...  query=${queryLeadSourceTypes_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][queryLeadSourceTypes]