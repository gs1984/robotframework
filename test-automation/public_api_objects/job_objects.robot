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
Resource    ../utils/public_api_utils.robot

*** Variables ***


${cancelJob_query}=
...    mutation CancelJob($input: CancelJobInput!) {
...  cancelJob(input: $input) {successful message
...    errors {path errorMessage}
...    cancelJob {id canceledNotes}}}   

# ${createJob_query}=
# ...  mutation CreateJob($input: CreateJobInput!) {
# ...    createJob(input: $input) {successful message
# ...      errors{path errorMessage}
# ...      jobData{id number jobClass jobType jobTypeDescription timePreference locationId estimatedDuration callbackJobNumber category scheduledFor zoneId departmentId
# ...        startTimePreference endTimePreference employeeCode leadSourceTypeId leadSourceId status arBillingCustomerId saleEst customerPONumber contact claimNo
# ...        contractNo sendBooked sendReminder callId priority serviceAccountId notes startDate endDate}}}
... 
${createJob_query}=
...    mutation CreateJob($input: CreateJobInput!) {
...    createJob(input: $input) {successful message
...    errors{path errorMessage}
...    jobData{id number jobClass jobType jobTypeDescription timePreference locationId estimatedDuration callbackJobNumber category scheduledFor zoneId departmentId
...     startTimePreference endTimePreference employeeCode leadSourceTypeId leadSourceId status arBillingCustomerId saleEst customerPONumber contact claimNo
...    contractNo sendBooked sendReminder callId priority serviceAccountId notes startDate endDate 
...    assignments {id employeeCode primaryEmployeeCode status estimatedDuration confirmedAt assignedAt scheduledFor notifiedAt dispatchedAt onSiteAt completedAt 
...    attentionNote isPrimary timePreference startTimePreference endTimePreference}}}}

