*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://finance.yahoo.com/
${BROWSER}             Chrome
${FIRST_NAME}          Soniya  
${LAST_NAME}           Singh
${EMAIL}               Soniya3421
${PASSWORD}            StrongPass123#
${PHONE}               5551234567
${BIRTH_MONTH}         January
${BIRTH_DAY}           15
${BIRTH_YEAR}          1993

*** Test Cases ***
Create Yahoo Account
    Open Browser To Yahoo Finance Website
    Click Sign In
    Click Create An Account
    Fill Sign Up Form
    Add Phone numer details and Verify
    # Note: We cannot automate Phone number validation/ Captcha verification. So User can add correct phone number and submit the form
    Sleep    5
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Yahoo Finance Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //a[text()='Sign in']    10s

Click Sign In
    Click Element    //a[text()='Sign in']
    Wait Until Element Is Visible    //a[text()='Create an account']    10s

Click Create An Account
    Click Element    //a[text()='Create an account']
    Click Element    //*[@id="usernamereg-altreg"]
    Wait Until Page Contains Element    name=firstName    10s

Fill Sign Up Form
    Input Text    name=firstName    ${FIRST_NAME}
    Input Text    name=lastName     ${LAST_NAME}
    Input Text    name=userId       ${EMAIL}
    Input Text    name=password     ${PASSWORD}
    Select From List By Label       name=mm    ${BIRTH_MONTH}
    Input Text    name=dd           ${BIRTH_DAY}
    Input Text    name=yyyy         ${BIRTH_YEAR}
    Wait Until Element Is Visible    id=reg-submit-button    timeout=10s
    Click Element    id=reg-submit-button

Add Phone numer details and Verify
    Input Text    name=phone        ${PHONE}
    Wait Until Element Is Visible    id=reg-sms-button    timeout=10s
    Click Element    id=reg-sms-button
    # We cannot automate Phone number validation. So User can add correct phone number and submit the form
