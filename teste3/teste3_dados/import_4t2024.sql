-- Limpa os dados existentes de 4T2024
DELETE FROM demonstracoes_contabeis WHERE trimestre = '4T2024';

-- Importa 4T2024 com o mapeamento correto
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dt_ini_exerc, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET trimestre = '4T2024', dt_fim_exerc = DATE_ADD(dt_ini_exerc, INTERVAL 2 MONTH); -- Ajusta dt_fim_exerc para o fim do trimestre