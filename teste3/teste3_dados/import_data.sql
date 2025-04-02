-- Seleciona o banco de dados
USE teste3_ans;

-- Importa os 8 arquivos de Demonstrações Contábeis
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 -- Define o encoding como UTF-8 para suportar acentos e caracteres especiais nos CSVs
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- Assumo que cada linha termina com uma quebra de linha padrão
IGNORE 1 LINES -- Pulo o cabeçalho dos CSVs
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '1T2023';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '2T2023';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '3T2023';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '4T2023';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '1T2024';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '2T2024';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '3T2024';

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, dt_ini_exerc, dt_fim_exerc)
SET trimestre = '4T2024';

-- Importa os dados das Operadoras Ativas
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/operadoras_ativas.csv'
INTO TABLE operadoras_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cep, uf);