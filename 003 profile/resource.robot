*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Resource          ../global.robot

*** Variables ***
${PROFILE URL}         http://${SERVER}/user/1
${PROFILE EDIT URL}    http://${SERVER}/edit_profile
${HELLO USER}          User: ${VALID USER}
${ABOUT ME}            LOREM IPSUM DOLLOR SET AMET
${MESSAGE}             Your changes have been saved.

*** Keywords ***
Open Browser To Profile Page From Home Page
    Open Browser To Home Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Form
    Go To Profile Page

Profile Page Should Be Open
    Wait Until Page Contains    ${HELLO USER}

Go To Profile Page
    Go To    ${PROFILE URL}
    Profile Page Should Be Open

Open Browser To Profile Edit Page From Home Page
    Open Browser To Home Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Form
    Go To Profile Edit Page

Profile Edit Page Should Be Open
    Title Should Be    Edit Profile - microblog

Go To Profile Edit Page
    Go To    ${PROFILE EDIT URL}
    Profile Edit Page Should Be Open

Input About Me
    [Arguments]    ${about me}
    Input Text    about_me    ${about me}