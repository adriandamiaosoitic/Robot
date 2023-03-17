*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    ../Geradores/geradores.py


*** Variables ***
${SETOR_URL}       https://homolog.metracloud.com.br/company/230/departments
${CAEPF}           29311861000172
*** Keywords ***
Dado que estou na pagina de setores e clico no botão novo setor
    Go To     ${SETOR_URL}
	Wait Until Page Contains Element        xpath://a[contains(@class,'botao btn btn-primary')]
	Click Element                           xpath://a[contains(@class,'botao btn btn-primary')]

E os campos são preenchidos com dados validos
	${CNPJ}                                 Generate CNPJ
	Sleep    2
	${nome_setor}                           Company Suffix
	Input Text                              name:nome            text=${nome_setor}
	Input Text                              name:descricao       Teste descrição setor CNPJ
	
	Wait Until Element Is Enabled           (//div[contains(@class,'multiselect__tags')])[3]
	Click Element                           (//div[contains(@class,'multiselect__tags')])[3]
	
	Wait Until Element Is Enabled           xpath://*[contains(text(), "Estabelecimento Próprio")]
    Click Element                           xpath://*[contains(text(), "Estabelecimento Próprio")]

	Scroll Element Into View                name:localNumeroDoDocumento
	 
E quando o campo tipo de documento for CNPJ, então o número do documento deverá ser preenchido automaticamente
    Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CNPJ")]
    Click Element                           xpath://*[contains(text(), "CNPJ")]
	
	Wait Until Element Is Visible           name:localNumeroDoDocumento
	Page Should Contain                     38.805.245/0001-69         

Então o setor é criado
    Click Element                           //button[@type='submit'][contains(.,'Salvar')]
    Wait Until Page Contains                Setor criado com sucesso
	Page Should Contain                     Setor criado com sucesso

E é escolhido a opção estabelecimento de terceiros
    Sleep    2
	${nome_setor}                           Company Suffix
	Input Text                              name:nome            text=${nome_setor}
	Input Text                              name:descricao       Teste descrição setor CNPJ
	
	Wait Until Element Is Enabled           (//div[contains(@class,'multiselect__tags')])[3]
	Click Element                           (//div[contains(@class,'multiselect__tags')])[3]
	
	Wait Until Element Is Enabled           xpath://*[contains(text(), "Estabelecimento de Terceiros")]
    Click Element                           xpath://*[contains(text(), "Estabelecimento de Terceiros")]

então o número do CNPJ deverá ser preenchido
    ${CNPJ}                                 Generate CNPJ
	Sleep    2

	Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CNPJ")]
    Click Element                           xpath://*[contains(text(), "CNPJ")]
	Input Text                              name:localNumeroDoDocumento                         ${CNPJ}

E quando o campo tipo de documento for CAEPF, então o campo deverá ser preenchido

	Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CAEPF")]
    Click Element                           xpath://*[contains(text(), "CAEPF")]
	Input Text                              name:localNumeroDoDocumento                         ${CAEPF}

E quando o campo tipo de documento for CNO, então deverá ser preenchido
   	Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CNO")]
    Click Element                           xpath://*[contains(text(), "CNO")]
	Input Text                              name:localNumeroDoDocumento                           66666666

E é preenchido as informações do local mas não preencho o nome do setor
	Scroll Element Into View                (//div[contains(@class,'multiselect__tags')])[3]
	
	Wait Until Element Is Enabled           (//div[contains(@class,'multiselect__tags')])[3]
	Click Element                           (//div[contains(@class,'multiselect__tags')])[3]
	
	Wait Until Element Is Enabled           xpath://*[contains(text(), "Estabelecimento Próprio")]
    Click Element                           xpath://*[contains(text(), "Estabelecimento Próprio")]
    
	Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CNPJ")]
    Click Element                           xpath://*[contains(text(), "CNPJ")]
	
	Scroll Element Into View                name:localNumeroDoDocumento

E é preenchido as informações do setor mas não é preenchido o tipo de setor
    ${nome_setor}                           Company Suffix
	Input Text                              name:nome            text=${nome_setor}
	Input Text                              name:descricao       Teste descrição setor CNPJ

E selecionado a opção CAEPF mas não é preenchido o numero do documento
    Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CAEPF")]
    Click Element                           xpath://*[contains(text(), "CAEPF")]

E selecionado a opção CNO mas não é preenchido o numero do documento
    Wait Until Element Is Enabled           //div[@class='multiselect__tags'][contains(.,'Selecione')]
	Click Element                           //div[@class='multiselect__tags'][contains(.,'Selecione')]

	Wait Until Element Is Enabled           xpath://*[contains(text(), "CNO")]
    Click Element                           xpath://*[contains(text(), "CNO")]

E clico no botão salvar 
    Click Element                           //button[@type='submit'][contains(.,'Salvar')]
  

Então uma mensagem de erro deverá ser exibida
    Wait Until Page Contains                Verifique os campos que estão com erro e tente novamente!
	Page Should Contain                     Verifique os campos que estão com erro e tente novamente!
