*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Resource          ../global.robot

*** Variables ***
${REGISTER URL}      http://${SERVER}/register
${SUCCESS MSG}       Congratulations, you are now a registered user!
${USER EXIST MSG}    [Please use a different username.]
${EMAIL EXIST MSG}   [Please use a different email address.]
${INVALID EMAIL MSG}    [Invalid email address.]
${PWD NOT MATCH}     [Field must be equal to password.]

*** Keywords ***
Open Browser To Register from Home Page
    Open Browser To Home Page
    Go To Register Page

Register Page Should Be Open
    Title Should Be    Register - microblog

Go To Register Page
    Go To    ${REGISTER URL}
    Register Page Should Be Open

Generate Email
    ${email}    Safe Email
    [Return]    ${email}

Given Email
    [Arguments]    ${email}
    [Return]    ${email}

Input Email
    [Arguments]    ${email}
    ${email}=    Run Keyword If    '${email}' == '${NEW DATA}'    Generate Email
    ...     ELSE    Given Email    ${email}
    Input Text    email    ${email}

Confirm Password
    [Arguments]    ${password2}
    Input Text    password2    ${password2}
