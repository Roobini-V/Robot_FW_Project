
*** Settings ***
Library    SeleniumLibrary
*** Keywords ***

url_navigation
    [Arguments]    ${url}
    Open Browser    ${url}    chrome

exit_browser
    Delete All Cookies
    Close Browser

clear_input_textbox
    [Arguments]    ${locator}   ${value}
    Clear Element Text   ${locator}
    Input Text    ${locator}    ${value}

select_button
    [Arguments]    ${locator}
    Click Element    ${locator}

select_list
    [Arguments]    ${locator}   ${value}
    Select From List By Label    ${locator}    ${value}

submit_login
    [Arguments]    ${locator}
    Click Button    ${locator}
    
