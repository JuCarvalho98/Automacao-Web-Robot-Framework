*** Settings ***
Documentation     Cenários de testes para página de usuários
Test Setup        Abrir navegador
Test Teardown     Fechar navegador
Resource          ../resources/base.robot
Resource          ../pages/home.robot
Resource          ../pages/users.robot

*** Test Cases ***
Funcionalidade: Criar um usuário válido
    Dado que eu esteja na home do site
    Quando clicar no menu formulário
    E clicar no link usuários
    E preencher as informações
    E clicar no botão criar
    Então a mensagem "Usuário Criado com sucesso" deve ser exibida

Funcionalidade: Listar usuários
    Dado que eu esteja na home do site
    Quando clicar no menu formulário
    E clicar no listar usuários
    Então deve ser exibida uma lista com todos usuários cadastrados


Funcionalidade: Excluir um Usuário
    Dado que esteja na lista de usuarios
    Quando clicar na paginação ultima pagina
    E clicar no icone delete
    E clicar em ok
    Então o usuario deve ser removido da lista