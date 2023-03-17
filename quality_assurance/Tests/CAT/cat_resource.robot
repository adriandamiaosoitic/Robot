*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    ../Geradores/geradores.py

*** Variables ***
${btn_Funcionario}        //a[contains(@class,'botao btn btn-primary')] 
${estado1}                (//span[contains(.,'
${estado2}                ')])[4]
${naoinformado}           Não Informado
@{tipocat}                Inicial    Reabertura    Comunicação de Óbito
@{iniciacat}              Iniciativa do Empregador    Ordem Judicial    Determinação do Órgão Fiscalizador
@{tipoacid}               Típico    Doença    Trajeto
@{houveafast}             (//label[@class='custom-control-label'][contains(.,'Sim')])[2]   (//label[@class='custom-control-label'][contains(.,'Não')])[2]
&{tipoInsc}               CNPJ=(//span[contains(.,'CNPJ')])[6]    CAEPF=(//span[contains(.,'CAEPF')])[7]    CNO=(//span[contains(.,'CNO')])[6]")
&{tipoLocal}              empregadorBrasil=//li[@class='multiselect__element'][contains(.,'Estabelecimento do Empregador no Brasil')]  empregadorExterior=//li[@class='multiselect__element'][contains(.,'Estabelecimento do Empregador no Exterior')]  terceiros=//li[@class='multiselect__element'][contains(.,'Estabelecimento de Terceiros')]  viapublica=//li[@class='multiselect__element'][contains(.,'Via Pública')]  rural=//li[@class='multiselect__element'][contains(.,'Área Rural')]  embarcacao//li[@class='multiselect__element'][contains(.,'Embarcação')]  outros=//li[@class='multiselect__element'][contains(.,'Outros')]
@{lateralidade}           Não Aplicável  Esquerda  Direita  Ambas
    


*** Keywords ***
Dado que estou na tela de preenchimento de um CAT
    Go To                             https://homolog.metracloud.com.br/employees
    Input Text                        (//input[contains(@type,'text')])[1]        Boneco da CAT
    Sleep                             2
    Click Element                     (//button[@type='button'])[3]
    Element Should Be Visible         //span[contains(.,'CAT')]
    Click Element                     //span[contains(.,'CAT')]
    Sleep                             2
    Element Should Be Visible         //span[@class='pl-2'][contains(.,'Novo CAT')]
    Click Element                     //span[@class='pl-2'][contains(.,'Novo CAT')]

Então será preenchida CAT de Autoridade Pública
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'Autoridade Pública')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipocat[0]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${iniciacat[0]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'eSocial')]
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Acidente/Doença')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipoacid[0]}')]

Então será preenchida CAT emitida por ${emitente}
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${emitente}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipocat[0]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${iniciacat[1]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'eSocial')]
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Acidente/Doença')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipoacid[2]}')]

Então será preenchida CAT emitida com nenhuma opção válida
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipocat[0]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${iniciacat[1]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'eSocial')]
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Acidente/Doença')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipoacid[2]}')]

Então será preenchida CAT emitida com empregador e sem tipo de CAT
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'Empregador')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${iniciacat[1]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'eSocial')]
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Acidente/Doença')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipoacid[2]}')]

Então será preenchida CAT emitida com empregador e sem Iniciativa de CAT
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'Empregador')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipocat[0]}')]
    Click Element         //label[@class='custom-control-label'][contains(.,'eSocial')]
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Acidente/Doença')]
    Click Element         //label[@class='custom-control-label'][contains(.,'${tipoacid[2]}')]




