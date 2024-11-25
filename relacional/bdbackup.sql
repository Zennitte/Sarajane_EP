--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2024-11-24 21:01:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5163 (class 1262 OID 18234)
-- Name: Hotel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Hotel" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "Hotel" OWNER TO postgres;

\connect "Hotel"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 18235)
-- Name: a_oferece_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_oferece_item (
    codigo_quarto integer NOT NULL,
    coditem integer NOT NULL,
    quantidade integer NOT NULL,
    valor real NOT NULL
);


ALTER TABLE public.a_oferece_item OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18238)
-- Name: academia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academia (
    iddep integer NOT NULL,
    idacad integer NOT NULL,
    nmraparelhos integer NOT NULL
);


ALTER TABLE public.academia OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18241)
-- Name: acomodacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acomodacao (
    codigo_quarto integer NOT NULL,
    iddep integer NOT NULL,
    status character varying(20) NOT NULL,
    tipo character varying(50) NOT NULL,
    valor real
);


ALTER TABLE public.acomodacao OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18244)
-- Name: ambulatorio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ambulatorio (
    idamb integer NOT NULL,
    iddep integer NOT NULL,
    idhospital integer
);


ALTER TABLE public.ambulatorio OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18247)
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    tipo character varying(50) NOT NULL,
    idarea integer NOT NULL,
    iddep integer NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18250)
-- Name: atendimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendimento (
    protocolo integer NOT NULL,
    gravidade character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    data date NOT NULL,
    cpf character(11) NOT NULL,
    m_r_cpf character(11) NOT NULL
);


ALTER TABLE public.atendimento OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18253)
-- Name: beneficio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficio (
    idbenef integer NOT NULL,
    tipo character varying(50) NOT NULL,
    desconto real,
    valor real
);


ALTER TABLE public.beneficio OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18256)
-- Name: condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condominio (
    codigocond integer NOT NULL,
    cnpj character(14) NOT NULL,
    valor_aluguel real NOT NULL,
    servico character varying(50) NOT NULL
);


ALTER TABLE public.condominio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18259)
-- Name: dependencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependencias (
    iddep integer NOT NULL,
    nome character varying(50) NOT NULL,
    status_de_limpeza character varying(50) NOT NULL,
    capacidade integer NOT NULL,
    cnpj character(14) NOT NULL,
    restaurante integer,
    piscina integer,
    espaco_de_eventos integer,
    ambulatorio integer,
    acomodacao integer,
    academia integer,
    hora_fechamento time without time zone NOT NULL,
    hora_inicio time without time zone NOT NULL,
    CONSTRAINT extone_dependencias CHECK ((((acomodacao IS NOT NULL) AND (ambulatorio IS NULL) AND (restaurante IS NULL) AND (espaco_de_eventos IS NULL) AND (academia IS NULL) AND (piscina IS NULL)) OR ((acomodacao IS NULL) AND (ambulatorio IS NOT NULL) AND (restaurante IS NULL) AND (espaco_de_eventos IS NULL) AND (academia IS NULL) AND (piscina IS NULL)) OR ((acomodacao IS NULL) AND (ambulatorio IS NULL) AND (restaurante IS NOT NULL) AND (espaco_de_eventos IS NULL) AND (academia IS NULL) AND (piscina IS NULL)) OR ((acomodacao IS NULL) AND (ambulatorio IS NULL) AND (restaurante IS NULL) AND (espaco_de_eventos IS NOT NULL) AND (academia IS NULL) AND (piscina IS NULL)) OR ((acomodacao IS NULL) AND (ambulatorio IS NULL) AND (restaurante IS NULL) AND (espaco_de_eventos IS NULL) AND (academia IS NOT NULL) AND (piscina IS NULL)) OR ((acomodacao IS NULL) AND (ambulatorio IS NULL) AND (restaurante IS NULL) AND (espaco_de_eventos IS NULL) AND (academia IS NULL) AND (piscina IS NOT NULL))))
);


ALTER TABLE public.dependencias OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18263)
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrada (
    idmov integer NOT NULL,
    identrada integer NOT NULL,
    desconto real NOT NULL,
    codigo_reserva integer
);


ALTER TABLE public.entrada OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18266)
-- Name: espaco_de_eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.espaco_de_eventos (
    iddep integer NOT NULL,
    idesp integer NOT NULL,
    tipo_de_uso character varying(50) NOT NULL,
    area integer NOT NULL
);


ALTER TABLE public.espaco_de_eventos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18269)
-- Name: estacionamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estacionamento (
    codigoest integer NOT NULL,
    cnpj character(14) NOT NULL,
    nome character varying(50) NOT NULL,
    quantidade_de_vagas_descobertas integer NOT NULL,
    quantidade_de_vagas_cobertas integer
);


ALTER TABLE public.estacionamento OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18272)
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    codestoque integer NOT NULL,
    nome character varying(50) NOT NULL,
    quantidade integer NOT NULL,
    cnpj character varying(13)
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18275)
-- Name: f_recebe_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.f_recebe_b (
    idbenef integer NOT NULL,
    cpf character(11) NOT NULL
);


ALTER TABLE public.f_recebe_b OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18278)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    cpf character(11) NOT NULL,
    salario real NOT NULL,
    primeiro_nome character varying(50) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    contrato character varying(50) NOT NULL,
    cargo character varying(50) NOT NULL,
    cnpj character(14)
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18281)
-- Name: h_consome_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.h_consome_item (
    cpf character(11) NOT NULL,
    coditem integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.h_consome_item OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18284)
-- Name: hospede; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospede (
    cpf character(11) NOT NULL,
    nom_primeironome character varying(50) NOT NULL,
    nom_sobrenome character varying(50) NOT NULL,
    telefone character varying(11) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.hospede OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18287)
-- Name: hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital (
    idhospital integer NOT NULL,
    cnpj character(14) NOT NULL,
    nome character varying(100) NOT NULL,
    quantidade_leitos integer NOT NULL
);


ALTER TABLE public.hospital OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18290)
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    avaliacao integer NOT NULL
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18293)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    coditem integer NOT NULL,
    produto character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18296)
-- Name: item_sai_do_e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_sai_do_e (
    codestoque integer NOT NULL,
    coditem integer NOT NULL
);


ALTER TABLE public.item_sai_do_e OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18299)
-- Name: m_trabalhapara_a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_trabalhapara_a (
    idamb integer NOT NULL,
    cpf character(11) NOT NULL
);


ALTER TABLE public.m_trabalhapara_a OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18302)
-- Name: medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamento (
    idmedic integer NOT NULL,
    data_validade date NOT NULL,
    nome_generico character varying(50) NOT NULL,
    forma character varying(50) NOT NULL,
    concentracao real NOT NULL
);


ALTER TABLE public.medicamento OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18305)
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    cpf character(11) NOT NULL,
    crm character varying(30) NOT NULL,
    nom_nome character varying(50) NOT NULL,
    nom_sobrenome character varying(100) NOT NULL
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18308)
-- Name: movimentacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimentacao (
    idmov integer NOT NULL,
    valor real NOT NULL,
    descricao character varying(500) NOT NULL,
    data date NOT NULL,
    forma_pagamento character varying(50) NOT NULL,
    saida integer,
    entrada integer,
    CONSTRAINT extone_movimentacao CHECK ((((saida IS NOT NULL) AND (entrada IS NULL)) OR ((saida IS NULL) AND (entrada IS NOT NULL))))
);


ALTER TABLE public.movimentacao OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18314)
-- Name: nota_fiscal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_fiscal (
    idnf integer NOT NULL,
    idmov integer NOT NULL,
    xml character varying(500) NOT NULL,
    numero integer NOT NULL,
    data_emissao date NOT NULL
);


ALTER TABLE public.nota_fiscal OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18319)
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    cpf character(11) NOT NULL,
    tipo character varying(20) NOT NULL,
    idade integer NOT NULL,
    peso real NOT NULL,
    problema character varying(100) NOT NULL,
    idamb integer NOT NULL
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18322)
-- Name: pertence_a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pertence_a (
    protocolo integer NOT NULL,
    idmedic integer NOT NULL
);


ALTER TABLE public.pertence_a OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18325)
-- Name: piscina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.piscina (
    iddep integer NOT NULL,
    idpis integer NOT NULL,
    volume real NOT NULL,
    temperatura integer NOT NULL,
    eh_coberta character(1) NOT NULL,
    eh_aquecida character(1) NOT NULL
);


ALTER TABLE public.piscina OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18328)
-- Name: programa_de_fidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programa_de_fidelidade (
    idbonus integer NOT NULL,
    tipobonus character varying(50) NOT NULL,
    valor real NOT NULL,
    codigo integer NOT NULL,
    codigo_reserva integer
);


ALTER TABLE public.programa_de_fidelidade OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18331)
-- Name: r_inclui_a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_inclui_a (
    codigo_quarto integer NOT NULL,
    codigo integer NOT NULL
);


ALTER TABLE public.r_inclui_a OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18334)
-- Name: requisicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisicao (
    idreq integer NOT NULL,
    cpf character(11) NOT NULL,
    status character varying(50) NOT NULL,
    dat_abertura timestamp without time zone NOT NULL,
    dat_fechamento timestamp without time zone,
    tipo character varying(50) NOT NULL,
    ordem character varying(500) NOT NULL,
    f_a_cpf character(11)
);


ALTER TABLE public.requisicao OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18339)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    codigo integer NOT NULL,
    hos_check_in timestamp without time zone NOT NULL,
    hos_check_out timestamp without time zone NOT NULL,
    valor real NOT NULL,
    numero_pessoas integer NOT NULL,
    cpf character(11) NOT NULL
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18342)
-- Name: restaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurante (
    iddep integer NOT NULL,
    idres integer NOT NULL,
    avaliacao integer NOT NULL,
    culinaria character varying(50) NOT NULL
);


ALTER TABLE public.restaurante OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18345)
-- Name: robo_de_delivey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.robo_de_delivey (
    idrobo integer NOT NULL,
    data_pedido date NOT NULL,
    produto character varying(50) NOT NULL,
    quantidade integer NOT NULL,
    empresa character varying(50) NOT NULL,
    cnpj character(14) NOT NULL,
    codigo_reserva integer
);


ALTER TABLE public.robo_de_delivey OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18348)
-- Name: saida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saida (
    idmov integer NOT NULL,
    idsaida integer NOT NULL,
    favorecido character varying(100) NOT NULL
);


ALTER TABLE public.saida OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18351)
-- Name: setor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setor (
    idsetor integer NOT NULL,
    capacidade integer NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.setor OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18354)
-- Name: u_realiza_m; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.u_realiza_m (
    idmov integer NOT NULL,
    cnpj character(14) NOT NULL
);


ALTER TABLE public.u_realiza_m OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18357)
-- Name: unidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidade (
    cnpj character(14) NOT NULL,
    razao_social character varying(100) NOT NULL,
    nome_fantasia character varying(100) NOT NULL,
    loc_latitude character varying(100) NOT NULL,
    loc_longitude character varying(100) NOT NULL,
    capacidade integer NOT NULL,
    categoria character varying(50) NOT NULL,
    idsetor integer NOT NULL,
    codigo integer NOT NULL
);


ALTER TABLE public.unidade OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18360)
-- Name: vaga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaga (
    idvaga integer NOT NULL,
    numero integer NOT NULL,
    eh_coberta character(1) NOT NULL,
    tipo character varying(50) NOT NULL,
    codigo integer NOT NULL,
    codigoest integer NOT NULL
);


ALTER TABLE public.vaga OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 18235)
-- Dependencies: 217
-- Data for Name: a_oferece_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.a_oferece_item VALUES (1, 1, 3, 5);
INSERT INTO public.a_oferece_item VALUES (2, 2, 5, 6);
INSERT INTO public.a_oferece_item VALUES (3, 3, 10, 12);
INSERT INTO public.a_oferece_item VALUES (4, 4, 2, 15);
INSERT INTO public.a_oferece_item VALUES (5, 5, 7, 8);
INSERT INTO public.a_oferece_item VALUES (6, 6, 4, 50);
INSERT INTO public.a_oferece_item VALUES (7, 7, 1, 100);
INSERT INTO public.a_oferece_item VALUES (8, 8, 6, 7.5);
INSERT INTO public.a_oferece_item VALUES (9, 9, 3, 25);
INSERT INTO public.a_oferece_item VALUES (10, 10, 2, 20);
INSERT INTO public.a_oferece_item VALUES (11, 1, 5, 5);
INSERT INTO public.a_oferece_item VALUES (11, 2, 3, 6);
INSERT INTO public.a_oferece_item VALUES (12, 3, 6, 12);
INSERT INTO public.a_oferece_item VALUES (13, 4, 4, 15);
INSERT INTO public.a_oferece_item VALUES (13, 5, 2, 8);
INSERT INTO public.a_oferece_item VALUES (14, 6, 3, 50);
INSERT INTO public.a_oferece_item VALUES (15, 7, 1, 100);
INSERT INTO public.a_oferece_item VALUES (15, 8, 4, 7.5);
INSERT INTO public.a_oferece_item VALUES (16, 9, 3, 25);
INSERT INTO public.a_oferece_item VALUES (17, 10, 2, 20);
INSERT INTO public.a_oferece_item VALUES (17, 1, 4, 5);
INSERT INTO public.a_oferece_item VALUES (18, 2, 5, 6);
INSERT INTO public.a_oferece_item VALUES (18, 3, 10, 12);
INSERT INTO public.a_oferece_item VALUES (19, 4, 2, 15);
INSERT INTO public.a_oferece_item VALUES (19, 5, 7, 8);
INSERT INTO public.a_oferece_item VALUES (20, 6, 4, 50);
INSERT INTO public.a_oferece_item VALUES (21, 7, 1, 100);
INSERT INTO public.a_oferece_item VALUES (22, 8, 6, 7.5);
INSERT INTO public.a_oferece_item VALUES (22, 9, 3, 25);
INSERT INTO public.a_oferece_item VALUES (23, 10, 2, 20);
INSERT INTO public.a_oferece_item VALUES (24, 1, 3, 5);
INSERT INTO public.a_oferece_item VALUES (24, 2, 2, 6);
INSERT INTO public.a_oferece_item VALUES (24, 4, 1, 15);
INSERT INTO public.a_oferece_item VALUES (25, 5, 5, 8);
INSERT INTO public.a_oferece_item VALUES (26, 6, 2, 50);
INSERT INTO public.a_oferece_item VALUES (26, 7, 1, 100);
INSERT INTO public.a_oferece_item VALUES (27, 8, 3, 7.5);
INSERT INTO public.a_oferece_item VALUES (28, 9, 1, 25);
INSERT INTO public.a_oferece_item VALUES (28, 10, 2, 20);
INSERT INTO public.a_oferece_item VALUES (28, 3, 2, 12);
INSERT INTO public.a_oferece_item VALUES (29, 4, 3, 15);
INSERT INTO public.a_oferece_item VALUES (30, 1, 5, 5);
INSERT INTO public.a_oferece_item VALUES (30, 2, 6, 6);
INSERT INTO public.a_oferece_item VALUES (30, 8, 2, 7.5);


