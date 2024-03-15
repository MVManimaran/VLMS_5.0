*** Settings ***
Documentation     This login resource file has all the login keywords
Resource          ../../Config/super.resource


*** Keywords ***
Login To VLMS Application
    [Arguments]    ${app_url}    ${username}    ${password}
    [Documentation]    Login To VLMS Application
    Enter Login Credentials And Click Login    ${app_url}    ${username}    ${password}
    ${alert_status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${label.home.configuration.alert}    ${SHORT_WAIT}    Configuration alert is not visible after waiting for ${SHORT_WAIT} seconds
    IF    '${alert_status}'=='True'    Click Button In VLMS    btnCommonAlertCancel
    Verify Home Page Is Displayed
    Log Expected And Actual Results For Keywords    Login should be successful   Login is successful

Enter Login Credentials And Click Login
    [Arguments]    ${app_url}    ${username}    ${password}
    [Documentation]    This keyword is used to enter Login credentials and click login button
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Launch Web Application    ${BROWSER_NAME}    ${app_url}
    Input Text    ${textbox.login.username}    ${username}
    Input Text    ${textbox.login.password}    ${password}
    Click Button In VLMS    btnSubmit

Navigate To Contact Admin Screen
    [Documentation]    This keyword is used to navigate to Contact Admin screen
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    ${link.login_page.newnavigation_link}    Update Dynamic Value    ${link.login_page.navigation_link}    Contact Admin
    Click Element    ${link.login_page.newnavigation_link}
    Wait Until Element Is Visible    ${label.login_page.contact_admin.screen}    ${MEDIUM_WAIT}    Contact Admin screen is not visible after waiting for ${MEDIUM_WAIT} seconds

Enter Details In Contact Admin Screen
    [Arguments]    ${user_id}    ${subject}    ${message}
    [Documentation]    This keyword is used to enter details in Contact Admin screen
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Enter Text In Mandatory Fields    txtboxCAdmin    ${user_id}
    Click Element    ${label.contact_admin.subject}
    Wait Until Time    2
    Select Value From Dropdown    ddSubject_chosen    ${subject}
    Enter Text In Mandatory Fields    txtMessage    ${message}
    Click Button In VLMS    btnCAdminSubmit
