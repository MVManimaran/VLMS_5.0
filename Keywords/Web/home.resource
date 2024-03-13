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

Click Top Menu Icon
    [Arguments]    ${icon_name}
    [Documentation]    It is used to Click top menu icons
    Unselect Frame
    ${icon.newtop_menu}    Update Dynamic Value    ${icon.top_menu}    ${icon_name}
    Wait Until Element Clickable    ${icon.newtop_menu}
    Click Element    ${icon.newtop_menu}
    Wait Until Time    4

Select Value From Top Menu Dropdown
    [Arguments]    ${dropdown_name}    ${dropdown_value}
    [Documentation]    It is used to click top menu dropdown and select value
    Unselect Frame
    ${dropdown.common.top_menu.newselect}    Update Dynamic Value    ${dropdown.common.top_menu.select}    ${dropdown_name}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.top_menu.newselect}    ${MEDIUM_WAIT}    ${dropdown_name} dropdown is not visible after waiting for ${MEDIUM_WAIT} seconds
    Wait Until Element Is Clickable And Click    ${dropdown.common.top_menu.newselect}    10
    ${dropdown.common.top_menu.select.newvalue}    Update Dynamic Value    ${dropdown.common.top_menu.select.value}    ${dropdown_value}
    Wait Until Time    2
    Wait Until Element Is Visible    ${dropdown.common.top_menu.select.newvalue}    ${MEDIUM_WAIT}    ${dropdown_value} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Click Element    ${dropdown.common.top_menu.select.newvalue}

Logout From VLMS Application
    [Documentation]    This Keyword is used to Logout from VLMS application
    Select Value From Top Menu Dropdown    lblProfileName    Logout
    Wait Until Element Is Visible    ${textbox.login.username}    ${LONG_WAIT}    Login page is not visible after waiting for ${LONG_WAIT} seconds
    IF    '${SCREENSHOT}'=='True'    Capture Allure Screenshot

Navigate To Module
    [Arguments]    ${main_menu_option}    ${sub_menu_option}    ${page_title}
    [Documentation]    Navigate to Module
    Unselect Frame
    Wait Until Element Is Visible    ${link.left_menu_header}    ${LONG_WAIT}    Left Menu Header is not visible after waiting for ${LONG_WAIT} seconds
    Wait Until Time    2
    Click Element    ${link.left_menu_header}
    Navigate To Main Menu    ${main_menu_option}
    Navigate To Sub Menu    ${sub_menu_option}    ${page_title}

Navigate To Main Menu
    [Arguments]    ${main_menu_option}
    [Documentation]    It is used to select left menu option
    ${icon.left_menu.newoption}    Update Dynamic Value    ${icon.left_menu.option}    ${main_menu_option}
    Wait Until Element Is Visible    ${icon.left_menu.newoption}    ${MEDIUM_WAIT}    ${main_menu_option} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Wait Until Time    2
    Click Element    ${icon.left_menu.newoption}

Navigate To Sub Menu
    [Arguments]    ${sub_menu_option}    ${page_title}
    [Documentation]    It is used to select sub menu option
    ${link.main_menu.newsub_menu_option}    Update Dynamic Value    ${link.main_menu.sub_menu_option}    ${sub_menu_option}
    Wait Until Element Is Visible    ${link.main_menu.newsub_menu_option}    ${MEDIUM_WAIT}    ${sub_menu_option} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Wait Until Time    2
    Click Element    ${link.main_menu.newsub_menu_option}
    Select Frame    ${iframe.framecontent}
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    ${page_title}
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    ${page_title} is not visible after waiting for ${MEDIUM_WAIT} seconds

Navigate To Tab Content
    [Arguments]    ${tab_option}    ${page_title}
    [Documentation]    It is used to select tab option
    ${link.main_menu.sub_menu.newtab_option}    Update Dynamic Value    ${link.main_menu.sub_menu.tab_option}    ${tab_option}
    Wait Until Element Is Visible    ${link.main_menu.sub_menu.newtab_option}    ${MEDIUM_WAIT}    ${tab_option} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Click Element    ${link.main_menu.sub_menu.newtab_option}
    ${label.module.newpage}    Update Dynamic Value    ${label.module.page}    ${page_title}
    Wait Until Element Is Visible    ${label.module.newpage}    ${MEDIUM_WAIT}    ${page_title} is not visible after waiting for ${MEDIUM_WAIT} seconds

Search And Select The Value
    [Arguments]    ${value}
    [Documentation]    It is used to search and select the Value
    Unselect Frame
    Wait Until Element Is Visible    ${textbox.top_menu.search}    ${LONG_WAIT}    Search textbox is not visible after waiting for ${LONG_WAIT} seconds
    Wait Until Time    2
    Input Text    ${textbox.top_menu.search}    ${value}
    Wait Until Time    2
    Click Element    ${icon.top_menu.search}
    Select Frame    ${iframe.framecontent}
    ${link.search.newvalue}    Update Dynamic Value    ${link.search.value}    ${value}
    Wait Until Element Is Visible    ${link.search.newvalue}    ${MEDIUM_WAIT}    ${value} is not visible after waiting for ${MEDIUM_WAIT} seconds
    Wait Until Time    1
    Click Element    ${link.search.newvalue}

Verify Logo Is Displayed
    [Documentation]    It is used to Verify Logo is displayed
    Unselect Frame
    Wait Until Element Is Visible    ${img.valgenesis_logo}    ${LONG_WAIT}    Valgenesis Logo is not visible after waiting for ${LONG_WAIT} seconds
    IF    '${SCREENSHOT}'=='True'    Capture Allure Screenshot
