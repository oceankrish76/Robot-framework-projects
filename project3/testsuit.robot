*** Settings ***
Library           SeleniumLibrary
Test Teardown    Close All Browsers
Suite Setup      Set Screenshot Directory  /Users/bagale/Desktop/robot_test/first_test/RobotFramework-Projects/project3/screenshots
Library        DateTime
Library    FakerLibrary
#Force Tags     10000

*** Variables *** 

${HELLO_WORLD_TEXT}   Hello World
${GOOGLE_URL}         https:google.com 
${ADD_EMPLOYEE}       https://opensource-demo.orangehrmlive.com/index.php/pim/addEmployee
${GOOGLE_NAME}        chrome
${LOCATOR_GOOGLE_SEARCH_TEXT_FIELD}      name=q
${TEST_COMPLETED_TEXT}       Test Completed
${TYPE OF FILE}           png
${UploadFiletest}         css=[type='file']
${AddFile}                /Users/bagale/Desktop/robot_test/first_test/RobotFramework-Projects/project3/cli.png




*** Test Cases ***
MyFirstTest
    Log     ${HELLO_WORLD_TEXT}

FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words   nb=${5}
    Log    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log    words: ${words}


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
    Input Text         id=txtUsername    Admin
    Input Text          id=txtPassword    admin123
    Click Button     name=Submit
    Wait Until Page Contains  Dashboard
    Click Element   //a[@id='welcome']
    Wait Until Page Contains Element  //body/div[@id='wrapper']/div[@id='branding']/div[@id='welcome-menu']/ul/li[2]
    sleep   2s
    Click Element   //body/div[@id='wrapper']/div[@id='branding']/div[@id='welcome-menu']/ul/li[2]
    Log    Test Completed

addEmployeeTest
    Open Browser    ${ADD_EMPLOYEE}   ${GOOGLE_NAME}
    Input Text         id=txtUsername    Admin
    Input Text          id=txtPassword    admin123
    Click Button     name=Submit
    Wait Until Page Contains  Dashboard

    # ${"pim"} set variable id:menu_pim_viewPimModule
    Mouse Over  //a[@id='menu_pim_viewPimModule']
    Wait Until Page Contains  Add Employee
    
    click Element  //a[@id='menu_pim_addEmployee']

    ${"first_name"} set variable id:firstName
    ${"last_name"} set variable id:lastName
    ${"employee_id"} set variable id:employeeId
    ${"save_button"} set variable id:btnSave

    element should be visible ${"first_name"}
    element should be enabled ${"first_name"}
    element should be visible ${"last_name"}
    element should be enabled ${"last_name"}
    element should be visible ${"employee_id"}
    element should be enabled ${"employee_id"}

    input text ${"first_name"} Krishna
    input text ${"last_name"} Bagale
    sleep 5s
    clear element text ${"first_name"}
    clear element text ${"last_name"}
    clear element text ${"employee_id"}

    Choose File     ${UploadFiletest}     ${AddFile}
    Click Button     ${"save_button"}

    Log    ${TEST_COMPLETED_TEXT} 

*** Keywords *** 
Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}

