#** API Calls in this file
#** createARBillingAccount
#** createBillingAccount
#** createServiceAccount
#** createServiceAccountForAnnie
#** findBillingAccountsByServiceAccountId
#** findByBillingAccountId
#** queryAccountById
#** searchEquipmentsByServiceAccountId
#** searchServiceAccounts
#** updateBillingAccount
#** updateServiceAccount
#** updateServiceAccountForAnnie

*** Settings ***
Resource  ../utils/public_api_utils.robot

*** Variables ***
${response}  ${None}
${createARBillingAccount_body}=
...  mutation CreateArBillingAccount($id:String!,
...    $input:genrockUpdateServiceAccountArBillingCustomerRequest!){
...      createArBillingAccount(id:$id,input:$input){successful message
...        billingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingDescription customerRatingName} balanceDue
...          paymentMethod{id paymentMethodName paymentType {id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks creditCardNumber creditCardName
...          creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber counterSale xchargeAlias xchargeClean checkBankAccountNumber
...          salesPersonId serviceAccountId statement paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance
...          openCount retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate arBillingLocationId
...          arAlternateLocationId totalInvoiceAmount totalRefundAmount totalPaidAmount title firstName lastName alternateFirstName alternateLastName
...          comments companyName cellPhone customerChangeUtcdt customerTitle2 faxPhone noEmail primaryAddress phoneNumber phoneNumber2 phoneNumber3 phoneNumber4
...          email name2InAddress alternateTitle phoneExtension phone2Extension phone3Extension phone4Extension
...          arAlternateAddress{id arBillingCustomerId alternateAddress1 alternateAddress2 alternateApContact alternateCity alternatePhone alternatePhoneExtension
...            alternateState alternateZip notes}
...          address1 address2 city state zipCode depositList{id balance totalAmount comment itemDate} depositOnAccount}
...      errors {path errorMessage}}}
# ${createBillingAccount_body}=
# ...  mutation CreateBillingAccount($input: arBillingCustomerRequest!){
# ...    createBillingAccount(input: $input){successful message
# ...      billingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingDescription customerRatingName} balanceDue
# ...        paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks creditCardNumber creditCardName
# ...        creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber counterSale xchargeAlias xchargeClean checkBankAccountNumber
# ...        salesPersonId serviceAccountId statement paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance
# ...        openCount retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate arBillingLocationId
# ...        arAlternateLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount title firstName lastName alternateFirstName alternateLastName
# ...        comments companyName cellPhone customerChangeUtcdt customerTitle2 faxPhone noEmail primaryAddress phoneNumber email name2InAddress alternateTitle phoneExtension
# ...        arAlternateAddress{id arBillingCustomerId} address1 address2 city state zipCode depositList{id balance totalAmount comment itemDate} depositOnAccount}
# ...      errors{path errorMessage}}}

