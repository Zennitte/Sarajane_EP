create database Hotelaria;


-- Tables Section
-- _____________ 

create table A_oferece_Item (
     Codigo_Quarto INT not null,
     CodItem INT not null,
     Quantidade INT not null,
     Valor REAL not null,
     constraint ID_A_oferece_Item primary key (CodItem, Codigo_Quarto));

create table Academia (
     IdDep INT not null,
     IdAcad INT not null,
     NmrAparelhos INT not null,
     constraint SID_Academia unique (IdAcad),
     constraint FKDep_Aca_ID primary key (IdDep));

create table Acomodacao (
     Codigo_Quarto INT not null,
     IdDep INT not null,
     Status varchar(20) not null,
     Tipo varchar(50) not null,
     constraint ID_Acomodacao primary key (Codigo_Quarto),
     constraint FKDep_Aco_ID unique (IdDep));

create table Ambulatorio (
     IdAmb INT not null,
     IdDep INT not null,
     Nome varchar(100) not null,
     IdHospital INT,
     constraint ID_Ambulatorio_ID primary key (IdAmb),
     constraint FKDep_Amb_ID unique (IdDep));

create table Area (
     Tipo varchar(50) not null,
     idArea INT not null,
     IdDep INT not null,
     constraint ID_Area primary key (idArea),
     constraint SID_Area unique (IdDep, idArea));

create table Atendimento (
     Protocolo INT not null,
     Gravidade varchar(30) not null,
     Status varchar(30) not null,
     Data date not null,
     CPF char(11) not null,
     M_r_CPF char(11) not null,
     constraint ID_Atendimento primary key (Protocolo));

create table Beneficio (
     IdBenef INT not null,
     Tipo varchar(50) not null,
     Desconto REAL not null,
     Valor REAL not null,
     constraint ID_Beneficio_ID primary key (IdBenef));

create table Condominio (
     CodigoCond INT not null,
     CNPJ char(14) not null,
     Valor_Aluguel REAL not null,
     Servico varchar(50) not null,
     constraint ID_Condominio primary key (CodigoCond),
     constraint FKU_possui_C_ID unique (CNPJ));

create table Dependencias (
     IdDep INT not null,
     Nome varchar(50) not null,
     Status_de_Limpeza varchar(50) not null,
     Capacidade INT not null,
     Hor_Fechamento date not null,
     Hor_Inicio date not null,
     CNPJ char(14) not null,
     Restaurante INT,
     Piscina INT,
     Espaco_de_Eventos INT,
     Ambulatorio INT,
     Acomodacao INT,
     Academia INT,
     constraint ID_Dependencias primary key (IdDep));

create table Entrada (
     IdMov INT not null,
     IdEntrada INT not null,
     Desconto REAL not null,
     constraint SID_Entrada unique (IdEntrada),
     constraint FKMov_Ent_ID primary key (IdMov));

create table Espaco_de_Eventos (
     IdDep INT not null,
     IdEsp INT not null,
     Tipo_De_Uso varchar(50) not null,
     Area INT not null,
     constraint SID_Espaco_de_Eventos unique (IdEsp),
     constraint FKDep_Esp_ID primary key (IdDep));

create table Estacionamento (
     CodigoEst INT not null,
     CNPJ char(14) not null,
     Nome varchar(50) not null,
     Quantidade_de_Vagas INT not null,
     constraint ID_Estacionamento_ID primary key (CodigoEst),
     constraint FKU_possui_E_ID unique (CNPJ));

create table Estoque (
     CodEstoque INT not null,
     Produto varchar(50) not null,
     Quantidade INT not null,
     constraint ID_Estoque primary key (CodEstoque));

create table F_recebe_B (
     IdBenef INT not null,
     CPF char(11) not null,
     constraint ID_F_recebe_B primary key (IdBenef, CPF));

