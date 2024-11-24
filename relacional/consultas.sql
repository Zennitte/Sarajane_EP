/* Consulta com LIKE */

/* SELECT h.nom_primeironome AS nome, h.nom_sobrenome AS sobrenome, ac.tipo AS acomodacao 
FROM requisicao AS r 
JOIN reserva AS rs ON r.cpf = rs.cpf 
JOIN r_inclui_a AS ra ON rs.codigo = ra.codigo
JOIN acomodacao AS ac ON ra.codigo_quarto = ac.codigo_quarto
JOIN hospede AS h ON r.cpf = h.cpf
WHERE r.ordem LIKE '%ar condicionado%'; */

/* Consulta com IN */

/* SELECT CONCAT(h.nom_primeironome, ' ', h.nom_sobrenome) AS Nome, rs.valor AS Valor 
FROM hospede AS h
JOIN reserva AS rs ON rs.cpf = h.cpf
JOIN r_inclui_a AS ra ON ra.codigo = rs.codigo
JOIN acomodacao AS ac ON ac.codigo_quarto = ra.codigo_quarto
WHERE ac.tipo IN ('Cobertura', 'Deluxe', 'Suíte de luxo'); */

/* Consulta com LEFT JOIN */

/*

SELECT 
    acom.Codigo_Quarto AS Codigo,
    acom.Tipo AS Tipo,
    h.CPF
FROM Acomodacao AS acom
LEFT JOIN R_inclui_A AS ra ON acom.Codigo_Quarto = ra.Codigo_Quarto
LEFT JOIN Reserva AS rs ON ra.Codigo = rs.Codigo
LEFT JOIN Hospede AS h ON Reserva.CPF = Hospede.CPF
LEFT JOIN dependencias AS dp ON acom.iddep = dp.iddep
WHERE dp.Status_de_Limpeza = 'Limpo';


*/

/* Consulta com HAVING */

/* SELECT dp.nome AS Nome, re.culinaria AS Culinaria 
FROM unidade AS u
JOIN dependencias AS dp ON u.cnpj = dp.cnpj
JOIN restaurante AS re ON re.iddep = dp.iddep
WHERE u.categoria = 'Pousada' 
GROUP BY Nome, Culinaria, re.avaliacao 
HAVING AVG(re.avaliacao) < re.avaliacao; */

/* 4 relações */

/* SELECT pa.cpf AS CPF, pa.idade AS Idade, amb.nome AS Ambulatorio, hosp.nome AS Hospital
FROM paciente AS pa
JOIN atendimento AS atend ON atend.cpf = pa.cpf
JOIN ambulatorio AS amb ON pa.idamb = amb.idamb 
JOIN hospital AS hosp ON amb.idhospital = hosp.idhospital
WHERE atend.gravidade = 'vermelha'; */

/* Relação recursiva */

SELECT 
    f1.Nom_PrimeiroNome AS Nome,
    f1.Cargo AS Cargo
FROM Funcionario AS f1
JOIN F_recebe_B AS frb1 ON f1.CPF = frb1.CPF
JOIN Beneficio AS b1 ON frb1.IdBenef = b1.IdBenef
WHERE b1.Tipo = 'VA' AND EXISTS ( SELECT 1
        		    					 FROM Funcionario f2
        		    					 JOIN F_recebe_B AS frb2 ON f2.CPF = frb2.CPF
       			    					 JOIN Beneficio AS b2 ON frb2.IdBenef = b2.IdBenef
        		    					 WHERE f1.CNPJ = f2.CNPJ AND b1.Valor = b2.Valor 
 AND f1.CPF != f2.CPF AND b1.Tipo = 'VA' )
ORDER BY f1.Nom_PrimeiroNome, f1.Cargo;


