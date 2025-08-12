*** Settings ***
Resource    ../Config/base.robot
Library     FakerLibrary
Library    OperatingSystem


*** Variables ***
${NOME_DA_PAGINA}     //img[@src='/images/Toolsqa.jpg']
${First_Name}           //input[contains(@id,'firstName')]
${Last_Name}            //input[contains(@id,'lastName')]
${EmailAddress}         //input[contains(@id,'userEmail')]
${Gender_Other}         //input[contains(@id,'gender-radio-3')]
${Date_Birth}          //input[contains(@id,'dateOfBirthInput')]   
            
${Mobile_Number}         //input[contains(@id,'userNumber')]
${Subjet}                //input[contains(@id,'subjectsInput')]
${Hobbies_Sports}       //input[contains(@id,'hobbies-checkbox-1')]
${Endereco_Atual}         //textarea[contains(@id,'currentAddress')]
${Descricao_Area}         //*[@id="state"]/div/div[1]
${SUBMIT}               //button[contains(@id,'submit')]
${Enter_Infos}           //b[contains(.,'Enter Account Information')]
${MODAL_ID}    example-modal-sizes-title-lg
${EXPECTED_TEXT}    Thanks for submitting the form
${INPUT_BIRTH}                 xpath=//input[@value='22 Nov 2024']
${dateofbirth}       id=dateOfBirthInput 
${DATA_NASCIMENTO}    10 May 1990
${nome_user}    Fulano
${sobrenome_user}    de Tal
${email_user}    fulano@example.com
${telefone_user}    1234567890
${genero_user}    Outro
${Close_Modal}    //button[contains(@id,'closeLargeModal')]


*** Keywords ***
Nome da Pagina
    Wait Until Element Is Visible    ${NOME_DA_PAGINA}
    Capture Page Screenshot   prints/Nome da Pagina.png   
    
Digitar nome
   ${nome_user}    FakerLibrary.Name Female
    Input Text    ${First_Name}    ${nome_user}
    Capture Page Screenshot   prints/Digitar nome.png   

Digitar sobrenome
    ${sobrenome_user}    FakerLibrary.Last Name Female
    Input Text    ${Last_Name}    ${sobrenome_user}
    Capture Page Screenshot   prints/Digitar sobrenome.png    

Digitar email
    ${email_user}    FakerLibrary.Email
    Input Text    ${EmailAddress}    ${email_user}
    Capture Page Screenshot   prints/Digitar email.png   

Selecionar genero    
   Execute JavaScript    document.querySelector("input[id*='gender-radio-3']").click()
   Capture Page Screenshot   prints/Selecionar genero .png 

Digitar Telefone
   Input Text    ${Mobile_Number}    1234567890
   Capture Page Screenshot   prints/Digitar Telefone.png 
      
Data de Nascimento Novo
    ${dadonascimento}    FakerLibrary.Date Of Birth
    Input Text    ${dateofbirth}    ${dadonascimento}
    Capture Page Screenshot   prints/Data de Nascimento Novo.png 
   
Preencher Data de Nascimento
 
    Wait Until Element Is Visible    id=dateOfBirthInput    5s
    Clear Element Text    id=dateOfBirthInput
    Input Text    id=dateOfBirthInput    ${DATA_NASCIMENTO}
    Press Keys    id=dateOfBirthInput    RETURN
    Sleep    2s
    Capture Page Screenshot   prints/Preencher Data de Nascimento.png 
    
Digitar Subjects
    Execute JavaScript    document.getElementById("adplus-anchor").style.display = "none"
    Input Text    ${Subjet}    TESTE  
    #Press Keys    ${Subjet}    RETURN 
    Sleep    2
     Capture Page Screenshot   prints/Digitar Subjects.png 

Selecionar Hobbies
    Click Element  ${Hobbies_Sports}
    Sleep    2
   Capture Page Screenshot   prints/Selecionar Hobbies.png     
   

    ${mobile_user}    FakerLibrary.Phone Number
    Input Text    ${Mobile_Number}    ${mobile_user}

    