${createBillingAccount_body}=
...    mutation CreateBillingAccount($input: arBillingCustomerRequest!){
...    createBillingAccount(input: $input){successful message
...      billingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingDescription customerRatingName} balanceDue
...        paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks creditCardNumber creditCardName
...        creditCardExpireMonth creditCardExpireYear financeCharge active taxExemptNumber counterSale xchargeAlias xchargeClean checkBankAccountNumber
...        salesPersonId serviceAccountId statement paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance
...        openCount retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate arBillingLocationId
...        arAlternateLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount title firstName lastName alternateFirstName alternateLastName
...        comments companyName cellPhone customerChangeUtcdt customerTitle2 faxPhone noEmail primaryAddress phoneNumber email name2InAddress alternateTitle phoneExtension
...        arAlternateAddress{id arBillingCustomerId} address1 address2 city state zipCode depositList{id balance totalAmount comment itemDate} depositOnAccount}
...      errors{path errorMessage}}}
${createServiceAccount_body}=  # note: there are no more fields that can be added to this query for testing purposes.
...  mutation CreateServiceAccount($input:CreateServiceAccountInput!){
...    createServiceAccount(input: $input){successful message
...      errors{path errorMessage} serviceAccount{id customerId locationId}}}
${createServiceAccountForAnnie_body}=  # note: there are no more fields that can be added to this query for testing purposes.
...  mutation CreateServiceAccountForAnnie($input:CreateServiceAccountInput!){
...    createServiceAccountForAnnie(input: $input){successful message
...      errors{path errorMessage} serviceAccount{id customerId locationId}}}
${findBillingAccountsByServiceAccountId_body}=
...  query FindBillingAccountsByServiceAccountId($page: Int! $size: Int! $sort: [String] $serviceAccountId: Long! $billingAccounts: Boolean!){
...    findBillingAccountsByServiceAccountId(page: $page size: $size sort: $sort serviceAccountId: $serviceAccountId
...      billingAccounts: $billingAccounts){totalElements totalPages pageSize pageNumber numberOfElements
...        content {id billingCustomerId apContact serviceContact creditLimit
...          customerRating {id customerRatingName} balanceDue paymentMethod {id paymentMethodName paymentType {id paymentTypeName}}}}}

${findByBillingAccountId_body}=
...  query FindByBIllingAccountId($billingAccountId: Long!) { findByBillingAccountId(billingAccountId: $billingAccountId) { id companyName customerTitle2 firstName lastName address1 address2 city state zipCode phoneNumber phone1Ext customerRating currentBalance depositOnAccount billingCustomerId phone2 phone2Ext cellPhone faxPhone email serviceContact general locationId comments paymentMethodName paymentTypeName creditCardNumber creditCardName creditCardExpireMonth creditCardExpireYear lastName2 firstName2 phone3 phone3Ext phone4 phone4Ext noEmail arReceivableDto { balance comment totalAmount itemDate } arBillingCustomerCommunicationPreferenceDto { id optIn optOut arBillingCustomerId communicationClass { className } } }}

...    
${findByBillingAccountId_body1}=
...    query FindByBIllingAccountId($billingAccountId: Long!) { findByBillingAccountId(billingAccountId: $billingAccountId) { 
...    id companyName customerTitle2 firstName lastName address1 address2 city state zipCode phoneNumber phone1Ext 
...    customerRating currentBalance depositOnAccount billingCustomerId phone2 phone2Ext cellPhone faxPhone email 
...    serviceContact general locationId comments paymentMethodName paymentTypeName 
...    creditCardNumber creditCardName creditCardExpireMonth creditCardExpireYear 
...    lastName2 firstName2 phone3 phone3Ext phone4 phone4Ext noEmail 
...    arReceivableDto { balance comment totalAmount itemDate }
...    arBillingCustomerCommunicationPreferenceDto { id optIn optOut arBillingCustomerId communicationClass { className } } }}