create table Funcionario (
     CPF char(11) not null,
     Salario REAL not null,
     Nom_PrimeiroNome varchar(50) not null,
     Nom_Sobrenome varchar(100) not null,
     Contrato varchar(50) not null,
     Cargo varchar(50) not null,
     CNPJ char(14) not null,
     constraint ID_Funcionario primary key (CPF));

create table H_consome_Item (
     CPF char(11) not null,
     CodItem INT not null,
     Quantidade INT not null,
     constraint ID_H_consome_Item primary key (CodItem, CPF));

create table Hospede (
     CPF char(11) not null,
     Nom_PrimeiroNome varchar(50) not null,
     Nom_Sobrenome varchar(50) not null,
     Telefone varchar(11) not null,
     Email varchar(50) not null,
     constraint ID_Hospede_ID primary key (CPF));

create table Hospital (
     IdHospital INT not null,
     CNPJ char(14) not null,
     Nome varchar(100) not null,
     Quantidade_leitos INT not null,
     constraint ID_Hospital primary key (IdHospital));

create table Hotel (
     Codigo INT not null,
     Nome varchar(100) not null,
     Avaliacao INT not null,
     constraint ID_Hotel_ID primary key (Codigo));

create table Item (
     CodItem INT not null,
     Produto varchar(50) not null,
     Tipo varchar(50) not null,
     constraint ID_Item_ID primary key (CodItem));

create table Item_sai_do_E (
     CodEstoque INT not null,
     CodItem INT not null,
     constraint ID_Item_sai_do_E primary key (CodEstoque, CodItem));

create table M_TrabalhaPara_A (
     IdAmb INT not null,
     CPF char(11) not null,
     constraint ID_M_TrabalhaPara_A primary key (IdAmb, CPF));

create table Medicamento (
     IdMedic INT not null,
     Data_Validade date not null,
     Nome_Generico varchar(50) not null,
     Forma varchar(50) not null,
     Concentracao REAL not null,
     constraint ID_Medicamento primary key (IdMedic));

create table Movimentacao (
     IdMov INT not null,
     Valor REAL not null,
     Descricao varchar(500) not null,
     Data date not null,
     Forma_Pagamento varchar(50) not null,
     Saida INT,
     Entrada INT,
     constraint ID_Movimentacao_ID primary key (IdMov));

create table Medico (
     CPF char(11) not null,
     CRM varchar(30) not null,
     Nom_Nome varchar(50) not null,
     Nom_Sobrenome varchar(100) not null,
     constraint ID_Medico_ID primary key (CPF));

create table Nota_Fiscal (
     IdNF INT not null,
     IdMov INT not null,
     XML varchar(500) not null,
     Numero INT not null,
     Data_Emissao date not null,
     constraint ID_Nota_Fiscal primary key (IdNF),
     constraint SID_Nota_Fiscal unique (IdMov, IdNF));

create table Paciente (
     CPF char(11) not null,
     Tipo varchar(20) not null,
     Idade INT not null,
     Peso REAL not null,
     Problema varchar(100) not null,
     IdAmb INT not null,
     constraint ID_Paciente_ID primary key (CPF));

create table Pertence_a (
     Protocolo INT not null,
     IdMedic INT not null,
     constraint ID_Pertence_a primary key (Protocolo, IdMedic));

create table Piscina (
     IdDep INT not null,
     IdPis INT not null,
     Volume REAL not null,
     Temperatura INT not null,
     eh_coberta char not null,
     eh_aquecida char not null,
     constraint SID_Piscina unique (IdPis),
     constraint FKDep_Pis_ID primary key (IdDep));

create table Programa_De_Fidelidade (
     IdBonus INT not null,
     TipoBonus varchar(50) not null,
     Valor REAL not null,
     Codigo INT not null,
     constraint ID_Programa_De_Fidelidade_ID primary key (IdBonus));

