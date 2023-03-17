*** Settings ***
Documentation        Essa suite de testes cobre os fluxos dentro da tela de cadastro de setor
...                  para realizar esse suite de teste, é utilizada a empresa Empresa setores 
...                  com o CNPJ 33.272.529/0001-13
Resource             ../Login/login_resources.robot
Resource             ./setor_resources.robot

Test Setup           Abrir Navegador 
Test Teardown        Fechar Navegador

*** Test Cases ***
Caso de teste 01 - Cadastrar um setor com sucesso - Estabelecimento próprio - CNPJ 
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento próprio e tipo de documento como CNPJ
	[Tags]             Setores
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
    E os campos são preenchidos com dados validos
    E quando o campo tipo de documento for CNPJ, então o número do documento deverá ser preenchido automaticamente
    Então o setor é criado

Caso de teste 02 - Cadastrar um setor com sucesso - Estabelecimento próprio - CAEPF
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento de terceiros e tipo de documento como CAEPF
	[Tags]             Setores
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E os campos são preenchidos com dados validos
	E quando o campo tipo de documento for CAEPF, então o campo deverá ser preenchido
	Então o setor é criado

Caso de teste 03 - Cadastrar um setor com sucesso - Estabelecimento próprio - CNO
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento de terceiros e tipo de documento como CNO
	[Tags]             Setores
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E os campos são preenchidos com dados validos
	E quando o campo tipo de documento for CNO, então deverá ser preenchido
    Então o setor é criado

Caso de teste 04 - Cadastrar um setor com sucesso - Estabelecimento de terceiros - CNPJ 
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento de terceiros e tipo de documento como CNPJ
    [Tags]             Setores
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E é escolhido a opção estabelecimento de terceiros
	então o número do CNPJ deverá ser preenchido
    Então o setor é criado

Caso de teste 05 - Cadastrar um setor com sucesso - Estabelecimento de terceiros - CAEPF
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento de terceiros e tipo de documento como CAEPF
	[Tags]             Setores
    Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E é escolhido a opção estabelecimento de terceiros
	E quando o campo tipo de documento for CAEPF, então o campo deverá ser preenchido
	Então o setor é criado

Caso de teste 06 - Cadastrar um setor com sucesso - Estabelecimento de terceiros - CNO
    [Documentation]    Esse caso de teste realiza o cadastro com sucesso de um setor, com o tipo de empresa
	...                Estabelecimento de terceiros e tipo de documento como CNO
	[Tags]             Setores
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
    então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E é escolhido a opção estabelecimento de terceiros
	E quando o campo tipo de documento for CNO, então deverá ser preenchido
	Então o setor é criado

Caso de teste 07 - Cadastrar um setor com sucesso - Sem tipo 
    [Documentation]   Esse caso de teste valida a mensagem de erro caso o setor seja criado
	...               sem tipo
	[Tags]            Setores
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E é preenchido as informações do setor mas não é preenchido o tipo de setor
	E clico no botão salvar 

Caso de teste 08 - Cadastro de setor sem nome
    [Documentation]   Esse caso de teste valida a mensagem de erro caso o setor seja criado
	...               sem nome
	[Tags]            Setores    
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E é preenchido as informações do local mas não preencho o nome do setor
	E clico no botão salvar 
	Então uma mensagem de erro deverá ser exibida

Caso de teste 09 - Cadastro de setor sem número do documento - CAEPF
    [Documentation]   Esse caso de teste valida a mensagem de erro caso o setor seja criado
	...               sem número do documento CAEPF
	[Tags]            Setores   
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E os campos são preenchidos com dados validos
	E selecionado a opção CAEPF mas não é preenchido o numero do documento
	E clico no botão salvar
	Então uma mensagem de erro deverá ser exibida

Caso de teste 10 - Cadastro de setor sem número do documento - CNO
    [Documentation]   Esse caso de teste valida a mensagem de erro caso o setor seja criado
	...               sem número do documento CNO
	[Tags]            Setores   
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na pagina de setores e clico no botão novo setor
	E os campos são preenchidos com dados validos
	E selecionado a opção CNO mas não é preenchido o numero do documento
	E clico no botão salvar
	Então uma mensagem de erro deverá ser exibida
