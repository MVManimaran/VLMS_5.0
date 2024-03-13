*** Settings ***
Documentation     This component resource file has all the common component keywords
Resource          ../../Config/super.resource


*** Keywords ***
# robocop: disable=unnecessary-string-conversion
Select Value For Radio Button
    [Arguments]    ${group_name}    ${value}
    [Documentation]    This keyword is used to select radio button
    ${radiobutton.common.newvalue}    Update Dynamic Value    ${radiobutton.common.value}    ${value}
    Wait Until Element Is Visible    ${radiobutton.common.newvalue}    ${MEDIUM_WAIT}
    ${status}    Run Keyword And Return Status    Radio Button Should Be Set To    ${group_name}    ${value}
    Wait Until Time    3
    IF    '${status}' == 'False'    Javascript Click    ${radiobutton.common.newvalue}

Select Value From Dropdown
    [Arguments]    ${dropdown_name}    ${dropdown_value}
    [Documentation]    This keyword is used to select value from a dropdown
    ${dropdown.common.newselect}    Update Dynamic Value    ${dropdown.common.select}    ${dropdown_name}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.newselect}    ${MEDIUM_WAIT}    ${dropdown_name} dropdown is not visible after waiting for ${MEDIUM_WAIT} seconds
    Scroll Till Element Is Visible    ${dropdown.common.newselect}
    Wait Until Element Is Clickable And Click    ${dropdown.common.newselect}    15
    ${dropdown.common.select.newvalue}    Update Dynamic Value    ${dropdown.common.select.value}    ${dropdown_value}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.select.newvalue}    ${MEDIUM_WAIT}    ${dropdown_value} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Scroll Element Into View    ${dropdown.common.select.newvalue}
    Wait Until Time    1
    Click Element    ${dropdown.common.select.newvalue}

Select Dropdown Value With Partial Text
    [Arguments]    ${dropdown_name}    ${dropdown_value}
    [Documentation]    This keyword is used to select value dropdown with partial text using contains
    ${dropdown.common.newselect}    Update Dynamic Value    ${dropdown.common.select}    ${dropdown_name}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.newselect}    ${MEDIUM_WAIT}    ${dropdown_name} dropdown is not visible after waiting for ${MEDIUM_WAIT} seconds
    Scroll Till Element Is Visible    ${dropdown.common.newselect}
    Wait Until Element Is Clickable And Click    ${dropdown.common.newselect}    15
    ${dropdown.common.select.newpartial_value}    Update Dynamic Value    ${dropdown.common.select.partial_value}    ${dropdown_value}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.select.newpartial_value}    ${MEDIUM_WAIT}    ${dropdown_value} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Click Element    ${dropdown.common.select.newpartial_value}

Click Button In VLMS
    [Arguments]    ${button_name}
    [Documentation]    This keyword is used to click button in VLMS
    ${button.common.newbutton_name}    Update Dynamic Value    ${button.common.button_name}    ${button_name}
    Wait Until Element Is Visible    ${button.common.newbutton_name}    ${MEDIUM_WAIT}    ${button_name} button is not visible after waiting for ${MEDIUM_WAIT} seconds
    Scroll Till Element Is Visible    ${button.common.newbutton_name}
    Wait Until Time    3
    Javascript Click    ${button.common.newbutton_name}
