#*** Settings ***
#Resource    ../locators/login_locator.robot
#Resource    /resources/global_keywords.robot
#Resource    /resources/global_variables.robot
#
#*** Keywords ***
#User_loging_in
#    [Arguments]    ${user_locator}    ${password_locator}    ${l}
##    Wait Until Element Is Visible    ${username}    ${MIN_WAIT}
##    clear_input_textbox    ${username}    ${l1}[0]
##    Wait Until Element Is Visible    ${password}    10s
##    clear_input_textbox    ${password}    ${l1}[1]
##    submit_form    ${submit}
#User_enter_id
#    [Arguments]
#    Wait Until Element Is Visible    ${username}    ${MIN_WAIT}
#    Wait Until Element Is Enabled    ${username}
#
#
#    Wait Until Element Is Visible    ${password}    ${MAX_WAIT}
#    Wait Until Element Is Enabled    ${password}
#    Wait Until Element Is Visible    ${submit_click}
#    Submit_login    ${submit_click}

*** Settings ***
Resource    resources/global_variables.robot
Resource    resources/global_keywords.robot
Resource    ../locators/login_locator.robot
Library     SeleniumLibrary
Library     JSONLibrary

*** Keywords ***

User Lands On Sauce Demo
    [Documentation]    Opens the Sauce Demo website
    url_navigation    ${SAUCE_URL}

User Loads Credentials
    [Documentation]    Fetches username and password from JSON file
    ${credential_obj}=    Load Json From File    ./resources/data/login.json
    ${username_list}=     Get Value From Json    ${credential_obj}    $.loginiduser
    ${password_list}=     Get Value From Json    ${credential_obj}    $.loginidpass
    ${username_value}=    Set Variable    ${username_list[0]}
    ${password_value}=    Set Variable    ${password_list[0]}
    RETURN    ${username_value}    ${password_value}

User Enters Username
    [Arguments]    ${loginiduser}    # ✅ should match JSON key
    #Wait Until Element Is Visible    ${locator_UID}    ${MIN_WAIT}
    clear_input_textbox    ${locator_UID}    ${loginiduser}

User Enters Password
    [Arguments]    ${loginidpass}    # ✅ should match JSON key
    #Wait Until Element Is Visible    ${locator_PID}    ${MAX_WAIT}
    clear_input_textbox    ${locator_PID}    ${loginidpass}

User Logging In
    [Arguments]    ${loginiduser}    ${loginidpass}   # ✅ matches JSON keys
    User Enters Username    ${loginiduser}
    User Enters Password    ${loginidpass}
    User Submits Login

User Submits Login
    Wait Until Element Is Visible    ${submit_click}
    submit_login    ${submit_click}

User Should See Cart
    Wait Until Element Is Visible    ${cart_visible}    ${MIN_WAIT}



