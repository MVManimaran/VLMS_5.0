*** Settings ***
Documentation    This suite contains test cases
Resource          ../Config/super.resource


*** Test Cases ***
Login
    [Documentation]    TC_01
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Module    Configuration    Site    Site
    Wait Until Time    5
    Logout From VLMS Application
    Wait Until Time    5
