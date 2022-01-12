*** Settings ***
Documentation        Page objects da página users
Library              SeleniumLibrary
Library              String



*** Variables ***
${NOME}                 id=user_name
${SOBRENOME}            id=user_lastname
${EMAIL}                id=user_email
${ENDEREÇO}             id=user_address
${UNIVERSIDADE}         id=user_university
${PROFISSAO}            id=user_profile
${GENERO}               id=user_gender
${IDADE}                id=user_age
${BOTAO_CRIAR}          css=.actions 
${MENSAGEM_SUCESSO}     id=notice
${LISTA_USUARIO}        xpath=//h5
${ULTIMA_PAGINA}        xpath=//a[contains(text(),'Último')]
${BOTAO_DELETE}         xpath=(//a[contains(text(),'delete')])[2]
${NOME_EXCLUIDO}        id=notice



*** Keywords ***
E preencher as informações
    Input Text        ${NOME}             Roberto
    Input Text        ${SOBRENOME}        Carvalho
    Input Text        ${EMAIL}            jmarcosviniciusteixeira2@hotmail.com
# ${ENDEREÇO}         id=user_address
# ${UNIVERSIDADE}     id=user_university
# ${PROFISSAO}        id=user_profile
# ${GENERO}           id=user_gender
# ${IDADE}            id=user_age


E clicar no botão criar
    Wait Until Element Is Visible   ${BOTAO_CRIAR}
    Click Element                   ${BOTAO_CRIAR}

Então a mensagem "${MENSAGEM}" deve ser exibida 
    Wait Until Element Is Visible    ${MENSAGEM_SUCESSO}
    Element Text Should Be     ${MENSAGEM_SUCESSO}    ${MENSAGEM}

Então deve ser exibida uma lista com todos usuários cadastrados
    Wait Until Element Is Visible    ${LISTA_USUARIO}
    Element Should Be Visible        ${LISTA_USUARIO}
    
Quando clicar na paginação ultima pagina
    Wait Until Element Is Visible    ${ULTIMA_PAGINA}
    Click Element                    ${ULTIMA_PAGINA}

E clicar no icone delete    
    Wait Until Element Is Visible    ${BOTAO_DELETE}
    Click Element                    ${BOTAO_DELETE}   
    
E clicar em ok
    Handle Alert        ACCEPT                    

Então o usuario deve ser removido da lista
    Element Text Should Be      ${NOME_EXCLUIDO}    Seu Usuário foi removido com sucesso!