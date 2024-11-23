/* Consulta com LIKE */

/*SELECT h.nom_primeironome as nome, h.nom_sobrenome as sobrenome, ac.tipo as acomodação 
FROM requisicao r 
JOIN reserva rs on r.cpf = rs.cpf 
JOIN r_inclui_a ra ON rs.codigo = ra.codigo
JOIN acomodacao ac ON ra.codigo_quarto = ac.codigo_quarto
JOIN hospede h ON r.cpf = h.cpf
WHERE r.ordem = LIKE '%ar condicionado%';*/

/* Consulta com IN */

/*SELECT CONCAT(h.nom_primeironome, ' ', h.nom_sobrenome) as Nome FROM hospede h
JOIN reserva rs on rs.cpf = h.cpf
JOIN r_inclui_a ra ON ra.codigo = rs.codigo
JOIN acomodacao ac ON ac.codigo_quarto = ra.codigo_quarto
WHERE ac.tipo IN ('Cobertura', 'Deluxe', 'Suíte de luxo')*/

/* Consulta com LEFT JOIN */

/*SELECT 
    Acomodacao.Codigo_Quarto AS Codigo,
    Acomodacao.Tipo,
    Hospede.CPF
FROM 
    Acomodacao
LEFT JOIN 
    R_inclui_A ON Acomodacao.Codigo_Quarto = R_inclui_A.Codigo_Quarto
LEFT JOIN 
    Reserva ON R_inclui_A.Codigo = Reserva.Codigo
LEFT JOIN 
    Hospede ON Reserva.CPF = Hospede.CPF
WHERE 
    Acomodacao.Status = 'Limpo';*/

/* Consulta com HAVING */

/*SELECT dp.nome as Nome, re.culinaria as Culinaria FROM unidade u
JOIN dependencias dp ON u.cnpj = dp.cnpj
JOIN restaurante re ON re.iddep = dp.iddep
WHERE u.categoria = 'Pousada' 
GROUP BY Nome, Culinaria, re.avaliacao 
HAVING AVG(re.avaliacao) < re.avaliacao*/

/* 4 relações */

/*SELECT pa.cpf as CPF, pa.idade as Idade, amb.nome as Ambulatorio, hosp.nome as Hospital
FROM paciente pa
JOIN atendimento atend ON atend.cpf = pa.cpf
JOIN ambulatorio amb ON pa.idamb = amb.idamb 
JOIN hospital hosp ON amb.idhospital = hosp.idhospital
WHERE atend.gravidade = 'vermelha'*/

/* Relação recursiva */

SELECT 
    f1.Nom_PrimeiroNome AS Nome,
    f1.Cargo AS Cargo
FROM 
    Funcionario f1
JOIN 
    F_recebe_B frb1 ON f1.CPF = frb1.CPF
JOIN 
    Beneficio b1 ON frb1.IdBenef = b1.IdBenef
WHERE 
    b1.Tipo = 'VA' 
    AND EXISTS (
        SELECT 1
        FROM Funcionario f2
        JOIN F_recebe_B frb2 ON f2.CPF = frb2.CPF
        JOIN Beneficio b2 ON frb2.IdBenef = b2.IdBenef
        WHERE 
            f1.CNPJ = f2.CNPJ
            AND b1.Valor = b2.Valor
            AND f1.CPF != f2.CPF
            AND b1.Tipo = 'VA'
    )
ORDER BY 
    f1.Nom_PrimeiroNome, f1.Cargo;



