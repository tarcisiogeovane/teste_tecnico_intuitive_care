# Teste 4: API com Vue.js

### Objetivo
O Teste 4 consiste em desenvolver uma interface web com Vue.js que interaja com um servidor Python (Flask), utilizando os CSVs do Teste 3. O servidor oferece uma rota para buscar operadoras por texto, e uma coleção no Postman demonstra os resultados.

### Estrutura do Projeto
- **Pasta:** `teste4/`
- **Arquivos:**
  - `server.py`: Backend Flask com as rotas da API.
  - `frontend/`: Projeto Vue.js com a interface web.
  - `Teste4_API_IntuitiveCare.postman_collection.json`: Coleção exportada do Postman.

### Instruções de Uso
1. **Pré-requisitos:**
   - Python 3.7+ com `pip`.
   - Node.js e npm instalados.
   - CSVs do Teste 3 em `C:\Users\tarci\OneDrive\Desktop\teste_tecnico_intuitive_care\teste3\teste3_dados`.

2. **Configuração do Backend:**
   - Instale as dependências:
     ```cmd
     pip install flask flask-cors pandas

   - Rode o servidor:
     ```cmd
     cd C:\Users\tarci\OneDrive\Desktop\teste_tecnico_intuitive_care\teste4
     python server.py
   - A API estará disponível em http://localhost:5000.
     
3. **Configuração do Frontend:**
   - Entre na pasta do frontend:
     ```cmd
     cd C:\Users\tarci\OneDrive\Desktop\teste_tecnico_intuitive_care\teste4\frontend]
     
   - Instale as dependências:
     ```cmd
     npm install

   - Rode o Vue.js:
     ```cmd
     npm run serve
   - Acesse http://localhost:8081 no navegador.

4. Funcionalidades:
   - Tabela de Despesas: Mostra as 10 operadoras com maiores despesas em 4T2024 (http://localhost:8081/api/top_despesas).
   - Busca de Operadoras: Campo de busca que filtra operadoras por nome (http://localhost:8081/api/search_operadoras?q=TermoDeBusca).

5. Postman:
   - Importe Teste4_API_IntuitiveCare.postman_collection.json no Postman.
   - Teste as requisições:
     - GET http://localhost:5000/api/top_despesas
     - GET http://localhost:5000/api/search_operadoras
     - GET http://localhost:5000/api/search_operadoras?q=BRADESCO
     - GET http://localhost:5000/api/search_operadoras?q=UNIMED
    
### Resultados
- Endpoint /api/top_despesas: Retorna JSON com REG_ANS e VL_SALDO_FINAL.
- Endpoint /api/search_operadoras: Retorna até 10 operadoras filtradas por razao_social (ou coluna ajustada).

### Observações
- O backend usa latin-1 para os CSVs.
- O frontend assume que o backend está em localhost:5000.
- Ajuste as portas se houver conflitos (ex.: 8081 foi usado em vez de 8080).


