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

E for efetuado o Login 
    Input Text      locator=${VIP}        text=autoTest 
    Input Text      locator=${USER}       text=admin
    Input Text      locator=${SENHA}      text=soitic1984
    Click Button    locator=${LOGIN}

    
então a pagina inicial do metracloud deverá ser exibida
    Wait Until Element Is Visible   //div[contains(@class,'container-logo-inicial')]
    Page Should Contain Element     //img[contains(@class,'thumbnail')]

