/* Consulta com LIKE */

SELECT h.nom_primeironome as nome, h.nom_sobrenome as sobrenome, ac.tipo as acomodação 
FROM requisicao r 
JOIN reserva rs on r.cpf = rs.cpf 
JOIN r_inclui_a ra ON rs.codigo = ra.codigo
JOIN acomodacao ac ON ra.codigo_quarto = ac.codigo_quarto
JOIN hospede h ON r.cpf = h.cpf
WHERE r.ordem  ILIKE '%ar-condicionado%';

/* Consulta com IN */

SELECT CONCAT(h.nom_primeironome, ' ', h.nom_sobrenome) as Nome FROM hospede h
JOIN reserva rs on rs.cpf = h.cpf
JOIN r_inclui_a ra ON ra.codigo = rs.codigo
JOIN acomodacao ac ON ac.codigo_quarto = ra.codigo_quarto
WHERE ac.tipo IN ('Cobertura', 'Deluxe', 'Suíte de luxo')

/* Consulta com LEFT JOIN */

SELECT 
    acom.Codigo_Quarto AS Codigo,
    acom.Tipo AS Tipo,
    h.CPF
FROM Acomodacao AS acom
LEFT JOIN R_inclui_A AS ra ON acom.Codigo_Quarto = ra.Codigo_Quarto
LEFT JOIN Reserva AS rs ON ra.Codigo = rs.Codigo
LEFT JOIN Hospede AS h ON rs.CPF = h.CPF
LEFT JOIN dependencias AS dp ON acom.iddep = dp.iddep
WHERE dp.Status_de_Limpeza = 'Limpa'

/* Consulta com HAVING */

SELECT d.nome as Nome, re.culinaria as Culinaria FROM dependencias d
JOIN unidade u ON u.cnpj = d.cnpj
JOIN restaurante re ON re.iddep = d.iddep
WHERE u.categoria = 'Hotel tradicional' 
GROUP BY Nome, Culinaria, re.avaliacao
HAVING re.avaliacao > (
        SELECT AVG(avaliacao) 
        FROM restaurante
    );

/* 4 relações */

SELECT pa.cpf as CPF, pa.idade as Idade, dp.nome as Ambulatorio, hosp.nome as Hospital
FROM paciente pa
JOIN atendimento atend ON atend.cpf = pa.cpf
JOIN ambulatorio amb ON pa.idamb = amb.idamb 
JOIN dependencias dp ON dp.iddep = amb.iddep
JOIN hospital hosp ON amb.idhospital = hosp.idhospital
WHERE atend.gravidade ILIKE 'alta'

/* Relação recursiva */

SELECT 
    f1.primeiro_nome AS Nome,
    f1.Cargo,
	h.codigo
FROM 
    Funcionario f1
JOIN 
    unidade u ON f1.CNPJ = u.cnpj
JOIN 
    hotel h ON u.codigo = h.codigo
JOIN 
    F_recebe_B fb1 ON f1.CPF = fb1.CPF
JOIN 
    Beneficio b1 ON fb1.IdBenef = b1.IdBenef
WHERE 
    b1.Tipo = 'Vale Alimentação'
AND EXISTS (
    SELECT 
        1
    FROM 
        Funcionario f2
    JOIN 
        F_recebe_B fb2 ON f2.CPF = fb2.CPF
    JOIN 
        Beneficio b2 ON fb2.IdBenef = b2.IdBenef
	JOIN
		unidade u2 ON f2.cnpj = u2.cnpj
	JOIN
		hotel h2 ON u2.codigo = h2.codigo
    WHERE 
        h.codigo = h2.codigo -- Mesmo hotel
        AND b1.Valor = b2.Valor -- Mesmo valor de benefício
        AND f1.CPF != f2.CPF -- Funcionários diferentes
        AND b2.Tipo = 'Vale Alimentação'
);