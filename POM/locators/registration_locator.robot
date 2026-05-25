*** Variables ***
${name}    css:[placeholder='First Name']
${email}    id:email
${gender}    xpath=//label[normalize-space(text())='Female']/preceding-sibling::input
${mobile}    xpath=//input[@type='text' and @name='mobile']
${birth}    id:dob
${subject}    xpath=//input[@placeholder='Enter Subject']
${hobbies}    xpath=//label[text()='Music']/preceding-sibling::input
${file}    css:[id='picture']
${address}     css:[placeholder='Currend Address']
${state}    id:state
${city}    id:city
${submit}    tag:form
#@{Reg}    Roobini    roobini123@gmail.com    1290123893    1999-10-11    Science    Chennai    Uttar Pradesh    Lucknow    C:/Users/Prem/Downloads/image.pdf