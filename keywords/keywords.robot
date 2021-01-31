*** Settings ***
[Documentation]      test related keywords

*** Keywords ***
Login to page
    Open Browser    https://opensource-demo.orangehrmlive.com    chrome
    Input Text       id=txtUsername    Admin
    Input Text       id=txtPassword    admin123
    Click Button     name=Submit
    Wait Until Page Contains  Dashboard