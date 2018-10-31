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
Test Template     Follow Each Others
Resource          resource.robot

*** Test Cases ***             1ST USER     1ST ID     2ND USER     2ND ID     ACTION       1ST INDICATOR      2ND INDICATOR
1st User Follow 2nd User       demo         1          mode         2          follow       ${B INDICATOR}     ${A INDICATOR}
2nd User Follow 1st User       mode         2          demo         1          follow       ${C INDICATOR}     ${C INDICATOR}
1st User Unfollow 2nd User     demo         1          mode         2          unfollow     ${A INDICATOR}     ${B INDICATOR}
2nd User Unfollow 1st User     mode         2          demo         1          unfollow     ${D INDICATOR}     ${D INDICATOR}

*** Keywords ***
Follow Each Others
    [Arguments]     ${1st user}     ${1st id}     ${2nd user}     ${2nd id}     ${action}     ${1st indicator}     ${2nd indicator}
    Open User Id Profile Page     ${1st user}     ${2nd user}     ${2nd id}
    Click Follow Unfollow Link     ${action}
    Check For Response Message     ${action}     ${2nd user}
    Check For Indicator     ${2nd indicator}
    Go To User Id Profile Page     ${1st user}    ${1st id}
    Check For Indicator     ${1st indicator}
    Logout
    Open User Id Profile Page     ${2nd user}     ${1st user}     ${1st id}
    Check For Indicator     ${1st indicator}
    Go To User Id Profile Page     ${2nd user}    ${2nd id}
    Check For Indicator     ${2nd indicator}
    Logout
