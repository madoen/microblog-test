*** Settings ***
Documentation     A test suite containing tests related to invalid sign in.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser
Test Setup        Go To Sign In Page
Test Template     Sign In With Invalid Credentials Should Fail
Resource          ../global.robot

*** Variables ***
${ERROR MSG}      Invalid username or password

*** Test Cases ***               USER NAME        PASSWORD             ERROR MESSAGE
Invalid Username                 invalid          ${VALID PASSWORD}    ${ERROR MSG}
Invalid Password                 ${VALID USER}    invalid              ${ERROR MSG}
Invalid Username And Password    invalid          whatever             ${ERROR MSG}
Empty Username                   ${EMPTY}         ${VALID PASSWORD}    ${EMPTY}
Empty Password                   ${VALID USER}    ${EMPTY}             ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}             ${EMPTY}

*** Keywords ***
Sign In With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${error msg}
    Input Username    ${username}
    Input Password    ${password}
    Submit Form
    Sign In Should Have Failed    ${error msg}

Sign In Should Have Failed
    [Arguments]    ${error msg}
    Wait Until Page Contains    ${error msg}
