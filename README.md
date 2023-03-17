<h1 align="center">Guia dos testes automatizados Metra Cloud</h1>

# Guia de Configuração

## 💡 Sobre o Robot

O Robot Framework ele é uma ferramenta com a estrutura para testes de aceitação ele é de código aberto.
O Robot Framework ele atua em cima de uma automação genérica de testes, ou seja, com ele é possível automatizar sites, webapps, APIs, desktop, mobile e tantas outros.
Para isso ele trabalha com <b>LIBRARIES</b>[https://robotframework.org/#libraries], cada Library possui suas palavras chaves que o Robot utiliza pra realizar os seus processos.
Sua estrutura é desenvolvida em Python, logo, ele usa espaçamentos para identifica cada recurso.

### 🚩 O que é necessário  

* [Visual Studio Code](https://code.visualstudio.com/download)
* [Python](https://www.python.org/downloads/) na sua útlima versão
_lembrar de marcar para adicionar o Python ao PATH_
* pip
* Selenium Web
* Webdriver do seu navegador

### 🔨 Configurando o ambiente

* Verificar se o python e o pip estão instalados corretamente: no terminal `python --version` `pip --version`
* Estando com o python instalado corretamente, no terminal execute o comando `pip install robotframework`. _Para verificarmos se o robot foi instalado corretamente, executamos o comando no terminal `robot --version`_
* Execute o `pip install robotframework-seleniumlibrary` para instalar a Library do selenium

Realizado as instalações do Robot, python e selenium, teremos que baixar o webdriver.
Vamos utilizar o navegador Chrome como exemplo, a primeira coisa a ser feita é verificar sua versão. Para isso seguimos o seguinte fluxo: definições -> acerca do chrome -> Versão

* Com a sua versão do navegador, será necessário realizar o download do [webdriver](https://chromedriver.chromium.org/downloads)
* Após o download do webdriver, pegamos o executável e copiamos para a pasta do `python/scripts`.

No vscode, será necessário instalar a extensão _Robot Code_ para facilitar a execução dos testes.

## Sobre os testes

Os testes de aceitação realizados através do robot tem a finalidade de cobrir a maior quantidade possível de fluxos realizados pelo usuário a fim de sempre garantir que as funções presentes nesses fluxos estejam funcionando corretamente.

## Fluxos 🚧

| Fluxos | Pendentes | Realizados |
| --- | --- | --- |
| Login |  | ✅ |
| Usuário | |✅ |
| Empresas | |✅ |
| Funções | | ✅ |
| Setor |  | ✅ |
| Funcionários | | ✅ |
| ASO 's | ❌ | |
| Registros Profissionais | ❌ | |
| Prestadores de Serviços | ❌ | |
| CAT 's |  | ✅ |
| EPI/EPC | ❌ | |
| Categoria | ❌ | | |
| Fabricante | ❌ | |
| Auditoria | ❌ | |
| eSocial | ❌ | |
| Painel do eSocial | ❌ | |
| Relatórios | ❌ | |
| FAQ-Dúvidas | ❌ | |
| Ag Nocivos | ❌ | |
