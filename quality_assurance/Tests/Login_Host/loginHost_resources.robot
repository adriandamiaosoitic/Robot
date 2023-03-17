*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROSER}            chrome
${url}               https://homolog.metracloud.com.br/login
${VIP}               __BVID__18               
${USER}              __BVID__22
${SENHA}             __BVID__26
${LOGIN}             //button[@type='submit'][contains(.,'Entrar')]  

*** Keywords ***
Abrir Navegador
    Open Browser    browser=${BROSER} 
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser 

Dado que estou na tela de login do metracloud
    Go To    url=${url}  

Quando os campos VIP, Usuário e Senha forem preenchidos com dados validos
    Input Text    locator=${VIP}        text=host
    Input Text    locator=${USER}       text=metracloud
    Input Text    locator=${SENHA}      text=M3tr@C10ud123

E for efetuado o Login 
    Click Button    locator=${LOGIN}

    
então a pagina inicial do metracloud deverá ser exibida
    Wait Until Element Is Visible    locator=//img[contains(@alt,'Logo Metra Cloud')]
    Page Should Contain Image    locator=//img[contains(@alt,'Logo Metra Cloud')]

# CASO DE TESTE 02

Quando o campo Vip for invalido, porém os campos Usuário e Senha forem preenchidos com dados validos
    Input Text    locator=${VIP}        text=invalido
    Input Text    locator=${USER}       text=metracloud
    Input Text    locator=${SENHA}      text=M3tr@C10ud123


Então a mensagem "Clínica não encontrada." deverá ser disparada
    Wait Until Page Contains    Clínica não encontrada.
    Page Should Contain         Clínica não encontrada.

Então a mensagem "Usuário não encontrado" deverá ser disparada
    Wait Until Page Contains    Usuário não encontrado
    Page Should Contain         Usuário não encontrado

# CASO DE TESTE 03

Quando o campo Usuario for invalido, porém os campos vip e Senha forem preenchidos com dados validos
    Input Text    locator=${VIP}        text=host
    Input Text    locator=${USER}       text=invalido
    Input Text    locator=${SENHA}      text=M3tr@C10ud123

# CASO DE TESTE 04 

Quando o campo senha for invalido, porém os campos vip e Usuario forem preenchidos com dados validos
    Input Text    locator=${VIP}        text=host
    Input Text    locator=${USER}       text=metracloud
    Input Text    locator=${SENHA}      text=teste

Então a mensagem de erro deverá ser disparada
    Wait Until Page Contains     Clínica ou senha divergentes. Verifique seus dados e tente novamente.
    Page Should Contain          Clínica ou senha divergentes. Verifique seus dados e tente novamente.
    