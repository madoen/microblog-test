*** Settings ***
Documentation     A test suite containing tests related to invalid sign in.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Profile Edit Page From Home Page
Suite Teardown    Close Browser
Test Setup        Go To Profile Edit Page
Test Template     Edit Profile With Different Possibility
Resource          resource.robot

*** Test Cases ***               USER NAME    ABOUT ME       MESSAGE
Same Username                    demo         ${ABOUT ME}    ${MESSAGE}
Diff Username                    diff         ${ABOUT ME}    ${MESSAGE}
Empty Username                   ${EMPTY}     ${ABOUT ME}    ${EMPTY}
Same Username Empty About Me     diff         ${EMPTY}       ${MESSAGE}
Diff Username Empty About Me     demo         ${EMPTY}       ${MESSAGE}
Empty Username Empty About Me    ${EMPTY}     ${EMPTY}       ${EMPTY}

*** Keywords ***
Edit Profile With Different Possibility
    [Arguments]    ${username}    ${about me}    ${message}
    Input Username    ${username}
    Input About Me    ${about me}
    Submit Form
    Check For Response Message    ${message}

Check For Response Message
    [Arguments]    ${message}
    Wait Until Page Contains    ${message}
