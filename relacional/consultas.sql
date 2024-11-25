/* Consulta com LIKE */

SELECT h.nom_primeironome as nome, h.nom_sobrenome as sobrenome, ac.tipo as acomodação 
FROM requisicao as r 
JOIN reserva as rs on r.cpf = rs.cpf 
JOIN r_inclui_a as ra ON rs.codigo = ra.codigo
JOIN acomodacao as ac ON ra.codigo_quarto = ac.codigo_quarto
JOIN hospede as h ON r.cpf = h.cpf
WHERE r.ordem ILIKE '%ar-condicionado%';

/* Consulta com IN */

SELECT CONCAT(h.nom_primeironome, ' ', h.nom_sobrenome) as Nome, ac.valor AS Valor
FROM hospede as h
JOIN reserva as rs on rs.cpf = h.cpf
JOIN r_inclui_a as ra ON ra.codigo = rs.codigo
JOIN acomodacao as ac ON ac.codigo_quarto = ra.codigo_quarto
WHERE ac.tipo IN ('Cobertura', 'Deluxe', 'Suíte de luxo');

/* Consulta com LEFT JOIN */
	
SELECT 
    acom.Codigo_Quarto AS Codigo,
    acom.Tipo AS Tipo,
    h.CPF as Hospede,
    acom.status as Status
FROM Acomodacao AS acom
LEFT JOIN R_inclui_A AS ra ON acom.Codigo_Quarto = ra.Codigo_Quarto
LEFT JOIN Reserva AS rs ON ra.Codigo = rs.Codigo
LEFT JOIN Hospede AS h ON rs.CPF = h.CPF
LEFT JOIN dependencias AS dp ON acom.iddep = dp.iddep
WHERE dp.Status_de_Limpeza = 'Limpa';

/* Consulta com HAVING */

SELECT d.nome as Nome, re.culinaria as Culinaria 
FROM dependencias d
JOIN unidade as u ON u.cnpj = d.cnpj
JOIN restaurante as re ON re.iddep = d.iddep
WHERE u.categoria = 'Hotel tradicional' 
GROUP BY Nome, Culinaria, re.avaliacao
HAVING re.avaliacao > (
        SELECT AVG(avaliacao) 
        FROM restaurante
    );

/* 4 relações */

SELECT pa.cpf as CPF, pa.idade as Idade, dp.nome as Ambulatorio, hosp.nome as Hospital
FROM paciente as pa
JOIN atendimento as atend ON atend.cpf = pa.cpf
JOIN ambulatorio as amb ON pa.idamb = amb.idamb 
JOIN dependencias as dp ON dp.iddep = amb.iddep
JOIN hospital as hosp ON amb.idhospital = hosp.idhospital
WHERE atend.gravidade = 'Alta';

/* Relação recursiva */

SELECT f1.primeiro_nome AS Nome, f1.Cargo
FROM funcionario as f1
JOIN unidade as u ON f1.CNPJ = u.cnpj
JOIN hotel as h ON u.codigo = h.codigo
JOIN f_recebe_b as fb1 ON f1.CPF = fb1.CPF
JOIN beneficio as b1 ON fb1.IdBenef = b1.IdBenef
WHERE b1.tipo = 'Vale Alimentação'
AND EXISTS (SELECT 1
    FROM 
        funcionario as f2
    JOIN 
        f_recebe_b as fb2 ON f2.CPF = fb2.CPF
    JOIN 
        beneficio as b2 ON fb2.IdBenef = b2.IdBenef
    JOIN
	unidade as u2 ON f2.cnpj = u2.cnpj
    JOIN
	hotel as h2 ON u2.codigo = h2.codigo
    WHERE 
        h.codigo = h2.codigo -- Mesmo hotel
        AND b1.Valor = b2.Valor -- Mesmo valor de benefício
        AND f1.CPF != f2.CPF -- Funcionários diferentes
        AND b2.Tipo = 'Vale Alimentação'
);