create table R_inclui_A (
     Codigo_Quarto INT not null,
     Codigo INT not null,
     constraint ID_R_inclui_A primary key (Codigo, Codigo_Quarto));

create table Requisicao (
     IdReq INT not null,
     CPF char(11) not null,
     Status varchar(50) not null,
     Dat_Abertura date not null,
     Dat_Fechamento date not null,
     Tipo varchar(50) not null,
     Ordem varchar(500) not null,
     F_a_CPF char(11) not null,
     constraint ID_Requisicao primary key (IdReq),
     constraint SID_Requisicao unique (CPF, IdReq));

create table Reserva (
     Codigo INT not null,
     IdBonus INT not null,
     IdMov INT not null,
     Hos_Check_In date not null,
     Hos_Check_Out date not null,
     Valor REAL not null,
     Numero_Pessoas INT not null,
     CPF char(11) not null,
     IdRobo INT not null,
     constraint ID_Reserva_ID primary key (Codigo),
     constraint FKInclui_ID unique (IdBonus),
     constraint FKE_inclui_R_ID unique (IdMov));

create table Restaurante (
     IdDep INT not null,
     IdRes INT not null,
     Avaliacao INT not null,
     Culinaria varchar(50) not null,
     constraint SID_Restaurante unique (IdRes),
     constraint FKDep_Res_ID primary key (IdDep));

create table Robo_de_delivey (
     IdRobo INT not null,
     Data_Pedido date not null,
     Produto varchar(50) not null,
     Quantidade INT not null,
     Empresa varchar(50) not null,
     CNPJ char(14) not null,
     constraint ID_Robo_de_delivey_ID primary key (IdRobo));

create table Saida (
     IdMov INT not null,
     IdSaida INT not null,
     Favorecido varchar(100) not null,
     constraint SID_Saida unique (IdSaida),
     constraint FKMov_Sai_ID primary key (IdMov));

create table Setor (
     IdSetor INT not null,
     Capacidade INT not null,
     Tipo varchar(50) not null,
     constraint ID_Setor_ID primary key (IdSetor));

create table U_realiza_M (
     IdMov INT not null,
     CNPJ char(14) not null,
     constraint ID_U_realiza_M primary key (CNPJ, IdMov));

create table Unidade (
     CNPJ char(14) not null,
     Razao_Social varchar(100) not null,
     Nome_Fantasia varchar(100) not null,
     Loc_Latitude varchar(100) not null,
     Loc_Longitude varchar(100) not null,
     Capacidade INT not null,
     Categoria varchar(50) not null,
     IdSetor INT not null,
     Codigo INT not null,
     constraint ID_Unidade_ID primary key (CNPJ));

create table Vaga (
     IdVaga INT not null,
     Numero INT not null,
     Eh_coberta char not null,
     Tipo varchar(50) not null,
     Codigo INT not null,
     CodigoEst INT not null,
     constraint ID_Vaga primary key (IdVaga));


-- Constraints Section
-- ___________________ 

alter table A_oferece_Item add constraint FKA_o_Ite
     foreign key (CodItem)
     references Item;

alter table A_oferece_Item add constraint FKA_o_Aco_FK
     foreign key (Codigo_Quarto)
     references Acomodacao;

--Not implemented
--alter table Academia add constraint FKDep_Aca_CHK
--     check(exists(select * from Area
--                  where Area.IdDep = IdDep)); 

alter table Academia add constraint FKDep_Aca_FK
     foreign key (IdDep)
     references Dependencias;

alter table Acomodacao add constraint FKDep_Aco_FK
     foreign key (IdDep)
     references Dependencias;

--Not implemented
--alter table Ambulatorio add constraint ID_Ambulatorio_CHK
--     check(exists(select * from M_TrabalhaPara_A
--                  where M_TrabalhaPara_A.IdAmb = IdAmb)); 

alter table Ambulatorio add constraint FKDep_Amb_FK
     foreign key (IdDep)
     references Dependencias;

