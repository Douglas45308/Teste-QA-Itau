*** Settings ***
Library    SeleniumLibrary
Library    DateTime
*** Variables ***
${URL}           https://demoqa.com/automation-practice-form
${NAVEGADOR}      chrome   
${TIULO_PAGINA}   DEMOQA
${date}
${TEST NAME}     
${NAVEGADOR_ON}               navegador-on
${NAVEGADOR_HEADLESS}         headless
*** Keywords ***
Abrir navegador
    [Arguments]   ${modo_execucao}
     IF     "${modo_execucao}"== "navegador-on"
            Open Browser       ${URL}     ${NAVEGADOR}     
            Set Selenium Implicit Wait    5
            Title Should Be    ${TIULO_PAGINA}
            Maximize Browser Window
              
    ELSE IF  "${modo_execucao}"== "headless"
            Open Browser       ${URL}     ${NAVEGADOR}     options=add_argument("--headless")   
            Set Selenium Implicit Wait    5
            Title Should Be    ${TIULO_PAGINA}
            Maximize Browser Window
            
    END

Encerrar navegador
    ${date}=    Evaluate    datetime.datetime.now().strftime('%d-%m-%Y %Hh%Mm%Ss')
    #Capture Page Screenshot    ${TEST NAME} ${date}.png
    Capture Page Screenshot   prints/Encerrar navegador.png 
    Close Browser


     
      