${queryAccountById_body}=
...  query QueryAccountByID($billingAccountId: Long!){queryAccountById(billingAccountId: $billingAccountId){
...    successful message errors{path errorMessage} account{id companyName customerTitle2 firstName lastName
...      address1 address2 city state zipCode phoneNumber phone1Ext customerRating subTotal arReceivableDto{id}
...      arBillingCustomerCommunicationPreferenceDto{id}}}}
${searchEquipmentsByServiceAccountId_body}=
...  query SearchEquipmentsByServiceAccountId($serviceAccountId: Long!, $page: Int!, $size: Int!, $sort:[String]){
...    searchEquipmentsByServiceAccountId(serviceAccountId: $serviceAccountId, page: $page, size: $size, sort: $sort){
...      successful message errors{path errorMessage} totalElements totalPages pageSize pageNumber numberOfElements
...      content{id unitType unitTypeDescription unitSize circuitPanel equipmentSystem manufacturer manufacturerDescription
...      other serialNo modelNo filterCount filterSize conditionNotes condition evaluatedBy evaluationDate
...      location installedByUs installedBy installedDate soldBy age warrantyStatus
...      warranties{id number type typeDescription reserveBalance providedBy vendor startDate laborEndDate partsEndDate inHouse}
...      outOfService installCallId}}}
${searchServiceAccounts_body}=
...  query SearchServiceAccounts($input: SearchServiceAccountRequest $page: Int! $size: Int! $sort: [String]){
...    searchServiceAccounts(input: $input, page: $page, size: $size, sort: $sort){totalElements totalPages pageSize pageNumber numberOfElements
...      content{id
...        customer{id firstName lastName phoneNumber extension email title leadSourceTypeId leadSourceId altFirstName altLastName referral noEmail}
...        serviceLocations{id address1 address2 city state zipCode type companyName lotId subdivision directionNote ownerOccupied taxCode}
...        primaryBillingAddress{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingName customerRatingName}
...          balanceDue paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks
...          creditCardNumber creditCardName creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber counterSale
...          xchargeAlias xchargeClean checkBankAccountNumber salesPersonId serviceAccountId statement
...          paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance openCount retainedBalance
...          noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate arBillingLocationId arAlternateLocationId
...          totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount title firstName lastName alternateFirstName alternateLastName
...          comments companyName cellPhone customerChangeUtcdt customerTitle2 faxPhone noEmail
...          primaryAddress phoneNumber phoneNumber2 phoneNumber3 phoneNumber4 email
...          name2InAddress alternateTitle phoneExtension phone2Extension phone3Extension phone4Extension
...          arAlternateAddress{id arBillingCustomerId alternateAddress1 alternateAddress2 alternateApContact alternateCity
...            alternatePhone alternatePhoneExtension alternateState alternateZip notes}
...          address1 address2 city state zipCode}
...        billingAccountOutput{
...          mainArBillingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingName} balanceDue
...            paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks
...            creditCardNumber creditCardName creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber
...            counterSale xchargeAlias xchargeClean checkBankAccountNumber salesPersonId serviceAccountId statement
...            paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance openCount
...            retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate
...            arBillingLocationId arAlternateLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount
...            title firstName lastName alternateFirstName alternateLastName comments companyName cellPhone customerChangeUtcdt
...            customerTitle2 faxPhone noEmail primaryAddress phoneNumber phoneNumber2 phoneNumber3 phoneNumber4 email
...            name2InAddress alternateTitle phoneExtension phone2Extension phone3Extension phone4Extension
...            arAlternateAddress{id arBillingCustomerId alternateAddress1 alternateAddress2 alternateApContact alternateCity
...              alternatePhone alternatePhoneExtension alternateState alternateZip notes}
...            address1 address2 city state zipCode}
...          otherArBillingCustomer{id billingCustomerId apContact serviceContact creditLimit customerRating{id customerRatingName}
...            balanceDue paymentMethod{id paymentMethodName paymentType{id paymentTypeName}} badRiskCustomer doNotSolicit happyChecks
...            creditCardNumber creditCardName creditCardExpireMonth creditCardExpireYear financeCharge active general taxExemptNumber
...            counterSale xchargeAlias xchargeClean checkBankAccountNumber salesPersonId serviceAccountId statement
...            paymentTerms{id termsCode termsDescription} currentBalance over30Balance over60Balance over90Balance openCount
...            retainedBalance noStatement lastAgeDate createdBy createdAt financeChargeAmount noFinanceCharge lastFinanceDate
...            arBillingLocationId arAlternateLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount
...            title firstName lastName alternateFirstName alternateLastName comments companyName cellPhone customerChangeUtcdt
...            customerTitle2 faxPhone noEmail primaryAddress phoneNumber phoneNumber2 phoneNumber3 phoneNumber4 email
...            name2InAddress alternateTitle phoneExtension phone2Extension phone3Extension phone4Extension
...            arAlternateAddress{id arBillingCustomerId alternateAddress1 alternateAddress2 alternateApContact
...              alternateCity alternatePhone alternatePhoneExtension alternateState alternateZip notes}
...            address1 address2 city state zipCode}}}}}
${updateBillingAccount_body}=
...  mutation UpdateBillingAccount($input: arBillingCustomerUpdateRequest!){
...    updateBillingAccount(input: $input){successful message
...      billingCustomer {id billingCustomerId apContact serviceContact creditLimit balanceDue
...        paymentMethod{id paymentMethodName paymentType{id paymentTypeName}}
...        badRiskCustomer doNotSolicit happyChecks creditCardNumber creditCardName creditCardExpireMonth
...        creditCardExpireYear financeCharge active general taxExemptNumber counterSale checkBankAccountNumber
...        salesPersonId serviceAccountId statement paymentTerms{id termsCode} currentBalance openCount
...        arBillingLocationId totalInvoiceAmount totalAdjustAmount totalRefundAmount totalPaidAmount
...        firstName lastName} errors {path errorMessage}}}
${updateServiceAccount_body}=
...  mutation UpdateServiceAccount($input:UpdateServiceAccountInput!){
...    updateServiceAccount(input:$input){successful message errors{path errorMessage}
...      serviceAccount{id
...        customer{firstName lastName phoneNumber extension email title}}}}
${updateServiceAccountForAnnie_body}=
...  mutation UpdateServiceAccountForAnnie($input:UpdateServiceAccountInput!){
...    updateServiceAccountForAnnie(input:$input){successful message
...      serviceAccount{id customer{firstName lastName phoneNumber email}} errors{path errorMessage}}}

