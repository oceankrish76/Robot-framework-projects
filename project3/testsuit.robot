*** Settings ***
Library           SeleniumLibrary
Test Teardown    Close All Browsers
Suite Setup      Set Screenshot Directory  /Users/bagale/Desktop/robot_test/first_test/RobotFramework-Projects/project3/screenshots
Library        DateTime
Library    FakerLibrary
Library  OperatingSystem
Library  String
#Force Tags     10000

*** Variables *** 

${HELLO_WORLD_TEXT}   Hello World
${GOOGLE_URL}         https:google.com 
${ADD_EMPLOYEE}       https://opensource-demo.orangehrmlive.com/index.php/pim/addEmployee
${GOOGLE_NAME}        chrome
${LOCATOR_GOOGLE_SEARCH_TEXT_FIELD}      name=q
${TEST_COMPLETED_TEXT}    Test Completed
${TYPE OF FILE}           png
${UploadFiletest}         css=[type='file']
${UploadFiletestLocator}  //input[@id='photofile']
${AddFile}                ${EXECDIR}/prof.png


${first-name}       id=firstName
${last-name}        id=lastName
${employee-id}      id=employeeId
${save-button}      id=btnSave


*** Test Cases ***
MyFirstTest
    Log     ${HELLO_WORLD_TEXT}
    Create File  ${EXECDIR}/example.txt  hello world


FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words   nb=${5}
    Log          words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log          words: ${words}


FirstSeleniumTest
    Open Browser    ${GOOGLE_URL}   ${GOOGLE_NAME}
    Set Browser Implicit Wait    5
    Input Text    ${LOCATOR_GOOGLE_SEARCH_TEXT_FIELD}    Automation step by step
    Press Keys    ${LOCATOR_GOOGLE_SEARCH_TEXT_FIELD}   Enter
    #Click Button  id=btnLogin
    Sleep    2
    Close Browser
    Log    ${TEST_COMPLETED_TEXT} 


SampleLoginTest
    [Documentation]    This is a simple login Test
    #Setup Selenium
    [Tags]   1000
    [Setup]     Set Screenshot Directory  /Users/bagale/Desktop/robot_test/first_test/RobotFramework-Projects/project3/screenshots
    Open Browser    https://opensource-demo.orangehrmlive.com    chrome
    Input Text       id=txtUsername    Admin
    Input Text       id=txtPassword    admin123
    Click Button     name=Submit
    Wait Until Page Contains  Dashboard
    Click Element   //a[@id='welcome']
    Wait Until Page Contains Element  //body/div[@id='wrapper']/div[@id='branding']/div[@id='welcome-menu']/ul/li[2]
    sleep   2s
    Click Element   //body/div[@id='wrapper']/div[@id='branding']/div[@id='welcome-menu']/ul/li[2]
    Log    Test Completed

addEmployeeTest
    Open Browser    ${ADD_EMPLOYEE}   ${GOOGLE_NAME}
    Input Text      id=txtUsername    Admin
    Input Text      id=txtPassword    admin123
    Click Button    name=Submit
    Wait Until Page Contains  Dashboard

    # ${"pim"} set variable id:menu_pim_viewPimModule
    Mouse Over     //a[@id='menu_pim_viewPimModule']
    Wait Until Page Contains  Add Employee
    
    click Element  //a[@id='menu_pim_addEmployee']

    

    element should be visible    ${first-name}
    element should be enabled    ${first-name}
    element should be visible    ${last-name}
    element should be enabled    ${last-name}
    element should be visible    ${employee-id}
    element should be enabled    ${employee-id}
    element should be visible    ${employee-id}
    element should be enabled    ${employee-id}

    input text    ${first-name}  Krishna
    input text    ${last-name}  Bagale
    sleep  5s
    clear element text  ${first-name}
    clear element text  ${last-name}
    clear element text  ${employee-id}

    Wait Until Page Contains element     //input[@id='photofile']
    # Click element    //*[@id='photofile']

    @{path}       Get WebElements   //input[@id='photofile']
    Choose File     ${UploadFiletestLocator}     ${AddFile}
    Click Button     ${save-button}

    Log    ${TEST_COMPLETED_TEXT} 

*** Keywords *** 
Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}