alter table Ambulatorio add constraint FKA_encaminha_para_H_FK
     foreign key (IdHospital)
     references Hospital;

alter table Area add constraint FKAcad_possui_Area
     foreign key (IdDep)
     references Academia;

alter table Atendimento add constraint FKP_gera_Atend_FK
     foreign key (CPF)
     references Paciente;

alter table Atendimento add constraint FKM_realiza_Atend_FK
     foreign key (M_r_CPF)
     references Medico;

--Not implemented
--alter table Beneficio add constraint ID_Beneficio_CHK
--     check(exists(select * from F_recebe_B
--                  where F_recebe_B.IdBenef = IdBenef)); 

alter table Condominio add constraint FKU_possui_C_FK
     foreign key (CNPJ)
     references Unidade;

alter table Dependencias add constraint EXTONE_Dependencias
     check((Acomodacao is not null and Ambulatorio is null and Restaurante is null and Espaco_de_Eventos is null and Academia is null and Piscina is null)
           or (Acomodacao is null and Ambulatorio is not null and Restaurante is null and Espaco_de_Eventos is null and Academia is null and Piscina is null)
           or (Acomodacao is null and Ambulatorio is null and Restaurante is not null and Espaco_de_Eventos is null and Academia is null and Piscina is null)
           or (Acomodacao is null and Ambulatorio is null and Restaurante is null and Espaco_de_Eventos is not null and Academia is null and Piscina is null)
           or (Acomodacao is null and Ambulatorio is null and Restaurante is null and Espaco_de_Eventos is null and Academia is not null and Piscina is null)
           or (Acomodacao is null and Ambulatorio is null and Restaurante is null and Espaco_de_Eventos is null and Academia is null and Piscina is not null)); 

alter table Dependencias add constraint FKU_possui_D_FK
     foreign key (CNPJ)
     references Unidade;

--Not implemented
--alter table Entrada add constraint FKMov_Ent_CHK
--     check(exists(select * from Nota_Fiscal
--                  where Nota_Fiscal.IdMov = IdMov)); 

--Not implemented
--alter table Entrada add constraint FKMov_Ent_CHK
--     check(exists(select * from Reserva
--                  where Reserva.IdMov = IdMov)); 

alter table Entrada add constraint FKMov_Ent_FK
     foreign key (IdMov)
     references Movimentacao;

alter table Espaco_de_Eventos add constraint FKDep_Esp_FK
     foreign key (IdDep)
     references Dependencias;

--Not implemented
--alter table Estacionamento add constraint ID_Estacionamento_CHK
--     check(exists(select * from Vaga
--                  where Vaga.CodigoEst = CodigoEst)); 

alter table Estacionamento add constraint FKU_possui_E_FK
     foreign key (CNPJ)
     references Unidade;

alter table F_recebe_B add constraint FKF_r_Fun_FK
     foreign key (CPF)
     references Funcionario;

alter table F_recebe_B add constraint FKF_r_Ben
     foreign key (IdBenef)
     references Beneficio;

alter table Funcionario add constraint FKF_TrabalhaPara_U_FK
     foreign key (CNPJ)
     references Unidade;

alter table H_consome_Item add constraint FKH_c_Ite
     foreign key (CodItem)
     references Item;

alter table H_consome_Item add constraint FKH_c_Hos_FK
     foreign key (CPF)
     references Hospede;

--Not implemented
--alter table Hospede add constraint ID_Hospede_CHK
--     check(exists(select * from Requisicao
--                  where Requisicao.CPF = CPF)); 

--Not implemented
--alter table Hospede add constraint ID_Hospede_CHK
--     check(exists(select * from Reserva
--                  where Reserva.CPF = CPF)); 

--Not implemented
--alter table Hotel add constraint ID_Hotel_CHK
--     check(exists(select * from Programa_De_Fidelidade
--                  where Programa_De_Fidelidade.Codigo = Codigo)); 