*** Keywords ***
createARBillingAccount API
    [Arguments]
    ...  ${serv_acct_id}
    ...  ${cust_id}
    ...  ${cust_first}
    ...  ${cust_last}
    ...  ${cust_dnis}
    ...  ${cust_ext}
    ...  ${cust_email}
    ...  ${cust_title}
    ...  ${cust_src_type}
    ...  ${ba_active}
    ...  ${ba_balance}
    ...  ${ba_check_bank_acc}
    ...  ${ba_counter_sale}
    ...  ${ba_CC_exp_month}
    ...  ${ba_CC_exp_year}
    ...  ${ba_CC_name}
    ...  ${ba_CC_num}
    ...  ${ba_credit_limit}
    ...  ${ba_no_solicit}
    ...  ${ba_finance_charge}
    ...  ${ba_happy_check}
    ...  ${ba_serv_contact}
    ...  ${ba_statement}
    ...  ${ba_tax_exempt_num}
    ...  ${ba_company_name}

    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END

    # Convert numeric fields to numbers (if needed)
    ${ba_balance_num}=    Convert To Number    ${ba_balance}
    ${ba_CC_exp_month_num}=    Convert To Number    ${ba_CC_exp_month}
    ${ba_CC_exp_year_num}=     Convert To Number    ${ba_CC_exp_year}
    ${ba_credit_limit_num}=    Convert To Number    ${ba_credit_limit}

    # Convert boolean fields (if needed)
    ${ba_active_bool}=         Convert To Boolean    ${ba_active}
    ${ba_counter_sale_bool}=   Convert To Boolean    ${ba_counter_sale}
    ${ba_no_solicit_bool}=     Convert To Boolean    ${ba_no_solicit}
    ${ba_finance_charge_bool}=    Convert To Boolean    ${ba_finance_charge}
    ${ba_happy_check_bool}=    Convert To Boolean    ${ba_happy_check}
    ${ba_statement_bool}=      Convert To Boolean    ${ba_statement}

    ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

    # Build the 'arBillingCustomerAccount' dictionary
    ${arBillingCustomerAccount}=  Create Dictionary
    ...  active=${ba_active_bool}
    ...  balanceDue=${ba_balance_num}
    ...  checkBankAccountNumber=${ba_check_bank_acc}
    ...  counterSale=${ba_counter_sale_bool}
    ...  creditCardExpireMonth=${ba_CC_exp_month_num}
    ...  creditCardExpireYear=${ba_CC_exp_year_num}
    ...  creditCardName=${ba_CC_name}
    ...  creditCardNumber=${ba_CC_num}
    ...  creditLimit=${ba_credit_limit_num}
    ...  doNotSolicit=${ba_no_solicit_bool}
    ...  financeCharge=${ba_finance_charge_bool}
    ...  happyChecks=${ba_happy_check_bool}
    ...  serviceContact=${ba_serv_contact}
    ...  statement=${ba_statement_bool}
    ...  taxExemptNumber=${ba_tax_exempt_num}
    ...  companyName=${ba_company_name}

    # Build the 'customer' dictionary
    ${cust_id_num}=    Convert To Number    ${cust_id}

    ${customer}=  Create Dictionary
    ...  id=${cust_id_num}
    ...  firstName=${cust_first}
    ...  lastName=${cust_last}
    ...  phoneNumber=${cust_dnis}
    ...  extension=${cust_ext}
    ...  email=${cust_email}
    ...  title=${cust_title}
    ...  sourceType=${cust_src_type}

    # Build the 'serviceAccount' dictionary
    ${serviceAccount}=  Create Dictionary
    ...  id=${serv_acct_id}
    ...  customer=${customer}

    # Build the 'input' dictionary
    ${input}=  Create Dictionary
    ...  serviceAccount=${serviceAccount}
    ...  arBillingCustomerAccount=${arBillingCustomerAccount}

    # Build the final 'variables' dictionary
    ${variables}=  Create Dictionary
    ...  id=${serv_acct_id}
    ...  input=${input}

    # Log the dictionaries to verify correct structure
    Log To Console      *** FINAL VARIABLES DICT ***
    Log To Console      ${variables}
    Log To Console      *** 'input' VALUE ***
    Log To Console      ${input}

    ${body}=  Create Dictionary
    ...  query=${createARBillingAccount_body}
    ...  variables=${variables}

    ${response}=  POST
    ...  url=${api_url}graphql
    ...  json=${body}
    ...  headers=${headers}
    ...  expected_status=200

    # Debug logs and return
    Log    ${response.text}
    Log    ${response.status_code}
    RETURN  ${response.json()}[data][createArBillingAccount]

