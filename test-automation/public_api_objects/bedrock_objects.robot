#** API Calls in this file
#** getAgreementById
#** getBedrockTaxCode
#** getPaymentMethod
#** queryAgreementById
#** searchArBillingCustomers

*** Settings ***
Resource    ../utils/public_api_utils.robot

*** Variables ***
${getAgreementById_body}=
...  query GetAgreementById($agreementId: Long!){
...    getAgreementById(agreementId: $agreementId){
...      billingAgreement{id jobId code startDate preferredTech billingMethod billingMethodText totalAmount deposit description covers coversText term visitsPerYear years
...        totalVisits discountType discountAmount discountPercentage endDate soldBy saleDate number paidAt status taxable renewToAgreementId renewToAgreementId
...        lastVisitDate locationId maintenancePrice maintenanceDeposit servicePrice serviceDeposit billingMaintenanceAmount billingServiceAmount
...        serviceAccount{id,customer{id},serviceLocations{id},primaryBillingAddress{id},
...          billingAccountOutput{mainArBillingCustomer{id},otherArBillingCustomer{id}},
...          primaryBillingCustomerId}
...        equipments{id},
...        visitSchedules{id}}}}
${getBedrockTaxCode_body}=
...  query GetBedrockTaxCode($page:Int!,$size:Int!) {
...    getBedrockTaxCode(page: $page, size: $size){totalElements totalPages pageSize pageNumber numberOfElements 
...      content{code description stateCode statePercentage partsTaxable laborTaxable miscellaneousTaxable}}}
${getPaymentMethod_body}=
...  query GetPaymentMethod ($page:Int!,$size:Int!){
...    getPaymentMethod(page: $page, size: $size) {totalElements totalPages pageSize pageNumber numberOfElements 
...      content{id paymentMethod paymentType}}}
${queryAgreementById_body_temp}=
...  query QueryAgreementById($agreementID: Int!){queryAgreementById(agreementId: $agreementID){successful message errors{path errorMessage}
...    agreement{billingAgreement{id} accountingAgreement{id} visitScheduleResponse{visitType} technicianName salesPersonName}}}
...    
${queryAgreementById_body}=
...  query GetAgreementByAgreementId($agreementId: Long!) {queryAgreementById(agreementId: $agreementId) {successful message errors{path errorMessage}
...   agreement{salesPersonName technicianName visitScheduleResponse { visitType estimatedHours collectMaintenance collectService maintenanceValueVisit visitNotes}
...    accountingAgreement {id agreementNumber year createdDate startDate endDate renewalId salesPerson totalPrice deposit billAmount visitCount department { 
...    departmentName } agreementType { agreementTypeName } billStartDate paymentType nextBilling preferredTech agreementEquipAge visitLeft serviceAccountId maintenancePrice servicePrice billingsPerYear comment}
...    billingAgreement{id jobId code startDate totalAmount deposit description term visitsPerYear discountType endDate soldBy saleDate status maintenancePrice servicePrice}}}}


${searchArBillingCustomers_body}=
...  query SearchArBillingCustomers($page: Int! $size: Int! $sort: [String!] $input: searchBillingCustomersRequest!) {
...    searchArBillingCustomers(page: $page size: $size sort: $sort input: $input) {
...      totalElements totalPages pageSize pageNumber numberOfElements
...      content {id lastName companyName address1 address2 phoneNumber phone2 phone3 phone4 email lastName2 firstName2 firstName city state zipCode billingCustomerId}}}

*** Keywords ***
getAgreementById API
    [Arguments]    ${agreementId}
    IF  '${api_token}' == '${None}'
      Get API Auth Token
    END
    ${url}=    Set Variable  ${api_url}graphql
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}
    ${variables}=    Create Dictionary    agreementId=${agreementId}
    ${body}=    Create Dictionary    query=${getAgreementById_body}    variables=${variables}

    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN    ${response.json()['data']['getAgreementById']}

getBedrockTaxCode API
    [Arguments]    ${page}    ${size}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}
    ${page_int}=    Convert To Integer    ${page}
    ${size_int}=    Convert To Integer    ${size}
    ${variables}=    Create Dictionary    page=${page_int}    size=${size_int}
    ${body}=     Create Dictionary    query=${getBedrockTaxCode_body}    variables=${variables}
  
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN    ${response.json()}[data][getBedrockTaxCode]

getPaymentMethod API
    [Arguments]  ${page}  ${size}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=     Create Dictionary    Authorization=bearer ${api_token}
    ${page_int}=    Convert To Integer    ${page}
    ${size_int}=    Convert To Integer    ${size}
    ${variables}=    Create Dictionary    page=${page_int}    size=${size_int}
    ${body}=    Create Dictionary    query=${getPaymentMethod_body}    variables=${variables}

    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN    ${response.json()}[data][getPaymentMethod]

queryAgreementById API
    [Arguments]  ${agreementId}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=    Create Dictionary    Authorization=bearer ${api_token}
    ${agreementId}=    Convert To Integer    ${agreementId}
    ${variables}=    Create Dictionary    agreementId=${agreementId}
    ${body}=    Create Dictionary    query=${queryAgreementById_body}    variables=${variables}
    Log To Console    ${body}
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    Custom Log    ${response.json()}
    RETURN  ${response.json()}[data][queryAgreementById]

searchArBillingCustomers API
    [Arguments]  ${page}  ${size}  ${sort}  ${billingCustomerId}  ${searchType}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=  Create Dictionary    Authorization=bearer ${api_token}
    IF  '${searchType}' == '${None}'
        Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort": ["${sort}"],"input": {"billingCustomerId":"${billingCustomerId}"}}
    ELSE
        Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort": ["${sort}"],"input": {"billingCustomerId":"${billingCustomerId}","searchType":""}}
    END

    ${body}=    Create Dictionary    query=${searchArBillingCustomers_body}    variables=${variables}
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN  ${response.json()}[data][searchArBillingCustomers]

searchArBillingCustomers Without CustomerId API
    [Arguments]  ${page}  ${size}  ${sort}    ${searchType}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=  Create Dictionary    Authorization=bearer ${api_token}
    IF  '${searchType}' == '${None}'
        Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort": ["${sort}"],"input": {"billingCustomerId":""}}
    ELSE
        Set Local Variable  ${variables}  {"page": ${page},"size": ${size},"sort": ["${sort}"],"input": {"billingCustomerId":"","searchType":""}}
    END

    ${body}=    Create Dictionary    query=${searchArBillingCustomers_body}    variables=${variables}
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN  ${response.json()}[data][searchArBillingCustomers]

searchArBillingCustomers Without Param API
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=    Set Variable    ${api_url}graphql
    ${headers}=  Create Dictionary    Authorization=bearer ${api_token}
 
    ${body}=    Create Dictionary    query=${searchArBillingCustomers_body}    
    ${response}=    POST    url=${url}    json=${body}    headers=${headers}    expected_status=200
    RETURN  ${response.json()}