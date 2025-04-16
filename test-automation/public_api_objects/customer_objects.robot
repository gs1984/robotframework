#** API Calls in this file
#** getBillingCustomerById
# getCustomerTitle
# getEquipmentList
# listChangedCustomer
# queryCustomerFlexData
# queryCustomerTitle

*** Settings ***
Resource  ../utils/public_api_utils.robot

*** Variables ***
${getBillingCustomerById_body}=
...  query GetBillingCustomerById($billingCustomerId: Long!){
...    getBillingCustomerById(billingCustomerID: $billingCustomerId){successful message errors{path errorMessage}
...      billingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingDescription customerRatingName}
...        balanceDue paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks creditCardNumber
...        creditCardName creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber counterSale xchargeAlias xchargeClean
...        checkBankAccountNumber salesPersonId serviceAccountId statement paymentTerms{id termsCode termsDescription} currentBalance
...        over30Balance over60Balance over90Balance openCount retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount
...        noFinanceCharge lastFinanceDate arBillingLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount
...        title firstName lastName alternateFirstName alternateLastName comments companyName cellPhone customerChangeUtcdt customerTitle2
...        faxPhone noEmail primaryAddress phoneNumber phoneNumber2 phoneNumber3 phoneNumber4 email
...        name2InAddress alternateTitle phoneExtension phone2Extension phone3Extension phone4Extension
...        arAlternateAddress{id arBillingCustomerId alternateAddress1 alternateAddress2 alternateApContact alternateCity alternatePhone alternatePhoneExtension alternateState alternateZip notes}
...        address1 address2 city state zipCode depositOnAccount}}}
${getCustomerTitle_body}=
...    query GetCustomerTitle($title: String!){
...    getCustomerTitle(title: $title){title}
...    }
${getEquipmentList_body}=
...    query getEquipmentList($page: Int!, $size: Int!, $unitType: String){
...    getEquipmentList(page: $page, size: $size, unitType: $unitType){totalElements totalPages pageSize pageNumber numberOfElements content{id unitType unitTypeDescription circuitPanel}}}
${listChangedCustomer_body}=
...    query ListChangedCustomer($changedAfter: String!, $page: Int!, $size: Int!,$sort: [String]!){
  ...    listChangedCustomer(changedAfter: $changedAfter, page: $page, size: $size, sort: $sort){totalElements totalPages pageSize pageNumber numberOfElements 
    ...    content{serviceAccountId locationDto{
      ...    locationID locationFirstName locationLastName locationCompanyName locationAddress1 locationAddress2 locationCity locationState locationZip locationPhone1 locationEmailAddress locationLocationType locationLeadSource locationAddDate} 
      ...  agreementDto {hasAgreement hasPerpetualAgreement agreementStartDate agreementEndDate}
      ...  customerDetailDto {billingAccountID billingFirstName billingLastName billingCompanyName billingAddress1 billingAddress2 billingCity billingState billingZip billingPhone1 billingEmailAddress doNotSolicit noHappyChecks billingAddDate requestID
      ...    custChangeBillingCommPrefList {commClass optInRequired optIn optOut}
      ...    custChangeLocationCommPrefList {commClass optInRequired optIn optOut}}}}}

${listChangedEquipment_body}=
...    query listChangedEquipment($modifyDate: String!, $page: Int!, $size: Int!, $sort: String!){
...    listChangedEquipment(modifyDate: $modifyDate, page: $page, size: $size, sort: $sort) {totalElements totalPages pageSize pageNumber numberOfElements
...    content{id unitType unitTypeDescription circuitPanel equipmentSystem manufacturer manufacturerDescription serialNo modelNo installedByUs installedBy installedDate soldBy outOfService locationId
...    warrantyDtoList {id number type typeDescription providedBy vendor startDate laborEndDate partsEndDate reserveBalance}}}}

${listOfChangedCustomersWithAgreementDetails_body}=
...    query listOfChangedCustomersWithAgreementDetails($changedAfter: String!, $page: Int!, $size: Int!,$sort: [String]!){
  ...    listOfChangedCustomersWithAgreementDetails(changedAfter: $changedAfter, page: $page, size: $size, sort: $sort){totalElements totalPages pageSize pageNumber numberOfElements 
    ...    content{serviceAccountId locationDto{
      ...    locationID locationFirstName locationLastName locationCompanyName locationAddress1 locationAddress2 locationCity locationState locationZip locationPhone1 locationEmailAddress locationLocationType locationLeadSource locationAddDate} 
      ...  agreementDto {hasAgreement hasPerpetualAgreement agreementStartDate agreementEndDate}
      ...  customerDetailDto {billingAccountID billingFirstName billingLastName billingCompanyName billingAddress1 billingAddress2 billingCity billingState billingZip billingPhone1 billingEmailAddress doNotSolicit noHappyChecks billingAddDate requestID
      ...    custChangeBillingCommPrefList {commClass optInRequired optIn optOut}
      ...    custChangeLocationCommPrefList {commClass optInRequired optIn optOut}}}}}

