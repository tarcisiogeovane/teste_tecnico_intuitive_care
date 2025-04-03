-- Seleciona o banco de dados
USE teste3_ans;

-- Limpa a tabela
TRUNCATE TABLE operadoras_ativas;

-- Importa os dados
LOAD DATA LOCAL INFILE 'C:/Users/tarci/OneDrive/Desktop/teste_tecnico_intuitive_care/teste3/teste3_dados/operadoras_ativas.csv'
INTO TABLE operadoras_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cep, uf);

