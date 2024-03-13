*** Settings ***
Documentation     This suite contains test case to trigger build results in mail and Generate Test Execution report in different formats
Suite Teardown    Close All Browsers
Resource          ../Config/super.resource


*** Test Cases ***
Trigger Build Results Email
    [Documentation]    This Test Case will trigger mail to defined users with build results and attachments
    ${user_name}    Get Environment Variable    EMAIL_USERNAME
    ${password}    Get Environment Variable    EMAIL_PASSWORD
    ${send_to}    Create List    mvijayakumar@qualizeal.com
    ${subject}    Set Variable    Build Execution Results
    Read Specific Data From Html And Write To File    ${BASE_URL}    ${EXECDIR}\\output2.xml    ${EXECDIR}\\metrics.html    ${CURDIR}\\subject    Local
    ${body}    Get File    ${CURDIR}\\subject.txt
    Remove File    ${CURDIR}\\subject.txt
    ${attachments}    Create List    ${EXECDIR}\\log.html    ${EXECDIR}\\report.html    ${EXECDIR}\\output.xml
    Send Mail    ${user_name}    ${send_to}    ${subject}    ${body}    ${attachments}    smtp.office365.com    ${user_name}    ${password}

Generate Test Execution Report
    [Documentation]    Generate Automation Execution Report In HTML Format
    [Tags]    Report
    ${output_xml_path}    Set Variable    ${EXECDIR}\\output2.xml
    Read Html Xml And Write Html    ${BASE_URL}    ${output_xml_path}    ${EXECDIR}\\VLMS_Test_Execution_Report    Local

Generate Test Execution In Word
    [Documentation]    Generate Test Execution Report In Word Format
    Pdf To Word    ${EXECDIR}\\VLMS_Test_Execution_Report.pdf    ${EXECDIR}\\VLMS_Test_Execution_Report.docx
