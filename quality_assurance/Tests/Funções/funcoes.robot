*** Settings ***
Documentation        Essa suite de testes cobre todos os fluxos da criação de empresas
Resource            ../Login/login_resources.robot
Resource            ./funcoes_resource.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***

Caso de teste 01 - Cria setor com sucesso
    [Documentation]    Esse caso de teste realiza o fluxo correto da criação de setor, preenchendo
	...                todos os campos com dados corretos e validando a criação do setor
	[Tags]             Setor
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E o campo CBO é preenchido com o código 317110
    E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP
	E clico no botão salvar 
	Então o setor é criado

Caso de teste 02 - Cria setor com sucesso - GFIP Exposição prévia - sem adicional sobre o RAT
    [Documentation]    Esse caso de teste realiza o fluxo correto da criação de setor, preenchendo
	...                todos os campos com dados corretos e GFIP como Exposição prévia - sem adicional sobre o RAT validando a criação do setor
	[Tags]             Setor
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E o campo CBO é preenchido com o código 317110
    E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP Exposição prévia - sem adicional sobre o RAT
	E clico no botão salvar 
	Então o setor é criado

Caso de teste 03 - Cria setor com sucesso - GFIP Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT
    [Documentation]    Esse caso de teste realiza o fluxo correto da criação de setor, preenchendo
	...                todos os campos com dados corretos e GFIP como Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT
	[Tags]             Setor
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E o campo CBO é preenchido com o código 317110
    E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT
	E clico no botão salvar 
	Então o setor é criado

Caso de teste 04 - Cria setor com sucesso - GFIP Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT
    [Documentation]    Esse caso de teste realiza o fluxo correto da criação de setor, preenchendo
	...                todos os campos com dados corretos e GFIP como Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT
	[Tags]             Setor
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E o campo CBO é preenchido com o código 317110
    E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT
	E clico no botão salvar 
	Então o setor é criado

Caso de teste 05 - Cria setor com sucesso - GFIP Exposição a agentes com aposentadoria especial após 25 anos - adicional de 06% sobre o RAT
    [Documentation]    Esse caso de teste realiza o fluxo correto da criação de setor, preenchendo
	...                todos os campos com dados corretos e GFIP como Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT
	[Tags]             Setor
	Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E o campo CBO é preenchido com o código 317110
    E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 25 anos - adicional de 06% sobre o RAT
	E clico no botão salvar 
	Então o setor é criado
Caso de teste 06 - Cria o setor com o campo CBO em branco 
    [Documentation]    Esse caso de teste tenta realizar a criação de um setor sem CBO
	[Tags]             Setor
	Dado que estou na tela de login do metracloud
    E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
	Dado que estou na tela de funções e foi clicado no botão "Nova Função"
	E os demais campos são preenchidos com dados validos 
	E é escolhido um GFIP
	E clico no botão salvar
	Então uma mensagem de erro deverá ser exibida 