${CreateUpdateJobClasses_body}=
...    mutation CreateUpdateJobClasses($input: JobClassesRequest!) {
...      createUpdateJobClasses(input: $input) {
...        successful
...        message
...        jobClass {
...          jobClassId
...          code
...          active
...          saleEst
...        }
...        errors {
...          path
...          errorMessage
...        }
...      }
...    }
${CreateUpdateJobType_body}=
...    mutation CreateUpdateJobType($input: JobTypeRequest!) {
...      createUpdateJobType(input: $input) {
...        successful
...        message
...        jobType {
...          id
...          code
...          description
...          estimatedDuration
...          department {
...            id
...            departmentName
...            description
...            active
...          }
...          jobClass {
...            jobClassId
...            code
...            active
...            saleEst
...          }
...          active
...        }
...        errors {
...          path
...          errorMessage
...        }
...      }
...    }
${GetJobAndCall_body}=
...    query GetJobAndCall($code: String, $inactive: Boolean!) {
...      getJobAndCall(code: $code, inactive: $inactive) {
...        id
...        code
...        description
...        jobClass
...        department
...        active
...      }
...    }
${GetJobClasses_body}=
...    query GetJobClasses($jobClassCode: String, $jobTypeCode: String, $inactive: Boolean!) {
...      getJobClasses(jobClassCode: $jobClassCode, jobTypeCode: $jobTypeCode, inactive: $inactive) {
...        jobClassId
...        code
...        active
...        saleEst
...        jobTypes {
...          id
...          code
...          description
...          estimatedDuration
...          active
...          department {
...            id
...            departmentName
...            description
...          }
...        }
...      }
...    }
${GetJobClassesList_body}=
...    query GetJobClassesList($jobClass: String!, $inactive: Boolean!) {
...      getJobClassesList(jobClass: $jobClass, inactive: $inactive) {
...        id
...        jobClass
...        isSalesEst
...        active
...      }
...    }
${jobAdd_body}=
...    mutation JobAdd($input: CreateJobCustomerInput!) {
...      jobAdd(input: $input) {
...        successful
...        message
...        jobData {
...          id
...          jobClass
...          jobType
...          jobTypeDescription
...          category
...          scheduledFor
...          zoneId
...          departmentId
...          startTimePreference
...          endTimePreference
...          employeeCode
...          leadSourceTypeId
...          leadSourceId
...          status
...          arBillingCustomerId
...          saleEst
...          customerPONumber
...          contact
...          claimNo
...          contractNo
...          sendBooked
...          sendReminder
...          callId
...          priority
...          serviceAccountId
...          notes
...        }
...        errors {
...          path
...          errorMessage
...        }
...      }
...    }
${queryJobAndCalls_body}=
...    query QueryJobAndCalls($code: String!, $inactive: Boolean!) {
...        queryJobAndCalls(code: $code, inactive: $inactive) {
...            successful
...            message
...            errors {
...                path
...                errorMessage
...            }
...            jobAndCalls {
...                id
...                code
...                description
...                jobClass
...                department
...                legacyJobClassCode
...                legacyPricebookItemId
...                legacyFlatRateId
...                active
...            }
...        }
...    }
${queryJobClasses_body}=
...    query QueryJobClasses($jobClass: String!, $inactive: Boolean!) {
...        queryJobClasses(jobClass: $jobClass, inactive: $inactive) {
...            successful
...            message
...            errors {
...                path
...                errorMessage
...            }
...            jobClasses {
...                id
...                jobClass
...                isSalesEst
...                active
...            }
...        }
...    }
${queryJobClassJobType_body}=
...    query QueryJobClassJobType($jobClassCode: String, $jobTypeCode: String, $inactive: Boolean!) {
...        queryJobClassJobType(jobClassCode: $jobClassCode, jobTypeCode: $jobTypeCode, inactive: $inactive) {
...            successful
...            message
...            errors {
...                path
...                errorMessage
...            }
...            jobClasses {
...                jobClassId
...                code
...                active
...                saleEst
...                jobTypes {
...                    id
...                    code
...                    description
...                    estimatedDuration
...                    active
...                    department {
...                        id
...                        departmentName
...                        description
...                        active
...                    }
...                }
...            }
...        }
...    }
${searchJobs_body}=
...    query SearchJobs($input: searchJobRequest!, $page: Int!, $size: Int!) {
...        searchJobs(input: $input, page: $page, size: $size) {
...            totalElements
...            totalPages
...            pageSize
...            pageNumber
...            numberOfElements
...            content {
...                id
...                number
...            }
...        }
...    }
${updateJobDetail_body}=
...    mutation UpdateJobDetail($input: UpdateJobInput!) {
...        updateJobDetail(input: $input) {
...            successful
...            message
...            errors {
...                path
...                errorMessage
...            }
...            jobData {
...                id
...                number
...                jobClass
...                jobType
...                jobTypeDescription
...                locationId
...                timePreference
...                estimatedDuration
...                scheduledFor
...                departmentId
...                leadSourceTypeId
...                leadSourceId
...                employeeCode
...                status
...                zoneId
...                isJobHavingIssue
...                serviceAccountId
...                priority
...                callId
...                callbackJobNumber
...                campaignId
...                opportunityId
...                visitIds
...                category
...                notes
...                startDate
...                endDate
...            }
...        }
...    }
${updateJobNotesById_body}=
...    mutation UpdateJobNotesById($jobId: Long!, $jobNotes: String!, $replaceNotes: Boolean!) {
...        updateJobNotesById(jobId: $jobId, jobNotes: $jobNotes, replaceNotes: $replaceNotes) {
...            successful
...            message
...            jobNotes {
...                id
...                jobNotes
...            }
...            errors {
...                path
...                errorMessage
...            }
...        }
...    }

*** Keywords ***
cancelJob API
  [Arguments]  ${cancelJobId}  ${canceledNotes}  ${replaceNotes}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable    ${api_url}graphql
  ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
  #Set Local Variable  ${variable}  {"input": {"id": ${cancelJobId},"canceledNotes": "${canceledNotes}","replaceNotes": ${replaceNotes}}}
 # Prepare input variables
  ${input}=  Create Dictionary
    ...  id=${cancelJobId}
    ...  canceledNotes=${canceledNotes}    
 
  ${variables}=  Create Dictionary
    ...  input=${input}

  ${body}=  Create Dictionary
  ...  query=${cancelJob_query}
  ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  RETURN  ${response.json()}[data][cancelJob]

