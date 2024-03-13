*** Settings ***
Documentation     This Textbox file has all textbox type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${textbox.login.username}    //input[@id="txtUserName"]
${textbox.login.password}    //input[@id="txtPassword"]
${textbox.top_menu.search}    id=topSearch
${textbox.common.mandatory.text_field}    id=txtreplaceText