--Not implemented
--alter table Hotel add constraint ID_Hotel_CHK
--     check(exists(select * from Unidade
--                  where Unidade.Codigo = Codigo)); 

--Not implemented
--alter table Item add constraint ID_Item_CHK
--     check(exists(select * from H_consome_Item
--                  where H_consome_Item.CodItem = CodItem)); 

alter table Item_sai_do_E add constraint FKIte_Ite_FK
     foreign key (CodItem)
     references Item;

alter table Item_sai_do_E add constraint FKIte_Est
     foreign key (CodEstoque)
     references Estoque;

alter table M_TrabalhaPara_A add constraint FKM_T_Med_FK
     foreign key (CPF)
     references Medico;

alter table M_TrabalhaPara_A add constraint FKM_T_Amb
     foreign key (IdAmb)
     references Ambulatorio;

--Not implemented
--alter table Movimentacao add constraint ID_Movimentacao_CHK
--     check(exists(select * from U_realiza_M
--                  where U_realiza_M.IdMov = IdMov)); 

alter table Movimentacao add constraint EXTONE_Movimentacao
     check((Saida is not null and Entrada is null)
           or (Saida is null and Entrada is not null)); 

--Not implemented
--alter table Medico add constraint ID_Medico_CHK
--     check(exists(select * from Atendimento
--                  where Atendimento.M_r_CPF = CPF)); 

--Not implemented
--alter table Medico add constraint ID_Medico_CHK
--     check(exists(select * from M_TrabalhaPara_A
--                  where M_TrabalhaPara_A.CPF = CPF)); 

alter table Nota_Fiscal add constraint FKE_gera_NF
     foreign key (IdMov)
     references Entrada;

--Not implemented
--alter table Paciente add constraint ID_Paciente_CHK
--     check(exists(select * from Atendimento
--                  where Atendimento.CPF = CPF)); 

alter table Paciente add constraint FKP_ehLevadoPara_A_FK
     foreign key (IdAmb)
     references Ambulatorio;

alter table Pertence_a add constraint FKPer_Med_FK
     foreign key (IdMedic)
     references Medicamento;

alter table Pertence_a add constraint FKPer_Ate
     foreign key (Protocolo)
     references Atendimento;

alter table Piscina add constraint FKDep_Pis_FK
     foreign key (IdDep)
     references Dependencias;

--Not implemented
--alter table Programa_De_Fidelidade add constraint ID_Programa_De_Fidelidade_CHK
--     check(exists(select * from Reserva
--                  where Reserva.IdBonus = IdBonus)); 

alter table Programa_De_Fidelidade add constraint FKBonifica_FK
     foreign key (Codigo)
     references Hotel;

alter table R_inclui_A add constraint FKR_i_Res
     foreign key (Codigo)
     references Reserva;

alter table R_inclui_A add constraint FKR_i_Aco_FK
     foreign key (Codigo_Quarto)
     references Acomodacao;

alter table Requisicao add constraint FKH_abre_R
     foreign key (CPF)
     references Hospede;

alter table Requisicao add constraint FKF_atende_R_FK
     foreign key (F_a_CPF)
     references Funcionario;

--Not implemented
--alter table Reserva add constraint ID_Reserva_CHK
--     check(exists(select * from R_inclui_A
--                  where R_inclui_A.Codigo = Codigo)); 

alter table Reserva add constraint FKInclui_FK
     foreign key (IdBonus)
     references Programa_De_Fidelidade;

alter table Reserva add constraint FKH_faz_R_FK
     foreign key (CPF)
     references Hospede;

alter table Reserva add constraint FKE_inclui_R_FK
     foreign key (IdMov)
     references Entrada;

alter table Reserva add constraint FKAtende_FK
     foreign key (IdRobo)
     references Robo_de_delivey;

alter table Restaurante add constraint FKDep_Res_FK
     foreign key (IdDep)
     references Dependencias;