createBillingAccount API
  [Arguments]  ${active}  ${balanceDue}  ${checkBankAccountNumber}  ${counterSale}  ${creditCardExpireMonth}  ${creditCardExpireYear}  ${creditCardName}  ${creditCardNumber}
  ...          ${creditLimit}  ${doNotSolicit}  ${financeCharge}  ${happyChecks}  ${serviceContact}  ${statement}  ${taxExemptNumber}  ${xchargeAlias}  ${xchargeClean}
  ...          ${firstName}  ${lastName}  ${companyName}

  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Checking arguments that may need quotes
  ${nCreditCardExpireYear}=  Add Quotes If Not Null  ${creditCardExpireYear}
  
  Set Local Variable  ${lv1}  "active": ${active}, "balanceDue": ${balanceDue}, "checkBankAccountNumber": "${checkBankAccountNumber}", "counterSale": ${counterSale},
  Set Local Variable  ${lv2}  "creditCardExpireMonth": ${creditCardExpireMonth}, "creditCardExpireYear": ${nCreditCardExpireYear}, "creditCardName": "${creditCardName}",
  Set Local Variable  ${lv3}  "creditCardNumber": "${CreditCardNumber}", "creditLimit": ${creditLimit}, "doNotSolicit": ${doNotSolicit}, "financeCharge": ${financeCharge},
  Set Local Variable  ${lv4}  "happyChecks": ${happyChecks}, "serviceContact": "${serviceContact}", "statement": ${statement}, "taxExemptNumber": "${taxExemptNumber}",
  Set Local Variable  ${lv5}  "xchargeAlias": "${xchargeAlias}", "xchargeClean": ${xchargeClean}, "firstName": "${firstName}", "lastName": "${lastName}", "companyName": "${companyName}"

  Set Local Variable  ${variables}  {"input": {${lv1}${lv2}${lv3}${lv4}${lv5}}}

  Custom Log    ${variables} 

  ${body}=  Create Dictionary
    ...  query=${createBillingAccount_body}
    ...  variables=${variables}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][createBillingAccount]

