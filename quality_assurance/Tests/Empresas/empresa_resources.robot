*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    ../Geradores/geradores.py

*** Variables ***
${EMPRESA_URL}                https://homolog.metracloud.com.br/companies
${BTN_NOVAEMPRESA}           //a[contains(@class,'botao btn btn-primary')]

*** Keywords ***

E a pagina de criação de empresas for acessada
    Go To                                   url=${EMPRESA_URL}   

E clico no botão "Nova Empresa"
    Wait Until Page Contains                Empresas
    Page Should Contain                     Empresas
    Wait Until Page Contains Element        ${BTN_NOVAEMPRESA}
    Click Element                           ${BTN_NOVAEMPRESA}

Então os dados de cadastro da empresa jurica são preenchidos corretamente
    ${nome_empresa}                      Company
    ${cnpj}                              Generate CNPJ
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Jurídica")]
    Click Element                        xpath://*[contains(text(), "Jurídica")]
    Input Text                           name:cnpj                                    text=${cnpj}
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresaCNPJ_crida.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
    
    Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Empresa criada com sucesso
    Page Should Contain                  Empresa criada com sucesso
    Capture Page Screenshot              filename=empresaCNPJ_crida.png

Então os dados de cadastro da empresa fisica são preenchidos corretamente
    ${nome_empresa}                      Company
    ${cpf}                               Generate CPF
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Física")]
    Click Element                        xpath://*[contains(text(), "Física")]
    Input Text                           name:cpf                                     text=${cpf}
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresaCPF_crida.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
      Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Empresa criada com sucesso
    Page Should Contain                  Empresa criada com sucesso
    Capture Page Screenshot              filename=empresaCPF_crida.png

Então os campos são preenchidos com excessão do campo Tipo
    ${nome_empresa}                      Company
    ${cpf}                               Generate CPF
    Wait Until Page Contains             Cadastrar Empresa
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=erro_Tipo.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
      Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Verifique os campos que estão com erro e tente novamente!
    Page Should Contain                  Verifique os campos que estão com erro e tente novamente!
    Capture Page Screenshot              filename=erro_Tipo.png

Então o campo CPF é preenchido com um valor invalido
    ${nome_empresa}                      Company
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Física")]
    Click Element                        xpath://*[contains(text(), "Física")]
    Input Text                           name:cpf                                     text=12345678911
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresaCPF_erro.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
      Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Verifique os campos que estão com erro e tente novamente!
    Page Should Contain                  Verifique os campos que estão com erro e tente novamente!
    Capture Page Screenshot              filename=empresaCPF_erro.png

Então o campo CNPJ é preenchido com um valor invalido
    ${nome_empresa}                      Company
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Jurídica")]
    Click Element                        xpath://*[contains(text(), "Jurídica")]
    Input Text                           name:cnpj                                    text=12345678911
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresaCNPJ_erro.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
      Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Verifique os campos que estão com erro e tente novamente!
    Page Should Contain                  Verifique os campos que estão com erro e tente novamente!
    Capture Page Screenshot              filename=empresaCNPJ_erro.png

Então uma empresa é cadastrada sem razão social
    ${nome_empresa}                      Company
    ${cnpj}                              Generate CNPJ
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Jurídica")]
    Click Element                        xpath://*[contains(text(), "Jurídica")]
    Input Text                           name:cnpj                                    text=${cnpj}
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresa_juridica_sem_razao.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
    
    Wait Until Element Is Enabled        (//div[contains(@class,'multiselect__tags')])[11]
    Click Element                        (//div[contains(@class,'multiselect__tags')])[11]
    Sleep                                1
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    Click Element                        xpath://*[contains(text(), "Grupo 2 - Empresas com faturamento inferior a R$78 milhões, exceto as optantes pelo SIMPLES")]
    
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Verifique os campos que estão com erro e tente novamente!
    Page Should Contain                  Verifique os campos que estão com erro e tente novamente!
    Capture Page Screenshot              filename=empresa_juridica_sem_razao.png

Então uma empresa é cadastrada sem grupo
    ${nome_empresa}                      Company
    ${cnpj}                              Generate CNPJ
    Wait Until Page Contains             Cadastrar Empresa
    Wait Until Element Is Enabled        css:div.multiselect
    Click Element                        css:div.multiselect
    Wait Until Element Is Enabled        xpath://*[contains(text(), "Jurídica")]
    Click Element                        xpath://*[contains(text(), "Jurídica")]
    Input Text                           name:cnpj                                    text=${cnpj}
    Input Text                           name:inscricaoEstadual                       text=1234423
    Input Text                           name:razaoSocial                             text=${nome_empresa}
    Input Text                           name:nomeFantasia                            text=${nome_empresa}
    Input Text                           name:cep                                     text=37704114
    Capture Page Screenshot              filename=empresa_sem_grupo.png
    Input Text                           name=numero                                  text=666
    Input Text                           name=complemento                             text=casa
    Input Text                           name=regiao                                  text=centro
    Input Text                           name=telefone1.ddd                           text=19
    Input Text                           name=telefone1.numero                        text=999999999
    Input Text                           name=telefone2.ddd                           text=19
    Input Text                           name=telefone2.numero                        text=999999999
    Click Element                        xpath://*[contains(text(), "Salvar")]
    Wait Until Page Contains             Verifique os campos que estão com erro e tente novamente!
    Page Should Contain                  Verifique os campos que estão com erro e tente novamente!
    Capture Page Screenshot              filename=empresa_sem_grupo.png