--
-- TOC entry 5119 (class 0 OID 18238)
-- Dependencies: 218
-- Data for Name: academia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.academia VALUES (21, 1, 20);
INSERT INTO public.academia VALUES (22, 2, 25);
INSERT INTO public.academia VALUES (23, 3, 15);
INSERT INTO public.academia VALUES (24, 4, 30);
INSERT INTO public.academia VALUES (65, 5, 35);


--
-- TOC entry 5120 (class 0 OID 18241)
-- Dependencies: 219
-- Data for Name: acomodacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acomodacao VALUES (2, 18, 'Livre', 'Cobertura', 2500);
INSERT INTO public.acomodacao VALUES (3, 19, 'Livre', 'Deluxe', 3000);
INSERT INTO public.acomodacao VALUES (4, 20, 'Ocupada', 'Quarto padrão', 900);
INSERT INTO public.acomodacao VALUES (5, 29, 'Fora de operação', 'Quarto standard', 1500);
INSERT INTO public.acomodacao VALUES (6, 30, 'Livre', 'Apartamento família', 1800);
INSERT INTO public.acomodacao VALUES (7, 31, 'Livre', 'Estúdio executivo', 3000);
INSERT INTO public.acomodacao VALUES (10, 34, 'Livre', 'Suíte econômica', 1000);
INSERT INTO public.acomodacao VALUES (12, 36, 'Livre', 'Cobertura premium', 1900);
INSERT INTO public.acomodacao VALUES (18, 42, 'Livre', 'Suíte compacta', 1000);
INSERT INTO public.acomodacao VALUES (14, 38, 'Livre', 'Suíte executiva', 900);
INSERT INTO public.acomodacao VALUES (16, 40, 'Livre', 'Estúdio com vista', 2300);
INSERT INTO public.acomodacao VALUES (19, 43, 'Livre', 'Apartamento família', 2600);
INSERT INTO public.acomodacao VALUES (8, 32, 'Ocupada', 'Chalé exclusivo', 2000);
INSERT INTO public.acomodacao VALUES (9, 33, 'Ocupada', 'Suíte presidencial', 2500);
INSERT INTO public.acomodacao VALUES (11, 35, 'Livre', 'Apartamento superior', 3000);
INSERT INTO public.acomodacao VALUES (17, 41, 'Livre', 'Quarto com hidromassagem', 3000);
INSERT INTO public.acomodacao VALUES (15, 39, 'Livre', 'Apartamento com varanda', 3000);
INSERT INTO public.acomodacao VALUES (13, 37, 'Livre', 'Quarto duplo', 4200);
INSERT INTO public.acomodacao VALUES (20, 44, 'Livre', 'Chalé master', 1900);
INSERT INTO public.acomodacao VALUES (1, 17, 'Reservada', 'Suíte de luxo', 1900);
INSERT INTO public.acomodacao VALUES (25, 49, 'Livre', 'Suíte deluxe', 5200);
INSERT INTO public.acomodacao VALUES (26, 50, 'Livre', 'Quarto casal standard', 2000);
INSERT INTO public.acomodacao VALUES (27, 51, 'Livre', 'Apartamento executivo', 1200);
INSERT INTO public.acomodacao VALUES (33, 57, 'Livre', 'Chalé panorâmico', 3499);
INSERT INTO public.acomodacao VALUES (31, 55, 'Livre', 'Apartamento com cozinha', 900);
INSERT INTO public.acomodacao VALUES (34, 58, 'Livre', 'Apartamento compacto', 750);
INSERT INTO public.acomodacao VALUES (21, 45, 'Livre', 'Apartamento térreo', 1100);
INSERT INTO public.acomodacao VALUES (32, 56, 'Livre', 'Quarto triplo', 1700);
INSERT INTO public.acomodacao VALUES (24, 48, 'Livre', 'Suíte com vista panorâmica', 2500);
INSERT INTO public.acomodacao VALUES (28, 52, 'Livre', 'Cobertura com terraço', 3900);
INSERT INTO public.acomodacao VALUES (30, 54, 'Fora de operação', 'Quarto familiar', 1420);
INSERT INTO public.acomodacao VALUES (29, 53, 'Fora de operação', 'Apartamento garden', 1350);
INSERT INTO public.acomodacao VALUES (36, 60, 'Fora de operação', 'Quarto luxo standard', 1600);
INSERT INTO public.acomodacao VALUES (23, 47, 'Fora de operação', 'Estúdio econômico', 300);
INSERT INTO public.acomodacao VALUES (22, 46, 'Fora de operação', 'Apartamento luxo', 1300);
INSERT INTO public.acomodacao VALUES (35, 59, 'Livre', 'Suíte com varanda', 1400);


--
-- TOC entry 5121 (class 0 OID 18244)
-- Dependencies: 220
-- Data for Name: ambulatorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ambulatorio VALUES (1, 13, 1);
INSERT INTO public.ambulatorio VALUES (2, 14, 2);
INSERT INTO public.ambulatorio VALUES (3, 15, 3);
INSERT INTO public.ambulatorio VALUES (4, 16, 4);
INSERT INTO public.ambulatorio VALUES (9, 64, 4);


--
-- TOC entry 5122 (class 0 OID 18247)
-- Dependencies: 221
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.area VALUES ('Estúdio de Yoga', 2, 21);
INSERT INTO public.area VALUES ('Sala de Spinning', 3, 22);
INSERT INTO public.area VALUES ('Zona Funcional', 4, 23);
INSERT INTO public.area VALUES ('Área de musculação', 5, 24);
INSERT INTO public.area VALUES ('Sala de Spinning', 1, 21);


--
-- TOC entry 5123 (class 0 OID 18250)
-- Dependencies: 222
-- Data for Name: atendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atendimento VALUES (1, 'Alta', 'Em andamento', '2024-11-24', '77292486037', '97491220037');
INSERT INTO public.atendimento VALUES (2, 'Média', 'Concluído', '2023-11-23', '85471362048', '85296374128');
INSERT INTO public.atendimento VALUES (3, 'Baixa', 'Redirecionado ao hospital', '2024-11-22', '96521473059', '74185296345');
INSERT INTO public.atendimento VALUES (4, 'Alta', 'Concluído', '2024-05-12', '74652183060', '96385274129');
INSERT INTO public.atendimento VALUES (5, 'Média', 'Concluído', '2023-07-01', '32345678914', '15975348621');


--
-- TOC entry 5124 (class 0 OID 18253)
-- Dependencies: 223
-- Data for Name: beneficio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beneficio VALUES (1, 'Plano de saúde', 112, NULL);
INSERT INTO public.beneficio VALUES (2, 'Plano odontológico', 30.2, NULL);
INSERT INTO public.beneficio VALUES (3, 'Vale Alimentação', NULL, 599.39);
INSERT INTO public.beneficio VALUES (4, 'Vale Refeição', NULL, 412.2);
INSERT INTO public.beneficio VALUES (5, 'Seguro de vida', NULL, NULL);


--
-- TOC entry 5125 (class 0 OID 18256)
-- Dependencies: 224
-- Data for Name: condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condominio VALUES (1, '22170636000142', 2500, 'Loja de Conveniência');
INSERT INTO public.condominio VALUES (2, '10170636000142', 2000, 'Escritório Administrativo');
INSERT INTO public.condominio VALUES (3, '50170636000142', 3000, 'Espaço para Boutique');
INSERT INTO public.condominio VALUES (4, '80170636000142', 3500, 'Farmácia');
INSERT INTO public.condominio VALUES (5, '19170636000142', 1800, 'Salão de Beleza');
INSERT INTO public.condominio VALUES (6, '12170636000142', 2700, 'Quiosque de Turismo');
INSERT INTO public.condominio VALUES (7, '16170636000142', 3200, 'Loja de Presentes');
INSERT INTO public.condominio VALUES (8, '70170636000142', 4000, 'Espaço para Pet Shop');
INSERT INTO public.condominio VALUES (9, '14170636000142', 2900, 'Espaço para Floricultura');


