*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    ../Geradores/geradores.py

*** Variables ***
${btn_Funcionario}        //a[contains(@class,'botao btn btn-primary')] 
${estado1}                (//span[contains(.,'
${estado2}                ')])[4]
${naoinformado}           Não Informado
*** Keywords ***
E depois eu for direcionado para a tela de cadastro de funcionarios
    Go To            https://homolog.metracloud.com.br/employees

Então todos os campos deverão ser preenchidos com dados validos: "${sexo}", "${estadocivi}", ${raca}
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${name}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'${sexo}')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${estadocivi}')])[3]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${raca}')])[4]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               0800 704 1333
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]
	Sleep                              5                    
	Input Text                         (//input[contains(@type,'text')])[1]    ${name}


Então todos os campos deverão ser preenchidos com dados validos: Estado Civil e Raça "${naoinfo}"
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${name}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinfo}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinfo}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]
	Sleep                              5                    
	Input Text                         (//input[contains(@type,'text')])[1]    ${name}



Então todos os campos deverão ser preenchidos exceto campo nome
    # ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste   
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]
	# Sleep                              5                    
	# Input Text                         (//input[contains(@type,'text')])[1]    ${namefem}
	

Então deve ser exibida mensagem de alerta para o ${campo} não preenchido
    Capture Element Screenshot            //div[@class='toasted toasted-primary error'][contains(.,'Verifique os campos que estão com erro e tente novamente!')]
    Element Should Be Visible             //div[@class='error-container invalid-feedback'][contains(.,'O campo ${campo} é obrigatório')]
	Sleep                                 3
	Capture Element Screenshot            //div[@class='col-md-4'][contains(.,'${campo} * O campo ${campo} é obrigatório')]

Então todos os campos deverão ser preenchidos exceto campo sobrenome
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${name}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então todos os campos deverão ser preenchidos exceto campo cpf
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${name}
    Input Text                         name:sobrenome                                     ${sobrenome}
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste  
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então todos os campos deverão ser preenchidos, o campo de CPF com valor invalido
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${name}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           12345678910
    Input Text                         name:rgNumero                                      327611200                          
    Input Text                         name:rgOrgaoEmissor                                ${state}
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste  
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então deve ser exibida mensagem de alerta para o Número do CPF invalido
    Capture Element Screenshot            //div[@class='toasted toasted-primary error'][contains(.,'Verifique os campos que estão com erro e tente novamente!')]
    Element Should Be Visible             //div[@class='error-container invalid-feedback'][contains(.,'O campo Número do CPF deve conter um CPF válido')]
	Sleep                                 3
	Capture Element Screenshot            //div[@class='col-md-4'][contains(.,'Número do CPF * O campo Número do CPF deve conter um CPF válido')]


Então todos os campos deverão ser preenchidos exceto campo rgOrgaoEmissor
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${namemasc}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200    
    Sleep                              2  
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então todos os campos deverão ser preenchidos exceto campo Data Emissão
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${namemasc}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                           
    Input Text                         name:rgOrgaoEmissor                                ${state} 
    Sleep                              2  
	Click Element                      (//div[contains(@class,'multiselect__select')])[1]
	Click Element                      ${estado1}${state}${estado2}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então deve ser exibida mensagem de alerta no campo ${campovazio} não preenchido
    Capture Element Screenshot            //div[@class='toasted toasted-primary error'][contains(.,'Verifique os campos que estão com erro e tente novamente!')]
    Element Should Be Visible             //div[@class='col-md-3'][contains(.,'${campovazio} * O campo ${campovazio} é obrigatório')]
	Sleep                                 3
	Capture Element Screenshot            //div[@class='col-md-3'][contains(.,'${campovazio} * O campo ${campovazio} é obrigatório')]


Então todos os campos deverão ser preenchidos exceto campo Estado Emissor
    ${name}                            Name 
    ${sobrenome}                       Last Name  
	${cpf}                             Generate CPF
    ${state}                           Generate State
	${namefem}                         Name Female
    ${namemasc}                        Name Male    
    ${gerardata}                       Generate Time
	Click Element                      ${btn_Funcionario}
	Wait Until Page Contains           Cadastrar Funcionário
	Input Text       	               name:nome                                          ${namemasc}
    Input Text                         name:sobrenome                                     ${sobrenome}
	Input Text                         name:cpf                                           ${cpf}
    Input Text                         name:rgNumero                                      327611200                           
    Input Text                         name:rgOrgaoEmissor                                ${state} 
    Sleep                              2 
	Input Text    	                   (//input[contains(@type,'text')])[6]               ${gerardata}
	Input Text                         (//input[contains(@type,'text')])[8]               ${gerardata}  
	Click Element                      (//div[@class='multiselect__select'])[2]
	Click Element                      (//span[contains(.,'Masculino')])[3]
	Click Element                      (//div[@class='multiselect__select'])[3]
	Click Element                      (//span[contains(.,'${naoinformado}')])[10]
	Click Element                      (//div[contains(@class,'multiselect__select')])[4]
	Click Element                      (//span[contains(.,'${naoinformado}')])[13]
	Input Text                         name:nomeDaMae                                      ${namefem}
    Input Text                         name:nomeDoPai                                      ${namemasc}
	Input Text                         name:cep                                            37713-047
    Sleep                              2    
	Input Text                         name:numero                                         1250    
	Input Text                         name:complemento                                    Apartamento 05 Bloco B
	Input Text                         name:regiao                                         Zona Leste    
	Input Text                         name:telefone1.ddd                                  35
	Input Text                         name:telefone1.numero                               9 9147-1234
	Input Text                         name:telefone2.ddd                                  (35)
	Input Text                         name:telefone2.numero                               Não informado
	Input Text                         name:email                                          teste@email.com
	Input Text                         name:observacoes                                    Possui Filhos
    Click Element                      //span[@class='content'][contains(.,'Salvar')]


Então deve ser exibida mensagem de alerta no campo Estado Emissor não foi preenchido
    Capture Element Screenshot            //div[@class='toasted toasted-primary error'][contains(.,'Verifique os campos que estão com erro e tente novamente!')]
    Element Should Be Visible             (//div[contains(@class,'col-md-3')])[4]   
    Sleep                                 3
	Capture Element Screenshot            (//div[contains(@class,'col-md-3')])[4]

