#** API Calls in this file
#** getCustomInvoiceById
#** listChangedInvoice
# queryCustomInvoiceById
# updateARInvoice
# updateARInvoiceItem - not available yet

*** Settings ***
Resource  ../utils/public_api_utils.robot
Library    DateTime

*** Variables ***
${getCustomInvoiceById_body}=
...  query GetCustomInvoiceById($id: Long!){
...    getCustomInvoiceById(id: $id){id invoiceNumber discountTypeName discountPercent discountAmount totalAmount taxableAmount taxCodeName taxPercent, taxIncludedAmount
...      taxIncluded taxAmountDue taxAmount subTotalWarranty subTotalAgreement subTotal subAfterDiscount netBalance currentBalance manualTax lessAmount depositAmount
...      paymentAmount updatedBy signatureWorkAuth signatureWorkApplication signaturePayment hasInvoiceDiscount autoDetail readyToPost updatedAt departmentName
...      invoiceItemType jobId locationId arBillingCustomerId
...      invoiceItemCustomDtos{id} invoiceMemoDtos{invoiceId workSuggested} invoiceDepositDtos{depositReceivableId depositBalanceAvailable depositAmount}}}
${listChangedInvoice_body}=
...  query ListChangedInvoice($modifyDate:String!,$page:Int!,$size:Int!,$sort:String!){
...    listChangedInvoice(modifyDate:$modifyDate,page:$page,size:$size,sort:$sort) {
...       totalElements totalPages pageSize  pageNumber numberOfElements
...       content{id serviceAccountId invoiceDate arBillingCustomerId locationId invoiceNumber jobNumber jobClass jobType leadSourceDescription leadSourceType jobDepartment
...         invoiceDepartment subTotal totalAmount netBalance saleEst
...         invoiceItemResponseList {invoiceId itemNumber quantity unitPrice totalSale discountAmount totalAfterDiscount chargeTo}}}}
${queryCustomInvoiceById_body}=
...    query QueryCustomInvoiceById($id: Long!){
...    queryCustomInvoiceById(id: $id){
...        successful
...        message
...        errors {
...            path
...            errorMessage
...        }
...        customInvoice {
...            id
...            invoiceNumber
...            discountTypeName
...            discountPercent
...            discountAmount
...            totalAmount
...            taxableAmount
...            taxCodeName
...            taxPercent
...            taxIncludedAmount
...            taxIncluded
...            taxAmountDue
...            taxAmount
...            subTotalWarranty
...            subTotalAgreement
...            subTotal
...            subAfterDiscount
...            netBalance
...            currentBalance
...            manualTax
...            lessAmount
...            depositAmount
...            paymentAmount
...            updatedBy
...            signatureWorkAuth
...            signatureWorkApplication
...            signaturePayment
...            hasInvoiceDiscount
...            autoDetail
...            readyToPost
...            updatedAt
...            departmentName
...            invoiceItemType
...            jobId
...            locationId
...            invoiceItemCustomDtos {
...                id
...            }
...            invoiceMemoDtos {
...                invoiceId
...                workSuggested
...            }
...            invoiceDepositDtos {
...                depositReceivableId
...                depositBalanceAvailable
...                depositAmount
...            }
...        }
...    }
...    }
${UpdateARInvoice_body}=
...    mutation UpdateARInvoice($input: ArInvoiceInput!){
...    updateArInvoice(input: $input){
...        successful
...        message
...        invoiceNumber
...        errors {
...            path
...            errorMessage
...        }
...    }
...    }
${updateARInvoiceItem_body}=
...    body here

*** Keywords ***
GetCustomInvoiceById API
    [Arguments]  ${customInvId}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
    ${variables}=    Create Dictionary
    ...  id=${customInvId}
    ${body}=  Create Dictionary
    ...  query=${getCustomInvoiceById_body}
    ...  variables=${variables}
    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
    ${response_body_length}=  Get Length  ${response.json()['data']}
    RETURN  ${response.json()['data']['getCustomInvoiceById']}

listChangedInvoice API
  [Arguments]  ${modifyDate}  ${page}  ${size}  ${sort}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  #${modifyDate}=  Convert Time  ${modifyDate}
  ${page}=  Convert To Integer  ${page}
  ${size}=  Convert To Integer  ${size}

  #Set Local Variable  ${variables}  {"modifyDate":"${modifyDate}", "page": ${page}, "size": ${size}, "sort":"${sort}"}
 
  ${variables}=  Create Dictionary  modifyDate=${modifyDate}  page=${page}  size=${size}  sort=${sort}
  
  Log To Console    Varriable: ${variables} 
  ${body}=  Create Dictionary
    ...  query=${listChangedInvoice_body}
    ...  variables=${variables}
    
   Log To Console    Body: ${body} 
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console     ${response.json()}
  RETURN  ${response.json()}[data][listChangedInvoice]

listChangedInvoice Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${listChangedInvoice_body}
   
  Log To Console    Body: ${body} 
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console     ${response.json()}
  RETURN  ${response.json()}

queryCustomInvoiceById API
  [Arguments]  ${id}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  id=${id}
  ${body}=  Create Dictionary
    ...  query=${queryCustomInvoiceById_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json['data']['queryCustomInvoiceById']['customInvoice']['id']}

UpdateARInvoice API
  [Arguments]  ${ARInvoiceId}  ${ARInvoiceNumber}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  # Explicitly ensure correct types for Long fields
  ${ARInvoiceNumberNumeric}=  Convert To Integer  ${ARInvoiceNumber}
  ${ARInvoiceNumber}=  Convert To String  ${ARInvoiceNumber}
  ${ARInvoiceId_number}=    Convert To Integer    ${ARInvoiceId}
  ${departmentId}=  Convert To Integer  25066000004
  ${departmentName}=    Set Variable    11 
  ${locationId}=  Convert To Integer  1007100047
  ${jobId}=  Convert To Integer  1007200020
  ${readyToPost}=    Convert To Boolean    false

  ${input_dict}=  Create Dictionary
    ...  id=${ARInvoiceId}
    ...  invoiceNumberNumeric=${ARInvoiceNumberNumeric}
    ...  invoiceNumber=${ARInvoiceNumber}
    ...  taxCodeId=None
    ...  paymentAmount=0
    ...  readyToPost=${readyToPost}
    ...  taxPercent=0.0
    ...  hasInvoiceDiscount=${readyToPost}
    ...  locationId=${locationId}
    ...  jobId=${jobId}
    ...  department={"id": ${departmentId}}
    ...  depositReceivableId=None
    ...  depositBalanceAvailable=0.0
    ...  workSuggested=None
    ...  invoiceItem=None
    ...  invoiceMemo=None
  
        
  ${department}=  Create Dictionary    id=${departmentId}    departmentName=${departmentName}

  ${input}=  Create Dictionary    invoiceNumber=${ARInvoiceNumber}    id=${ARInvoiceId_number}
  Set To Dictionary    ${input}    department=${department}            

  ${variables}=  Create Dictionary
    ...  input=${input}
  
  Log To Console    ${variables}
  
  ${body}=  Create Dictionary
    ...  query=${UpdateARInvoice_body}
    ...  variables=${variables}

  Log To Console    ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  Log  Response Content: ${response.content}

  Log To Console    ${response.json()}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json['data']['updateArInvoice']['message']}

updateARInvoiceItem API
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
    ...  query=${updateARInvoiceItem_body}
    ...  variables=${variables}
#  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
#  RETURN  ${response.json()}[data][updateARInvoiceItem]
  RETURN  ${None}