--
-- TOC entry 5126 (class 0 OID 18259)
-- Dependencies: 225
-- Data for Name: dependencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependencias VALUES (1, 'Restaurante Gourmet', 'Limpa', 50, '30170636000142', 1, NULL, NULL, NULL, NULL, NULL, '22:00:00', '08:00:00');
INSERT INTO public.dependencias VALUES (2, 'Restaurante Vista Mar', 'Limpa', 60, '40170636000142', 1, NULL, NULL, NULL, NULL, NULL, '23:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (3, 'Restaurante Sabores', 'Suja', 40, '50170636000142', 1, NULL, NULL, NULL, NULL, NULL, '21:00:00', '06:00:00');
INSERT INTO public.dependencias VALUES (4, 'Restaurante Central', 'Limpa', 70, '60170636000142', 1, NULL, NULL, NULL, NULL, NULL, '23:30:00', '09:00:00');
INSERT INTO public.dependencias VALUES (5, 'Piscina Externa', 'Limpa', 30, '70170636000142', NULL, 1, NULL, NULL, NULL, NULL, '18:00:00', '06:00:00');
INSERT INTO public.dependencias VALUES (6, 'Piscina Interna', 'Limpa', 25, '80170636000142', NULL, 1, NULL, NULL, NULL, NULL, '20:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (7, 'Piscina Infantil', 'Suja', 15, '90170636000142', NULL, 1, NULL, NULL, NULL, NULL, '19:00:00', '08:00:00');
INSERT INTO public.dependencias VALUES (8, 'Piscina Aquecida', 'Limpa', 20, '10170636000142', NULL, 1, NULL, NULL, NULL, NULL, '22:00:00', '06:30:00');
INSERT INTO public.dependencias VALUES (9, 'Auditório Principal', 'Limpa', 100, '11170636000142', NULL, NULL, 1, NULL, NULL, NULL, '21:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (10, 'Salão de Festas', 'Limpa', 120, '12170636000142', NULL, NULL, 1, NULL, NULL, NULL, '23:00:00', '09:00:00');
INSERT INTO public.dependencias VALUES (11, 'Sala de Reuniões', 'Suja', 50, '13170636000142', NULL, NULL, 1, NULL, NULL, NULL, '20:00:00', '08:00:00');
INSERT INTO public.dependencias VALUES (12, 'Centro de Convenções', 'Limpa', 200, '14170636000142', NULL, NULL, 1, NULL, NULL, NULL, '22:00:00', '07:30:00');
INSERT INTO public.dependencias VALUES (13, 'Ambulatório Geral', 'Limpa', 5, '15170636000142', NULL, NULL, NULL, 1, NULL, NULL, '18:00:00', '06:00:00');
INSERT INTO public.dependencias VALUES (14, 'Ambulatório Geral', 'Limpa', 3, '16170636000142', NULL, NULL, NULL, 1, NULL, NULL, '20:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (15, 'Ambulatório de Urgência', 'Suja', 4, '17170636000142', NULL, NULL, NULL, 1, NULL, NULL, '22:00:00', '06:00:00');
INSERT INTO public.dependencias VALUES (16, 'Ambulatório de Urgência', 'Limpa', 6, '18170636000142', NULL, NULL, NULL, 1, NULL, NULL, '19:00:00', '08:30:00');
INSERT INTO public.dependencias VALUES (17, 'Acomodação Luxo', 'Limpa', 2, '19170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (18, 'Acomodação Econômica', 'Suja', 1, '20170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '14:00:00');
INSERT INTO public.dependencias VALUES (19, 'Acomodação Familiar', 'Limpa', 4, '21170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:00:00', '10:00:00');
INSERT INTO public.dependencias VALUES (20, 'Acomodação Executiva', 'Limpa', 2, '22170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '13:00:00');
INSERT INTO public.dependencias VALUES (21, 'Academia Fitness', 'Limpa', 15, '30170636000142', NULL, NULL, NULL, NULL, NULL, 1, '22:00:00', '06:00:00');
INSERT INTO public.dependencias VALUES (22, 'Academia CrossFit', 'Suja', 12, '40170636000142', NULL, NULL, NULL, NULL, NULL, 1, '21:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (23, 'Academia Funcional', 'Limpa', 10, '50170636000142', NULL, NULL, NULL, NULL, NULL, 1, '20:00:00', '06:30:00');
INSERT INTO public.dependencias VALUES (24, 'Academia Musculação', 'Limpa', 20, '60170636000142', NULL, NULL, NULL, NULL, NULL, 1, '23:00:00', '05:30:00');
INSERT INTO public.dependencias VALUES (25, 'Acomodação Luxo', 'Limpa', 2, '30170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (26, 'Acomodação Econômica', 'Suja', 1, '30170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '14:00:00');
INSERT INTO public.dependencias VALUES (27, 'Acomodação Familiar', 'Limpa', 4, '40170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:00:00', '10:00:00');
INSERT INTO public.dependencias VALUES (28, 'Acomodação Executiva', 'Limpa', 2, '40170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '13:00:00');
INSERT INTO public.dependencias VALUES (29, 'Acomodação Vista Mar', 'Limpa', 3, '50170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (30, 'Acomodação Premium', 'Suja', 2, '50170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '11:00:00');
INSERT INTO public.dependencias VALUES (31, 'Acomodação Simples', 'Limpa', 1, '60170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '14:00:00');
INSERT INTO public.dependencias VALUES (32, 'Acomodação Luxo', 'Suja', 3, '60170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '13:30:00');
INSERT INTO public.dependencias VALUES (33, 'Acomodação Estrela', 'Limpa', 4, '70170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:30:00', '10:30:00');
INSERT INTO public.dependencias VALUES (34, 'Acomodação Plus', 'Suja', 2, '70170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:00:00', '12:30:00');
INSERT INTO public.dependencias VALUES (35, 'Acomodação Luxo', 'Limpa', 5, '80170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (36, 'Acomodação Econômica', 'Suja', 3, '80170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '13:00:00');
INSERT INTO public.dependencias VALUES (37, 'Acomodação Familiar', 'Limpa', 4, '90170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '10:00:00');
INSERT INTO public.dependencias VALUES (38, 'Acomodação Executiva', 'Suja', 3, '90170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:30:00', '11:00:00');
INSERT INTO public.dependencias VALUES (39, 'Acomodação Luxo', 'Limpa', 2, '10170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '10:30:00');
INSERT INTO public.dependencias VALUES (40, 'Acomodação Simples', 'Suja', 1, '10170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (41, 'Acomodação Econômica', 'Limpa', 3, '11170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:30:00', '11:00:00');
INSERT INTO public.dependencias VALUES (42, 'Acomodação Vista Mar', 'Suja', 2, '11170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (43, 'Acomodação Familiar', 'Limpa', 4, '12170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:00:00', '10:00:00');
INSERT INTO public.dependencias VALUES (44, 'Acomodação Premium', 'Suja', 2, '12170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (45, 'Acomodação Simples', 'Limpa', 1, '13170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:30:00', '13:00:00');
INSERT INTO public.dependencias VALUES (46, 'Acomodação Luxo', 'Suja', 3, '13170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '11:30:00');
INSERT INTO public.dependencias VALUES (47, 'Acomodação Estrela', 'Limpa', 4, '14170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '10:30:00');
INSERT INTO public.dependencias VALUES (48, 'Acomodação Econômica', 'Suja', 2, '14170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '13:30:00');
INSERT INTO public.dependencias VALUES (49, 'Acomodação Familiar', 'Limpa', 4, '15170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:30:00', '10:30:00');
INSERT INTO public.dependencias VALUES (50, 'Acomodação Plus', 'Suja', 2, '15170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '12:30:00');
INSERT INTO public.dependencias VALUES (51, 'Acomodação Vista Mar', 'Limpa', 3, '16170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:30:00', '12:00:00');
INSERT INTO public.dependencias VALUES (52, 'Acomodação Econômica', 'Suja', 2, '16170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '11:30:00');
INSERT INTO public.dependencias VALUES (53, 'Acomodação Luxo', 'Limpa', 5, '17170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:00:00', '10:00:00');
INSERT INTO public.dependencias VALUES (54, 'Acomodação Econômica', 'Suja', 3, '17170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:30:00', '11:00:00');
INSERT INTO public.dependencias VALUES (55, 'Acomodação Vista Mar', 'Limpa', 4, '18170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '12:30:00');
INSERT INTO public.dependencias VALUES (56, 'Acomodação Estrela', 'Suja', 3, '18170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '13:00:00');
INSERT INTO public.dependencias VALUES (57, 'Acomodação Plus', 'Limpa', 3, '19170636000142', NULL, NULL, NULL, NULL, 1, NULL, '21:00:00', '12:00:00');
INSERT INTO public.dependencias VALUES (58, 'Acomodação Familiar', 'Suja', 2, '19170636000142', NULL, NULL, NULL, NULL, 1, NULL, '20:30:00', '10:30:00');
INSERT INTO public.dependencias VALUES (59, 'Acomodação Econômica', 'Limpa', 3, '20170636000142', NULL, NULL, NULL, NULL, 1, NULL, '22:00:00', '11:30:00');
INSERT INTO public.dependencias VALUES (60, 'Acomodação Luxo', 'Suja', 2, '20170636000142', NULL, NULL, NULL, NULL, 1, NULL, '23:00:00', '13:00:00');
INSERT INTO public.dependencias VALUES (61, 'Restaurante Internacional', 'Limpa', 80, '22170636000142', 1, NULL, NULL, NULL, NULL, NULL, '23:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (62, 'Piscina Panorâmica', 'Limpa', 40, '21170636000142', NULL, 1, NULL, NULL, NULL, NULL, '21:00:00', '06:30:00');
INSERT INTO public.dependencias VALUES (63, 'Auditório Empresarial', 'Limpa', 150, '20170636000142', NULL, NULL, 1, NULL, NULL, NULL, '22:00:00', '08:00:00');
INSERT INTO public.dependencias VALUES (64, 'Ambulatório de Especialidades', 'Limpa', 10, '19170636000142', NULL, NULL, NULL, 1, NULL, NULL, '20:00:00', '07:00:00');
INSERT INTO public.dependencias VALUES (65, 'Academia Wellness', 'Limpa', 20, '18170636000142', NULL, NULL, NULL, NULL, NULL, 1, '23:30:00', '05:30:00');
INSERT INTO public.dependencias VALUES (66, 'Outback', 'Limpa', 20, '40170636000142', NULL, NULL, NULL, NULL, NULL, 1, '23:30:00', '05:30:00');
INSERT INTO public.dependencias VALUES (67, 'Madero', 'Limpa', 20, '40170636000142', NULL, NULL, NULL, NULL, NULL, 1, '23:30:00', '05:30:00');


--
-- TOC entry 5127 (class 0 OID 18263)
-- Dependencies: 226
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entrada VALUES (3, 3, 0, 3);
INSERT INTO public.entrada VALUES (4, 4, 0, 4);
INSERT INTO public.entrada VALUES (5, 5, 0, 5);
INSERT INTO public.entrada VALUES (6, 6, 0, 6);
INSERT INTO public.entrada VALUES (7, 7, 0, 7);
INSERT INTO public.entrada VALUES (8, 8, 0, 8);
INSERT INTO public.entrada VALUES (9, 9, 0, 9);
INSERT INTO public.entrada VALUES (10, 10, 0, 10);
INSERT INTO public.entrada VALUES (11, 11, 0, 11);
INSERT INTO public.entrada VALUES (12, 12, 0, 12);
INSERT INTO public.entrada VALUES (13, 13, 0, 13);
INSERT INTO public.entrada VALUES (14, 14, 0, 14);
INSERT INTO public.entrada VALUES (15, 15, 0, 15);
INSERT INTO public.entrada VALUES (16, 16, 0, 16);
INSERT INTO public.entrada VALUES (18, 18, 0, 18);
INSERT INTO public.entrada VALUES (19, 19, 0, 19);
INSERT INTO public.entrada VALUES (20, 20, 0, 20);
INSERT INTO public.entrada VALUES (2, 2, 0, 2);
INSERT INTO public.entrada VALUES (1, 1, 0, 1);


--
-- TOC entry 5128 (class 0 OID 18266)
-- Dependencies: 227
-- Data for Name: espaco_de_eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.espaco_de_eventos VALUES (9, 1, 'Casamentos', 200);
INSERT INTO public.espaco_de_eventos VALUES (10, 2, 'Conferências', 300);
INSERT INTO public.espaco_de_eventos VALUES (11, 3, 'Reuniões corporativas', 150);
INSERT INTO public.espaco_de_eventos VALUES (12, 4, 'Festas de aniversário', 400);
INSERT INTO public.espaco_de_eventos VALUES (63, 5, 'Palestras e Conferências', 300);


--
-- TOC entry 5129 (class 0 OID 18269)
-- Dependencies: 228
-- Data for Name: estacionamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estacionamento VALUES (1, '10170636000142', 'Estacionamento Central', 120, 30);
INSERT INTO public.estacionamento VALUES (2, '19170636000142', 'Estacionamento Lateral', 100, 20);
INSERT INTO public.estacionamento VALUES (3, '22170636000142', 'Estacionamento Frontal', 100, 0);
INSERT INTO public.estacionamento VALUES (4, '50170636000142', 'Estacionamento Subsolo', 200, 50);
INSERT INTO public.estacionamento VALUES (5, '80170636000142', 'Estacionamento Externo', 100, 5);


--
-- TOC entry 5130 (class 0 OID 18272)
-- Dependencies: 229
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5131 (class 0 OID 18275)
-- Dependencies: 230
-- Data for Name: f_recebe_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.f_recebe_b VALUES (1, '51340576058');
INSERT INTO public.f_recebe_b VALUES (2, '40238972019');
INSERT INTO public.f_recebe_b VALUES (3, '30567891012');
INSERT INTO public.f_recebe_b VALUES (4, '12345678901');
INSERT INTO public.f_recebe_b VALUES (5, '98765432100');
INSERT INTO public.f_recebe_b VALUES (1, '67890123456');
INSERT INTO public.f_recebe_b VALUES (2, '23456789012');
INSERT INTO public.f_recebe_b VALUES (3, '89012345678');
INSERT INTO public.f_recebe_b VALUES (4, '34567890123');
INSERT INTO public.f_recebe_b VALUES (5, '45678901234');
INSERT INTO public.f_recebe_b VALUES (1, '11111111111');
INSERT INTO public.f_recebe_b VALUES (2, '22222222222');
INSERT INTO public.f_recebe_b VALUES (3, '33333333333');
INSERT INTO public.f_recebe_b VALUES (4, '44444444444');
INSERT INTO public.f_recebe_b VALUES (5, '55555555555');
INSERT INTO public.f_recebe_b VALUES (1, '66666666666');
INSERT INTO public.f_recebe_b VALUES (2, '77777777777');
INSERT INTO public.f_recebe_b VALUES (3, '88888888888');
INSERT INTO public.f_recebe_b VALUES (4, '99999999999');
INSERT INTO public.f_recebe_b VALUES (5, '10101010101');
INSERT INTO public.f_recebe_b VALUES (1, '12121212121');
INSERT INTO public.f_recebe_b VALUES (2, '13131313131');
INSERT INTO public.f_recebe_b VALUES (3, '14141414141');
INSERT INTO public.f_recebe_b VALUES (4, '15151515151');
INSERT INTO public.f_recebe_b VALUES (5, '16161616161');
INSERT INTO public.f_recebe_b VALUES (1, '17171717171');
INSERT INTO public.f_recebe_b VALUES (2, '18181818181');
INSERT INTO public.f_recebe_b VALUES (3, '19191919191');
INSERT INTO public.f_recebe_b VALUES (4, '20202020202');
INSERT INTO public.f_recebe_b VALUES (5, '21212121212');
INSERT INTO public.f_recebe_b VALUES (1, '30567891012');
INSERT INTO public.f_recebe_b VALUES (2, '12345678901');
INSERT INTO public.f_recebe_b VALUES (3, '67890123456');
INSERT INTO public.f_recebe_b VALUES (4, '23456789012');
INSERT INTO public.f_recebe_b VALUES (5, '89012345678');
INSERT INTO public.f_recebe_b VALUES (1, '34567890123');
INSERT INTO public.f_recebe_b VALUES (2, '45678901234');
INSERT INTO public.f_recebe_b VALUES (3, '11111111111');
INSERT INTO public.f_recebe_b VALUES (4, '22222222222');
INSERT INTO public.f_recebe_b VALUES (5, '33333333333');
INSERT INTO public.f_recebe_b VALUES (1, '44444444444');
INSERT INTO public.f_recebe_b VALUES (2, '55555555555');
INSERT INTO public.f_recebe_b VALUES (3, '66666666666');
INSERT INTO public.f_recebe_b VALUES (4, '77777777777');
INSERT INTO public.f_recebe_b VALUES (5, '88888888888');
INSERT INTO public.f_recebe_b VALUES (1, '99999999999');
INSERT INTO public.f_recebe_b VALUES (2, '10101010101');
INSERT INTO public.f_recebe_b VALUES (3, '12121212121');
INSERT INTO public.f_recebe_b VALUES (4, '13131313131');
INSERT INTO public.f_recebe_b VALUES (5, '14141414141');


--
-- TOC entry 5132 (class 0 OID 18278)
-- Dependencies: 231
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionario VALUES ('51340576058', 2100, 'João', 'Cesar', 'CLT', 'Auxiliar de limpeza', '30170636000142');
INSERT INTO public.funcionario VALUES ('40238972019', 2500, 'Maria', 'Silva', 'CLT', 'Recepcionista', '30170636000142');
INSERT INTO public.funcionario VALUES ('30567891012', 3100, 'Carlos', 'Pereira', 'CLT', 'Cozinheiro', '40170636000142');
INSERT INTO public.funcionario VALUES ('12345678901', 2200, 'Ana', 'Santos', 'CLT', 'Camareira', '40170636000142');
INSERT INTO public.funcionario VALUES ('98765432100', 4500, 'Roberto', 'Almeida', 'PJ', 'Gerente', '50170636000142');
INSERT INTO public.funcionario VALUES ('67890123456', 3000, 'Fernanda', 'Gomes', 'CLT', 'Atendente', '50170636000142');
INSERT INTO public.funcionario VALUES ('23456789012', 2800, 'Lucas', 'Rocha', 'CLT', 'Segurança', '60170636000142');
INSERT INTO public.funcionario VALUES ('89012345678', 2700, 'Bruna', 'Barros', 'CLT', 'Lavadeira', '60170636000142');
INSERT INTO public.funcionario VALUES ('34567890123', 2300, 'Gabriela', 'Souza', 'CLT', 'Barman', '70170636000142');
INSERT INTO public.funcionario VALUES ('45678901234', 5000, 'Eduardo', 'Vieira', 'PJ', 'Supervisor', '70170636000142');
INSERT INTO public.funcionario VALUES ('11111111111', 1900, 'Rafael', 'Moraes', 'CLT', 'Zelador', '80170636000142');
INSERT INTO public.funcionario VALUES ('22222222222', 2100, 'Paula', 'Fernandes', 'CLT', 'Recepcionista', '80170636000142');
INSERT INTO public.funcionario VALUES ('33333333333', 2600, 'André', 'Silva', 'CLT', 'Cozinheiro', '90170636000142');
INSERT INTO public.funcionario VALUES ('44444444444', 2900, 'Juliana', 'Lima', 'CLT', 'Camareira', '90170636000142');
INSERT INTO public.funcionario VALUES ('55555555555', 3500, 'Ricardo', 'Nascimento', 'PJ', 'Gerente', '10170636000142');
INSERT INTO public.funcionario VALUES ('66666666666', 3200, 'Camila', 'Gonçalves', 'CLT', 'Atendente', '10170636000142');
INSERT INTO public.funcionario VALUES ('77777777777', 2400, 'Felipe', 'Souza', 'CLT', 'Segurança', '11170636000142');
INSERT INTO public.funcionario VALUES ('88888888888', 2700, 'Larissa', 'Ribeiro', 'CLT', 'Lavadeira', '11170636000142');
INSERT INTO public.funcionario VALUES ('99999999999', 2200, 'Diego', 'Barbosa', 'CLT', 'Barman', '12170636000142');
INSERT INTO public.funcionario VALUES ('10101010101', 4800, 'Patrícia', 'Alves', 'PJ', 'Supervisor', '12170636000142');
INSERT INTO public.funcionario VALUES ('12121212121', 2000, 'Pedro', 'Costa', 'CLT', 'Zelador', '13170636000142');
INSERT INTO public.funcionario VALUES ('13131313131', 2500, 'Aline', 'Martins', 'CLT', 'Recepcionista', '13170636000142');
INSERT INTO public.funcionario VALUES ('14141414141', 3000, 'Renato', 'Menezes', 'CLT', 'Cozinheiro', '14170636000142');
INSERT INTO public.funcionario VALUES ('15151515151', 3300, 'Cláudia', 'Carvalho', 'CLT', 'Camareira', '14170636000142');
INSERT INTO public.funcionario VALUES ('16161616161', 4000, 'Thiago', 'Pinto', 'PJ', 'Gerente', '15170636000142');
INSERT INTO public.funcionario VALUES ('17171717171', 3100, 'Monica', 'Dias', 'CLT', 'Atendente', '15170636000142');
INSERT INTO public.funcionario VALUES ('18181818181', 2500, 'Leandro', 'Santos', 'CLT', 'Segurança', '16170636000142');
INSERT INTO public.funcionario VALUES ('19191919191', 2800, 'Roberta', 'Moura', 'CLT', 'Lavadeira', '16170636000142');
INSERT INTO public.funcionario VALUES ('20202020202', 2200, 'Daniel', 'Oliveira', 'CLT', 'Barman', '17170636000142');
INSERT INTO public.funcionario VALUES ('21212121212', 4700, 'Isabela', 'Freitas', 'PJ', 'Supervisor', '17170636000142');
INSERT INTO public.funcionario VALUES ('12345678910', 3200, 'Fernando', 'Alves', 'CLT', 'Recepcionista', '20170636000142');
INSERT INTO public.funcionario VALUES ('12345678911', 2800, 'Juliana', 'Silva', 'CLT', 'Camareira', '20170636000142');
INSERT INTO public.funcionario VALUES ('22345678912', 4500, 'Lucas', 'Souza', 'CLT', 'Gerente', '22170636000142');
INSERT INTO public.funcionario VALUES ('22345678913', 3100, 'Paula', 'Gomes', 'CLT', 'Cozinheira', '22170636000142');
INSERT INTO public.funcionario VALUES ('32345678914', 3000, 'Ricardo', 'Nascimento', 'CLT', 'Barman', '19170636000142');
INSERT INTO public.funcionario VALUES ('32345678915', 2500, 'Carla', 'Pereira', 'CLT', 'Atendente', '19170636000142');
INSERT INTO public.funcionario VALUES ('42345678916', 2900, 'André', 'Lima', 'CLT', 'Zelador', '21170636000142');
INSERT INTO public.funcionario VALUES ('42345678917', 2700, 'Bruna', 'Ramos', 'CLT', 'Camareira', '21170636000142');
INSERT INTO public.funcionario VALUES ('52345678918', 3500, 'Thiago', 'Oliveira', 'CLT', 'Supervisor', '18170636000142');
INSERT INTO public.funcionario VALUES ('52345678919', 2400, 'Isabela', 'Costa', 'CLT', 'Lavadeira', '18170636000142');


--
-- TOC entry 5133 (class 0 OID 18281)
-- Dependencies: 232
-- Data for Name: h_consome_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.h_consome_item VALUES ('18573383089', 1, 1);
INSERT INTO public.h_consome_item VALUES ('23456789012', 2, 2);
INSERT INTO public.h_consome_item VALUES ('34567890123', 3, 1);
INSERT INTO public.h_consome_item VALUES ('45678901234', 4, 1);
INSERT INTO public.h_consome_item VALUES ('56789012345', 5, 2);
INSERT INTO public.h_consome_item VALUES ('67890123456', 6, 1);
INSERT INTO public.h_consome_item VALUES ('78901234567', 7, 1);
INSERT INTO public.h_consome_item VALUES ('89012345678', 8, 3);
INSERT INTO public.h_consome_item VALUES ('90123456789', 9, 1);
INSERT INTO public.h_consome_item VALUES ('12345678901', 10, 1);


--
-- TOC entry 5134 (class 0 OID 18284)
-- Dependencies: 233
-- Data for Name: hospede; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hospede VALUES ('18573383089', 'Caio', 'Almeida', '11968144641', 'caio@gmail.com');
INSERT INTO public.hospede VALUES ('23456789012', 'Mariana', 'Silva', '21998877654', 'mariana@gmail.com');
INSERT INTO public.hospede VALUES ('34567890123', 'Lucas', 'Santos', '31998765432', 'lucas@gmail.com');
INSERT INTO public.hospede VALUES ('45678901234', 'Ana', 'Pereira', '41987654321', 'ana@gmail.com');
INSERT INTO public.hospede VALUES ('56789012345', 'João', 'Souza', '51976543210', 'joao@gmail.com');
INSERT INTO public.hospede VALUES ('67890123456', 'Fernanda', 'Oliveira', '61965432109', 'fernanda@gmail.com');
INSERT INTO public.hospede VALUES ('78901234567', 'Pedro', 'Gomes', '71954321098', 'pedro@gmail.com');
INSERT INTO public.hospede VALUES ('89012345678', 'Beatriz', 'Barros', '81943210987', 'beatriz@gmail.com');
INSERT INTO public.hospede VALUES ('90123456789', 'Rafael', 'Costa', '91932109876', 'rafael@gmail.com');
INSERT INTO public.hospede VALUES ('12345678901', 'Camila', 'Nascimento', '11921098765', 'camila@gmail.com');
INSERT INTO public.hospede VALUES ('23456789022', 'Gabriel', 'Mendes', '21987654321', 'gabriel@gmail.com');
INSERT INTO public.hospede VALUES ('34567890124', 'Isabela', 'Martins', '31976543210', 'isabela@gmail.com');
INSERT INTO public.hospede VALUES ('45678901235', 'Thiago', 'Lima', '41965432109', 'thiago@gmail.com');
INSERT INTO public.hospede VALUES ('56789012346', 'Juliana', 'Ferreira', '51954321098', 'juliana@gmail.com');
INSERT INTO public.hospede VALUES ('67890123457', 'Rodrigo', 'Carvalho', '61943210987', 'rodrigo@gmail.com');
INSERT INTO public.hospede VALUES ('78901234568', 'Bruna', 'Monteiro', '71932109876', 'bruna@gmail.com');
INSERT INTO public.hospede VALUES ('89012345679', 'André', 'Ribeiro', '81921098765', 'andre@gmail.com');
INSERT INTO public.hospede VALUES ('90123456780', 'Larissa', 'Moura', '91910987654', 'larissa@gmail.com');
INSERT INTO public.hospede VALUES ('12345678902', 'Marcelo', 'Duarte', '11900987654', 'marcelo@gmail.com');
INSERT INTO public.hospede VALUES ('23456789033', 'Patrícia', 'Azevedo', '21912345678', 'patricia@gmail.com');


--
-- TOC entry 5135 (class 0 OID 18287)
-- Dependencies: 234
-- Data for Name: hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hospital VALUES (1, '12345678000190', 'Hospital São Cristóvão', 150);
INSERT INTO public.hospital VALUES (2, '23456789000180', 'Hospital Vida Saudável', 220);
INSERT INTO public.hospital VALUES (3, '34567890000170', 'Hospital Esperança', 180);
INSERT INTO public.hospital VALUES (4, '45678901000160', 'Hospital Nova Saúde', 90);
INSERT INTO public.hospital VALUES (5, '56789012000150', 'Hospital Senior ', 250);


--
-- TOC entry 5136 (class 0 OID 18290)
-- Dependencies: 235
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hotel VALUES (1, 'Unidade Paulista', 4);
INSERT INTO public.hotel VALUES (2, 'Hotel Luxor Palace', 5);
INSERT INTO public.hotel VALUES (3, 'Hotel Bela Vista', 3);
INSERT INTO public.hotel VALUES (4, 'Hotel Paraíso Tropical', 4);
INSERT INTO public.hotel VALUES (5, 'Hotel Central Plaza', 4);
INSERT INTO public.hotel VALUES (6, 'Hotel Mar Azul', 5);
INSERT INTO public.hotel VALUES (7, 'Hotel Pousada das Flores', 3);
INSERT INTO public.hotel VALUES (8, 'Hotel Bosque Encantado', 4);
INSERT INTO public.hotel VALUES (9, 'Hotel Monte Alegre', 4);
INSERT INTO public.hotel VALUES (10, 'Hotel Sol e Mar', 5);


--
-- TOC entry 5137 (class 0 OID 18293)
-- Dependencies: 236
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item VALUES (1, 'Água Mineral Bonafont', 'Bebida');
INSERT INTO public.item VALUES (2, 'Refrigerante Coca-Cola', 'Bebida');
INSERT INTO public.item VALUES (3, 'Cerveja Heineken', 'Bebida');
INSERT INTO public.item VALUES (4, 'Chocolate Lindt Excellence', 'Comida');
INSERT INTO public.item VALUES (5, 'Batata Chips Ruffles Original', 'Comida');
INSERT INTO public.item VALUES (6, 'Vinho Tinto Casillero del Diablo', 'Bebida');
INSERT INTO public.item VALUES (7, 'Whisky Johnnie Walker Black Label', 'Bebida');
INSERT INTO public.item VALUES (8, 'Suco de Laranja Natural One', 'Bebida');
INSERT INTO public.item VALUES (9, 'Sanduíche Subway Italiano', 'Comida');
INSERT INTO public.item VALUES (10, 'Sorvete Häagen-Dazs Baunilha', 'Comida');


--
-- TOC entry 5138 (class 0 OID 18296)
-- Dependencies: 237
-- Data for Name: item_sai_do_e; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5139 (class 0 OID 18299)
-- Dependencies: 238
-- Data for Name: m_trabalhapara_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.m_trabalhapara_a VALUES (1, '97491220037');
INSERT INTO public.m_trabalhapara_a VALUES (2, '85296374128');
INSERT INTO public.m_trabalhapara_a VALUES (3, '74185296345');
INSERT INTO public.m_trabalhapara_a VALUES (4, '96385274129');
INSERT INTO public.m_trabalhapara_a VALUES (9, '15975348621');


--
-- TOC entry 5140 (class 0 OID 18302)
-- Dependencies: 239
-- Data for Name: medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicamento VALUES (1, '2030-12-25', 'Dipirona monoidratada', 'Liquido', 10);
INSERT INTO public.medicamento VALUES (2, '2029-08-15', 'Paracetamol', 'Comprimido', 500);
INSERT INTO public.medicamento VALUES (3, '2032-05-30', 'Ibuprofeno', 'Cápsula', 200);
INSERT INTO public.medicamento VALUES (4, '2031-11-10', 'Amoxicilina', 'Suspensão', 250);
INSERT INTO public.medicamento VALUES (5, '2028-03-22', 'Omeprazol', 'Cápsula', 20);


--
-- TOC entry 5141 (class 0 OID 18305)
-- Dependencies: 240
-- Data for Name: medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medico VALUES ('97491220037', 'CRM/SP 123456', 'Paulo', ' Roberto');
INSERT INTO public.medico VALUES ('85296374128', 'CRM/RJ 789123', 'Ana', 'Silva');
INSERT INTO public.medico VALUES ('74185296345', 'CRM/MG 456789', 'Carlos', 'Oliveira');
INSERT INTO public.medico VALUES ('96385274129', 'CRM/RS 321654', 'Mariana', 'Santos');
INSERT INTO public.medico VALUES ('15975348621', 'CRM/BA 987654', 'Rafael', 'Pereira');


--
-- TOC entry 5142 (class 0 OID 18308)
-- Dependencies: 241
-- Data for Name: movimentacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movimentacao VALUES (1, 1200, 'Reserva de Quarto', '2024-11-23', 'Crédito à vista', NULL, 1);
INSERT INTO public.movimentacao VALUES (2, 2500, 'Reserva de Quarto', '2024-11-30', 'Crédito à vista', NULL, 1);
INSERT INTO public.movimentacao VALUES (3, 3000, 'Reserva de Quarto', '2023-08-14', 'Débito', NULL, 1);
INSERT INTO public.movimentacao VALUES (4, 900, 'Reserva de Quarto', '2024-10-31', 'PIX', NULL, 1);
INSERT INTO public.movimentacao VALUES (5, 1500, 'Reserva de Quarto', '2022-05-09', 'Transferência Bancária', NULL, 1);
INSERT INTO public.movimentacao VALUES (6, 1800, 'Reserva de Quarto', '2025-03-09', 'Crédito à vista', NULL, 1);
INSERT INTO public.movimentacao VALUES (7, 3500, 'Reserva de Quarto', '2023-12-19', 'Débito', NULL, 1);
INSERT INTO public.movimentacao VALUES (8, 2000, 'Reserva de Quarto', '2024-10-09', 'PIX', NULL, 1);
INSERT INTO public.movimentacao VALUES (9, 2800, 'Reserva de Quarto', '2024-06-30', 'Transferência Bancária', NULL, 1);
INSERT INTO public.movimentacao VALUES (10, 1000, 'Reserva de Quarto', '2023-02-28', 'Crédito à vista', NULL, 1);
INSERT INTO public.movimentacao VALUES (11, 3200, 'Reserva de Quarto', '2024-11-27', 'Débito', NULL, 1);
INSERT INTO public.movimentacao VALUES (12, 1800, 'Reserva de Quarto', '2023-05-14', 'Transferência Bancária', NULL, 1);
INSERT INTO public.movimentacao VALUES (13, 4200, 'Reserva de Quarto', '2025-01-04', 'Crédito à vista', NULL, 1);
INSERT INTO public.movimentacao VALUES (14, 900, 'Reserva de Quarto', '2023-08-31', 'Débito', NULL, 1);
INSERT INTO public.movimentacao VALUES (15, 3000, 'Reserva de Quarto', '2024-12-23', 'PIX', NULL, 1);
INSERT INTO public.movimentacao VALUES (16, 2300, 'Reserva de Quarto', '2023-10-19', 'Transferência Bancária', NULL, 1);
INSERT INTO public.movimentacao VALUES (18, 950, 'Reserva de Quarto', '2023-06-14', 'Débito', NULL, 1);
INSERT INTO public.movimentacao VALUES (19, 2700, 'Reserva de Quarto', '2024-02-13', 'PIX', NULL, 1);
INSERT INTO public.movimentacao VALUES (20, 1900, 'Reserva de Quarto', '2025-03-31', 'Transferência Bancária', NULL, 1);
INSERT INTO public.movimentacao VALUES (21, 22000, 'Compra de material de limpeza', '2024-11-23', 'Boleto', 1, NULL);
INSERT INTO public.movimentacao VALUES (22, 15000, 'Pagamento de fornecedores de alimentos', '2024-11-22', 'Transferência Bancária', 1, NULL);
INSERT INTO public.movimentacao VALUES (23, 8000, 'Manutenção de equipamentos', '2024-11-20', 'Cartão de Crédito', 1, NULL);
INSERT INTO public.movimentacao VALUES (24, 12000, 'Reparos na infraestrutura (pintura e encanamento)', '2024-11-19', 'PIX', 1, NULL);
INSERT INTO public.movimentacao VALUES (25, 18000, 'Pagamento de funcionários (folha de pagamento)', '2024-11-18', 'Transferência Bancária', 1, NULL);
INSERT INTO public.movimentacao VALUES (26, 5000, 'Compra de uniformes para funcionários', '2024-11-17', 'Boleto', 1, NULL);
INSERT INTO public.movimentacao VALUES (27, 10000, 'Gastos com publicidade e marketing', '2024-11-15', 'Cartão de Crédito', 1, NULL);
INSERT INTO public.movimentacao VALUES (28, 7000, 'Assinatura de softwares de gestão', '2024-11-14', 'PIX', 1, NULL);
INSERT INTO public.movimentacao VALUES (29, 3000, 'Compra de itens de papelaria e escritório', '2024-11-13', 'Boleto', 1, NULL);
INSERT INTO public.movimentacao VALUES (30, 25000, 'Pagamento de contas de energia e água', '2024-11-12', 'Transferência Bancária', 1, NULL);


--
-- TOC entry 5143 (class 0 OID 18314)
-- Dependencies: 242
-- Data for Name: nota_fiscal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nota_fiscal VALUES (1, 1, '<nota_fiscal><idmov>1</idmov><descricao>Reserva de Quarto</descricao><valor>1200.0</valor><data>2024-11-23</data><forma_pagamento>Crédito à vista</forma_pagamento></nota_fiscal>', 1, '2024-11-23');
INSERT INTO public.nota_fiscal VALUES (2, 2, '<nota_fiscal><idmov>2</idmov><descricao>Reserva de Quarto</descricao><valor>2500.0</valor><data>2024-11-30</data><forma_pagamento>Crédito à vista</forma_pagamento></nota_fiscal>', 2, '2024-11-30');
INSERT INTO public.nota_fiscal VALUES (3, 3, '<nota_fiscal><idmov>3</idmov><descricao>Reserva de Quarto</descricao><valor>3000.0</valor><data>2023-08-14</data><forma_pagamento>Débito</forma_pagamento></nota_fiscal>', 3, '2023-08-14');
INSERT INTO public.nota_fiscal VALUES (4, 4, '<nota_fiscal><idmov>4</idmov><descricao>Reserva de Quarto</descricao><valor>900.0</valor><data>2024-10-31</data><forma_pagamento>PIX</forma_pagamento></nota_fiscal>', 4, '2024-10-31');
INSERT INTO public.nota_fiscal VALUES (5, 5, '<nota_fiscal><idmov>5</idmov><descricao>Reserva de Quarto</descricao><valor>1500.0</valor><data>2022-05-09</data><forma_pagamento>Transferência Bancária</forma_pagamento></nota_fiscal>', 5, '2022-05-09');
INSERT INTO public.nota_fiscal VALUES (6, 6, '<nota_fiscal><idmov>6</idmov><descricao>Reserva de Quarto</descricao><valor>1800.0</valor><data>2025-03-09</data><forma_pagamento>Crédito à vista</forma_pagamento></nota_fiscal>', 6, '2025-03-09');
INSERT INTO public.nota_fiscal VALUES (7, 7, '<nota_fiscal><idmov>7</idmov><descricao>Reserva de Quarto</descricao><valor>3500.0</valor><data>2023-12-19</data><forma_pagamento>Débito</forma_pagamento></nota_fiscal>', 7, '2023-12-19');
INSERT INTO public.nota_fiscal VALUES (8, 8, '<nota_fiscal><idmov>8</idmov><descricao>Reserva de Quarto</descricao><valor>2000.0</valor><data>2024-10-09</data><forma_pagamento>PIX</forma_pagamento></nota_fiscal>', 8, '2024-10-09');
INSERT INTO public.nota_fiscal VALUES (9, 9, '<nota_fiscal><idmov>9</idmov><descricao>Reserva de Quarto</descricao><valor>2800.0</valor><data>2024-06-30</data><forma_pagamento>Transferência Bancária</forma_pagamento></nota_fiscal>', 9, '2024-06-30');
INSERT INTO public.nota_fiscal VALUES (10, 10, '<nota_fiscal><idmov>10</idmov><descricao>Reserva de Quarto</descricao><valor>1000.0</valor><data>2023-02-28</data><forma_pagamento>Crédito à vista</forma_pagamento></nota_fiscal>', 10, '2023-02-28');
INSERT INTO public.nota_fiscal VALUES (11, 11, '<nota_fiscal><idmov>11</idmov><descricao>Reserva de Quarto</descricao><valor>3200.0</valor><data>2024-11-27</data><forma_pagamento>Débito</forma_pagamento></nota_fiscal>', 11, '2024-11-27');
INSERT INTO public.nota_fiscal VALUES (12, 12, '<nota_fiscal><idmov>12</idmov><descricao>Reserva de Quarto</descricao><valor>1800.0</valor><data>2023-05-14</data><forma_pagamento>Transferência Bancária</forma_pagamento></nota_fiscal>', 12, '2023-05-14');
INSERT INTO public.nota_fiscal VALUES (13, 13, '<nota_fiscal><idmov>13</idmov><descricao>Reserva de Quarto</descricao><valor>4200.0</valor><data>2025-01-04</data><forma_pagamento>Crédito à vista</forma_pagamento></nota_fiscal>', 13, '2025-01-04');
INSERT INTO public.nota_fiscal VALUES (14, 14, '<nota_fiscal><idmov>14</idmov><descricao>Reserva de Quarto</descricao><valor>900.0</valor><data>2023-08-31</data><forma_pagamento>Débito</forma_pagamento></nota_fiscal>', 14, '2023-08-31');
INSERT INTO public.nota_fiscal VALUES (15, 15, '<nota_fiscal><idmov>15</idmov><descricao>Reserva de Quarto</descricao><valor>3000.0</valor><data>2024-12-23</data><forma_pagamento>PIX</forma_pagamento></nota_fiscal>', 15, '2024-12-23');
INSERT INTO public.nota_fiscal VALUES (16, 16, '<nota_fiscal><idmov>16</idmov><descricao>Reserva de Quarto</descricao><valor>2300.0</valor><data>2023-10-19</data><forma_pagamento>Transferência Bancária</forma_pagamento></nota_fiscal>', 16, '2023-10-19');
INSERT INTO public.nota_fiscal VALUES (18, 18, '<nota_fiscal><idmov>18</idmov><descricao>Reserva de Quarto</descricao><valor>950.0</valor><data>2023-06-14</data><forma_pagamento>Débito</forma_pagamento></nota_fiscal>', 18, '2023-06-14');
INSERT INTO public.nota_fiscal VALUES (19, 19, '<nota_fiscal><idmov>19</idmov><descricao>Reserva de Quarto</descricao><valor>2700.0</valor><data>2024-02-13</data><forma_pagamento>PIX</forma_pagamento></nota_fiscal>', 19, '2024-02-13');
INSERT INTO public.nota_fiscal VALUES (20, 20, '<nota_fiscal><idmov>20</idmov><descricao>Reserva de Quarto</descricao><valor>1900.0</valor><data>2025-03-31</data><forma_pagamento>Transferência Bancária</forma_pagamento></nota_fiscal>', 20, '2025-03-31');


--
-- TOC entry 5144 (class 0 OID 18319)
-- Dependencies: 243
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paciente VALUES ('77292486037', 'Acompanhante Hóspede', 16, 40, 'Afogamento', 1);
INSERT INTO public.paciente VALUES ('85471362048', 'Hóspede', 45, 70.5, 'Pressão Alta', 2);
INSERT INTO public.paciente VALUES ('96521473059', 'Acompanhante Hóspede', 30, 65, 'Luxação no Braço', 3);
INSERT INTO public.paciente VALUES ('74652183060', 'Hóspede', 28, 55, 'Intoxicação Alimentar', 4);
INSERT INTO public.paciente VALUES ('32345678914', 'Funcionário', 35, 80, 'Corte na Mão', 9);


--
-- TOC entry 5145 (class 0 OID 18322)
-- Dependencies: 244
-- Data for Name: pertence_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pertence_a VALUES (1, 1);
INSERT INTO public.pertence_a VALUES (2, 1);
INSERT INTO public.pertence_a VALUES (3, 2);
INSERT INTO public.pertence_a VALUES (4, 3);
INSERT INTO public.pertence_a VALUES (5, 5);


--
-- TOC entry 5146 (class 0 OID 18325)
-- Dependencies: 245
-- Data for Name: piscina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.piscina VALUES (5, 1, 200, 20, '1', '0');
INSERT INTO public.piscina VALUES (6, 2, 150, 28, '1', '1');
INSERT INTO public.piscina VALUES (7, 3, 100, 25, '0', '0');
INSERT INTO public.piscina VALUES (8, 4, 250, 30, '1', '1');
INSERT INTO public.piscina VALUES (62, 5, 300, 27, '0', '1');


--
-- TOC entry 5147 (class 0 OID 18328)
-- Dependencies: 246
-- Data for Name: programa_de_fidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programa_de_fidelidade VALUES (1, 'Desconto em hospedagem', 20, 8, 1);
INSERT INTO public.programa_de_fidelidade VALUES (2, 'Desconto em alimentação', 15, 9, 2);
INSERT INTO public.programa_de_fidelidade VALUES (3, 'Pontos de fidelidade', 50, 1, 3);
INSERT INTO public.programa_de_fidelidade VALUES (4, 'Upgrade de quarto', 100, 2, 4);
INSERT INTO public.programa_de_fidelidade VALUES (5, 'Desconto em hospedagem', 25, 3, 5);
INSERT INTO public.programa_de_fidelidade VALUES (6, 'Desconto em alimentação', 10, 3, 6);
INSERT INTO public.programa_de_fidelidade VALUES (7, 'Pontos de fidelidade', 70, 4, 7);
INSERT INTO public.programa_de_fidelidade VALUES (8, 'Upgrade de quarto', 80, 4, 8);
INSERT INTO public.programa_de_fidelidade VALUES (9, 'Desconto em hospedagem', 30, 5, 9);
INSERT INTO public.programa_de_fidelidade VALUES (10, 'Desconto em alimentação', 20, 5, 10);
INSERT INTO public.programa_de_fidelidade VALUES (11, 'Pontos de fidelidade', 60, 6, 11);
INSERT INTO public.programa_de_fidelidade VALUES (12, 'Upgrade de quarto', 90, 6, 12);
INSERT INTO public.programa_de_fidelidade VALUES (13, 'Desconto em hospedagem', 40, 7, 13);
INSERT INTO public.programa_de_fidelidade VALUES (14, 'Desconto em alimentação', 18, 7, 14);
INSERT INTO public.programa_de_fidelidade VALUES (15, 'Pontos de fidelidade', 55, 7, 15);
INSERT INTO public.programa_de_fidelidade VALUES (16, 'Upgrade de quarto', 75, 8, 16);
INSERT INTO public.programa_de_fidelidade VALUES (18, 'Desconto em alimentação', 22, 1, 18);
INSERT INTO public.programa_de_fidelidade VALUES (19, 'Pontos de fidelidade', 65, 1, 19);
INSERT INTO public.programa_de_fidelidade VALUES (20, 'Upgrade de quarto', 95, 8, 20);


--
-- TOC entry 5148 (class 0 OID 18331)
-- Dependencies: 247
-- Data for Name: r_inclui_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.r_inclui_a VALUES (1, 1);
INSERT INTO public.r_inclui_a VALUES (2, 2);
INSERT INTO public.r_inclui_a VALUES (3, 3);
INSERT INTO public.r_inclui_a VALUES (4, 4);
INSERT INTO public.r_inclui_a VALUES (5, 5);
INSERT INTO public.r_inclui_a VALUES (6, 6);
INSERT INTO public.r_inclui_a VALUES (7, 7);
INSERT INTO public.r_inclui_a VALUES (8, 8);
INSERT INTO public.r_inclui_a VALUES (9, 9);
INSERT INTO public.r_inclui_a VALUES (10, 10);
INSERT INTO public.r_inclui_a VALUES (11, 11);
INSERT INTO public.r_inclui_a VALUES (12, 12);
INSERT INTO public.r_inclui_a VALUES (13, 13);
INSERT INTO public.r_inclui_a VALUES (14, 14);
INSERT INTO public.r_inclui_a VALUES (15, 15);
INSERT INTO public.r_inclui_a VALUES (16, 16);
INSERT INTO public.r_inclui_a VALUES (17, 15);
INSERT INTO public.r_inclui_a VALUES (18, 18);
INSERT INTO public.r_inclui_a VALUES (19, 19);
INSERT INTO public.r_inclui_a VALUES (20, 20);
INSERT INTO public.r_inclui_a VALUES (1, 20);
INSERT INTO public.r_inclui_a VALUES (20, 18);
INSERT INTO public.r_inclui_a VALUES (15, 12);


--
-- TOC entry 5149 (class 0 OID 18334)
-- Dependencies: 248
-- Data for Name: requisicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requisicao VALUES (1, '18573383089', 'Aberta', '2024-11-24 12:00:00', NULL, 'Dúvida', 'Onde posso ver os valores dos itens no meu frigobar? ', NULL);
INSERT INTO public.requisicao VALUES (2, '18573383089', 'Atendida', '2024-11-24 12:30:00', '2024-11-25 14:00:00', 'Dúvida', 'Onde posso ver os valores dos itens no meu frigobar?', '10101010101');
INSERT INTO public.requisicao VALUES (3, '23456789012', 'Cancelada', '2024-12-02 09:00:00', '2024-12-02 10:30:00', 'Reclamação', 'A temperatura do ar-condicionado não está ajustando corretamente.', '22222222222');
INSERT INTO public.requisicao VALUES (4, '34567890123', 'Atendida', '2023-08-17 11:00:00', '2023-08-18 18:00:00', 'Dúvida', 'Como faço para solicitar o serviço de quarto?', '40238972019');
INSERT INTO public.requisicao VALUES (5, '89012345678', 'Atendida', '2024-10-12 10:00:00', '2024-10-12 12:00:00', 'Reclamação', 'A piscina estava com temperatura inadequada.', '98765432100');


--
-- TOC entry 5150 (class 0 OID 18339)
-- Dependencies: 249
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva VALUES (1, '2024-11-24 10:00:00', '2024-11-26 12:00:00', 1200, 3, '18573383089');
INSERT INTO public.reserva VALUES (2, '2024-12-01 14:00:00', '2024-12-05 12:00:00', 2500, 2, '23456789012');
INSERT INTO public.reserva VALUES (3, '2023-08-15 10:00:00', '2023-08-20 12:00:00', 3000, 4, '34567890123');
INSERT INTO public.reserva VALUES (5, '2022-05-10 12:00:00', '2022-05-15 10:00:00', 1500, 3, '56789012345');
INSERT INTO public.reserva VALUES (6, '2025-03-10 14:00:00', '2025-03-12 12:00:00', 1800, 2, '67890123456');
INSERT INTO public.reserva VALUES (7, '2023-12-20 13:00:00', '2023-12-25 11:00:00', 3500, 4, '78901234567');
INSERT INTO public.reserva VALUES (10, '2023-03-01 14:00:00', '2023-03-05 10:00:00', 1000, 1, '12345678901');
INSERT INTO public.reserva VALUES (11, '2024-11-28 15:00:00', '2024-12-02 12:00:00', 3200, 5, '23456789022');
INSERT INTO public.reserva VALUES (12, '2023-05-15 12:00:00', '2023-05-20 12:00:00', 1800, 2, '34567890124');
INSERT INTO public.reserva VALUES (13, '2025-01-05 14:00:00', '2025-01-10 12:00:00', 4200, 4, '45678901235');
INSERT INTO public.reserva VALUES (14, '2023-09-01 10:00:00', '2023-09-03 12:00:00', 900, 1, '56789012346');
INSERT INTO public.reserva VALUES (15, '2024-12-24 16:00:00', '2024-12-27 12:00:00', 3000, 3, '67890123457');
INSERT INTO public.reserva VALUES (16, '2023-10-20 14:00:00', '2023-10-25 11:00:00', 2300, 2, '78901234568');
INSERT INTO public.reserva VALUES (18, '2023-06-15 13:00:00', '2023-06-18 12:00:00', 950, 1, '90123456780');
INSERT INTO public.reserva VALUES (19, '2024-02-14 12:00:00', '2024-02-20 12:00:00', 2700, 2, '12345678902');
INSERT INTO public.reserva VALUES (20, '2025-04-01 15:00:00', '2025-04-05 11:00:00', 1900, 3, '23456789033');
INSERT INTO public.reserva VALUES (4, '2024-11-23 10:00:00', '2024-11-24 18:00:00', 900, 1, '45678901234');
INSERT INTO public.reserva VALUES (8, '2024-11-21 10:00:00', '2024-11-25 18:00:00', 2000, 3, '89012345678');
INSERT INTO public.reserva VALUES (9, '2024-11-22 10:00:00', '2024-11-28 18:00:00', 2800, 2, '90123456789');


--
-- TOC entry 5151 (class 0 OID 18342)
-- Dependencies: 250
-- Data for Name: restaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurante VALUES (1, 1, 4, 'Comida brasileira');
INSERT INTO public.restaurante VALUES (2, 2, 5, 'Culinária italiana');
INSERT INTO public.restaurante VALUES (3, 3, 4, 'Culinária japonesa');
INSERT INTO public.restaurante VALUES (4, 4, 3, 'Comida mineira');
INSERT INTO public.restaurante VALUES (61, 5, 5, 'Culinária internacional');
INSERT INTO public.restaurante VALUES (66, 6, 4, 'Culinária internacional');
INSERT INTO public.restaurante VALUES (67, 7, 3, 'Hamburgueria');


--
-- TOC entry 5152 (class 0 OID 18345)
-- Dependencies: 251
-- Data for Name: robo_de_delivey; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.robo_de_delivey VALUES (1, '2024-11-25', 'X-Bacon', 1, 'Bullguers', '19170636000142', 1);
INSERT INTO public.robo_de_delivey VALUES (2, '2024-12-03', 'Paracetamol 500mg', 2, 'Farmácia Saúde Já', '20170636000142', 2);
INSERT INTO public.robo_de_delivey VALUES (3, '2023-08-17', 'Pizza Marguerita', 1, 'Pizzaria La Bella', '21170636000142', 3);
INSERT INTO public.robo_de_delivey VALUES (4, '2024-10-02', 'Shampoo Anticaspa', 3, 'Drogaria Bem Estar', '60170636000142', 8);
INSERT INTO public.robo_de_delivey VALUES (5, '2024-12-24', 'Cesta de Frutas', 1, 'Empório Natural Vida', '11170636000142', 15);


--
-- TOC entry 5153 (class 0 OID 18348)
-- Dependencies: 252
-- Data for Name: saida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.saida VALUES (21, 1, 'Fornecedor Higiclear');
INSERT INTO public.saida VALUES (22, 2, 'Fornecedor Alimentos Fresh');
INSERT INTO public.saida VALUES (23, 3, 'Manutenção Equipamentos MaxRepair');
INSERT INTO public.saida VALUES (24, 4, 'Construtora BuildUp');
INSERT INTO public.saida VALUES (25, 5, 'Equipe de RH Soluções');
INSERT INTO public.saida VALUES (26, 6, 'Uniformes Profissionais UniformEx');
INSERT INTO public.saida VALUES (27, 7, 'Agência MarketingPlus');
INSERT INTO public.saida VALUES (28, 8, 'Software Gestão Hotelar CloudManage');
INSERT INTO public.saida VALUES (29, 9, 'Papelaria OfficeCenter');
INSERT INTO public.saida VALUES (30, 10, 'Companhia de Energia e Água UtilityCo');


--
-- TOC entry 5154 (class 0 OID 18351)
-- Dependencies: 253
-- Data for Name: setor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setor VALUES (1, 100, 'trabalho');
INSERT INTO public.setor VALUES (2, 200, 'hotéis para família');
INSERT INTO public.setor VALUES (3, 150, 'hotéis para adultos');
INSERT INTO public.setor VALUES (4, 50, 'hotéis que permitem pets');


--
-- TOC entry 5155 (class 0 OID 18354)
-- Dependencies: 254
-- Data for Name: u_realiza_m; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.u_realiza_m VALUES (1, '19170636000142');
INSERT INTO public.u_realiza_m VALUES (2, '20170636000142');
INSERT INTO public.u_realiza_m VALUES (3, '21170636000142');
INSERT INTO public.u_realiza_m VALUES (4, '22170636000142');
INSERT INTO public.u_realiza_m VALUES (5, '50170636000142');
INSERT INTO public.u_realiza_m VALUES (6, '50170636000142');
INSERT INTO public.u_realiza_m VALUES (7, '60170636000142');
INSERT INTO public.u_realiza_m VALUES (8, '60170636000142');
INSERT INTO public.u_realiza_m VALUES (9, '70170636000142');
INSERT INTO public.u_realiza_m VALUES (10, '70170636000142');
INSERT INTO public.u_realiza_m VALUES (11, '80170636000142');
INSERT INTO public.u_realiza_m VALUES (12, '80170636000142');
INSERT INTO public.u_realiza_m VALUES (13, '90170636000142');
INSERT INTO public.u_realiza_m VALUES (14, '90170636000142');
INSERT INTO public.u_realiza_m VALUES (15, '10170636000142');
INSERT INTO public.u_realiza_m VALUES (16, '10170636000142');
INSERT INTO public.u_realiza_m VALUES (18, '11170636000142');
INSERT INTO public.u_realiza_m VALUES (19, '12170636000142');
INSERT INTO public.u_realiza_m VALUES (20, '12170636000142');
INSERT INTO public.u_realiza_m VALUES (15, '11170636000142');
INSERT INTO public.u_realiza_m VALUES (20, '19170636000142');
INSERT INTO public.u_realiza_m VALUES (21, '19170636000142');
INSERT INTO public.u_realiza_m VALUES (22, '20170636000142');
INSERT INTO public.u_realiza_m VALUES (23, '50170636000142');
INSERT INTO public.u_realiza_m VALUES (24, '90170636000142');
INSERT INTO public.u_realiza_m VALUES (26, '19170636000142');
INSERT INTO public.u_realiza_m VALUES (27, '10170636000142');
INSERT INTO public.u_realiza_m VALUES (28, '22170636000142');
INSERT INTO public.u_realiza_m VALUES (29, '50170636000142');
INSERT INTO public.u_realiza_m VALUES (30, '60170636000142');


--
-- TOC entry 5156 (class 0 OID 18357)
-- Dependencies: 255
-- Data for Name: unidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidade VALUES ('30170636000142', 'Hotel Gran Fino - Unidade 1 Ltda ', 'Unidade Paulista', '22,9° S', '43,2° W', 100, 'Condomínio de hotéis', 1, 1);
INSERT INTO public.unidade VALUES ('40170636000142', 'Hotel Luxor Palace - Unidade 1 Ltda', 'Hotel Luxor Palace', '23.0° S', '43.2° W', 150, 'Hotel tradicional', 2, 2);
INSERT INTO public.unidade VALUES ('50170636000142', 'Hotel Bela Vista - Unidade 1 Ltda', 'Hotel Bela Vista', '16.5° S', '39.1° W', 80, 'Pousadas', 2, 3);
INSERT INTO public.unidade VALUES ('60170636000142', 'Hotel Paraíso Tropical - Unidade 1 Ltda', 'Hotel Paraíso Tropical', '23.5° S', '46.6° W', 120, 'Resorts', 1, 4);
INSERT INTO public.unidade VALUES ('70170636000142', 'Hotel Central Plaza - Unidade 1 Ltda', 'Hotel Central Plaza', '12.9° S', '38.3° W', 200, 'Hotel tradicional', 3, 5);
INSERT INTO public.unidade VALUES ('80170636000142', 'Hotel Mar Azul - Unidade 1 Ltda', 'Hotel Mar Azul', '19.9° S', '43.9° W', 250, 'Condomínio de hotéis', 2, 6);
INSERT INTO public.unidade VALUES ('90170636000142', 'Hotel Bosque Encantado - Unidade 1 Ltda', 'Hotel Bosque Encantado', '25.4° S', '49.3° W', 180, 'Pousadas', 1, 7);
INSERT INTO public.unidade VALUES ('10170636000142', 'Hotel Monte Alegre - Unidade 1 Ltda', 'Hotel Monte Alegre', '30.0° S', '51.2° W', 60, 'Resorts', 4, 8);
INSERT INTO public.unidade VALUES ('11170636000142', 'Hotel Sol e Mar - Unidade 1 Ltda', 'Hotel Sol e Mar', '22.9° S', '43.1° W', 90, 'Apart-hotéis', 1, 9);
INSERT INTO public.unidade VALUES ('12170636000142', 'Hotel Gran Fino - Unidade 2 Ltda', 'Hotel Gran Fino', '15.8° S', '47.9° W', 120, 'Condomínio de hotéis', 2, 1);
INSERT INTO public.unidade VALUES ('13170636000142', 'Hotel Luxor Palace - Unidade 2 Ltda', 'Hotel Luxor Palace', '3.1° S', '60.0° W', 140, 'Hotel tradicional', 1, 2);
INSERT INTO public.unidade VALUES ('14170636000142', 'Hotel Bela Vista - Unidade 2 Ltda', 'Hotel Bela Vista', '8.0° S', '34.9° W', 220, 'Pousadas', 4, 3);
INSERT INTO public.unidade VALUES ('15170636000142', 'Hotel Paraíso Tropical - Unidade 2 Ltda', 'Hotel Paraíso Tropical', '29.3° S', '50.9° W', 70, 'Resorts', 2, 4);
INSERT INTO public.unidade VALUES ('16170636000142', 'Hotel Central Plaza - Unidade 2 Ltda', 'Hotel Central Plaza', '5.8° S', '35.2° W', 110, 'Hotel tradicional', 1, 5);
INSERT INTO public.unidade VALUES ('17170636000142', 'Hotel Mar Azul - Unidade 2 Ltda', 'Hotel Mar Azul', '27.6° S', '48.5° W', 180, 'Condomínio de hotéis', 3, 6);
INSERT INTO public.unidade VALUES ('18170636000142', 'Hotel Bosque Encantado - Unidade 2 Ltda', 'Hotel Bosque Encantado', '20.3° S', '40.3° W', 160, 'Pousadas', 2, 7);
INSERT INTO public.unidade VALUES ('19170636000142', 'Hotel Monte Alegre - Unidade 2 Ltda', 'Hotel Monte Alegre', '8.4° S', '35.0° W', 280, 'Resorts', 3, 8);
INSERT INTO public.unidade VALUES ('20170636000142', 'Hotel Sol e Mar - Unidade 2 Ltda', 'Hotel Sol e Mar', '22.7° S', '45.6° W', 100, 'Apart-hotéis', 4, 9);
INSERT INTO public.unidade VALUES ('21170636000142', 'Hotel Gran Fino - Unidade 3 Ltda', 'Hotel Gran Fino', '26.9° S', '48.6° W', 140, 'Condomínio de hotéis', 1, 1);
INSERT INTO public.unidade VALUES ('22170636000142', 'Hotel Luxor Palace - Unidade 3 Ltda', 'Hotel Luxor Palace', '27.6° S', '48.5° W', 180, 'Hotel tradicional', 2, 2);


--
-- TOC entry 5157 (class 0 OID 18360)
-- Dependencies: 256
-- Data for Name: vaga; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vaga VALUES (1, 1, '0', 'Uso Comum', 15, 1);
INSERT INTO public.vaga VALUES (2, 1, '1', 'Deficiente', 20, 2);
INSERT INTO public.vaga VALUES (3, 1, '0', 'Uso Comum', 4, 3);
INSERT INTO public.vaga VALUES (4, 1, '1', 'Idoso', 6, 4);
INSERT INTO public.vaga VALUES (5, 1, '1', 'Uso Comum', 12, 5);


--
-- TOC entry 4802 (class 2606 OID 18364)
-- Name: academia fkdep_aca_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academia
    ADD CONSTRAINT fkdep_aca_id PRIMARY KEY (iddep);


--
-- TOC entry 4806 (class 2606 OID 18366)
-- Name: acomodacao fkdep_aco_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT fkdep_aco_id UNIQUE (iddep);


--
-- TOC entry 4811 (class 2606 OID 18368)
-- Name: ambulatorio fkdep_amb_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fkdep_amb_id UNIQUE (iddep);


--
-- TOC entry 4836 (class 2606 OID 18370)
-- Name: espaco_de_eventos fkdep_esp_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT fkdep_esp_id PRIMARY KEY (iddep);


--
-- TOC entry 4885 (class 2606 OID 18372)
-- Name: piscina fkdep_pis_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT fkdep_pis_id PRIMARY KEY (iddep);


--
-- TOC entry 4903 (class 2606 OID 18374)
-- Name: restaurante fkdep_res_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT fkdep_res_id PRIMARY KEY (iddep);


--
-- TOC entry 4832 (class 2606 OID 18376)
-- Name: entrada fkmov_ent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT fkmov_ent_id PRIMARY KEY (idmov);


--
-- TOC entry 4910 (class 2606 OID 18378)
-- Name: saida fkmov_sai_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT fkmov_sai_id PRIMARY KEY (idmov);


--
-- TOC entry 4825 (class 2606 OID 18380)
-- Name: condominio fku_possui_c_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fku_possui_c_id UNIQUE (cnpj);


--
-- TOC entry 4840 (class 2606 OID 18382)
-- Name: estacionamento fku_possui_e_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT fku_possui_e_id UNIQUE (cnpj);


--
-- TOC entry 4800 (class 2606 OID 18384)
-- Name: a_oferece_item id_a_oferece_item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT id_a_oferece_item PRIMARY KEY (coditem, codigo_quarto);


--
-- TOC entry 4808 (class 2606 OID 18386)
-- Name: acomodacao id_acomodacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT id_acomodacao PRIMARY KEY (codigo_quarto);


--
-- TOC entry 4813 (class 2606 OID 18388)
-- Name: ambulatorio id_ambulatorio_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT id_ambulatorio_id PRIMARY KEY (idamb);


--
-- TOC entry 4815 (class 2606 OID 18390)
-- Name: area id_area; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT id_area PRIMARY KEY (idarea);


--
-- TOC entry 4821 (class 2606 OID 18392)
-- Name: atendimento id_atendimento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT id_atendimento PRIMARY KEY (protocolo);


--
-- TOC entry 4823 (class 2606 OID 18394)
-- Name: beneficio id_beneficio_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficio
    ADD CONSTRAINT id_beneficio_id PRIMARY KEY (idbenef);


--
-- TOC entry 4827 (class 2606 OID 18396)
-- Name: condominio id_condominio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT id_condominio PRIMARY KEY (codigocond);


--
-- TOC entry 4830 (class 2606 OID 18398)
-- Name: dependencias id_dependencias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependencias
    ADD CONSTRAINT id_dependencias PRIMARY KEY (iddep);


--
-- TOC entry 4842 (class 2606 OID 18400)
-- Name: estacionamento id_estacionamento_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT id_estacionamento_id PRIMARY KEY (codigoest);


--
-- TOC entry 4844 (class 2606 OID 18402)
-- Name: estoque id_estoque; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT id_estoque PRIMARY KEY (codestoque);


--
-- TOC entry 4847 (class 2606 OID 18404)
-- Name: f_recebe_b id_f_recebe_b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT id_f_recebe_b PRIMARY KEY (idbenef, cpf);


--
-- TOC entry 4850 (class 2606 OID 18406)
-- Name: funcionario id_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT id_funcionario PRIMARY KEY (cpf);


--
-- TOC entry 4853 (class 2606 OID 18408)
-- Name: h_consome_item id_h_consome_item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT id_h_consome_item PRIMARY KEY (coditem, cpf);


--
-- TOC entry 4855 (class 2606 OID 18410)
-- Name: hospede id_hospede_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospede
    ADD CONSTRAINT id_hospede_id PRIMARY KEY (cpf);


--
-- TOC entry 4857 (class 2606 OID 18412)
-- Name: hospital id_hospital; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT id_hospital PRIMARY KEY (idhospital);


--
-- TOC entry 4859 (class 2606 OID 18414)
-- Name: hotel id_hotel_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT id_hotel_id PRIMARY KEY (codigo);


--
-- TOC entry 4861 (class 2606 OID 18416)
-- Name: item id_item_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT id_item_id PRIMARY KEY (coditem);


--
-- TOC entry 4864 (class 2606 OID 18418)
-- Name: item_sai_do_e id_item_sai_do_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT id_item_sai_do_e PRIMARY KEY (codestoque, coditem);


--
-- TOC entry 4867 (class 2606 OID 18420)
-- Name: m_trabalhapara_a id_m_trabalhapara_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT id_m_trabalhapara_a PRIMARY KEY (idamb, cpf);


--
-- TOC entry 4869 (class 2606 OID 18422)
-- Name: medicamento id_medicamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamento
    ADD CONSTRAINT id_medicamento PRIMARY KEY (idmedic);


--
-- TOC entry 4871 (class 2606 OID 18424)
-- Name: medico id_medico_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT id_medico_id PRIMARY KEY (cpf);


--
-- TOC entry 4873 (class 2606 OID 18426)
-- Name: movimentacao id_movimentacao_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT id_movimentacao_id PRIMARY KEY (idmov);


--
-- TOC entry 4875 (class 2606 OID 18428)
-- Name: nota_fiscal id_nota_fiscal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT id_nota_fiscal PRIMARY KEY (idnf);


--
-- TOC entry 4880 (class 2606 OID 18430)
-- Name: paciente id_paciente_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT id_paciente_id PRIMARY KEY (cpf);


--
-- TOC entry 4883 (class 2606 OID 18432)
-- Name: pertence_a id_pertence_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT id_pertence_a PRIMARY KEY (protocolo, idmedic);


--
-- TOC entry 4890 (class 2606 OID 18434)
-- Name: programa_de_fidelidade id_programa_de_fidelidade_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT id_programa_de_fidelidade_id PRIMARY KEY (idbonus);


--
-- TOC entry 4893 (class 2606 OID 18436)
-- Name: r_inclui_a id_r_inclui_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT id_r_inclui_a PRIMARY KEY (codigo, codigo_quarto);


--
-- TOC entry 4896 (class 2606 OID 18438)
-- Name: requisicao id_requisicao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT id_requisicao PRIMARY KEY (idreq);


--
-- TOC entry 4901 (class 2606 OID 18440)
-- Name: reserva id_reserva_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_reserva_id PRIMARY KEY (codigo);


--
-- TOC entry 4908 (class 2606 OID 18442)
-- Name: robo_de_delivey id_robo_de_delivey_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT id_robo_de_delivey_id PRIMARY KEY (idrobo);


--
-- TOC entry 4914 (class 2606 OID 18444)
-- Name: setor id_setor_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor
    ADD CONSTRAINT id_setor_id PRIMARY KEY (idsetor);


--
-- TOC entry 4917 (class 2606 OID 18446)
-- Name: u_realiza_m id_u_realiza_m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT id_u_realiza_m PRIMARY KEY (cnpj, idmov);


--
-- TOC entry 4921 (class 2606 OID 18448)
-- Name: unidade id_unidade_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT id_unidade_id PRIMARY KEY (cnpj);


--
-- TOC entry 4925 (class 2606 OID 18450)
-- Name: vaga id_vaga; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT id_vaga PRIMARY KEY (idvaga);


--
-- TOC entry 4804 (class 2606 OID 18452)
-- Name: academia sid_academia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academia
    ADD CONSTRAINT sid_academia UNIQUE (idacad);


--
-- TOC entry 4817 (class 2606 OID 18454)
-- Name: area sid_area; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT sid_area UNIQUE (iddep, idarea);


--
-- TOC entry 4834 (class 2606 OID 18456)
-- Name: entrada sid_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT sid_entrada UNIQUE (identrada);


--
-- TOC entry 4838 (class 2606 OID 18458)
-- Name: espaco_de_eventos sid_espaco_de_eventos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT sid_espaco_de_eventos UNIQUE (idesp);


--
-- TOC entry 4877 (class 2606 OID 18460)
-- Name: nota_fiscal sid_nota_fiscal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT sid_nota_fiscal UNIQUE (idmov, idnf);


--
-- TOC entry 4887 (class 2606 OID 18462)
-- Name: piscina sid_piscina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT sid_piscina UNIQUE (idpis);


--
-- TOC entry 4898 (class 2606 OID 18464)
-- Name: requisicao sid_requisicao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT sid_requisicao UNIQUE (cpf, idreq);


--
-- TOC entry 4905 (class 2606 OID 18466)
-- Name: restaurante sid_restaurante; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT sid_restaurante UNIQUE (idres);


--
-- TOC entry 4912 (class 2606 OID 18468)
-- Name: saida sid_saida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT sid_saida UNIQUE (idsaida);


--
-- TOC entry 4809 (class 1259 OID 18469)
-- Name: fka_encaminha_para_h_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fka_encaminha_para_h_ind ON public.ambulatorio USING btree (idhospital);


--
-- TOC entry 4798 (class 1259 OID 18470)
-- Name: fka_o_aco_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fka_o_aco_ind ON public.a_oferece_item USING btree (codigo_quarto);


--
-- TOC entry 4888 (class 1259 OID 18471)
-- Name: fkbonifica_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkbonifica_ind ON public.programa_de_fidelidade USING btree (codigo);


--
-- TOC entry 4922 (class 1259 OID 18472)
-- Name: fke_possui_v_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fke_possui_v_ind ON public.vaga USING btree (codigoest);


--
-- TOC entry 4894 (class 1259 OID 18473)
-- Name: fkf_atende_r_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkf_atende_r_ind ON public.requisicao USING btree (f_a_cpf);


--
-- TOC entry 4845 (class 1259 OID 18474)
-- Name: fkf_r_fun_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkf_r_fun_ind ON public.f_recebe_b USING btree (cpf);


--
-- TOC entry 4848 (class 1259 OID 18475)
-- Name: fkf_trabalhapara_u_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkf_trabalhapara_u_ind ON public.funcionario USING btree (cnpj);


--
-- TOC entry 4851 (class 1259 OID 18476)
-- Name: fkh_c_hos_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkh_c_hos_ind ON public.h_consome_item USING btree (cpf);


--
-- TOC entry 4899 (class 1259 OID 18477)
-- Name: fkh_faz_r_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkh_faz_r_ind ON public.reserva USING btree (cpf);


--
-- TOC entry 4918 (class 1259 OID 18478)
-- Name: fkh_possui_u_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkh_possui_u_ind ON public.unidade USING btree (codigo);


--
-- TOC entry 4862 (class 1259 OID 18479)
-- Name: fkite_ite_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkite_ite_ind ON public.item_sai_do_e USING btree (coditem);


--
-- TOC entry 4818 (class 1259 OID 18480)
-- Name: fkm_realiza_atend_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkm_realiza_atend_ind ON public.atendimento USING btree (m_r_cpf);


--
-- TOC entry 4865 (class 1259 OID 18481)
-- Name: fkm_t_med_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkm_t_med_ind ON public.m_trabalhapara_a USING btree (cpf);


--
-- TOC entry 4878 (class 1259 OID 18482)
-- Name: fkp_ehlevadopara_a_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkp_ehlevadopara_a_ind ON public.paciente USING btree (idamb);


--
-- TOC entry 4819 (class 1259 OID 18483)
-- Name: fkp_gera_atend_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkp_gera_atend_ind ON public.atendimento USING btree (cpf);


--
-- TOC entry 4881 (class 1259 OID 18484)
-- Name: fkper_med_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkper_med_ind ON public.pertence_a USING btree (idmedic);


--
-- TOC entry 4891 (class 1259 OID 18485)
-- Name: fkr_i_aco_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkr_i_aco_ind ON public.r_inclui_a USING btree (codigo_quarto);


--
-- TOC entry 4923 (class 1259 OID 18486)
-- Name: fkreservavaga_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fkreservavaga_ind ON public.vaga USING btree (codigo);


--
-- TOC entry 4828 (class 1259 OID 18487)
-- Name: fku_possui_d_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fku_possui_d_ind ON public.dependencias USING btree (cnpj);


--
-- TOC entry 4906 (class 1259 OID 18488)
-- Name: fku_possui_r_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fku_possui_r_ind ON public.robo_de_delivey USING btree (cnpj);


--
-- TOC entry 4919 (class 1259 OID 18489)
-- Name: fku_possui_s_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fku_possui_s_ind ON public.unidade USING btree (idsetor);


--
-- TOC entry 4915 (class 1259 OID 18490)
-- Name: fku_r_mov_ind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fku_r_mov_ind ON public.u_realiza_m USING btree (idmov);


--
-- TOC entry 4937 (class 2606 OID 18491)
-- Name: entrada entrada_codigo_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);


--
-- TOC entry 4941 (class 2606 OID 18496)
-- Name: estoque estoque_cnpj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_cnpj_fkey FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4930 (class 2606 OID 18501)
-- Name: ambulatorio fka_encaminha_para_h_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fka_encaminha_para_h_fk FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);


--
-- TOC entry 4926 (class 2606 OID 18506)
-- Name: a_oferece_item fka_o_aco_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT fka_o_aco_fk FOREIGN KEY (codigo_quarto) REFERENCES public.acomodacao(codigo_quarto);


--
-- TOC entry 4927 (class 2606 OID 18511)
-- Name: a_oferece_item fka_o_ite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT fka_o_ite FOREIGN KEY (coditem) REFERENCES public.item(coditem);


--
-- TOC entry 4932 (class 2606 OID 18516)
-- Name: area fkacad_possui_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT fkacad_possui_area FOREIGN KEY (iddep) REFERENCES public.academia(iddep);


--
-- TOC entry 4956 (class 2606 OID 18521)
-- Name: programa_de_fidelidade fkbonifica_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT fkbonifica_fk FOREIGN KEY (codigo) REFERENCES public.hotel(codigo);


--
-- TOC entry 4928 (class 2606 OID 18526)
-- Name: academia fkdep_aca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academia
    ADD CONSTRAINT fkdep_aca_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4929 (class 2606 OID 18531)
-- Name: acomodacao fkdep_aco_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT fkdep_aco_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4931 (class 2606 OID 18536)
-- Name: ambulatorio fkdep_amb_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fkdep_amb_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4939 (class 2606 OID 18541)
-- Name: espaco_de_eventos fkdep_esp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT fkdep_esp_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4955 (class 2606 OID 18546)
-- Name: piscina fkdep_pis_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT fkdep_pis_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4963 (class 2606 OID 18551)
-- Name: restaurante fkdep_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT fkdep_res_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);


--
-- TOC entry 4951 (class 2606 OID 18556)
-- Name: nota_fiscal fke_gera_nf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT fke_gera_nf FOREIGN KEY (idmov) REFERENCES public.entrada(idmov);


--
-- TOC entry 4971 (class 2606 OID 18561)
-- Name: vaga fke_possui_v_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT fke_possui_v_fk FOREIGN KEY (codigoest) REFERENCES public.estacionamento(codigoest);


--
-- TOC entry 4960 (class 2606 OID 18566)
-- Name: requisicao fkf_atende_r_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT fkf_atende_r_fk FOREIGN KEY (f_a_cpf) REFERENCES public.funcionario(cpf);


--
-- TOC entry 4942 (class 2606 OID 18571)
-- Name: f_recebe_b fkf_r_ben; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT fkf_r_ben FOREIGN KEY (idbenef) REFERENCES public.beneficio(idbenef);


--
-- TOC entry 4943 (class 2606 OID 18576)
-- Name: f_recebe_b fkf_r_fun_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT fkf_r_fun_fk FOREIGN KEY (cpf) REFERENCES public.funcionario(cpf);


--
-- TOC entry 4944 (class 2606 OID 18581)
-- Name: funcionario fkf_trabalhapara_u_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fkf_trabalhapara_u_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4961 (class 2606 OID 18586)
-- Name: requisicao fkh_abre_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT fkh_abre_r FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);


--
-- TOC entry 4945 (class 2606 OID 18591)
-- Name: h_consome_item fkh_c_hos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT fkh_c_hos_fk FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);


--
-- TOC entry 4946 (class 2606 OID 18596)
-- Name: h_consome_item fkh_c_ite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT fkh_c_ite FOREIGN KEY (coditem) REFERENCES public.item(coditem);


--
-- TOC entry 4962 (class 2606 OID 18601)
-- Name: reserva fkh_faz_r_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT fkh_faz_r_fk FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);


--
-- TOC entry 4969 (class 2606 OID 18606)
-- Name: unidade fkh_possui_u_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT fkh_possui_u_fk FOREIGN KEY (codigo) REFERENCES public.hotel(codigo);


--
-- TOC entry 4947 (class 2606 OID 18611)
-- Name: item_sai_do_e fkite_est; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT fkite_est FOREIGN KEY (codestoque) REFERENCES public.estoque(codestoque);


--
-- TOC entry 4948 (class 2606 OID 18616)
-- Name: item_sai_do_e fkite_ite_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT fkite_ite_fk FOREIGN KEY (coditem) REFERENCES public.item(coditem);


--
-- TOC entry 4933 (class 2606 OID 18621)
-- Name: atendimento fkm_realiza_atend_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fkm_realiza_atend_fk FOREIGN KEY (m_r_cpf) REFERENCES public.medico(cpf);


--
-- TOC entry 4949 (class 2606 OID 18626)
-- Name: m_trabalhapara_a fkm_t_amb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT fkm_t_amb FOREIGN KEY (idamb) REFERENCES public.ambulatorio(idamb);


--
-- TOC entry 4950 (class 2606 OID 18631)
-- Name: m_trabalhapara_a fkm_t_med_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT fkm_t_med_fk FOREIGN KEY (cpf) REFERENCES public.medico(cpf);


--
-- TOC entry 4938 (class 2606 OID 18636)
-- Name: entrada fkmov_ent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT fkmov_ent_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);


--
-- TOC entry 4966 (class 2606 OID 18641)
-- Name: saida fkmov_sai_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT fkmov_sai_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);


--
-- TOC entry 4952 (class 2606 OID 18646)
-- Name: paciente fkp_ehlevadopara_a_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT fkp_ehlevadopara_a_fk FOREIGN KEY (idamb) REFERENCES public.ambulatorio(idamb);


--
-- TOC entry 4934 (class 2606 OID 18651)
-- Name: atendimento fkp_gera_atend_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fkp_gera_atend_fk FOREIGN KEY (cpf) REFERENCES public.paciente(cpf);


--
-- TOC entry 4953 (class 2606 OID 18656)
-- Name: pertence_a fkper_ate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT fkper_ate FOREIGN KEY (protocolo) REFERENCES public.atendimento(protocolo);


--
-- TOC entry 4954 (class 2606 OID 18661)
-- Name: pertence_a fkper_med_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT fkper_med_fk FOREIGN KEY (idmedic) REFERENCES public.medicamento(idmedic);


--
-- TOC entry 4958 (class 2606 OID 18666)
-- Name: r_inclui_a fkr_i_aco_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT fkr_i_aco_fk FOREIGN KEY (codigo_quarto) REFERENCES public.acomodacao(codigo_quarto);


--
-- TOC entry 4959 (class 2606 OID 18671)
-- Name: r_inclui_a fkr_i_res; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT fkr_i_res FOREIGN KEY (codigo) REFERENCES public.reserva(codigo);


--
-- TOC entry 4972 (class 2606 OID 18676)
-- Name: vaga fkreservavaga_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT fkreservavaga_fk FOREIGN KEY (codigo) REFERENCES public.reserva(codigo);


--
-- TOC entry 4935 (class 2606 OID 18681)
-- Name: condominio fku_possui_c_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fku_possui_c_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4936 (class 2606 OID 18686)
-- Name: dependencias fku_possui_d_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependencias
    ADD CONSTRAINT fku_possui_d_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4940 (class 2606 OID 18691)
-- Name: estacionamento fku_possui_e_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT fku_possui_e_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4964 (class 2606 OID 18696)
-- Name: robo_de_delivey fku_possui_r_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT fku_possui_r_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4970 (class 2606 OID 18701)
-- Name: unidade fku_possui_s_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT fku_possui_s_fk FOREIGN KEY (idsetor) REFERENCES public.setor(idsetor);


--
-- TOC entry 4967 (class 2606 OID 18706)
-- Name: u_realiza_m fku_r_mov_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT fku_r_mov_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);


--
-- TOC entry 4968 (class 2606 OID 18711)
-- Name: u_realiza_m fku_r_uni; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT fku_r_uni FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);


--
-- TOC entry 4957 (class 2606 OID 18716)
-- Name: programa_de_fidelidade programa_de_fidelidade_codigo_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT programa_de_fidelidade_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);


--
-- TOC entry 4965 (class 2606 OID 18721)
-- Name: robo_de_delivey robo_de_delivey_codigo_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT robo_de_delivey_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);


-- Completed on 2024-11-24 21:01:16

--
-- PostgreSQL database dump complete
--

