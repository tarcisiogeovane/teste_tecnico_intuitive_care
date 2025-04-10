-- Limpa todos os dados existentes
TRUNCATE TABLE demonstracoes_contabeis;

-- Importa todos os trimestres com o mapeamento correto
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '1T2023', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '2T2023', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '3T2023', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '4T2023', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '1T2024', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '2T2024', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '3T2024', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '4T2024', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH);

-- Importa operadoras_ativas (sem alterações)
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/operadoras_ativas.csv'
INTO TABLE operadoras_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cep, uf);