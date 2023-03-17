*** Settings ***
Documentation        Essa suite de testes cobre todos os fluxos da criação de empresas
Resource            ../Login/login_resources.robot
Resource            ./empresa_resources.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***

Caso de teste 01 - Criar empresa Juridica com sucesso
    [Documentation]     Este caso de teste realiza a criação de uma empresa com tipo juridico
    [Tags]              Empresa
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então os dados de cadastro da empresa jurica são preenchidos corretamente

Caso de teste 02 - Criar empresa fisica com sucesso
    [Documentation]     Este  caso de teste realiza a criação de uma empresa com tipo fisico
    [Tags]              Empresa
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então os dados de cadastro da empresa fisica são preenchidos corretamente

Caso de teste 03 - Empresa sem o Tipo
    [Documentation]     Este caso de teste tenta realizar a criação de uma empresa com tipo juridico, porém,
    ...                 com o campo "tipo" em branco.
    [Tags]              Empresa
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então os campos são preenchidos com excessão do campo Tipo

Caso de teste 04 - Empresa com CPF invalido
    [Documentation]     Este caso de teste tenta realizar a criação de uma empresa com o tipo fisico, porém, 
    ...                 com um cpf invalido.
    [Tags]              Empresa
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então o campo CPF é preenchido com um valor invalido

Caso de teste 05 - Empresa com CNPJ invalido
    [Documentation]    Este caso de teste tenta realizar a criação de uma empresa com o tipo fisico, porém, 
    ...                com um cnpj invalido.
    [Tags]             Empresas
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então o campo CNPJ é preenchido com um valor invalido

Caso de teste 06 - Empresa sem razão social
    [Documentation]    Este caso de teste tenta realizar a criação de uma empresa do tipo juridica, porém,
    ...                sem uma razão social.
    [Tags]             Empresa
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então uma empresa é cadastrada sem razão social    

Caso de teste 07 - Empresa sem grupo
    [Documentation]    Este caso de teste tenta realizar a criação de uma empresa do tipo juridico, porém,
    ...                sem um grupo do eSocial.
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    E a pagina de criação de empresas for acessada
    E clico no botão "Nova Empresa"
    Então uma empresa é cadastrada sem grupo 