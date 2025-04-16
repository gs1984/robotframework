*** Settings ***
Library    yaml
Resource    log_utils.robot
Variables    ../app-config.yaml    # robotcode: ignore
Library    OperatingSystem
Library    Collections

*** Variables ***
${CONFIG_FILE}    ../test-automation/app-config.yaml

*** Keywords ***
Get YAML Configuration
    [Arguments]    ${file_path}
    ${result} =    Get File    ${file_path}
    ${yaml_content} =    Set Variable    ${result}
    ${config} =    Evaluate    yaml.safe_load('''${yaml_content}''')
    RETURN    ${config}

Get Env
    [Arguments]    ${useLog}=${True}
    ${config} =    Get YAML Configuration    ${CONFIG_FILE}
    IF  '${ENV}' != ''
        ${env}=    Set Variable    ${ENV}
    ELSE
        IF  '${useLog}' == '${True}'
            Log To Console    ${config['env']}
        END
        ${env}=    Set Variable    ${config['env']}
    END
    RETURN    ${env}

Get Environment Values
    [Arguments]    ${useLog}=${True}
    ${config} =    Get YAML Configuration    ${CONFIG_FILE}
    ${env}=    Get Env
    ${environment} =    Get From Dictionary    ${config}    ${env}
    IF  '${useLog}' == '${True}'
        Log To Console    here ${env} is ${environment}
    END    
    RETURN    ${environment}

Get Url
    [Arguments]    ${useLog}=${True}
    ${env_values} =    Get Environment Values  ${useLog}
    RETURN    ${env_values['url']}

Get Username
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_username\}' in @{env_variables.keys()}
        RETURN    ${sw_username}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values    ${useLog}
        RETURN    ${env_values['credentials']['username']}
    END

Get Password
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_password\}' in @{env_variables.keys()}
        RETURN    ${sw_password}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values    ${useLog}
        RETURN    ${env_values['credentials']['password']}
    END

Get Tenant Name
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_tenantname\}' in @{env_variables.keys()}
        RETURN    ${sw_tenantname}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values    ${useLog}
        RETURN    ${env_values['tenantname']}
    END

Get Approval User Username
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_approval_user_username\}' in @{env_variables.keys()}
        RETURN    ${sw_approval_user_username}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values    ${useLog}
        RETURN    ${env_values['credentials']['approval_user_username']}
    END

Get Approval User Password
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_approval_user_password\}' in @{env_variables.keys()}
        RETURN    ${sw_approval_user_password}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values    ${useLog}
        RETURN    ${env_values['credentials']['approval_user_password']}
    END

Get Browser
    &{env_variables}=     Get Variables
    IF  '\$\{BROWSER\}' in @{env_variables.keys()}
        RETURN    ${BROWSER}    # robotcode: ignore
    ELSE
        RETURN    ${browser}
    END

Get Headless
    RETURN    ${${headless}}

Get Public API Url
    [Arguments]    ${useLog}=${True}
    &{env_variables}=     Get Variables
    IF  '\$\{sw_public_api_url\}' in @{env_variables.keys()}
        RETURN    ${sw_public_api_url}    # robotcode: ignore
    ELSE
        ${env_values} =    Get Environment Values  ${useLog}
        RETURN    ${env_values['public_api_url']}
    END


