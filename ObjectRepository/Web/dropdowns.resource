*** Settings ***
Documentation     This Dropdown file has all dropdown type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${dropdown.common.select}    //span[contains(@id,"replaceText")]/parent::span/span/b
${dropdown.common.select.value}    //li[text()="replaceText"]
${dropdown.common.select.partial_value}    //li[contains(text(),"replaceText")]
${dropdown.common.top_menu.select}    //span[contains(@id,"replaceText")]/parent::div
${dropdown.common.top_menu.select.value}    //div/a[normalize-space()="replaceText"]
${dropdown.contact_admin.subject}    id=ddSubject
