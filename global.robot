*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${VALID USER}     demo
${VALID PASSWORD}    123456
${SERVER}         172.17.0.3
${BROWSER}        %{BROWSER}
${DELAY}          0
${HOME URL}       http://${SERVER}/index
${LOGIN URL}      http://${SERVER}/login

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOME URL}    ${BROWSER}
    # Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Sign In Page Should Be Open

Sign In Page Should Be Open
    Title Should Be    Sign In - microblog

Go To Sign In Page
    Go To    ${LOGIN URL}
    Sign In Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Form
    Click Button    submit

Home Page Should Be Open
    Location Should Be    ${HOME URL}
    Title Should Be    Home - microblog

