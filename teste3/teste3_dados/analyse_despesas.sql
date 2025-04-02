-- Seleciona o banco de dados
USE teste3_ans;

-- Query 1: Top 10 operadoras com maiores despesas no último trimestre (4T2024)
SELECT 
    dc.reg_ans AS registro_ans, -- Registro ANS da operadora
    oa.razao_social AS nome_operadora, -- Nome oficial da operadora, obtido da tabela operadoras_ativas
    SUM(dc.vl_saldo_final) AS total_despesas -- Soma o valor final das despesas para a categoria especificada
FROM -- FROM e JOIN Junta as tabelas demonstracoes_contabeis (dc) e operadoras_ativas (oa) pelo campo reg_ans/registro_ans
    demonstracoes_contabeis dc
JOIN 
    operadoras_ativas oa ON dc.reg_ans = oa.registro_ans
WHERE 
    dc.trimestre = '4T2024'  -- Filtra apenas o Último trimestre completo (data da criação desse código: 02/04/2025)
    AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR' -- Filtra a categoria exata pedida no enunciado
GROUP BY -- Agrupa os resultados por operadora para somar as despesas
    dc.reg_ans, oa.razao_social
ORDER BY -- Ordena do maior para o menor valor
    total_despesas DESC
LIMIT 10; -- Retorna apenas as 10 primeiras

-- Query 2: Top 10 operadoras com maiores despesas no último ano (2024), mesma lógica da Query 1, mas com um filtro mais amplo
SELECT  
    dc.reg_ans AS registro_ans,
    oa.razao_social AS nome_operadora,
    SUM(dc.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis dc
JOIN 
    operadoras_ativas oa ON dc.reg_ans = oa.registro_ans
WHERE 
    dc.trimestre IN ('1T2024', '2T2024', '3T2024', '4T2024')  -- Todos os trimestres de 2024
    AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY 
    dc.reg_ans, oa.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;