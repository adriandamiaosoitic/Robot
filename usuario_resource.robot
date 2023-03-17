*** Settings ***
Library              SeleniumLibrary
Library              FakerLibrary
Library              ../Geradores/geradores.py

*** Variables ***
${USER_URL}          https://homolog.metracloud.com.br/users/
${BTN_NOVO_USR}      //button[@type='button'][contains(.,'Novo Usuário')] 

*** Keywords ***
Dado que estou na tela de usuários e clico no botão Novo Usuário
    Go To                url=${USER_URL}
    Click Button         locator=${BTN_NOVO_USR}    

E na tela de cadastro, eu preencho todos os campos com dados validos
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678
   
Então um novo usuário deverá ser criado
    Click Element                        //span[@data-testid='button-text'][contains(.,'Salvar')]
    Wait Until Page Contains            Usuário criado com sucesso
	Page Should Contain                 Usuário criado com sucesso 

E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Médico
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Médico(a)")]
    Click Element                       xpath://*[contains(text(), "Médico(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Operador
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Téc/Operador(a)")]
    Click Element                       xpath://*[contains(text(), "Téc/Operador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Enfermeiro
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Enfermeiro(a)")]
    Click Element                       xpath://*[contains(text(), "Enfermeiro(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

 E na tela de cadastro, eu preencho todos os campos com dados validos e crio um usuario do tipo Secretário
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Secretário(a)")]
    Click Element                       xpath://*[contains(text(), "Secretário(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão do campo nome
    ${nome}                             First Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                        text=${nome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão do campo sobrenome
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de usuário
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                           text=${nome}
    Input Text                          name:lastName                                       text=${sobrenome}    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de email
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                 text=12345678
E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de username
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão do campo tipo de senha
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            ${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
	Input Text                          name:confirmPassword                                text=12345678

E na tela de cadastro, e preencho todos os campos com excessão dos campos de senha
    ${nome}                             First Name Male
    ${sobrenome}                        Last Name Male
	${email}                            Company Email
  
	Wait Until Page Contains            Cadastrar Usuário
    Input Text                          name:name                                            text=${nome}
    Input Text                          name:lastName                                        text=${sobrenome}
    Wait Until Element Is Enabled       css:div.multiselect
    Click Element                       css:div.multiselect 
    Wait Until Element Is Enabled       xpath://*[contains(text(), "Administrador(a)")]
    Click Element                       xpath://*[contains(text(), "Administrador(a)")]    
    Input Text                          name:email                                          text=${email}
	Input Text                          name:userName                                       text=${nome}_${sobrenome}                
    Input Text                          name:password                                       text=12345678
	Input Text                          name:confirmPassword                                text=321654987
   
Então clico no botão salvar
    Click Element                        //span[@data-testid='button-text'][contains(.,'Salvar')]
    Wait Until Page Contains            Verifique os campos que estão com erro e tente novamente!
	Page Should Contain                 Verifique os campos que estão com erro e tente novamente!
