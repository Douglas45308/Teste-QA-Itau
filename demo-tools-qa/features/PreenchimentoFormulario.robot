*** Settings ***
Library    SeleniumLibrary
Resource            ../Config/base.robot
Resource            ../steps/PreenchimentoFormularioSteps.robot
Library             SeleniumLibrary
Library             DateTime



Suite Setup         Abrir navegador    ${NAVEGADOR_ON}
Suite Teardown      Encerrar navegador



*** Test Cases ***

Cenário 001: Enviar formulário com todos os campos obrigatórios preenchidos
  [Documentation]    Preencher todos os campos obrigatórios e validar o envio
  [Tags]  Validar Campos Obrigatórios
  Dado que o usuário esteja no site Tools QA
  Quando preencho os campos obrigatórios do formulário
  Então o formulário deve ser enviado com sucesso
   
Cenário 002: Validar Campos obrigatórios Campos Vazios
  [Documentation]    Tentar submeter o formulário com campos vazios e validar mensagens de erro ou bloqueios do submit
  [Tags]  Tentar submeter formulário com campos vazios
  Dado que o usuário esteja no site Tools QA
  Quando não preencho os campos obrigatórios do formulário 
  Então desejo visualizar o bloqueio do submit   
  
Cenário 003: Validação visual do envio
  [Documentation]    Validar visualmente se o formulário foi enviado com sucesso 
  Dado que o usuário esteja no site Tools QA
  Quando preencho e envio o formulário corretamente
  Então devo visualizar uma mensagem de confirmação de envio