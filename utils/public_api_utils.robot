# This folder is used by the public integration apis.  Please notify the developer (Danny Price) of changes.

*** Settings ***
Library    RequestsLibrary
Library  CSVLib 
Resource    yaml_utils.robot
Library    String
Resource  ../utils/csv_utils.robot

*** Variables ***
${api_url}    ${None}
${api_token}    ${None}
${ts_data}    ${None}

*** Comments ***
Link to API status: https://successware.atlassian.net/wiki/spaces/SDT/pages/2710306910/Automated+API+Integration+Testing

*** Keywords ***
# This routine is a clone of Get Authorization Token in api_utils.robot.
# It gets a different token using a different url, and needs to be held in a different global variable than the UI routines.
Get API Auth Token
    [Arguments]  ${useLog}=${False}
    ${local_url} =    Get Public API Url  ${False}
    ${username}=    Get Username  ${False}
    ${password}=    Get Password  ${False}
    ${tenant}=    Get Tenant Name  ${False}
    ${login_url}=    Set Variable    ${local_url}login
    ${login_body}=    Create Dictionary
    ...    username=${username}
    ...    password=${password}
    ...    companyName=${tenant}
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    IF  '${useLog}' == '${True}'
        Custom Log    url is ${login_url}
        Custom Log    body is ${login_body}
        Custom Log    headers are ${headers}
    END
    ${response}=    POST    url=${login_url}    json=${login_body}    headers=${headers}
    IF  '${useLog}' == '${True}'
        Log To Console    ${response.text}
    END
    ${access_token}=    Set Variable  ${response.json()['access_token']}
    Set Global Variable    ${api_token}    ${access_token}
    Set Global Variable    ${api_url}    ${local_url}

  # Needed for internal api calls to populate ts_data if needed
  IF  '${token}' == '${None}'
      Get Authentication Token  ${useLog}
  END

# This routine adds quotes around the incoming value if that value is not null.
# This is needed to make sure certain api calls have the correct json format.
### value = value to be returned with quotes around it if it isn't a null.
Add Quotes If Not Null
    [Arguments]    ${value}
    IF  "${value}" == "null"
        Set Local Variable   ${result}    ${value}
    ELSE    
        Set Local Variable  ${result}    "${value}"
    END
#    Custom Log    Quote value is ${result}
    RETURN    ${result}  

# This routine checks to see if data is contained in a list (or 2 pieces of data)
### json_list  = list routine scans through for result 
### field_main = primary name of the json field in the element of the list
### data_main  = piece of data to compare to the value in the primary json field
### field_aux  = secondary json field name, can be null
### data_aux   = piece of data to compare to the value in the secondary json field, should be null if field_aux is null
Match In JSON List
  [Arguments]  ${json_list}  ${field_main}  ${data_main}  ${field_aux}=${None}  ${data_aux}=${None}
  ${json_length}=  Get Length  ${json_list}
  Set Local Variable  ${json_flag}  ${False}
  FOR  ${index}  IN RANGE  0  ${json_length}
    Set Local Variable  ${data}  ${json_list}[${index}]
    IF  '${data}[${field_main}]' == '${data_main}'
      Set Local Variable  ${json_flag}  ${True}
      IF  '${data_aux}' != '${None}'
        Should Be Equal As Strings  ${data}[${field_aux}]  ${data_aux}  msg=${data_aux} not found in ${field_aux}
      END   
    END
  END
  Should Be Equal  ${json_flag}  ${True}  msg=${data_main} not found in ${field_main}

# This routine checks a json list with a particular field for a certain matched value.
#   json_list   - JSON being scanned, root level should be the actual list
#   outer_key   - Key field used to find the inner json list being scanned
#   outer_field - name of the outside field in the json item that is to be compared
#   outer_data  - data to be compared to the to the outside item in the json with the outer field name
#   inner_field - name of the inner field in the json being scanned
#   inner_data  - data being compared to the inner field of the json
Match Double JSON List
  [Arguments]  ${json_list}  ${outer_key}  ${outer_field}  ${outer_data}  ${inner_field}  ${inner_data}
  ${outer_length}=  Get Length  ${json_list}
  Set Local Variable  ${outer_flag}  ${False}
  FOR  ${outer_idx}  IN RANGE  0  ${outer_length}
    Set Local Variable  ${outer_var}  ${json_list}[${outer_idx}]
    IF  '${outer_var}[${outer_field}]' == '${outer_data}'
      Set Local Variable  ${outer_flag}  ${True}
      Set Local Variable  ${inner_list}  ${outer_var}[${outer_key}]
      Match In JSON List  ${inner_list}  ${inner_field}  ${inner_data}
    END
  END
  Should Be Equal  ${outer_flag}  ${True}  msg=${outer_data} not found in ${outer_field}

# This routine checks a json list with a particular field for a certain value that does not match.
#   json_list  - JSON being scanned, root level should be the actual list
#   field_main - name of the field in the json item that is to be compared
#   data_main  - data to be compared to the item in the json with the field name
No Match In JSON List
  [Arguments]  ${json_list}  ${field_to_match}  ${data_to_match}
  ${json_length}=  Get Length  ${json_list}
  Set Local Variable  ${json_flag}  ${False}
  FOR  ${index}  IN RANGE  0  ${json_length}
    Set Local Variable  ${data}  ${json_list}[${index}][${field_to_match}]
    IF  '${data}' == '${data_to_match}'
      ${json_flag}=  Set Local Variable  ${True}
    END
  END
  Should Be Equal  ${json_flag}  ${False}  msg=${data_to_match} found in ${field_to_match} 

# This routine does a case insensitive check in the left side of the main string for the existence of the substring
### subString  = substring within the main string
### mainString = string to check for a contained substring
### message    = message to display if no match is found
Case Insensitive Left Match
  [Arguments]  ${subString}  ${mainString}  ${message}
  ${upcaseSub}=  Convert To Upper Case  ${subString}
  ${upcaseMain}=  Convert To Upper Case  ${mainString}
  Should Start With  ${upcaseMain}  ${upcaseSub}  msg=${message}

# This routine checks to see if the value contains 'None', displays a message if not
### value   = value to check for None
### message = message to display if None not found
Contains None
  [Arguments]  ${value}  ${message}
  ${flag} =  Set Variable If  "${value}" == "${None}"  ${EMPTY}  ${value}
  Should Be Equal  ${value}  ${None}  msg=${message}

# This routine is used to load in API csv data into variables for the test suite.
Get API Data from CSV
  [Arguments]  ${folder_name}  ${file_name}
  Get Data from CSV  ${folder_name}  ${file_name}  ${False}
  ${temp}=  Read Csv As Dictionary  filename=test_data/${folder_name}/${file_name}  key_column=key  value_columns=value  delimiter=,
  
  IF  '${ts_data}' == 'None'
    Set Suite Variable  ${ts_data}  ${temp}
  ELSE
    Append To List  ${ts_data}  ${temp}
  END
  Set To Dictionary  ${ts_data}  public_api_success_create  CREATED SUCCESSFULLY
  Set To Dictionary  ${ts_data}  public_api_fetch_successful  FETCHED SUCCESSFULLY
  Set To Dictionary  ${ts_data}  public_api_update_successful  UPDATE SUCCESSFUL

  Research Test Data  # placeholder, should actually be called from test file.

# This routine is used to search for existing test data for the test suite.
Research Test Data
  Set Local Variable  ${placeholder}  ${None}