--Not implemented
--alter table Robo_de_delivey add constraint ID_Robo_de_delivey_CHK
--     check(exists(select * from Reserva
--                  where Reserva.IdRobo = IdRobo)); 

alter table Robo_de_delivey add constraint FKU_possui_R_FK
     foreign key (CNPJ)
     references Unidade;

alter table Saida add constraint FKMov_Sai_FK
     foreign key (IdMov)
     references Movimentacao;

--Not implemented
--alter table Setor add constraint ID_Setor_CHK
--     check(exists(select * from Unidade
--                  where Unidade.IdSetor = IdSetor)); 

alter table U_realiza_M add constraint FKU_r_Uni
     foreign key (CNPJ)
     references Unidade;

alter table U_realiza_M add constraint FKU_r_Mov_FK
     foreign key (IdMov)
     references Movimentacao;

--Not implemented
--alter table Unidade add constraint ID_Unidade_CHK
--     check(exists(select * from Funcionario
--                  where Funcionario.CNPJ = CNPJ)); 

--Not implemented
--alter table Unidade add constraint ID_Unidade_CHK
--     check(exists(select * from Dependencias
--                  where Dependencias.CNPJ = CNPJ)); 

--Not implemented
--alter table Unidade add constraint ID_Unidade_CHK
--     check(exists(select * from Estacionamento
--                  where Estacionamento.CNPJ = CNPJ)); 

--Not implemented
--alter table Unidade add constraint ID_Unidade_CHK
--     check(exists(select * from U_realiza_M
--                  where U_realiza_M.CNPJ = CNPJ)); 

alter table Unidade add constraint FKU_possui_S_FK
     foreign key (IdSetor)
     references Setor;

alter table Unidade add constraint FKH_possui_U_FK
     foreign key (Codigo)
     references Hotel;

alter table Vaga add constraint FKReservaVaga_FK
     foreign key (Codigo)
     references Reserva;

alter table Vaga add constraint FKE_possui_V_FK
     foreign key (CodigoEst)
     references Estacionamento;


-- Index Section
-- _____________ 

create index FKA_o_Aco_IND
     on A_oferece_Item (Codigo_Quarto);

create index FKA_encaminha_para_H_IND
     on Ambulatorio (IdHospital);

create index FKP_gera_Atend_IND
     on Atendimento (CPF);

create index FKM_realiza_Atend_IND
     on Atendimento (M_r_CPF);

create index FKU_possui_D_IND
     on Dependencias (CNPJ);

create index FKF_r_Fun_IND
     on F_recebe_B (CPF);

create index FKF_TrabalhaPara_U_IND
     on Funcionario (CNPJ);

create index FKH_c_Hos_IND
     on H_consome_Item (CPF);

create index FKIte_Ite_IND
     on Item_sai_do_E (CodItem);

create index FKM_T_Med_IND
     on M_TrabalhaPara_A (CPF);

create index FKP_ehLevadoPara_A_IND
     on Paciente (IdAmb);

create index FKPer_Med_IND
     on Pertence_a (IdMedic);

create index FKBonifica_IND
     on Programa_De_Fidelidade (Codigo);

create index FKR_i_Aco_IND
     on R_inclui_A (Codigo_Quarto);

create index FKF_atende_R_IND
     on Requisicao (F_a_CPF);

create index FKH_faz_R_IND
     on Reserva (CPF);

create index FKAtende_IND
     on Reserva (IdRobo);

create index FKU_possui_R_IND
     on Robo_de_delivey (CNPJ);

create index FKU_r_Mov_IND
     on U_realiza_M (IdMov);

create index FKU_possui_S_IND
     on Unidade (IdSetor);

create index FKH_possui_U_IND
     on Unidade (Codigo);

create index FKReservaVaga_IND
     on Vaga (Codigo);

create index FKE_possui_V_IND
     on Vaga (CodigoEst);

