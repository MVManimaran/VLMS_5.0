*** Settings ***
Documentation     This labels file has all label type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${label.home.configuration.alert}    id=divHomeModalLabel
${label.home.dashboard}    //p[text()="My Dashboard"]
${label.module.page}    //div[contains(@id,"MenuBreadCrumb")]/following-sibling::h5//span[contains(text(),"replaceText")]
${label.login_page.contact_admin.screen}    //h3[text()="Contact Admin"]
${label.contact_admin.subject}    //span[text()="Subject"]
${label.success_msg}    //span[@id="toastBody"]
${label.admin.department.activate_depart.depart_name}    id=lblRDepartmentNameValue
${label.admin.user.activate_title.title_name}    id=lblRTitleValue
