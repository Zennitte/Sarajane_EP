## Dependências

Utilizamos o nodejs na versão v20.12.1 que pode ser instalado pelo link abaixo
https://nodejs.org/dist/v20.12.1/node-v20.12.1-x64.msi

Caso já tenha o node instalado em uma versão que dê conflito com a do projeto, pode ser utilizado o nvm para controle de versões.

Link de instalação: https://sourceforge.net/projects/nvm-for-windows.mirror/

Depois de instalado, é possível visualizar e trocar as versões com os seguintes comandos executador no termina:

```bash
# Para listar as versões
nvm list
```

```bash
# Para usar a versão
nvm use 10.12.1
## Installation
```

## Configuração de variáveis
É preciso alterar os valores da string de conexão do banco no arquivo .env

DATABASE_URL="postgresql://{usuario}:{senha}@{endereco}:{porta}/{nome do banco}"

Exemplo: 
DATABASE_URL="postgresql://postgres:1234@localhost:5432/ep_bd1"

## Rodando o Projeto

```bash
# Instala as dependêcias do projeto
npm i

# Roda o projeto
npm run start:dev
```

Exemplo de terminal rodando com sucesso:
<br>
<img src="./imgs/rodando.png" width="200" alt="Nest Logo" />

## Endpoints

Com o projeto no ar, é possível acessar os endpoint da aplicação 

Url Base: http://localhost:3000/

Endpoint de Hello World para verificar se a aplicação está rodando: http://localhost:3000/

Acesso ao Swagger para ver e testar as demais rotas: http://localhost:3000/api

*Uma coleção do postman está anexada no projeto com todas as rotas e exemplos de body
