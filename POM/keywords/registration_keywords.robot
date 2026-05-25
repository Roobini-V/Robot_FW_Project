*** Settings ***
Library    JSONLibrary
Resource   resources/global_variables.robot
Resource   resources/global_keywords.robot
Resource   ../locators/registration_locator.robot

*** Keywords ***

User Lands On Registration Page
    [Documentation]    Opens the registration form page
    url_navigation    ${REG_URL}

User Loads Registration Data
    [Documentation]    Loads registration details from JSON file
    ${reg_cred_obj}=    Load Json From File    ./resources/data/registration.json
    ${name}=            Get Value From Json    ${reg_cred_obj}    $.user_name
    ${email}=           Get Value From Json    ${reg_cred_obj}    $.user_email
    ${mobile}=          Get Value From Json    ${reg_cred_obj}    $.user_mobile_num
    ${dob}=             Get Value From Json    ${reg_cred_obj}    $.user_date_of_birth
    ${subject}=         Get Value From Json    ${reg_cred_obj}    $.user_subject
    ${file}=            Get Value From Json    ${reg_cred_obj}    $.user_file
    ${address}=         Get Value From Json    ${reg_cred_obj}    $.user_address
    ${state}=           Get Value From Json    ${reg_cred_obj}    $.user_state
    ${city}=            Get Value From Json    ${reg_cred_obj}    $.user_city
    ${gender}=          Get Value From Json    ${reg_cred_obj}    $.user_gender
    RETURN    ${name[0]}    ${email[0]}    ${mobile[0]}    ${dob[0]}    ${subject[0]}    ${file[0]}    ${address[0]}    ${state[0]}    ${city[0]}    ${gender[0]}

User Enters Name
    [Documentation]    Clears the name textbox and enters the provided user name
    [Arguments]    ${name_value}
    clear_input_textbox    ${name}    ${name_value}

User Enters Email
    [Documentation]    Clears the email textbox and enters the provided email address
    [Arguments]    ${email_value}
    clear_input_textbox    ${email}    ${email_value}

User Selects Gender
    [Documentation]    Selects the gender option (Male/Female/Other) from the form
    [Arguments]    ${gender_value}
    Click Element    ${gender}

User Enters Mobile
    [Documentation]    Clears the mobile number textbox and enters the provided mobile number
    [Arguments]    ${mobile_value}
    clear_input_textbox    ${mobile}    ${mobile_value}

User Enters DOB
    [Documentation]    Clears the date of birth field and enters the provided DOB
    [Arguments]    ${dob_value}
    clear_input_textbox    ${birth}    ${dob_value}

User Enters Subject
    [Documentation]    Clears the subject textbox and enters the subject
    [Arguments]    ${subject_value}
    clear_input_textbox    ${subject}    ${subject_value}

User Selects Hobbies
    [Documentation]    Selects one or more hobbies from the form
    [Arguments]    ${hobbies_value}
    Click Element    ${hobbies}

User Uploads File
    [Documentation]    Uploads the specified file (e.g., resume, document) to the form
    [Arguments]    ${file_value}
    Choose File    ${file}    ${file_value}

User Enters Address
    [Documentation]    Clears the address textbox and enters the address
    [Arguments]    ${address_value}
    clear_input_textbox    ${address}    ${address_value}

User Selects State
    [Documentation]    Selects the given state from the dropdown list
    [Arguments]    ${state_value}
    select_list    ${state}    ${state_value}

User Selects City
    [Documentation]    Selects the given city from the dropdown list
    [Arguments]    ${city_value}
    select_list    ${city}    ${city_value}

User Submits Registration
    [Documentation]    Submits the completed registration form
    Submit Form    ${submit}

Fill Registration Form With Data
    [Documentation]    It fills all the required fields
    [Arguments]    ${name}    ${email}    ${gender}    ${mobile}    ${dob}    ${subject}    ${hobbies}    ${file}    ${address}    ${state}    ${city}
    User Enters Name        ${name}
    User Enters Email       ${email}
    User Selects Gender     ${gender}
    User Enters Mobile      ${mobile}
    User Enters DOB         ${dob}
    User Enters Subject     ${subject}
    User Selects Hobbies    ${hobbies}
    User Uploads File       ${file}
    User Enters Address     ${address}
    User Selects State      ${state}
    User Selects City       ${city}

Submit Registration Form With Data
    [Documentation]    It Submits the registration form
    User Submits Registration
