*** Settings ***
Documentation     This Icon file has all icon type locators of web application


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${icon.home.top_menu}    //i[contains(@class,"replaceText")]
${icon.left_menu.option}    //div[@class="left-menu-list"]//span[text()="replaceText"]/preceding-sibling::i
${icon.top_menu.search}    //span//i[@class="vg-icon-search"]
