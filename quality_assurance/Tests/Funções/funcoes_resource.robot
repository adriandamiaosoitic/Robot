*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Library     ../Geradores/geradores.py


*** Variables ***
${FUNC_URL}     https://homolog.metracloud.com.br/company/230/department/254/functions


*** Keywords ***
Dado que estou na tela de funções e foi clicado no botão "Nova Função"
    Go To    ${FUNC_URL}
    Wait Until Page Contains    Funções
    Wait Until Page Contains Element    //a[contains(@class,'btn btn-primary')]
    Click Element    //a[contains(@class,'btn btn-primary')]

E o campo CBO é preenchido com o código 317110
    Wait Until Page Contains    Cadastrar Função
    Sleep    2
    Click Element    //button[contains(@class,'btn picker-button btn-success')]
    Wait Until Page Contains    CBO
    Input Text    (//input[contains(@type,'text')])[7]    317110
    Wait Until Page Contains    Programador de sistemas de informação
    Click Element
    ...    //td[@title='Programador de sistemas de informação'][contains(.,'Programador de sistemas de informação')]
    Sleep    2
    Click Element    //button[@type='button'][contains(.,'Selecionar')]
    Sleep    2

E os demais campos são preenchidos com dados validos
    ${nome}    Company Suffix
    Input Text    name:nome    ${nome}
    Input Text    name:descricao    Teste de criação de setor

E é escolhido um GFIP
    Sleep    1
    Input Text    name:atividadesInsalubres    teste atividade insalubres
    Input Text    name:registrosAmbientais    teste registro ambiental

E é escolhido um GFIP Exposição prévia - sem adicional sobre o RAT
    Wait Until Element Is Enabled    (//div[contains(@class,'multiselect__tags')])[1]
    Click Element    (//div[contains(@class,'multiselect__tags')])[1]

    Wait Until Element Is Enabled    xpath://*[contains(text(), "Exposição prévia - sem adicional sobre o RAT")]
    Click Element    xpath://*[contains(text(), "Exposição prévia - sem adicional sobre o RAT")]

E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT
    Wait Until Element Is Enabled    (//div[contains(@class,'multiselect__tags')])[1]
    Click Element    (//div[contains(@class,'multiselect__tags')])[1]

    Wait Until Element Is Enabled
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT")]
    Click Element
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 15 anos - adicional de 12% sobre o RAT")]

E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT
    Wait Until Element Is Enabled    (//div[contains(@class,'multiselect__tags')])[1]
    Click Element    (//div[contains(@class,'multiselect__tags')])[1]

    Wait Until Element Is Enabled
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT")]
    Click Element
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 20 anos - adicional de 09% sobre o RAT")]

E é escolhido um GFIP Exposição a agentes com aposentadoria especial após 25 anos - adicional de 06% sobre o RAT
    Wait Until Element Is Enabled    (//div[contains(@class,'multiselect__tags')])[1]
    Click Element    (//div[contains(@class,'multiselect__tags')])[1]

    Wait Until Element Is Enabled
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 25 anos - adicional de 06% sobre o RAT")]
    Click Element
    ...    xpath://*[contains(text(), "Exposição a agentes com aposentadoria especial após 25 anos - adicional de 06% sobre o RAT")]

E clico no botão salvar
    Click Element    //button[@type='submit'][contains(.,'Salvar')]

Então o setor é criado
    Wait Until Page Contains    Função criada com sucesso
    Page Should Contain    Função criada com sucesso

Então uma mensagem de erro deverá ser exibida
    Wait Until Page Contains    Verifique os campos que estão com erro e tente novamente!
    Page Should Contain    Verifique os campos que estão com erro e tente novamente!

