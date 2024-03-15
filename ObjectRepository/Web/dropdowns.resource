*** Settings ***
Documentation     This Dropdown file has all dropdown type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${dropdown.common.select}    //div[contains(@id,"replaceText")]//b
${dropdown.common.select.value}    //li[text()="replaceText"]
${dropdown.common.select.partial_value}    //li[contains(text(),"replaceText")]
${dropdown.home.top_menu.select}    //span[contains(@id,"replaceText")]/parent::div
${dropdown.home.top_menu.select.value}    //div/a[normalize-space()="replaceText"]
${dropdown.action}    //a[text()="Action"]
${dropdown.action.action_type}    //a[text()="replaceText"]
