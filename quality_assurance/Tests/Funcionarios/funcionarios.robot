*** Settings ***
Documentation       Esta suite de testes realiza todos os fluxos da tela de cadastro de usuario.
Resource            ../Login/login_resources.robot
Resource            ./funcionarios_resource.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***
Caso de teste 01 - Criação de funcionaria com sucesso 1
    [Documentation]        Realiza o cadastro de uma funcionaria, solteira de raça 'Amarela'
	[Tags]                 Funcionario 
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: "Feminino", "Solteiro", Amarela

Caso de teste 02 - Criação de funcionaria com sucesso 2
    [Documentation]        Realiza cadastro de uma funcionaria, casada de raça 'Branca'
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: "Feminino", "Casado", Branca

Caso de teste 03 - Criação de funcionaria com sucesso 3
    [Documentation]        Realiza cadastro de uma funcionaria, divorciada de raça 'Negra'
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: "Feminino", "Divorciado", Negra

Caso de teste 04 - Criação de funcionario com sucesso 1
    [Documentation]        Realiza cadastro de um funcionario, 'separado' de raça 'Parda'
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: "Masculino", "Separado", Parda

Caso de Teste 05 - Criação de funcionario com sucesso 2
    [Documentation]        Realiza cadastro de um funcionario, 'Viúvo' de raça 'Indígena' 
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: "Masculino", "Viúvo", Indígena





Caso de Teste 06 - Criação de funcionario com sucesso 3
    [Documentation]        Realiza cadastro de um funcionario, sem Estado Civil e Raça não informados
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios 
	Então todos os campos deverão ser preenchidos com dados validos: Estado Civil e Raça "Não Informado"


Caso de Teste 07 - Criação de funcionario sem nome
    [Documentation]        Realiza cadastro de um funcionario sem preecher campo Obrigatório: nome
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo nome
	Então deve ser exibida mensagem de alerta para o Nome não preenchido


Caso de Teste 08 - Criação de funcionario sem sobrenome
    [Documentation]        Realiza cadastro de um funcionario sem preecher campo Obrigatório: sobrenome
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo sobrenome
	Então deve ser exibida mensagem de alerta para o Sobrenome não preenchido


Caso de Teste 09 - Criação de funcionario sem cpf
    [Documentation]        Realiza cadastro de um funcionario sem preecher campo Obrigatório: cpf
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo cpf
	Então deve ser exibida mensagem de alerta para o Número do CPF não preenchido


Caso de Teste 10 - Criação de funcionario com cpf invalido
    [Documentation]        Realiza cadastro de um funcionario preenchendo CPF com número inválido
	[Tags]                 Funcionario    
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos, o campo de CPF com valor invalido
	Então deve ser exibida mensagem de alerta para o Número do CPF invalido


Caso de Teste 11 - Criação de funcionario sem informações do RG 1
    [Documentation]        Realiza cadastro de um funcionario sem preencher campo rgOrgaoEmissor
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo rgOrgaoEmissor
	Então deve ser exibida mensagem de alerta no campo Órgão Emissor não preenchido


Caso de Teste 12 - Criação de funcionario sem informações do RG 2
    [Documentation]        Realiza cadastro de um funcionario sem preencher campo Data emissao
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo Data Emissão
	Então deve ser exibida mensagem de alerta no campo Data Emissão não preenchido


Caso de Teste 13 - Criação de funcionario sem informações do RG 3
    [Documentation]        Realiza cadastro de um funcionario sem preencher campo Estado Emissor
	[Tags]                 Funcionario
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	E depois eu for direcionado para a tela de cadastro de funcionarios
	Então todos os campos deverão ser preenchidos exceto campo Estado Emissor
	Então deve ser exibida mensagem de alerta no campo Estado Emissor não foi preenchido

