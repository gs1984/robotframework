*** Settings ***
Library    Browser
Resource    yaml_utils.robot
Resource    ../utils/string_utils.robot

*** Variables ***
${DOWNLOAD_DIR}=    downloads

*** Keywords ***
Custom Open Browser
    [Arguments]    ${browser}    ${url}    ${headless}
    Set Browser Timeout    60s
    ${env}=    Get Env
    Custom Log    Creating Browser...    
    IF  '${browser}' == 'msedge'
        New Browser    browser=chromium    headless=${headless}    channel=msedge    args=["--start-maximized"]
    ELSE
        New Browser    browser=${browser}    headless=${headless}    args=["--start-maximized"]
    END
    Custom Log    Creating Context...
    New Context    acceptDownloads=${True}    tracing=trace.zip     viewport=${None}    recordVideo={'dir':'${env}_videos', 'size':{'width':400, 'height':200}}
    Custom Log    Creating Page...
    New Page    url=${url}
    #Set Viewport Size    1920    1080

Custom Setup
    ${url}=    Get Url
    ${browser}=    Get Browser
    ${headless}=    Get Headless
    Custom Open Browser    browser=${browser}    url=${url}    headless=${headless}

Click Element
    [Arguments]    ${selector}    ${wait_for_enabled}=${True}    ${force}=${False}
    # Wait For Page To Load
    IF    ${wait_for_enabled} == ${True}
        Wait For Element To Be Visible    ${selector}
    END
    Custom Log    text_to_log=Clicking ${selector}
    Click    ${selector}
    Wait For Page To Load

Right Click Element
    [Arguments]    ${selector}
    Click    selector=${selector}    button=right

Send Keys To Element
    [Arguments]    ${selector}    ${keys_to_send}    ${force}=${False}
    Wait For Page To Load
    Wait For Element To Be Visible    ${selector}
    Custom Log    Sending keys ${keys_to_send} to ${selector} using force as ${force}
    Fill Text    selector=${selector}    txt=${keys_to_send}    force=${force}    

Wait For Page To Load
    [Arguments]    ${timeout}=5s
    Custom Log    Waiting For Page To Load
    Wait For Load State    domcontentloaded
    Run Keyword And Ignore Error   Wait For Load State    networkidle    timeout=${timeout}

Wait For Page To Load_1
    [Arguments]    ${timeout}=15s
    Custom Log    Waiting For Page To Load
    Wait For Load State    domcontentloaded
    Run Keyword And Ignore Error   Wait For Load State    networkidle    timeout=${timeout}

Wait For Element To Be Visible
    [Arguments]    ${selector}    ${timeout}=1s
    Custom Log    Waiting For Element ${selector} to be visible
    Wait For Elements State    selector=${selector}    state=visible    timeout=${timeout}
    Custom Log    Element ${selector} is visible

Wait For Element To Be Visible_1
    [Arguments]    ${selector}    ${timeout}=40s
    Custom Log    Waiting For Element ${selector} to be visible
    Wait For Elements State    selector=${selector}    state=visible    timeout=${timeout}
    Custom Log    Element ${selector} is visible

Wait For Element To Be Enabled
    [Arguments]    ${selector}    ${timeout}=10s
    Custom Log    Waiting For Element ${selector} to be enabled
    Wait For Elements State    selector=${selector}    state=enabled    timeout=${timeout}
    Custom Log    Element ${selector} is enabled

Get Element Attribute
    [Arguments]    ${selector}    ${attribute_name}
    Custom Log    Fetching attribute ${attribute_name} For Selector: ${selector}
    ${attribute}=    Get Attribute    selector=${selector}    attribute=${attribute_name}
    Custom Log    Fetched attribute:${attribute}
    RETURN    ${attribute}

Get Element Text
    [Arguments]    ${selector}
    Custom Log    Fetching element text for selector ${selector}
    ${text}=    Get Text    selector=${selector}
    Custom Log    Fetched Text:${text}
    RETURN    ${text}

Get Element Style
    [Arguments]    ${selector}
    Custom Log    Fetching element style for selector ${selector}
    ${style}=    Get Attribute    selector=${selector}    attribute=style
    Custom Log    Fetched Style:${style}
    RETURN    ${style}

