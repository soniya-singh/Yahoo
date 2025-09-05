*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${YAHOO_URL}           https://finance.yahoo.com/
${BROWSER}             Chrome
${FIRST_NAME}          Soniya  
${LAST_NAME}           Singh
${EMAIL}               Soniyas022
${PASSWORD}            StrongPass123!
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
    # Note: CAPTCHA and phone verification cannot be bypassed.
    Sleep    5
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Yahoo Finance Website
    Open Browser    ${YAHOO_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //a[text()='Sign in']    10s

Click Sign In
    Click Element    //a[text()='Sign in']
    Wait Until Element Is Visible    //a[text()='Create an account']    10s

Click Create An Account
    Click Element    //a[text()='Create an account']
    Wait Until Page Contains Element    name=firstName    10s

Fill Sign Up Form
    Input Text    name=firstName    ${FIRST_NAME}
    Input Text    name=lastName     ${LAST_NAME}
    Input Text    name=username     ${EMAIL}
    Input Text    name=password     ${PASSWORD}
    Input Text    name=phone        ${PHONE}
    Select From List By Label    name=mm    ${BIRTH_MONTH}
    Input Text    name=dd           ${BIRTH_DAY}
    Input Text    name=yyyy         ${BIRTH_YEAR}
