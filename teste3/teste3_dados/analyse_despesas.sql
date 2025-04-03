USE teste3_ans;

-- Query 1: Top 10 operadoras por reg_ans (sem JOIN)
SELECT 
    reg_ans AS registro_ans,
    SUM(vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis
WHERE 
    trimestre = '4T2024'
    AND descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY 
    reg_ans
ORDER BY 
    total_despesas DESC
LIMIT 10;

-- Query 2: Top 10 operadoras por reg_ans (sem JOIN)
SELECT 
    reg_ans AS registro_ans,
    SUM(vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis
WHERE 
    trimestre IN ('1T2024', '2T2024', '3T2024', '4T2024')
    AND descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY 
    reg_ans
ORDER BY 
    total_despesas DESC
LIMIT 10;