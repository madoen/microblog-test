*** Settings ***
Documentation     A test suite with a single test for valid register.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Register
    Open Browser To Register from Home Page
    Input Username    ${NEW DATA}
    Input Email    ${NEW DATA}
    Input Password    ${VALID PASSWORD}
    Confirm Password    ${VALID PASSWORD}
    Submit Form
    Wait Until Page Contains    ${SUCCESS MSG}
    [Teardown]    Close Browser
