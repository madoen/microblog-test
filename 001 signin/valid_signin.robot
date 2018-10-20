*** Settings ***
Documentation     A test suite with a single test for valid sign in.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../global.robot

*** Test Cases ***
Valid Sign In
    Open Browser To Home Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Form
    Home Page Should Be Open
    [Teardown]    Close Browser
