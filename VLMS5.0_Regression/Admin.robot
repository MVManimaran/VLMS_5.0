*** Settings ***
Documentation    This suite contains test cases of Admin Module
Suite Teardown     Run Keywords    Close Browser
...         AND    Stop Recording    False    AM1
Suite Setup        Start Recording    False    AM1
Resource          ../Config/super.resource
Test Tags    test:retry(1)


*** Test Cases ***
Validate User Is Able To Create Department
    [Documentation]    TC_13 Create Department and Verify Success message
    [Tags]    AM1TC13
    [Setup]    Start Recording    False    T13
    [Teardown]    Stop Recording    False    T13
    ${create_depart_data}    Read TestData From Excel    TC_13    Department
    ${SITE_NAME}    Set Variable    QZ_Test_111017
    Set Suite Variable    ${SITE_NAME}
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Create Department Page
    ${expected_message}    Create Department    ${create_depart_data}    ${SITE_NAME}    ${create_depart_data}[DepartmentName]
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is created    Department should be created

Validate User Is Able To Edit Department
    [Documentation]    TC_14 Edit Department and Verify Success message
    [Tags]    AM1TC14
    [Setup]    Start Recording    False    T14
    [Teardown]    Stop Recording    False    T14
    ${edit_depart_data}    Read TestData From Excel    TC_14    Department
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Edit Department Page    ${DEPARTMENT_NAME}
    ${expected_message}    Edit Department    ${edit_depart_data}
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is edited    Department should be edited

Validate User Is Able To Deactivate Department
    [Documentation]    TC_15 Deactivate Department and Verify Success message
    [Tags]    AM1TC15
    [Setup]    Start Recording    False    T15
    [Teardown]    Stop Recording    False    T15
    ${deactivate_depart_data}    Read TestData From Excel    TC_15    Department
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Edit Department Page    ${UPDATED_DEPARTMENT_NAME}
    ${expected_message}    Perform Actions For Department    ${deactivate_depart_data}
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is deactivated    Department should be deactivated

Validate User Is Able To Activate Department
    [Documentation]    TC_16 Activate Department and Verify Success message
    [Tags]    AM1TC16
    [Setup]    Start Recording    False    T16
    [Teardown]    Stop Recording    False    T16
    ${activate_depart_data}    Read TestData From Excel    TC_16    Department
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Activate Department Page    ${UPDATED_DEPARTMENT_NAME}
    ${expected_message}    Perform Actions For Department    ${activate_depart_data}
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is activated    Department should be activated

Validate User Is Able To Terminate Department
    [Documentation]    TC_17 Terminate Department and Verify Success message
    [Tags]    AM1TC17
    [Setup]    Start Recording    False    T17
    [Teardown]    Stop Recording    False    T17
    ${terminate_depart_data}    Read TestData From Excel    TC_17    Department
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Edit Department Page    ${UPDATED_DEPARTMENT_NAME}
    ${expected_message}    Perform Actions For Department    ${terminate_depart_data}
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is terminated    Department should be terminated

Validate User Is Able To ReCreate Department
    [Documentation]    TC_18 ReCreate Department and Verify Success message
    [Tags]    AM1TC18
    [Setup]    Start Recording    False    T18
    [Teardown]    Stop Recording    False    T18
    ${recreate_depart_data}    Read TestData From Excel    TC_18    Department
    Login To VLMS Application    ${BASE_URL}    ${SUPER_ADMIN}    ${SUPER_ADMIN_PASSWORD}
    Navigate To Create Department Page
    ${expected_message}    Create Department    ${recreate_depart_data}    ${SITE_NAME}    ${UPDATED_DEPARTMENT_NAME}
    Verify Success Message    ${expected_message}
    Log Actual And Expected Results    Department is created    Department should be created