createServiceAccount API
  [Arguments]  ${firstName}  ${lastName}  ${dnis}  ${email}  ${leadSourceTypeId}  ${leadSourceId}  ${noEmail}
  ...  ${locationType}  ${locationAddress}  ${locationCity}  ${locationState}  ${locationZip}  ${ownerOccupied}

  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
   
  ${noEmail}=    Convert to Boolean    ${noEmail}

  ${customer}=  Create Dictionary    firstName=${firstName}    lastName=${lastName}    phoneNumber=${dnis}    email=${email}
    ...  leadSourceTypeId=${leadSourceTypeId}    leadSourceId=${leadSourceId}    noEmail=${noEmail}
    
  ${location}=  Create Dictionary    type=${locationType}    address1=${locationAddress}    city=${locationCity}    state=${locationState}
    ...  zipCode=${locationZip}    
 
  ${input}=  Create Dictionary
  Set To Dictionary  ${input}  customer=${customer}  location=${location}  

   Log To Console    Varriable: ${input}

  ${variables}=  Create Dictionary
    ...  input=${input}
   
  Log To Console    Varriable: ${variables}

  ${body}=  Create Dictionary
    ...  query=${createServiceAccount_body}
    ...  variables=${variables}
  
  Log To Console    Body: ${body}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  Log to Console    ${response.json()}

  RETURN  ${response.json()}[data][createServiceAccount]

createServiceAccountForAnnie API
  [Arguments]  ${firstName}  ${lastName}  ${dnis}  ${email}  ${leadSourceTypeId}  ${leadSourceId}  ${noEmail}
  ...  ${locationType}  ${locationAddress}  ${locationCity}  ${locationState}  ${locationZip}  ${ownerOccupied}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  Set Local Variable  ${lv1}  "customer":{"firstName": "${firstName}","lastName": "${lastName}","phoneNumber": "${dnis}","email": "${email}",
  Set Local Variable  ${lv2}  "leadSourceTypeId": ${leadSourceTypeId},"leadSourceId": ${leadSourceId},"noEmail": ${noEmail}},
  Set Local Variable  ${lv3}  "location":{"type": "${locationType}","address1": "${locationAddress}","city": "${locationCity}",
  Set Local Variable  ${lv4}  "state": "${locationState}","zipCode": "${locationZip}","ownerOccupied": ${ownerOccupied}}
  Set Local Variable  ${variables}  {"input": {${lv1}${lv2}${lv3}${lv4}}}  
  
  ${body}=  Create Dictionary
    ...  query=${createServiceAccountForAnnie_body}
    ...  variables=${variables}
  
  Log To Console     Body: ${body}

  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}[data][createServiceAccountForAnnie]

findBillingAccountsByServiceAccountId API
  [Arguments]  ${page}  ${size}  ${sort}  ${serviceAccountId}  ${isBillingAccounts}
  IF  '${api_token}' == '${None}'
    Get API Auth Token  
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort":${sort},"serviceAccountId":${serviceAccountId},"billingAccounts":${isBillingAccounts}}
  ${body}=  Create Dictionary
    ...  query=${findBillingAccountsByServiceAccountId_body}
    ...  variables=${variables}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][findBillingAccountsByServiceAccountId]

