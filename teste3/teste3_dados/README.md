# Teste 3: Padronização e Análise de Dados

### Objetivo
O Teste 3 consiste em baixar, padronizar e importar dados da ANS (Agência Nacional de Saúde Suplementar) para um banco MySQL, seguido pela análise das despesas das operadoras de saúde no último trimestre (4T2024) e no último ano (2024).

### Estrutura do Projeto
- **Pasta:** `teste3/`
- **Arquivos:**
  - `create_tables.sql`: Script para criar as tabelas no MySQL.
  - `import_data.sql`: Script para importar os CSVs trimestrais.
  - `analyse_despesas.sql`: Queries analíticas para calcular as top 10 operadoras com maiores despesas.
  - `teste3_dados/`: Contém os CSVs baixados (`1T2023.csv` a `4T2024.csv` e `operadoras_ativas.csv`).

### Instruções de Uso
1. **Pré-requisitos:**
   - MySQL instalado e rodando (ex.: MySQL Server 8.0).
   - CSVs baixados do site da ANS e salvos em `teste3_dados/`.

2. **Configuração do Banco:**
   - Abra o MySQL no CMD:
     ```cmd
     mysql -u root -p
     
   - Crie o banco e as tabelas:
     ```cmd
     source C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/create_tables.sql;
  
3. **Importação dos Dados:**
   - Execute o script de importação com `--local-infile=1`:
     ```cmd
     mysql --local-infile=1 -u root -p teste3_ans < C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/import_data.sql

4. **Análise:**
   - Rode as queries analíticas:
     ```cmd
     mysql -u root -p teste3_ans < C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/analyse_despesas.sql > resultados.txt

   - Abra o resultado:
     ```cmd
     notepad resultados.txt


### Resultados
  - **Top 10 Operadoras (4T2024):** Lista as 10 operadoras com maiores despesas no 4º trimestre de 2024.
  - **Top 10 Operadoras (2024):** Lista as 10 operadoras com maiores despesas acumuladas em 2024.
  - Exemplo de saída (Query 1):
    ```cmd
    registro_ans | nome_operadora                  | total_despesas
    005711       | BRADESCO SAÚDE S.A.             | 30941701626.00
    006246       | SUL AMERICA COMPANHIA DE SEGURO SAÚDE | 21124940439.00
    ...


### Observações
- Os CSVs foram processados com codificação `latin-1` e separador decimal `,`.
- A descrição analisada foi `"EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"`.
