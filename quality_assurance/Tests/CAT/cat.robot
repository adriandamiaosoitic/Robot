*** Settings ***
Documentation       Esta suite de testes realiza todos os fluxos da tela de cadastro de usuario.
Resource            ../Login/login_resources.robot
Resource            ./cat_resource.robot

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador

*** Test Cases ***
Caso de Teste 01 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Autoridade Pública.
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Autoridade Pública
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 02 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Médico
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Médico
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 03 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Segurado ou Dependente
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Segurado ou Dependente
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 04 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Trabalhador
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Trabalhador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 05 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Sindicato
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Sindicato
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 06 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Tomador de serviço avulso ou órgão gestor de mão de obra
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Tomador de serviço avulso ou órgão gestor de mão de obra
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 07 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Empregador doméstico
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador doméstico
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 08 - Cadastro de um CAT com sucesso
    [Documentation]        Realiza o cadastro de um CAT emitido por Empregador
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então CAT deve ser salva com sucesso

Caso de Teste 09 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo emitente não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida com nenhuma opção válida
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 10 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo tipo cat não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida com empregador e sem tipo de CAT
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 11 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Iniciativa CAT não preenchida
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida com empregador e sem Iniciativa de CAT
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 12 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Data Acidente não preenchida
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Data Acidente
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 13 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Hora do Acidente não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Hora do Acidente
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 14 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo N° Inscrição do Local não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo N° Inscrição do Local
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 15 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo CEP não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo CEP
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 16 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Local do Acidente não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Local do Acidente
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 17 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo N° Logradouro não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo N° Logradouro
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 18 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Partes do Corpo Atingidas não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Partes do Corpo Atingidas
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 19 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Agente Causador do Acidente não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Agente Causador do Acidente
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 20 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Situação Geradora não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Situação Geradora
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 21 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Houve Registro Policial não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Houve Registro Policial
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 22 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo Houve Óbito não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Houve Óbito
    Então deverá ser preenchida a aba de Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 23 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 40 - Data do Atendimento não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Data do Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 24 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 41 - Hora do Atendimento não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Hora do Atendimento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 25 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 42 - Houve Internação não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Houve Internação
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 26 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 43 - Duração Tratamento não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Duração Tratamento
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 27 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 44 - Deverá o Acidentado Afastar-se não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Deverá o Acidentado Afastar-se
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 28 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 45 - Descrição e Natureza da Lesão não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Descrição e Natureza da Lesão
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 29 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 47 - CID-10 não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo CID-10
    Então será exibido alerta ao tentar salvar CAT

Caso de Teste 29 - Cadastro de um CAT com campo não preenchido
    [Documentation]        Realiza preenchimento de CAT com campo 49 - Nome do Profissional que Emitiu o Atestado não preenchido
    [Tags]                 CAT
    Dado que estou na tela de login do metracloud
	E for efetuado o Login
	então a pagina inicial do metracloud deverá ser exibida
    Dado que estou na tela de preenchimento de um CAT
	Então será preenchida CAT emitida por Empregador
    Então deverá ser preenchida a aba de Acidente/Doença
    Então deverá ser preenchida a aba de Atendimento, exceto campo Nome do Profissional que Emitiu o Atestado
    Então será exibido alerta ao tentar salvar CAT
