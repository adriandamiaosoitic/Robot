*** Settings ***
Documentation       Essa suite de testes valida o acesso ao homolog do metracloud com o user host
Resource            ./loginHost_resources.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***
Caso de teste 01 - Logar como Host com sucesso
    [Documentation]    Esse caso de teste valida um login com sucesso.   
    [Tags]             Login
    Dado que estou na tela de login do metracloud
    Quando os campos VIP, Usuário e Senha forem preenchidos com dados validos
    E for efetuado o Login 
    então a pagina inicial do metracloud deverá ser exibida
    
Caso de teste 02 - Logar com o campo vip errado
    [Documentation]    Esse caso de teste valida um login cujo campo VIP esteja errado.   
    [Tags]             Login
    Dado que estou na tela de login do metracloud
    Quando o campo Vip for invalido, porém os campos Usuário e Senha forem preenchidos com dados validos
    E for efetuado o Login
    Então a mensagem "Clínica não encontrada." deverá ser disparada
    

Case de teste 03 - Logar como host com o nome de usuário errado
    [Documentation]    Esse caso de teste valida um login cujo campo usuário esteja errado.   
    [Tags]             Login
    Dado que estou na tela de login do metracloud
    Quando o campo Usuario for invalido, porém os campos vip e Senha forem preenchidos com dados validos
    E for efetuado o Login
    Então a mensagem "Usuário não encontrado" deverá ser disparada
    
Case de teste 04 - Logar como host com a senha errada
    [Documentation]    Esse caso de teste valida um login cujo campo senha esteja errado
    [Tags]             Login
    Dado que estou na tela de login do metracloud
    Quando o campo senha for invalido, porém os campos vip e Usuario forem preenchidos com dados validos
    E for efetuado o Login
    Então a mensagem de erro deverá ser disparada

    
