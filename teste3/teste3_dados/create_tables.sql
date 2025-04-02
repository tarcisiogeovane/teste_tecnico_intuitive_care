-- Criei o banco de dados
CREATE DATABASE IF NOT EXISTS teste3_ans;
USE teste3_ans;

-- Tabela para Demonstrações Contábeis (arquivos trimestrais: 1T2023.csv, 2T2023.csv, etc.)
CREATE TABLE demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Identificador único para cada registro
    reg_ans VARCHAR(10) NOT NULL,                -- Registro ANS da operadora (ex.: 123456)
    cd_conta_contabil VARCHAR(20) NOT NULL,      -- Código da conta contábil (ex.: 4111101)
    descricao VARCHAR(255),                      -- Descrição da conta (ex.: EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS...)
    vl_saldo_inicial DECIMAL(15,2),              -- Saldo inicial em reais
    vl_saldo_final DECIMAL(15,2),                -- Saldo final em reais (usado para despesas)
    dt_ini_exerc DATE,                           -- Data de início do exercício (ex.: 2023-01-01)
    dt_fim_exerc DATE,                           -- Data de fim do exercício (ex.: 2023-03-31)
    trimestre VARCHAR(6) NOT NULL,               -- Identificador do trimestre (ex.: 1T2023, 4T2024)
    INDEX idx_reg_ans (reg_ans),                 -- Índice para consultas por REG_ANS
    INDEX idx_trimestre (trimestre)              -- Índice para consultas por trimestre
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela para Operadoras Ativas (operadoras_ativas.csv)
CREATE TABLE operadoras_ativas (
    registro_ans VARCHAR(10) PRIMARY KEY,        -- Registro ANS como chave primária (ex.: 123456)
    cnpj VARCHAR(14) NOT NULL,                   -- CNPJ da operadora (14 dígitos, ex.: 12345678000195)
    razao_social VARCHAR(255) NOT NULL,          -- Nome oficial da operadora
    nome_fantasia VARCHAR(255),                  -- Nome fantasia (pode ser nulo)
    modalidade VARCHAR(50),                      -- Tipo de operadora (ex.: Cooperativa Médica)
    logradouro VARCHAR(255),                     -- Endereço: logradouro
    numero VARCHAR(10),                          -- Número do endereço
    complemento VARCHAR(100),                    -- Complemento do endereço
    bairro VARCHAR(100),                         -- Bairro
    cep VARCHAR(8),                              -- CEP (8 dígitos, ex.: 12345678)
    uf CHAR(2),                                  -- UF (ex.: SP, RJ)
    INDEX idx_cnpj (cnpj)                        -- Índice para consultas por CNPJ
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Comentários:
-- - Usarei utf8mb4 para suportar acentos e caracteres especiais comuns em português
-- - DECIMAL(15,2) permite valores monetários grandes com 2 casas decimais
-- - Índices aceleram consultas analíticas (posteriores)