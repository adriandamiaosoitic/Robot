*** Settings ***
Documentation       Essa suite realiza o acesso ao homolog do metracloud com o user de testes
Resource            ./login_resources.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***
Caso de teste 01 - Logar com sucesso
    [Documentation]    Esse caso de teste valida um login com sucesso.   
    [Tags]             Login
    Dado que estou na tela de login do metracloud
    E for efetuado o Login 
    então a pagina inicial do metracloud deverá ser exibida
    

    