findBillingAccountsByServiceAccountId Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token  
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort":${sort},"serviceAccountId":${serviceAccountId},"billingAccounts":${isBillingAccounts}}
  ${body}=  Create Dictionary
    ...  query=${findBillingAccountsByServiceAccountId_body}

  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}

findByBillingAccountId API
  [Arguments]  ${billingAccountId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${variables}=  Create Dictionary
    ...  billingAccountId=${billingAccountId}
  #Set Local Variable  ${variables}  {"billingAccountId":${billingAccountId}}
  ${body}=  Create Dictionary
    ...  query=${findByBillingAccountId_body}
    ...  variables=${variables}
  Custom Log    API url : ${api_url}  
  Custom Log    Headers : ${headers}
  Custom Log    Variables : ${variables}
  Custom Log    Body : ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Should Be Equal As Numbers    ${response.status_code}    200
  
  Custom Log    Respons : ${response}

  RETURN  ${response.json()}[data][findByBillingAccountId]

findByBillingAccountId Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${findByBillingAccountId_body}
  
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Should Be Equal As Numbers    ${response.status_code}    200
  
  Custom Log    Respons : ${response}

  RETURN  ${response.json()}

queryAccountById API
  [Arguments]  ${billingAccountId}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"billingAccountId":${billingAccountId}}
  ${variables}=  Create Dictionary
    ...  billingAccountId=${billingAccountId}
  ${body}=  Create Dictionary
    ...  query=${queryAccountById_body}
    ...  variables=${variables}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][queryAccountById]

queryAccountById Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${queryAccountById_body}
 
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}

searchEquipmentsByServiceAccountId API
  [Arguments]  ${servAcctId}  ${page}  ${size}  ${sort}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  Set Local Variable  ${variables}  {"serviceAccountId": ${servAcctId},"page": ${page},"size": ${size},"sort": ["${sort}"]}
  # ${variables}=  Create Dictionary
  #   ...  serviceAccountId=${servAcctId}    page=${page}    size=${size}    sort=[${sort}]}    
  ${body}=  Create Dictionary
    ...  query=${searchEquipmentsByServiceAccountId_body}
    ...  variables=${variables}
  Log To Console    ${body}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][searchEquipmentsByServiceAccountId]

searchEquipmentsByServiceAccountId Wihtout Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  #Set Local Variable  ${variables}  {"serviceAccountId": ${servAcctId},"page": ${page},"size": ${size},"sort": ["${sort}"]}
  # ${variables}=  Create Dictionary
  #   ...  serviceAccountId=${servAcctId}    page=${page}    size=${size}    sort=[${sort}]}    
  ${body}=  Create Dictionary
    ...  query=${searchEquipmentsByServiceAccountId_body}
    #...  variables=${variables}
  Log To Console    ${body}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}

searchServiceAccounts API
  [Arguments]  ${address}  ${cName}  ${cId}  ${lName}  ${locId}  ${locIds}  ${dnis}  ${servAcctId}  ${phoneEmpty}  ${ownOcc}  ${page}  ${size}  ${sort}

  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Create request headers
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}

    # Other string fields can still be quoted if they need to be.
    ${nAddress}=    Add Quotes If Not Null    ${address}
    ${nCName}=      Add Quotes If Not Null    ${cName}
    ${nCId}=        Add Quotes If Not Null    ${cId}
    ${nLName}=      Add Quotes If Not Null    ${lName}
    ${nLocId}=      Add Quotes If Not Null    ${locId}
    ${nDnis}=       Add Quotes If Not Null    ${dnis}
    ${nServAcctId}=    Add Quotes If Not Null    ${servAcctId}

    Set Local Variable    ${var1}    "address1":${nAddress},"companyName":${nCName},"customerId":${nCId},
    Set Local Variable    ${var2}    "lastName":${nLName},"locationId":${nLocId},"locationIds":${locIds},"phoneNumber":${nDnis},
    Set Local Variable    ${var3}    "serviceAccountId":${nServAcctId},"isPhoneNumberEmpty":${phoneEmpty},"keepOwnerOccupied":${ownOcc}

    Set Local Variable    ${variables}    {"input":{${var1}${var2}${var3}},"page":${page},"size":${size},"sort":"${sort}"}

    ${body}=    Create Dictionary
    ...    query=${searchServiceAccounts_body}
    ...    variables=${variables}

    ${response}=    POST
    ...    url=${api_url}graphql
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=200

    RETURN    ${response.json()}[data][searchServiceAccounts]

