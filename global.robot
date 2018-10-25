*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           FakerLibrary

*** Variables ***
${VALID USER}     demo
${NEW DATA}       generate
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

Generate Username
    ${username}    User Name
    [Return]    ${username}

Given Username
    [Arguments]    ${username}
    [Return]    ${username}

Input Username
    [Arguments]    ${username}
    ${username}=    Run Keyword If    '${username}' == '${NEW DATA}'    Generate Username
    ...     ELSE    Given Username    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Form
    Click Button    submit

Home Page Should Be Open
    Location Should Be    ${HOME URL}
    Title Should Be    Home - microblog

