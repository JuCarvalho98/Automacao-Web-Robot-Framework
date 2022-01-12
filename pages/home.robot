*** Settings ***
Documentation        page objects da página home
Library              SeleniumLibrary
Library              String


*** Variables ***
${HOME_TITLE}                 Automação com Batista
${FORMULARIO_BTN}             xpath=//a[contains(text(),'Formulário')]
${CRIAR_USUARIO}              xpath=//a[contains(text(),'Criar Usuários')]
${LISTA_USUARIO}              xpath=//a[contains(text(),'Lista de Usuários')]
${MENSAGEM_LISTA_USUARIO}     xpath=//h5

*** Keywords ***
Dado que eu esteja na home do site
    Title Should Be    ${HOME_TITLE}
Quando clicar no menu formulário
    Wait Until Element Is Visible    ${FORMULARIO_BTN} 
    Click Element                    ${FORMULARIO_BTN}
E clicar no link usuários
    Wait Until Element Is Visible    ${CRIAR_USUARIO}  
    Click Element                    ${CRIAR_USUARIO}  

E clicar no listar usuários
    Wait Until Element Is Visible   ${LISTA_USUARIO}
    Click Element                   ${LISTA_USUARIO}

Dado que esteja na lista de usuarios
    Quando clicar no menu formulário
    E clicar no listar usuários
    Element Text Should Be    ${MENSAGEM_LISTA_USUARIO}    Lista de Usuários!!