*** Settings ***
Library           ../Utilities/LinuxConnection.py
Resource          ../ObjectRepository/R_common.robot

*** Keywords ***
LookInLogs
    [Arguments]    ${server}    ${user}    ${command}    ${comparation}
    ${sError}    Connect Ssh    ${server}    ubuntu    None    ${SSH_pemFile}
    ${sData}    Run Ssh    cd /home/ubuntu
    ${sData}    Run Ssh    ${command} > fileLog.log
    ${sData}    Run Ssh    cat /home/ubuntu/fileLog.log | grep '${comparation}'
    Close Ssh
#    Comment    ${sError}    Connect Ssh    ${EC2_AUTO_TOOL_SERVER}    ubuntu    None    ${SSH_pemFile}
#    Comment    ${sTest}    Run Ssh    /home/ubuntu/InfiniteVisitorTool/runAutomationTC.sh
#    Comment    ${sData}    Run Ssh    cat /home/ubuntu/InfiniteVisitorTool/AutomationTCs.log | grep Thank
    [Return]    ${sData}
