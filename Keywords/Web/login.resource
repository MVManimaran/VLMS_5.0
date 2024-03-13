*** Settings ***
Documentation     This login resource file has all the login keywords
Resource          ../../Config/super.resource

*** Keywords ***
Login To VLMS Application
    [Arguments]    ${app_url}    ${username}    ${password}
    [Documentation]    Login To VLMS Application
    # Launch Web Application    ${BROWSER_NAME}    ${app_url}
    # Wait Until Element Is Visible    ${textbox.login.username}    ${LONG_WAIT}    Login page is not visible after waiting for ${LONG_WAIT} seconds
    # Input Text    ${textbox.login.username}    ${username}
    # Input Text    ${textbox.login.password}    ${password}
    # ${button.newsubmit/cancel}    Update Dynamic Value    ${button.submit/cancel}    Submit
    # Javascript Click    ${button.newsubmit/cancel}
    Enter Login Credentials And Click Login    ${app_url}    ${username}    ${password}
    ${alert_status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${label.home.configuration.alert}    ${SHORT_WAIT}    Configuration alert is not visible after waiting for ${SHORT_WAIT} seconds
    IF    '${alert_status}'=='True'    Click Button In VLMS    btnCommonAlertOk
    Verify Home Page Is Displayed

Enter Login Credentials And Click Login
    [Arguments]    ${app_url}    ${username}    ${password}
    [Documentation]    This keyword is used to enter Login credentials and click login button
    Launch Web Application    ${BROWSER_NAME}    ${app_url}
    Wait Until Element Is Visible    ${textbox.login.username}    ${LONG_WAIT}    Login page is not visible after waiting for ${LONG_WAIT} seconds
    Input Text    ${textbox.login.username}    ${username}
    Input Text    ${textbox.login.password}    ${password}
    ${button.newsubmit/cancel}    Update Dynamic Value    ${button.submit/cancel}    Submit
    Javascript Click    ${button.newsubmit/cancel}

Navigate To Contact Admin Screen
    [Documentation]    This keyword is used to navigate to Contact Admin screen
    Wait Until Element Is Visible    ${textbox.login.username}    ${LONG_WAIT}    Login page is not visible after waiting for ${LONG_WAIT} seconds
    ${link.login_page.newnavigation_link}    Update Dynamic Value    ${link.login_page.navigation_link}    Contact Admin
    Wait Until Element Is Visible    ${link.login_page.newnavigation_link}    ${MEDIUM_WAIT}    Contact Admin link is not visible after waiting for ${MEDIUM_WAIT} seconds
    Click Element    ${link.login_page.newnavigation_link}
    Wait Until Element Is Visible    ${label.login_page.contact_admin.screen}    ${MEDIUM_WAIT}    Contact Admin screen is not visible after waiting for ${MEDIUM_WAIT} seconds

Enter Details In Contact Admin Screen
    [Arguments]    ${user_id}    ${subject}    ${message}
    [Documentation]    This keyword is used to enter details in Contact Admin screen
    Enter Text In Mandatory Fields    boxCAdmin    ${user_id}
    Select From List By Label    ${dropdown.contact_admin.subject}    ${subject}
    Enter Text In Mandatory Fields    Message    ${message}
    ${button.newsubmit/cancel}    Update Dynamic Value    ${button.submit/cancel}    CAdminSubmit
    Javascript Click    ${button.newsubmit/cancel}