Então deverá ser preenchida a aba de Acidente/Doença
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT

Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Houve Óbito
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Houve Registro Policial
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Situação Geradora
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Agente Causador do Acidente
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Partes do Corpo Atingidas
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo N° Logradouro
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Local do Acidente
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo CEP
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo N° Inscrição do Local
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[contains(@name,'horaDoAcidente')]                               ${horaAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Hora do Acidente
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0000
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT

Então deverá ser preenchida a aba de Acidente/Doença, exceto campo Data Acidente
    ${gerardata}          Generate Time
    ${dataAtual}          Data Atual   
    ${cidade}             Generate City    
    ${tpLogradouro}       Generate Logradouro 
    ${PartAting}          Generate ParteCorpoAtingida
    ${AgenteCausador}     Generate AgenteCausador
    ${SitGeradora}        Generate SituacaoGeradora
    ${horaAtual}          Generate Hour
    Input Text            (//input[contains(@type,'text')])[32]                                   ${dataAtual}
    Input Text            //input[@name='aposQuantasHorasDeTrabalho']                             0001
    Click Element         ${houveafast[1]}
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[2]                       ${dataAtual}
    Input Text            //input[@name='localAcidente']                                          Estabelecimento do Empregador
    Input Text            //input[contains(@name,'localAcidenteNEspecificacao')]                  Especificação do Local
    Click Element         (//div[@class='multiselect__select'])[5]
    Click Element         ${tipoInsc.CNPJ}
    Input Text            //input[contains(@name,'localAcidenteNumeroDeInscricao')]               07.526.557/0001-00
    Click Element         (//div[contains(@class,'select')])[32]
    Click Element         ${tipoLocal.empregadorBrasil}
    Click Button          (//button[contains(@type,'button')])[1]
    Input Text            //input[@placeholder='Procure por algum registro...']                   ${tpLogradouro}
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[2]
    Click Element         //span[@data-testid='button-text'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:cep                                                                37713047
    Click Button          (//button[contains(@type,'button')])[2]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${cidade}  
    Sleep                 2
    Click Element         (//td[contains(@id,'hideText')])[1]
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            (//input[@autocomplete='off'])[36]                                      0497
    Input Text            name:complemento                                                        CASA 02
    Click Button          (//button[contains(@type,'button')])[4]
    Sleep                 2
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${PartAting} 
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[5]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]         ${AgenteCausador}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         //label[@class='custom-control-label'][contains(.,'${lateralidade[0]}')]
    Click Button          (//button[contains(@type,'button')])[6]
    Input Text            //input[contains(@placeholder,'Procure por algum registro...')]          ${SitGeradora}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[4]
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[5]
    Input Text            name:observacao                                                           Observação da CAT


Então deverá ser preenchida a aba de Atendimento   
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   
Então deverá ser preenchida a aba de Atendimento, exceto campo Nome do Profissional que Emitiu o Atestado
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2

Então deverá ser preenchida a aba de Atendimento, exceto campo CID-10
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   

Então deverá ser preenchida a aba de Atendimento, exceto campo Descrição e Natureza da Lesão
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 

Então deverá ser preenchida a aba de Atendimento, exceto campo Deverá o Acidentado Afastar-se
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   

Então deverá ser preenchida a aba de Atendimento, exceto campo Duração Tratamento
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6] 
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Input Text            name:duracaoDoTratamento                                                 ' '  
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   

Então deverá ser preenchida a aba de Atendimento, exceto campo Houve Internação
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual}
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}   
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   
Então deverá ser preenchida a aba de Atendimento, exceto campo Hora do Atendimento
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            (//input[contains(@placeholder,'dd/mm/aaaa')])[4]                         ${dataAtual} 
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   

Então deverá ser preenchida a aba de Atendimento, exceto campo Data do Atendimento
    ${dataAtual}          Data Atual   
    ${descLesao}          Generate DescricaoLesao
    ${CID}                Generate CID
    ${horaAtual}          Generate Hour
    Click Element         //a[@role='tab'][contains(@id,'')][contains(.,'Atendimento')]
    Input Text            name:unidadeDeAtendimentoMedico                                           Santa Casa
    Input Text            name:horaDoAtendimento                                                    ${horaAtual}     
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[6]
    Input Text            name:duracaoDoTratamento                                                  01    
    Click Element         (//label[@class='custom-control-label'][contains(.,'Não')])[7]
    Click Button          (//button[contains(@type,'button')])[7]        
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${descLesao}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Input Text            name:descricaoComplementarDaLesao                                         Descrição Complementar da Lesão
    Input Text            name:diagnosticoProvavel                                                  Diagnóstico Provável
    Click Button          (//button[contains(@type,'button')])[8]
    Input Text            //input[@placeholder='Procure por algum registro...']                     ${CID}
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]
    Sleep                 2
    Click Button          (//button[contains(@type,'button')])[10]
    Sleep                 2
    Click Element         id:hideText
    Click Button          //button[@type='button'][contains(.,'Selecionar')]    
    Sleep                 2 
   

Então CAT deve ser salva com sucesso
    Click Button                  //button[@type='submit'][contains(.,'Salvar')]
    Sleep                         2
    Element Should Be Visible     //i[contains(@class,'fas fa-check-circle fa-2x')]    

Então será exibido alerta ao tentar salvar CAT
    Click Button                  //button[@type='submit'][contains(.,'Salvar')]
    Sleep                         2
    Element Should Be Visible     //i[contains(@class,'fas fa-exclamation-circle fa-2x')]