*** Settings ***
Documentation     This home resource file has all the home page keywords
Resource          ../../Config/super.resource


*** Keywords ***
# robocop: disable=unnecessary-string-conversion
Verify Home Page Is Displayed
    [Documentation]    It is used to Verify Home page is displayed
    Select Frame    ${iframe.framecontent}
    Wait Until Element Is Visible    ${label.home.dashboard}    ${LONG_WAIT}    Home page is not visible after waiting for ${LONG_WAIT} seconds
    IF    '${SCREENSHOT}'=='True'    Capture Allure Screenshot
    Unselect Frame
    Log Expected And Actual Results For Keywords    Home Page should be displayed    Home Page is displayed

Click Top Menu Icon
    [Arguments]    ${icon_name}
    [Documentation]    It is used to Click top menu icons
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Unselect Frame
    ${icon.home.newtop_menu}    Update Dynamic Value    ${icon.home.top_menu}    ${icon_name}
    Click Element    ${icon.home.newtop_menu}
    Wait Until Time    2

Select Value From Top Menu Dropdown
    [Arguments]    ${dropdown_name}    ${dropdown_value}
    [Documentation]    It is used to click top menu dropdown and select value
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Unselect Frame
    ${dropdown.home.top_menu.newselect}    Update Dynamic Value    ${dropdown.home.top_menu.select}    ${dropdown_name}
    Wait Until Element Is Clickable And Click    ${dropdown.home.top_menu.newselect}    10
    ${dropdown.home.top_menu.select.newvalue}    Update Dynamic Value    ${dropdown.home.top_menu.select.value}    ${dropdown_value}
    Wait Until Time    1
    Click Element    ${dropdown.home.top_menu.select.newvalue}

Logout From VLMS Application
    [Documentation]    This Keyword is used to Logout from VLMS application
    Select Value From Top Menu Dropdown    lblProfileName    Logout
    Wait Until Element Is Visible    ${textbox.login.username}    ${LONG_WAIT}    Login page is not visible after waiting for ${LONG_WAIT} seconds
    IF    '${SCREENSHOT}'=='True'    Capture Allure Screenshot
    Log Expected And Actual Results For Keywords    Logout should be successful   Logout is successful

Navigate To Module Sub Menu
    [Arguments]    ${main_menu_option}    ${sub_menu_option}    ${page_title}
    [Documentation]    Navigate To Module Sub Menu
    Unselect Frame
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Click Element    ${link.left_menu_header}
    Navigate To Main Menu    ${main_menu_option}
    Navigate To Sub Menu    ${sub_menu_option}    ${page_title}

Navigate To Main Menu
    [Arguments]    ${main_menu_option}
    [Documentation]    It is used to select left menu option
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    ${icon.left_menu.newoption}    Update Dynamic Value    ${icon.left_menu.option}    ${main_menu_option}
    Click Element    ${icon.left_menu.newoption}

Navigate To Sub Menu
    [Arguments]    ${sub_menu_option}    ${page_title}
    [Documentation]    It is used to select sub menu option
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    ${link.main_menu.newsub_menu_option}    Update Dynamic Value    ${link.main_menu.sub_menu_option}    ${sub_menu_option}
    Wait Until Time    2
    Click Element    ${link.main_menu.newsub_menu_option}
    Select Frame    ${iframe.framecontent}
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    ${page_title}
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    ${page_title} is not visible after waiting for ${MEDIUM_WAIT} seconds

Navigate To Tab Content
    [Arguments]    ${tab_option}    ${page_title}
    [Documentation]    It is used to select tab option
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    ${link.main_menu.sub_menu.newtab_option}    Update Dynamic Value    ${link.main_menu.sub_menu.tab_option}    ${tab_option}
    Click Element    ${link.main_menu.sub_menu.newtab_option}
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    ${page_title}
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    ${page_title} is not visible after waiting for ${MEDIUM_WAIT} seconds

Search And Select The Value
    [Arguments]    ${value}
    [Documentation]    It is used to search and select the Value
    Set Selenium Implicit Wait    ${MEDIUM_WAIT}
    Unselect Frame
    Input Text    ${textbox.top_menu.search}    ${value}
    Click Element    ${icon.top_menu.search}
    Select Frame    ${iframe.framecontent}
    ${link.search.newvalue}    Update Dynamic Value    ${link.search.value}    ${value}
    Click Element    ${link.search.newvalue}

Verify Logo Is Displayed
    [Documentation]    It is used to Verify Logo is displayed
    Unselect Frame
    Wait Until Element Is Visible    ${img.valgenesis_logo}    ${LONG_WAIT}    Valgenesis Logo is not visible after waiting for ${LONG_WAIT} seconds
    IF    '${SCREENSHOT}'=='True'    Capture Allure Screenshot
    Log Expected And Actual Results For Keywords    Logo should be displayed    Logo is displayed
