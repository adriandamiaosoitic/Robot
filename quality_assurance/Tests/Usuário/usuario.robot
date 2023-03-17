*** Settings ***
Documentation        Essa suite de teste cobre todos os fluxos da tela de cadastro de usuário
Resource            ../Login/login_resources.robot
Resource            ./usuario_resource.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***
Caso de teste 01 - Criação de um usuario Administrador com sucesso
    [Documentation]    Este caso de teste realiza a criação de um usuário do tipo Administrador com todos os dados válidos.
    [Tags]             User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, eu preencho todos os campos com dados validos
    Então um novo usuário deverá ser criado

Caso de teste 02 - Criação de um usuario Médico com sucesso
    [Documentation]    Este caso de teste realiza a criação de um usuário do tipo médico com todos os dados válidos.
    [Tags]             User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Médico
    Então um novo usuário deverá ser criado

Caso de teste 02 - Criação de um usuario Operador com sucesso
    [Documentation]    Este caso de teste realiza a criação de um usuário do tipo Operador com todos os dados válidos.
    [Tags]             User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Operador
    Então um novo usuário deverá ser criado

Caso de teste 03 - Criação de um usuario Enfermeiro com sucesso
    [Documentation]    Este caso de teste realiza a criação de um usuário do tipo Enfermeiro com todos os dados válidos.
    [Tags]             User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Enfermeiro
    Então um novo usuário deverá ser criado

Caso de teste 04 - Criação de um usuario Secretário com sucesso
    [Documentation]    Este caso de teste realiza a criação de um usuário do tipo Secretário com todos os dados válidos.
    [Tags]             User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Secretário
    Então um novo usuário deverá ser criado

Caso de teste 05 - Criação do usuário com campo nome em branco
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo nome em branco.
	[Tags]              User
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo nome
    Então clico no botão salvar
Caso de teste 06 - Criação do usuário com campo sobrenome em branco
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo sobrenome em branco.
	[Tags]              User
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo sobrenome
    Então clico no botão salvar

Caso de teste 07 - Criação do usuário com campo tipo de usuário em branco 
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo tipo de usuário em branco.
	[Tags]              User
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de usuário
    Então clico no botão salvar

Caso de teste 08 - Criação do usuário com o campo email em branco 
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo email em branco.
	[Tags]              User
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de email
    Então clico no botão salvar

caso de teste 09 - Criação do usuário com o campo username em branco
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo username em branco.
    [Tags]              User
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de username
    Então clico no botão salvar

caso de teste 10 - Criação do usuário com campo senha em branco
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo senha em branco.
    [Tags]              User 
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de senha
    Então clico no botão salvar

caso de teste 11 - Criação do usuário com campo senha e confirma senha diferente
    [Documentation]     Este caso de teste realiza a criação de um usuário com o campo senha em branco.
    [Tags]              User 
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de usuários e clico no botão Novo Usuário
    E na tela de cadastro, e preencho todos os campos com excessão dos campos de senha
    Então clico no botão salvar