updateBillingAccount API
  [Arguments]  ${billAcctId}  ${billCustId}  ${active}  ${happy}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${billAcctId}=    Convert To Integer    ${billAcctId}
  ${active}=    Convert To Boolean    ${active}
  ${happy}=    Convert To Boolean    ${happy}

  ${input}=  Create Dictionary     
  ...    id=${billAcctId}    billingCustomerId=${billCustId}    active=${active}    happyChecks=${happy}  
  ${variables}=  Create Dictionary    
  ...    input=${input}
  Log To Console    ${variables}

  ${body}=  Create Dictionary
    ...  query=${updateBillingAccount_body}
    ...  variables=${variables}
  Log To Console    ${body}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  Log To Console    ${response.json()}
  RETURN  ${response.json()}[data][updateBillingAccount]

updateServiceAccount API
  [Arguments]  ${servAcctId}  ${firstName}  ${lastName}  ${dnis}  ${extension}  ${email}  ${title}  ${noEmail}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${nExt}=  Add Quotes If Not Null  ${extension}
  ${nTitle}=  Add Quotes If Not Null  ${title}
  Set Local Variable  ${var1}  "id":${servAcctId},"customer":{"firstName": "${firstName}","lastName": "${lastName}","phoneNumber": "${dnis}",
  Set Local Variable  ${var2}  "extension": ${nExt},"email": "${email}","title": ${nTitle},"noEmail": ${noEmail}}
  Set Local Variable  ${variables}  {"input":{${var1}${var2}}}
  ${body}=  Create Dictionary
    ...  query=${updateServiceAccount_body}
    ...  variables=${variables}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][updateServiceAccount]

updateServiceAccountForAnnie API
  [Arguments]  ${servAcctId}  ${firstName}  ${lastName}  ${dnis}  ${extension}  ${email}  ${title}
  ...  ${leadSourceTypeId}  ${leadSourceId}  ${altFirstName}  ${altLastName}  ${referral}  ${noEmail}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${nExt}=  Add Quotes If Not Null  ${extension}
  ${nTitle}=  Add Quotes If Not Null  ${title}
  ${nAltFirstName}=  Add Quotes If Not Null  ${altFirstName}
  ${nAltLastName}=  Add Quotes If Not Null  ${altLastName}
  ${nReferral}=  Add Quotes If Not Null  ${referral}
  Set Local Variable  ${var1}  "id":${servAcctId},"customer":{"firstName": "${firstName}","lastName": "${lastName}",
  Set Local Variable  ${var2}  "phoneNumber": "${dnis}","extension": ${nExt},"email": "${email}","title": ${nTitle},
  Set Local Variable  ${var3}  "leadSourceTypeId":${leadSourceTypeId},"leadSourceId": ${leadSourceId},
  Set Local Variable  ${var4}  "altFirstName": ${nAltFirstName},"altLastName": ${nAltLastName},"referral": ${nReferral},"noEmail": ${noEmail}}
  Set Local Variable  ${variables}  {"input":{${var1}${var2}${var3}${var4}}}
  ${body}=  Create Dictionary
    ...  query=${updateServiceAccountForAnnie_body}
    ...  variables=${variables}
  ${response}=  POST  url=${api_url}graphql  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][updateServiceAccountForAnnie]