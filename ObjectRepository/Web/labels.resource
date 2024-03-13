*** Settings ***
Documentation     This labels file has all label type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${label.home.configuration.alert}    id=divHomeModalLabel
${label.home.dashboard}    //p[text()="My Dashboard"]
${label.module.page}    //div[contains(@id,"MenuBreadCrumb")]/following-sibling::h5//span[contains(text(),"replaceText")]
${label.login_page.contact_admin.screen}    //h3[text()="Contact Admin"]