createJob API
  [Arguments]  ${jobClass}  ${jobType}  ${jobTypeDescription}  ${timePreference}  ${locationId}  ${estimatedDuration}  ${callbackJobNumber}  ${category}  ${scheduledFor}
  ...  ${zoneId}  ${departmentId}  ${startTimePreference}  ${endTimePreference}  ${employeeCode}  ${leadSourceTypeId}  ${leadSourceId}  ${status}  ${arBillingCustomerId}
  ...  ${saleEst}  ${customerPONumber}  ${contact}  ${claimNo}  ${contractNo}  ${sendBooked}  ${sendReminder}  ${callId}  ${priority}  ${serviceAccountId}
  ...  ${workRequestNotes}  ${isNotified}  ${priorityLevel}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable    ${api_url}graphql
  ${headers}=  Create Dictionary  Authorization=bearer ${api_token}

  # Checking arguments that may need quotes
  ${nTimePreference}=  Add Quotes If Not Null  ${timePreference}
  ${nCallbackJobNumber}=  Add Quotes If Not Null  ${callbackJobNumber}
  ${nZoneId}=  Add Quotes If Not Null  ${zoneId}
  ${nStartTimePreference}=  Add Quotes If Not Null  ${startTimePreference}
  ${nEndTimePreference}=  Add Quotes If Not Null  ${endTimePreference}
  ${nEmployeeCode}=  Add Quotes If Not Null  ${employeeCode}
  ${nArBillingCustomerId}=  Add Quotes If Not Null  ${arBillingCustomerId}
  ${nCustomerPONumber}=  Add Quotes If Not Null  ${customerPONumber}
  ${nContact}=  Add Quotes If Not Null  ${contact}
  ${nClaimNo}=  Add Quotes If Not Null  ${claimNo}  
  ${nContractNo}=  Add Quotes If Not Null  ${contractNo}
  ${nCallId}=  Add Quotes If Not Null  ${callId}

# Prepare input variables
  ${input}=  Create Dictionary
    ...  category=${category}
    ...  jobClass=${jobClass}
    ...  jobType=${jobType}
    ...  leadSourceTypeId=${leadSourceTypeId}
    ...  leadSourceId=${leadSourceId}
    ...  workRequestNotes=${workRequestNotes}
    ...  estimatedDuration=${estimatedDuration}
    ...  departmentId=${departmentId}
    ...  scheduledFor=${scheduledFor}
    ...  priority=${priority}
    ...  employeeCode=${nEmployeeCode}
    ...  jobTypeDescription=${jobTypeDescription}
    ...  serviceAccountId=${serviceAccountId}
    ...  locationId=${locationId}
    ...  saleEst=${saleEst}
    
   ${variables}=  Create Dictionary
    ...  input=${input}
    
    Log To Console    Varriables: ${variables}

  ${body}=  Create Dictionary
    ...  query=${createJob_query}
    ...  variables=${variables}
    
    Log To Console    Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  Log To Console    Response: ${response.json()}
  RETURN  ${response.json()}[data][createJob]

