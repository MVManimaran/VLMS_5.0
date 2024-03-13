*** Settings ***
Documentation     This links file has all link type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${link.main_menu.sub_menu_option}    //ul[@class="sub-menu-list"]//a[text()="replaceText"]
${link.main_menu.sub_menu.tab_option}    //div[@id="tabs"]//li//a[text()="replaceText"]
${link.search.value}    //font[text()="replaceText"]/parent::a
${link.left_menu_header}    id=menu-header-bar
${link.login_page.navigation_link}    //a[text()="replaceText"]
