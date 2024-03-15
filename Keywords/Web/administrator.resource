*** Settings ***
Documentation     This administrator resource file has all the administrator module keywords
Resource          ../../Config/super.resource


*** Keywords ***
# robocop: disable=unnecessary-string-conversion
Navigate To Create Department Page
    [Documentation]    This keyword will navigate to Create Department Page
    Navigate To Module Sub Menu    Administrator    Department    Department
    Click Button In VLMS    btnCreate
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    Create Department
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    Create Department Page is not visible after waiting for ${MEDIUM_WAIT} seconds
    Log Expected And Actual Results For Keywords    Create Department Page should be displayed    Create Department Page is displayed

Create Department
    [Arguments]    ${create_department_data}    ${site}    ${depart_name}
    [Documentation]    This Keyword is used to Create Department
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    IF    'Site' in ${create_department_data}    Select Value From Dropdown    ddlSite    ${site}
    IF    'DepartmentName' in ${create_department_data}
        Enter Text In Mandatory Fields    txtboxDepartmentName    ${depart_name}
        ${DEPARTMENT_NAME}    Set Variable    ${depart_name}
        Set Suite Variable    ${DEPARTMENT_NAME}
    END
    IF    'Description' in ${create_department_data}    Enter Text In Mandatory Fields    txtBoxDesc    ${create_department_data}[Description]
    IF    'Button' in ${create_department_data}    Select Submit/Cancel Button    ${create_department_data}[Button]
    ${expected_message}    Set Variable    ${DEPARTMENT_NAME} Department has been created
    Log Expected And Actual Results For Keywords    Department should be created    Department is created
    RETURN    ${expected_message}

Navigate To Edit Department Page
    [Arguments]    ${department_name}
    [Documentation]    This keyword will navigate to Edit Department Page
    Navigate To Module Sub Menu    Administrator    Department    Department
    Search And Select The Value    ${department_name}
    Click Button In VLMS    lnkViewEdit
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    Edit Department
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    Edit Department Page is not visible after waiting for ${MEDIUM_WAIT} seconds
    Log Expected And Actual Results For Keywords    Edit Department Page should be displayed    Edit Department Page is displayed

Edit Department
    [Arguments]    ${edit_department_data}
    [Documentation]    This Keyword is used to Edit Department
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    IF    'DepartmentName' in ${edit_department_data}
        Enter Text In Mandatory Fields    txtboxDepartmentName    ${edit_department_data}[DepartmentName]
        ${UPDATED_DEPARTMENT_NAME}    Set Variable    ${edit_department_data}[DepartmentName]
        Set Suite Variable    ${UPDATED_DEPARTMENT_NAME}
    END
    IF    'Description' in ${edit_department_data}    Enter Text In Mandatory Fields    txtBoxDesc    ${edit_department_data}[Description]
    IF    'Button' in ${edit_department_data}    Select Submit/Cancel Button    ${edit_department_data}[Button]
    IF    'Comments' in ${edit_department_data}    Enter Text In Mandatory Fields    val1_txtActionComments    ${edit_department_data}[Comments]
    IF    'ConfirmButton' in ${edit_department_data}    Click Button In VLMS    ${edit_department_data}[ConfirmButton]
    ${expected_message}    Set Variable    ${UPDATED_DEPARTMENT_NAME} Department has been Edited
    Log Expected And Actual Results For Keywords    Department should be edited    Department is edited
    RETURN    ${expected_message}

Navigate To Activate Department Page
    [Arguments]    ${department_name}
    [Documentation]    This keyword will navigate to Activate Department Page
    Navigate To Module Sub Menu    Administrator    Department    Department
    Search And Select The Value    ${department_name}
    Click Button In VLMS    lnkViewEdit
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    Activate Department
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    Activate Department Page is not visible after waiting for ${MEDIUM_WAIT} seconds
    Log Expected And Actual Results For Keywords    Activate Department Page should be displayed    Activate Department Page is displayed

Perform Actions For Department
    [Arguments]    ${action_data}
    [Documentation]    This Keyword is used to Activate or Deactivate or Terminate Department
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Wait Until Time    2
    IF    '${action_data}[ActionType]'=='Deactivate' or '${action_data}[ActionType]'=='Terminate'
        ${depart_name}    Get Value    ${textbox.admin.department.edit_depart.depart_name}
    END
    IF    '${action_data}[ActionType]'=='Activate'
        ${depart_name}    Get Text    ${label.admin.department.activate_depart.depart_name}
    END
    IF    'ActionType' in ${action_data}    Select Action Type    ${action_data}[ActionType]
    IF    'Comments' in ${action_data}    Enter Text In Mandatory Fields    val1_txtActionComments    ${action_data}[Comments]
    IF    'ConfirmButton' in ${action_data}    Click Button In VLMS    ${action_data}[ConfirmButton]
    IF    '${action_data}[ActionType]'=='Deactivate'
        ${expected_message}    Set Variable    ${depart_name} Department has been deactivated
        Log Expected And Actual Results For Keywords    Department should be deactivated    Department is deactivated
    END
    IF    '${action_data}[ActionType]'=='Activate'
        ${expected_message}    Set Variable    ${depart_name} Department has been activated
        Log Expected And Actual Results For Keywords    Department should be activated    Department is activated
    END
    IF    '${action_data}[ActionType]'=='Terminate'
        ${expected_message}    Set Variable    ${depart_name} Department has been terminated
        Log Expected And Actual Results For Keywords    Department should be terminated    Department is terminated
    END
    RETURN    ${expected_message}
