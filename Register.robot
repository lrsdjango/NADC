*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
#${url}    https://demowebshop.tricentis.com/register
${url}    https://demowebshop.tricentis.com/


*** Test Cases ***
RegisterTest
    #Open Browser    https://demowebshop.tricentis.com/register    chrome
    ${speed}    Get Selenium Speed              #To check the speed of selenium
    Log To Console    ${speed}                  #To print the speed time


    Open Browser    ${url}    ${browser}
    Maximize Browser Window


    Wait Until Page Contains    Register        #This will wait the page until it will find the register and then it will proceed

    #${Timeout}    Get Selenium Timeout
    # Log To Console    ${Timeout}


    #Set Selenium Timeout    10sec               #Page wil wait 10sec and this will applicable only for below line not complete code
    #Wait Until Page Contains    Registration    #Here we are giving wrong check i.e registration, so the page will wait 5sed and it will through error

    Set Selenium Speed    2sec
    Click Link    xpath://a[contains(text(),'Register')]
    Select Radio Button    Gender    M
    Input Text    name:FirstName    Shiva
    Input Text    name:LastName    God
    Input Text    name:Email    omNamashivaya@gmail.com
    Input Text    name:Password    Shiva123
    Input Text    name:ConfirmPassword    Shiva123
    Click Element    xpath://input[@id='register-button']
    ${speed}    Get Selenium Speed              #To check the speed of selenium
    Log To Console    ${speed}                  #To print the speed time

*** Keywords ***