CreateUpdateJobClasses API
  [Arguments]  ${jobClassId}  ${jobClass}  ${active}  ${isSalesEst}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${input}=  Create Dictionary
    ...  id=${jobClassId}
    ...  jobClass=${jobClass}
    ...  active=${active}
    ...  isSalesEst=${isSalesEst}

  ${variables}=  Create Dictionary
    ...  input=${input}

  ${body}=  Create Dictionary
    ...  query=${CreateUpdateJobClasses_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

CreateUpdateJobType API
  [Arguments]  ${jobTypeId}  ${code}  ${description}  ${jobClass}  ${department}  ${estimatedDuration}  ${estimatedDays}  ${estimatedDayHours}  ${estimatedDayManHours}  ${isPermitRequired}  ${active}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${input}=  Create Dictionary
    ...  id=${jobTypeId}
    ...  code=${code}
    ...  description=${description}
    ...  jobClass=${jobClass}
    ...  department=${department}
    ...  estimatedDuration=${estimatedDuration}
    ...  estimatedDays=${estimatedDays}
    ...  estimatedDayHours=${estimatedDayHours}
    ...  estimatedDayManHours=${estimatedDayManHours}
    ...  isPermitRequired=${isPermitRequired}
    ...  active=${active}

  ${variables}=  Create Dictionary
    ...  input=${input}

  ${body}=  Create Dictionary
    ...  query=${CreateUpdateJobType_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

GetJobAndCall API
  [Arguments]  ${code}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${variables}=  Create Dictionary
    ...  code=${code}
    ...  inactive=${inactive}

  ${body}=  Create Dictionary
    ...  query=${GetJobAndCall_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

GetJobClasses API
  [Arguments]  ${jobClassCode}  ${jobTypeCode}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${variables}=  Create Dictionary
    ...  jobClassCode=${jobClassCode}
    ...  jobTypeCode=${jobTypeCode}
    ...  inactive=${inactive}

  ${body}=  Create Dictionary
    ...  query=${GetJobClasses_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response.json()['data']['getJobClasses']}

GetJobClasses Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${GetJobClasses_body}
  
  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response.json()}

GetJobClassesList API
  [Arguments]  ${jobClass}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${variables}=  Create Dictionary
    ...  jobClass=${jobClass}
    ...  inactive=${inactive}

  ${body}=  Create Dictionary
    ...  query=${GetJobClassesList_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response.json()['data']['getJobClassesList']}
  
GetJobClassesList Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${GetJobClassesList_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}
  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

jobAdd API
  [Arguments]  ${jobClass}  ${jobType}  ${jobTypeDescription}  ${locationId}  ${estimatedDuration}  ${category}  ${scheduledFor}  ${departmentId}  ${leadSourceTypeId}  ${leadSourceId}  ${status}  ${serviceAccountId}  ${workRequestNotes}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
    
    ${input}=  Create Dictionary
    ...  jobClass=${jobClass}  jobType=${jobType}  jobTypeDescription=${jobTypeDescription}  locationId=${locationId}  estimatedDuration=${estimatedDuration}  category=${category}
    ...  scheduledFor=${scheduledFor}  departmentId=${departmentId}  leadSourceTypeId=${leadSourceTypeId}  leadSourceId=${leadSourceId}  status=${status}  
    ...  serviceAccountId=${serviceAccountId}  workRequestNotes=${workRequestNotes}
    
   
    ${true_flag}=    Set Variable    true  
    ${true_flag}=    Convert To Boolean    ${true_flag}
    ${n_val}=    Set Variable    null

    ${location}=  Create Dictionary    zipCode=30329    type=Residential    state=GA    city=Atlanta    address1=1392 Lively Ridge Rd NE
      
    ${customer}=    Create Dictionary    phoneNumber=4047908111    noEmail=${true_flag}    leadSourceTypeId=${leadSourceTypeId}    leadSourceId=${leadSourceTypeId}
     ...    lastName=Pawliger    firstName=Richard
      
    ${input}=  Create Dictionary    leadSourceTypeId=1010000013    leadSourceType=Referral    leadSourceId=1010000013    leadSource=REF    jobType=Roof Repair    jobClass=JOBS
    ...    isNewCustomer=${true_flag}    departmentId=1010000003
    Set To Dictionary  ${input}  customer=${customer}  location=${location}  
    ...    contractNo=136643    claimNo=0    category=SERVICE

    ${variables}=  Create Dictionary
      ...  input=${input}
          
    Log To Console   Varriable: ${variables}
    
    ${body}=  Create Dictionary  query=${jobAdd_body}
    ...  variables=${variables}
    
    # ${body}=  Create Dictionary  query=mutation CreateJob($input: CreateJobInput!) { createJob(input: $input) { successful message errors { path errorMessage } jobData { id number } } }  variables=${variables}
    Log To Console    ${body}
    Log To Console    URl:${url}

    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
    Log To Console    ${response.json()}
    RETURN  ${response.json()}

queryJobAndCalls API
    [Arguments]    ${code}    ${inactive}
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary
        ...  Authorization=bearer ${api_token}
    ${variables}=  Create Dictionary
        ...  code=${code}
        ...  inactive=${inactive}
    ${body}=  Create Dictionary
        ...  query=${queryJobAndCalls_body}
        ...  variables=${variables}

    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
    Log  Response Content: ${response.content}
    RETURN  ${response.json()}

queryJobAndCalls Without Param API
    IF  '${api_token}' == '${None}'
        Get API Auth Token
    END
    ${url}=  Set Variable  ${api_url}graphql
    ${headers}=  Create Dictionary
        ...  Authorization=bearer ${api_token}

    ${body}=  Create Dictionary
        ...  query=${queryJobAndCalls_body}

    ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

    # Log the response content for debugging
    Log  Response Content: ${response.content}
    RETURN  ${response.json()}

queryJobClasses API
  [Arguments]    ${jobClass}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  jobClass=${jobClass}
    ...  inactive=${inactive}
  ${body}=  Create Dictionary
    ...  query=${queryJobClasses_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.content}

  RETURN  ${response.json()['data']['queryJobClasses']}

queryJobClasses Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${queryJobClasses_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.content}

  RETURN  ${response.json()} 

queryJobClassJobType API
  [Arguments]    ${jobClassCode}  ${jobTypeCode}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  jobClassCode=${jobClassCode}
    ...  jobTypeCode=${jobTypeCode}
    ...  inactive=${inactive}
  ${body}=  Create Dictionary
    ...  query=${queryJobClassJobType_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.json()}

  RETURN  ${response.content}

queryJobClassJobType Without JobClass API
  [Arguments]    ${jobTypeCode}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  jobTypeCode=${jobTypeCode}
    ...  inactive=${inactive}
  ${body}=  Create Dictionary
    ...  query=${queryJobClassJobType_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  # Log the response content for debugging
  Log  Response Content: ${response.json()}
  RETURN  ${response.json()}

queryJobClassJobType Without JobType API
  [Arguments]    ${jobClassCode}  ${inactive}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${variables}=  Create Dictionary
    ...  jobClassCode=${jobClassCode}
    ...  inactive=${inactive}
  ${body}=  Create Dictionary
    ...  query=${queryJobClassJobType_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  # Log the response content for debugging
  Log  Response Content: ${response.json()}
  RETURN  ${response.json()}

queryJobClassJobType Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  ${body}=  Create Dictionary
    ...  query=${queryJobClassJobType_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.json()}
  RETURN  ${response.json()}


searchJobs API
  [Arguments]    ${jobNumbers}  ${page}  ${size}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Explicitly convert arguments to their expected types
  ${page_int}=  Convert To Integer  ${page}
  ${size_int}=  Convert To Integer  ${size}
  ${jobNumbers_list}=  Evaluate  ${jobNumbers} if isinstance(${jobNumbers}, list) else [${jobNumbers}]

  # Construct the input object
  ${input}=  Create Dictionary
    ...  jobNumbers=${jobNumbers_list}

  ${variables}=  Create Dictionary
    ...  input=${input}
    ...  page=${page_int}
    ...  size=${size_int}
  
  ${body}=  Create Dictionary
    ...  query=${searchJobs_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.json()}

  RETURN  ${response.json()}

searchJobs Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}
  
  ${body}=  Create Dictionary
    ...  query=${searchJobs_body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.json()}

  RETURN  ${response.json()}

updateJobDetail API
  [Arguments]    ${id}  ${jobClass}  ${jobType}  ${jobTypeDescription}  ${locationId}  ${timePreference}
  ...  ${estimatedDuration}  ${scheduledFor}  ${departmentId}  ${leadSourceTypeId}  ${leadSourceId}
  ...  ${employeeCode}  ${status}  ${zoneId}  ${isJobHavingIssue}  ${serviceAccountId}  ${priority}
  ...  ${callId}  ${callbackJobNumber}  ${campaignId}  ${opportunityId}  ${visitIds}  ${category}
  ...  ${notes}  ${isNotified}  ${sendReminder}  ${priorityLevel}  ${replaceNotes}

  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Explicitly cast arguments to their expected types
  ${id_long}=  Convert To Integer  ${id}
  ${locationId_long}=  Convert To Integer  ${locationId}
  ${estimatedDuration_int}=  Convert To Integer  ${estimatedDuration}
  ${departmentId_long}=  Convert To Integer  ${departmentId}
  ${leadSourceTypeId_long}=  Convert To Integer  ${leadSourceTypeId}
  ${leadSourceId_long}=  Convert To Integer  ${leadSourceId}
  ${zoneId_long}=  Convert To Integer  ${zoneId}
  ${serviceAccountId_long}=  Convert To Integer  ${serviceAccountId}
  ${priority_bool}=  Convert To Boolean  ${priority}
  ${isJobHavingIssue_bool}=  Convert To Boolean  ${isJobHavingIssue}
  ${isNotified_bool}=  Convert To Boolean  ${isNotified}
  ${sendReminder_bool}=  Convert To Boolean  ${sendReminder}
  ${priorityLevel_int}=  Convert To Integer  ${priorityLevel}
  ${replaceNotes_bool}=  Convert To Boolean  ${replaceNotes}

  # Construct the input object
  ${input}=  Create Dictionary
    ...  id=${id_long}
    ...  jobClass=${jobClass}
    ...  jobType=${jobType}
    ...  jobTypeDescription=${jobTypeDescription}
    ...  locationId=${locationId_long}
    ...  timePreference=${timePreference}
    ...  estimatedDuration=${estimatedDuration_int}
    ...  scheduledFor=${scheduledFor}
    ...  departmentId=${departmentId_long}
    ...  leadSourceTypeId=${leadSourceTypeId_long}
    ...  leadSourceId=${leadSourceId_long}
    ...  employeeCode=${employeeCode}
    ...  status=${status}
    ...  zoneId=${zoneId_long}
    ...  isJobHavingIssue=${isJobHavingIssue_bool}
    ...  serviceAccountId=${serviceAccountId_long}
    ...  priority=${priority_bool}
    ...  callId=${callId}
    ...  callbackJobNumber=${callbackJobNumber}
    ...  campaignId=${campaignId}
    ...  opportunityId=${opportunityId}
    ...  visitIds=${visitIds}
    ...  category=${category}
    ...  notes=${notes}
    ...  isNotified=${isNotified_bool}
    ...  sendReminder=${sendReminder_bool}
    ...  priorityLevel=${priorityLevel_int}
    ...  replaceNotes=${replaceNotes_bool}

  ${variables}=  Create Dictionary
    ...  input=${input}
  
  ${body}=  Create Dictionary
    ...  query=${updateJobDetail_body}
    ...  variables=${variables}

  Log To Console    ${body}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.content}

  RETURN  ${response.content}

updateJobNotesById API
  [Arguments]    ${jobId}  ${jobNotes}  ${replaceNotes}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Convert jobId to string and replaceNotes to boolean
  ${jobId_string}=  Convert To String  ${jobId}
  ${replaceNotes_bool}=  Convert To Boolean  ${replaceNotes}

  # Construct the input variables
  ${variables}=  Create Dictionary
    ...  jobId=${jobId_string}
    ...  jobNotes=${jobNotes}
    ...  replaceNotes=${replaceNotes_bool}
  
  ${body}=  Create Dictionary
    ...  query=${updateJobNotesById_body}
    ...  variables=${variables}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  # Log the response content for debugging
  Log  Response Content: ${response.content}

  RETURN  ${response.content}