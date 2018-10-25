*** Settings ***
Documentation     A test suite containing tests related to invalid register.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Register from Home Page
Suite Teardown    Close Browser
Test Setup        Go To Register Page
Test Template     Register With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***        USER NAME      EMAIL                 PASSWORD             CONFIRM PASSWORD     ERROR MESSAGE
Existed Username          demo           ${NEW DATA}           ${VALID PASSWORD}    ${VALID PASSWORD}    ${USER EXIST MSG}
Existed Email             ${NEW DATA}    demo@microblog.com    ${VALID PASSWORD}    ${VALID PASSWORD}    ${EMAIL EXIST MSG}
Invalid Email             ${NEW DATA}    demo.microblog.com    ${VALID PASSWORD}    ${VALID PASSWORD}    ${INVALID EMAIL MSG}
Password Unmatch          ${NEW DATA}    ${NEW DATA}           ${VALID PASSWORD}    whatever             ${PWD NOT MATCH}
Empty Username            ${EMPTY}       ${NEW DATA}           ${VALID PASSWORD}    ${VALID PASSWORD}    ${EMPTY}
Empty Email               ${NEW DATA}    ${EMPTY}              ${VALID PASSWORD}    ${VALID PASSWORD}    ${EMPTY}
Empty Password            ${NEW DATA}    ${NEW DATA}           ${EMPTY}             ${VALID PASSWORD}    ${EMPTY}
Empty Confirm Password    ${NEW DATA}    ${NEW DATA}           ${VALID PASSWORD}    ${EMPTY}             ${EMPTY}

*** Keywords ***
Register With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${email}    ${password}    ${password2}    ${error msg}
    Input Username    ${username}
    Input Email    ${email}
    Input Password    ${password}
    Confirm Password    ${password2}
    Submit Form
    Register Should Have Failed    ${error msg}

Register Should Have Failed
    [Arguments]    ${error msg}
    Wait Until Page Contains    ${error msg}
