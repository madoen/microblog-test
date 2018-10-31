*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Resource          ../global.robot

*** Variables ***
${USER URL}         http://${SERVER}/user/
${A INDICATOR}      1 followers, 0 following.
${B INDICATOR}      0 followers, 1 following.
${C INDICATOR}      1 followers, 1 following.
${D INDICATOR}      0 followers, 0 following.

*** Keywords ***
Open User Id Profile Page
    [Arguments]    ${username}    ${2nd user}    ${2nd id}
    Input Username    ${username}
    Input Password    ${VALID PASSWORD}
    Submit Form
    Go To User Id Profile Page    ${2nd user}    ${2nd id}

User Id Profile Should Be Open
    [Arguments]    ${user}
    Wait Until Page Contains    User: ${user}

Go To User Id Profile Page
    [Arguments]    ${user}    ${id}
    Go To    ${USER URL}${id}
    User Id Profile Should Be Open    ${user}

Check For Success Message
    [Arguments]     ${action}     ${username}
    Wait Until Page Contains     ${action}     ${username}

Click Follow Unfollow Link
    [Arguments]    ${action}
    Click Element    ${action}

Check For Indicator
    [Arguments]    ${indicator}
    Wait Until Page Contains    ${indicator}

Follow Message
    [Arguments]    ${username}
    [Return]    You are following ${username}!

Unfollow Message
    [Arguments]    ${username}
    [Return]    You are not following ${username}.

Check For Response Message
    [Arguments]    ${action}    ${username}
    ${message}=     Run Keyword If    '${action}' == 'follow'    Follow Message    ${username}
    ...     ELSE    Unfollow Message    ${username}
    Wait Until Page Contains    ${message}