Scroll To Element
    [Arguments]    ${selector}
    Custom Log    Scrolling to Element ${selector}
    Scroll To Element    selector=${selector}

Refresh Page
    Reload

Wait For Download To Complete
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable     ${EXECDIR}/downloads/${file_name}
    ${download_promise}=    Promise To Wait For Download    saveAs=${file_path}    wait_for_finished=True

Press Keyboard Keys
    [Arguments]    ${selector}    @{keys}
    Wait For Page To Load
    Custom Log    Pressing @{keys} on selector ${selector}
    Press Keys    ${selector}    @{keys}

Switch To Tab
    [Arguments]    ${tab_number}
    ${tab1}=    Get Page Ids    CURRENT    context=ACTIVE
    Log To Console    Tab 1 id is ${tab1}
    ${tabs}=    Get Page Ids    ALL    context=ACTIVE
    Log To Console    All Tabs id is ${tabs}
    ${num_tabs}=    Get Length    ${tabs}
    Log To Console    Number of Tabs is ${num_tabs}
    ${page_title}=    Create List
    IF  ${tab_number} < ${num_tabs}
        Log    Switching to tab ${tab_number}
        Log    ${tabs}[${tab_number}]
        Switch Page    ${tabs[${tab_number}]}
        Log To Console    Switching Page ${tabs[${tab_number}]}
        Wait For Page To Load
    ELSE
        Log    Tab number ${tab_number} is out of range.
    END
    
Get Elements With Selector
    [Arguments]    ${selector}
    @{elements}=    Get Elements    selector=${selector}
    RETURN    @{elements}

Custom Teardown
    [Arguments]    ${browser}=ALL    ${context}=ALL
    Custom Log    Closing page...
    Close Page
    Custom Log    Closing browser...
    Close Browser
    Custom Log    Closing Context...
    Close Context    ${browser}    ${context}

Does Element Exist
    [Arguments]    ${locator}
    Wait for Elements State     selector=${locator}     state=visible   timeout=3s

Wait For Element To Be Hidden
    [Arguments]    ${selector}
    Custom Log    Waiting For Element ${selector} to be hidden
    Wait For Elements State    selector=${selector}    state=hidden
    Custom Log    Element ${selector} is hidden

Extract Text With Position Number
    [Arguments]    ${text_Message}    ${position_count}
    @{words}=    Split String    ${text_Message}
    Custom Log   ${words}
    ${position_count}=    Evaluate    int(${position_count})-1
    ${extracted_text}=    Get From List    ${words}    ${position_count}
    Custom Log    ${extracted_text} is splitted
    RETURN    ${extracted_text}

Close Current Tab
    [Arguments]    ${browser}=ALL    ${context}=ALL
    Custom Log    Closing page...
    Close Page

Is Element Visible
    [Arguments]    ${locator}
    Custom Log    text_to_log=Locator is ${locator}
    ${states}=    Get Element States    ${locator}    then    value & (visible | hidden)
    Custom Log    text_to_log=Element State is ${states}

    # If the element is visible, return True
    Run Keyword If    'visible' in ${states}    Return From Keyword    True
    
    # If the element is not visible, return False
    Run Keyword If    'hidden' in ${states}    Return From Keyword    False
    
    # If the element is neither visible nor hidden (e.g., detached), return False
    Return From Keyword    False

Validate that page contain text
    [Arguments]    ${text}    ${timeout}=10s
    Wait For Element To Be Visible    //*[text()=${text}]    timeout=${timeout}


Send Keyboard Keys To Element Via Keyboard
    [Arguments]    ${selector}    ${keys_to_send}    ${force}=${False}
    Wait For Page To Load
    Wait For Element To Be Visible    ${selector}
    Custom Log    Sending keys '${keys_to_send}' to ${selector} using force as ${force}
    
    # Convert the string to a list of individual characters
    @{char_list}=    Split String To Characters    ${keys_to_send}
    
    Click Element    selector=${selector}
    Keyboard Input    type    input=${keys_to_send}    delay=1s
        
