*** Settings ***
Documentation     A test suite with a single test for valid sign in.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Profile Page And Profile Edit Page
    Open Browser To Profile Page From Home Page
    Go To Profile Edit Page
    [Teardown]    Close Browser
