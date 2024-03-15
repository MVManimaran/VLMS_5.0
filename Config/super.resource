*** Settings ***
Documentation     This super.resource file has all imported Libraries and Resources
Library           Collections
Library           DateTime
Library           String
Library           OperatingSystem
Library           SeleniumLibrary
Library           RetryFailed
Library           Pdf2TextLibrary
Library           ScreenCapLibrary
Library           ../Library/CustomLibrary.py
Library           ../Library/report.py
Resource          common_variables.resource
Resource          ../ObjectRepository/Web/buttons.resource
Resource          ../ObjectRepository/Web/icons.resource
Resource          ../ObjectRepository/Web/labels.resource
Resource          ../ObjectRepository/Web/textboxes.resource
Resource          ../ObjectRepository/Web/iframes.resource
Resource          ../ObjectRepository/Web/dropdowns.resource
Resource          ../ObjectRepository/Web/radiobuttons.resource
Resource          ../ObjectRepository/Web/checkboxes.resource
Resource          ../ObjectRepository/Web/images.resource
Resource          ../ObjectRepository/Web/links.resource
Resource          ../Keywords/Web/common.resource
Resource          ../Keywords/Web/component.resource
Resource          ../Keywords/Web/home.resource
Resource          ../Keywords/Web/login.resource
Resource          ../Keywords/Web/administration.resource