${queryCustomerFlexData_body}=
...    body here
${queryCustomerTitle_body}=
...    query QueryCustomerTitle($title: String){
...    queryCustomerTitle(title: $title){
...        successful
...        message
...        errors {
...            path
...            errorMessage
...        }
...        customerTitles {
...            id
...            title
...            legacyCustomerTitleId
...        }
...    }
...    }

*** Keywords ***
GetBillingCustomerById API
    [Arguments]  ${billingCustomerId}  ${title}=${None}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
    ${variables}=    Create Dictionary
    ...  billingCustomerId=${billingCustomerId}
    ${body}=  Create Dictionary
    ...  query=${getBillingCustomerById_body}
    ...  variables=${variables}
    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
    ${billingCustomer}=  Set Variable  ${response.json()['data']['getBillingCustomerById']}
    
    IF  '${title}' != '${None}'
        IF  ${billingCustomer} != ${None}
            Should Be Equal As Strings  ${billingCustomer}[title]  ${title}  msg=Billing customer title does not match
        END
    END
    
    RETURN  ${billingCustomer}

getCustomerTitle API
  [Arguments]    ${customerId}  ${title}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  customerId=${customerId}
    ...  title=${title}
  ${body}=  Create Dictionary
    ...  query=${getCustomerTitle_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}

  RETURN  ${response_json['data']['getCustomerTitle'][0]['title']}

getEquipmentList API
  [Arguments]    ${pageId}  ${size}  ${unitType}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  page=${pageId}
    ...  size=${size}
    ...  unitType=${unitType}
  ${body}=  Create Dictionary
    ...  query=${getEquipmentList_body}
    ...  variables=${variables}
  
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  ${equipment_list}=  Set Variable  ${response.json()['data']['getEquipmentList']}
  
  RETURN  ${equipment_list}

listChangedCustomer API
  [Arguments]    ${changedAfter}  ${pageId}  ${size}  ${sortBy}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  changedAfter=${changedAfter}
    ...  page=${pageId}
    ...  size=${size}
    ...  sort=${sortBy}
  ${body}=  Create Dictionary
    ...  query=${listChangedCustomer_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
  Log  Response content: ${response.content}

  RETURN  ${response.json()}
  
queryCustomerFlexData API
## stub
  [Arguments]
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  ${None}
  ${body}=  Create Dictionary
    ...  query=${queryCustomerFlexData_body}
    ...  variables=${variables}
#  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
#  RETURN  ${response.json()}[data][queryCustomerFlexData]
  RETURN  ${None}

queryCustomerTitle API
  [Arguments]  ${title}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  title=${title}
  ${body}=  Create Dictionary
    ...  query=${queryCustomerTitle_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json['data']['queryCustomerTitle']['customerTitles'][0]['title']}

listChangedEquipment API
  [Arguments]    ${modifyDate}  ${pageId}  ${size}  ${sortBy}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  modifyDate=${modifyDate}
    ...  page=${pageId}
    ...  size=${size}
    ...  sort=${sortBy}
  ${body}=  Create Dictionary
    ...  query=${listChangedEquipment_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
  Log  Response content: ${response.content}

  RETURN  ${response.json()}

listChangedEquipment Withput Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
 
  ${body}=  Create Dictionary
    ...  query=${listChangedEquipment_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
  Log  Response content: ${response.content}

  RETURN  ${response.json()}


listOfChangedCustomersWithAgreementDetails API
  [Arguments]    ${changedAfter}  ${pageId}  ${size}  ${sortBy}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  changedAfter=${changedAfter}
    ...  page=${pageId}
    ...  size=${size}
    ...  sort=${sortBy}
  ${body}=  Create Dictionary
    ...  query=${listOfChangedCustomersWithAgreementDetails_body}
    ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
  Log  Response content: ${response.content}

  RETURN  ${response.json()}

listOfChangedCustomersWithAgreementDetails Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${listOfChangedCustomersWithAgreementDetails_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
  Log  Response content: ${response.content}

  RETURN  ${response.json()} 