*** Settings ***
Resource    ../Config/base.robot
Resource    ../pages/PreenchimentoFormularioPages.robot

*** Variables ***


*** Keywords ***
Dado que o usuário esteja no site Tools QA
    PreenchimentoFormularioPages.Nome da Pagina
    

Quando preencho os campos obrigatórios do formulário
    PreenchimentoFormularioPages.Digitar Nome
    PreenchimentoFormularioPages.Digitar Sobrenome
    PreenchimentoFormularioPages.Selecionar Genero
    PreenchimentoFormularioPages.Digitar Telefone

Então o formulário deve ser enviado com sucesso
    PreenchimentoFormularioPages.Clicar Submit
    PreenchimentoFormularioPages.Validar Modal
    PreenchimentoFormularioPages.Validar Campos do Modal    ${nome_user}    ${genero_user}    ${telefone_user} 
    PreenchimentoFormularioPages.Fechar Modal Com JavaScript


Quando não preencho os campos obrigatórios do formulário
   PreenchimentoFormularioPages.Clicar Submit
   
Então desejo visualizar o bloqueio do submit 
    PreenchimentoFormularioPages.Tirar Print da Tela

Quando preencho e envio o formulário corretamente
    PreenchimentoFormularioPages.Digitar nome
    PreenchimentoFormularioPages.Digitar sobrenome
    PreenchimentoFormularioPages.Digitar email
    PreenchimentoFormularioPages.Selecionar genero
    PreenchimentoFormularioPages.Digitar Telefone
    PreenchimentoFormularioPages.Preencher Data de Nascimento
    PreenchimentoFormularioPages.Digitar Subjects
    #PreenchimentoFormularioPages.Selecionar Hobbies
    PreenchimentoFormularioPages.Digitar Endereco
    PreenchimentoFormularioPages.Preencher State e City    NCR    Delhi
    PreenchimentoFormularioPages.Clicar Submit
    PreenchimentoFormularioPages.Fechar Modal Com JavaScript

Então devo visualizar uma mensagem de confirmação de envio
  PreenchimentoFormularioPages.Tirar Print da Tela    