*** Settings ***
Library           DateTime
Library           String

*** Keywords ***
Split And Verify Day And Date
    [Arguments]    ${calendar_text}    ${" "}=
    [Documentation]    Split the calendar text and verify it with today's day and date.
    ${split_text}      Split String    ${calendar_text}    ${" "}
    ${day_of_week}     Set Variable    ${split_text[0]}
    ${month}           Set Variable    ${split_text[1]}
    ${day_with_comma}  Set Variable    ${split_text[2]}
    ${day}             Replace String    ${day_with_comma}    ,    ${EMPTY}
    ${year}            Set Variable    ${split_text[3]}

    # Convert month name to number
    ${month_number}    Convert Month Name To Number    ${month}

    # Format the extracted date to a standard format (YYYY-MM-DD)
    ${parsed_date}     Convert Date    ${year}-${month_number}-${day}    result_format=%Y-%m-%d

    # Get today's date and day in the same format
    ${today_date}      Get Current Date    result_format=%Y-%m-%d
    ${today_day}       Get Current Date    result_format=%A

    # Verify the extracted day and date with today's day and date
    Should Be Equal    ${day_of_week}    ${today_day}
    Should Be Equal    ${parsed_date}    ${today_date}

Convert Month Name To Number
    [Arguments]    ${month_name}
    ${month_dict}   Create Dictionary    Jan=01    Feb=02    Mar=03    Apr=04    May=05    Jun=06    Jul=07    Aug=08    Sep=09    Oct=10    Nov=11    Dec=12
    ${month_number}    Set Variable    ${month_dict}[${month_name}]
    RETURN    ${month_number}

Generate Today's Date In MM/DD/YYYY Format
    [Documentation]    Generates today's date in the format MM/DD/YYYY.
    ${today_date}      Get Current Date    result_format=%m/%d/%Y
    RETURN    ${today_date}
