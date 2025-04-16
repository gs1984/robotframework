#** API Calls in this file
# getScheduleBlocks
# getTimeSlotDetail
#** queryTimeSlot
# scheduleJob
# searchAssignments
# searchScheduledCalls

*** Settings ***
Resource  ../utils/public_api_utils.robot

*** Variables ***
${GetScheduleBlocks_body}=
...    query GetScheduleBlocks($groupTimeSlotID: String!, $jobClass: String!, $jobType: String!, $startDate: String!, $endDate: String!) {
...      getScheduleBlocks(groupTimeSlotId: $groupTimeSlotID, jobClass: $jobClass, jobType: $jobType, startDate: $startDate, endDate: $endDate) {
...        successful
...        message
...        errors {
...          path
...          errorMessage
...        }
...        scheduleGroupBlock {
...          groupTimeSlotId
...          groupName
...          scheduleStartDate
...          scheduleEndDate
...          scheduleBlock {
...            id
...            date
...            startTime
...            endTime
...            scheduled
...            slots
...            allowOverbooking
...          }
...        }
...      }
...    }
${GetTimeSlotDetail_body}=
...    query GetTimeSlotDetail($groupName: String!) {
...      getTimeSlotDetail(groupName: $groupName) {
...        id
...        groupJobClasses {
...          id
...          jobClass
...          jobType
...          jobTypeDescription
...        }
...      }
...    }
${queryTimeSlot_body}=
...  query QueryTimeSlot($groupName: String!){
...    queryTimeSlot(groupName: $groupName){successful message errors{path errorMessage}
...      timeSlot{id groupJobClasses{id jobClass jobType jobTypeDescription}}}}
${ScheduleJob_body}=
...    mutation ScheduleJob($input: ScheduleJobInput!) {
...      scheduleJob(input: $input) {
...        successful
...        message
...        errors {
...          path
...          errorMessage
...        }
...        scheduleJobResponse {
...          id
...          scheduledFor
...          notes
...        }
...      }
...    }
${SearchAssignments_body}=
...    query SearchAssignments($input: SearchAssignmentInput, $page: Int!, $size: Int!, $sort: [String]) {
...      searchAssignments(input: $input, page: $page, size: $size, sort: $sort) {
...        successful
...        message
...        errors {
...          path
...          errorMessage
...        }
...        totalElements
...        totalPages
...        pageSize
...        pageNumber
...        numberOfElements
...        content {
...          id
...          status
...          job {
...            id
...            number
...            jobClass
...            jobType
...            campaign {
...              id
...              startDate
...              endDate
...            }
...            scheduledFor
...          }
...          isCompleted
...          assignedAt
...          scheduledFor
...          completedAt
...          attentionNote
...        }
...      }
...    }
${SearchScheduledCalls_body}=
...    query SearchScheduledCalls($input: SearchViewScheduleCallRequest!, $page: Int!, $size: Int!, $sort: [String]) {
...      searchScheduledCalls(input: $input, page: $page, size: $size, sort: $sort) {
...        successful
...        message
...        errors {
...          path
...          errorMessage
...        }
...        totalElements
...        totalPages
...        pageSize
...        pageNumber
...        numberOfElements
...        content {
...          jobId
...          callId
...          callDate
...          jobClass
...          jobNumber
...        }
...      }
...    }

*** Keywords ***
GetScheduleBlocks API
  [Arguments]  ${groupTimeSlotID}  ${jobClass}  ${jobType}  ${startDate}  ${endDate}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${variables}=  Create Dictionary
    ...  groupTimeSlotID=${groupTimeSlotID}
    ...  jobClass=${jobClass}
    ...  jobType=${jobType}
    ...  startDate=${startDate}
    ...  endDate=${endDate}

  ${body}=  Create Dictionary
    ...  query=${GetScheduleBlocks_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json['data']['getScheduleBlocks']}

GetScheduleBlocks Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${GetScheduleBlocks_body}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200

  RETURN  ${response.json()}

GetTimeSlotDetail API
  [Arguments]  ${groupName}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Pass groupName as part of variables
  ${variables}=  Create Dictionary
    ...  groupName=${groupName}

  ${body}=  Create Dictionary
    ...  query=${GetTimeSlotDetail_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

queryTimeSlot API
  [Arguments]  ${groupName}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary  Authorization=bearer ${api_token}
  ${variables}=    Create Dictionary
  ...  groupName=${groupName}
  ${body}=  Create Dictionary
  ...  query=${queryTimeSlot_body}
  ...  variables=${variables}
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}  expected_status=200
  ${response_body_length}=  Get Length  ${response.json()['data']}
  RETURN  ${response.json()['data']['queryTimeSlot']}

ScheduleJob API
  [Arguments]  ${jobId}  ${scheduledFor}  ${notes}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  # Prepare input variables
  ${input}=  Create Dictionary
    ...  id=${jobId}
    ...  scheduledFor=${scheduledFor}
    ...  notes=${notes}

  ${variables}=  Create Dictionary
    ...  input=${input}

  ${body}=  Create Dictionary
    ...  query=${ScheduleJob_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

SearchAssignments API
  [Arguments]  ${jobId}  ${page}  ${size}  ${sort}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${input}=  Create Dictionary
    ...  jobId=${jobId}
    # ...  page=${page}
    # ...  size=${size}
    # ...  sort=${sort}
  Log To Console    Input: ${input}  

  ${variables}=  Create Dictionary
    ...  input=${input}
    ...  page=${page}
    ...  size=${size}
    ...  sort=${sort}    
    Log To Console    Varriables: ${variables}

  ${body}=  Create Dictionary
    ...  query=${SearchAssignments_body}
    ...  variables=${variables}
  Log To Console    Body ${body}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}
  Log  Response Content: ${response.content}
   
  ${response_json}=  Set Variable  ${response.json()}
  Log To Console    ${response_json} 
  RETURN  ${response_json}

SearchAssignments Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${SearchAssignments_body}
  Log To Console    Body ${body}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}
  Log  Response Content: ${response.content}
   
  ${response_json}=  Set Variable  ${response.json()}
  Log To Console    ${response_json} 
  RETURN  ${response_json}

SearchScheduledCalls API
  [Arguments]  ${assignmentDate}  ${callDate}  ${callDateThru}  ${jobId}  ${page}  ${size}  ${sort}
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${input}=  Create Dictionary
    ...  assignmentDate=${assignmentDate}
    ...  callDate=${callDate}
    ...  callDateThru=${callDateThru}
    ...  jobId=${jobId}

  ${variables}=  Create Dictionary
    ...  input=${input}
    ...  page=${page}
    ...  size=${size}
    ...  sort=${sort}

  ${body}=  Create Dictionary
    ...  query=${SearchScheduledCalls_body}
    ...  variables=${variables}

  Log  Request Body: ${body}

  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}

SearchScheduledCalls Without Param API
  IF  '${api_token}' == '${None}'
    Get API Auth Token
  END
  ${url}=  Set Variable  ${api_url}graphql
  ${headers}=  Create Dictionary
    ...  Authorization=bearer ${api_token}

  ${body}=  Create Dictionary
    ...  query=${SearchScheduledCalls_body}
  
  ${response}=  POST  url=${url}  json=${body}  headers=${headers}

  # Log the response content
  Log  Response Content: ${response.content}

  ${response_json}=  Set Variable  ${response.json()}
  RETURN  ${response_json}