Digitar Endereco
    Execute JavaScript    document.getElementById("adplus-anchor").style.display = "none"
    ${varios_enderecos}=    FakerLibrary.Street Address
    Scroll Element Into View    ${Endereco_Atual}
    Wait Until Element Is Visible    ${Endereco_Atual}    timeout=5s
    Input Text    ${Endereco_Atual}    ${varios_enderecos}
    Sleep    15
    Capture Page Screenshot   prints/Digitar Endereco.png 

*** Keywords ***
Clicar Submit
    Execute JavaScript    document.getElementById("adplus-anchor").style.display = "none"
    Execute JavaScript    document.getElementById("submit").click()
     Sleep    3
    Capture Page Screenshot   prints/Clicar Submit.png 
   
    

Fechar Modal Com JavaScript
    Execute JavaScript    document.querySelector("button#closeLargeModal").click()
    Sleep    2
    Capture Page Screenshot   prints/Fechar Modal Com JavaScript.png 
   
Validar Modal
    Wait Until Element Is Visible    id=${MODAL_ID}    timeout=10s
    ${modal_text}=    Get Text    id=${MODAL_ID}
    Should Be Equal    ${modal_text}    ${EXPECTED_TEXT}
    Capture Page Screenshot   prints/Validar Modal.png 
    
Validar Campos do Modal
    [Arguments]    ${expected_name}    ${expected_gender}    ${expected_mobile}

    ${actual_name}=    Get Text    xpath=//td[text()='Student Name']/following-sibling::td
    ${actual_gender}=  Get Text    xpath=//td[text()='Gender']/following-sibling::td
    ${actual_mobile}=  Get Text    xpath=//td[text()='Mobile']/following-sibling::td

    Should Not Be Empty     ${actual_name}    ${expected_name}
    Should Not Be Empty    ${actual_gender}  ${expected_gender}
    Should Not Be Empty     ${actual_mobile}  ${expected_mobile}   
    Capture Page Screenshot   prints/Validar Campos do Modal.png 
 
Select Hobbies
    [Arguments]    @{hobbies}
    FOR    ${hobby}    IN    @{hobbies}
        Run Keyword If    '${hobby}' == 'Sports'    Click Element    xpath=//label[normalize-space(text())="Sports"]
        Run Keyword If    '${hobby}' == 'Reading'   Click Element    xpath=//label[normalize-space(text())="Reading"]
        Run Keyword If    '${hobby}' == 'Music'     Click Element    xpath=//label[normalize-space(text())="Music"]
    END
    Capture Page Screenshot   prints/Select Hobbies.png

Selecionar Hobbies Correto 
    [Arguments]    ${Hobbies_Sports} 
Click Element    xpath=//label[normalize-space(text())='${hobby}']
    Capture Page Screenshot   prints/Selecionar Hobbies Correto.png    


Tirar Print da Tela
    Capture Page Screenshot

Validar Mensagem de Confirmacao
    Wait Until Element Is Visible    id=${MODAL_ID}    timeout=10s
    Element Should Contain    id=${MODAL_ID}    ${EXPECTED_TEXT}
    Capture Page Screenshot   prints/Validar Mensagem de Confirmacao.png

Preencher State e City
    [Arguments]    ${state}    ${city}
    # Seleciona o campo State e digita o valor
    #Click Element xpath=//div[@id='state']//div[contains(@class,'css-1wa3eu0-placeholder')]
    Input Text    xpath=//div[@id='state']//input    ${state}
    Press Keys    xpath=//div[@id='state']//input    RETURN
    Sleep    1s
    # Seleciona o campo City e digita o valor
    #Click Element    xpath=//div[@id='city']//div[contains(@class,'css-1wa3eu0-placeholder')]
    Input Text    xpath=//div[@id='city']//input    ${city}
    Press Keys    xpath=//div[@id='city']//input    RETURN
    Sleep    1s
    Capture Page Screenshot   prints/Preencher State e City.png