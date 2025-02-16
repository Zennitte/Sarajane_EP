PGDMP                  
    |            Hotel    17.2    17.2 �    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            +           1262    18234    Hotel    DATABASE     ~   CREATE DATABASE "Hotel" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Hotel";
                     postgres    false            �            1259    18235    a_oferece_item    TABLE     �   CREATE TABLE public.a_oferece_item (
    codigo_quarto integer NOT NULL,
    coditem integer NOT NULL,
    quantidade integer NOT NULL,
    valor real NOT NULL
);
 "   DROP TABLE public.a_oferece_item;
       public         heap r       postgres    false            �            1259    18238    academia    TABLE     }   CREATE TABLE public.academia (
    iddep integer NOT NULL,
    idacad integer NOT NULL,
    nmraparelhos integer NOT NULL
);
    DROP TABLE public.academia;
       public         heap r       postgres    false            �            1259    18241 
   acomodacao    TABLE     �   CREATE TABLE public.acomodacao (
    codigo_quarto integer NOT NULL,
    iddep integer NOT NULL,
    status character varying(20) NOT NULL,
    tipo character varying(50) NOT NULL,
    valor real
);
    DROP TABLE public.acomodacao;
       public         heap r       postgres    false            �            1259    18244    ambulatorio    TABLE     t   CREATE TABLE public.ambulatorio (
    idamb integer NOT NULL,
    iddep integer NOT NULL,
    idhospital integer
);
    DROP TABLE public.ambulatorio;
       public         heap r       postgres    false            �            1259    18247    area    TABLE        CREATE TABLE public.area (
    tipo character varying(50) NOT NULL,
    idarea integer NOT NULL,
    iddep integer NOT NULL
);
    DROP TABLE public.area;
       public         heap r       postgres    false            �            1259    18250    atendimento    TABLE     �   CREATE TABLE public.atendimento (
    protocolo integer NOT NULL,
    gravidade character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    data date NOT NULL,
    cpf character(11) NOT NULL,
    m_r_cpf character(11) NOT NULL
);
    DROP TABLE public.atendimento;
       public         heap r       postgres    false            �            1259    18253 	   beneficio    TABLE     �   CREATE TABLE public.beneficio (
    idbenef integer NOT NULL,
    tipo character varying(50) NOT NULL,
    desconto real,
    valor real
);
    DROP TABLE public.beneficio;
       public         heap r       postgres    false            �            1259    18256 
   condominio    TABLE     �   CREATE TABLE public.condominio (
    codigocond integer NOT NULL,
    cnpj character(14) NOT NULL,
    valor_aluguel real NOT NULL,
    servico character varying(50) NOT NULL
);
    DROP TABLE public.condominio;
       public         heap r       postgres    false            �            1259    18259    dependencias    TABLE     �  CREATE TABLE public.dependencias (
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
     DROP TABLE public.dependencias;
       public         heap r       postgres    false            �            1259    18263    entrada    TABLE     �   CREATE TABLE public.entrada (
    idmov integer NOT NULL,
    identrada integer NOT NULL,
    desconto real NOT NULL,
    codigo_reserva integer
);
    DROP TABLE public.entrada;
       public         heap r       postgres    false            �            1259    18266    espaco_de_eventos    TABLE     �   CREATE TABLE public.espaco_de_eventos (
    iddep integer NOT NULL,
    idesp integer NOT NULL,
    tipo_de_uso character varying(50) NOT NULL,
    area integer NOT NULL
);
 %   DROP TABLE public.espaco_de_eventos;
       public         heap r       postgres    false            �            1259    18269    estacionamento    TABLE     �   CREATE TABLE public.estacionamento (
    codigoest integer NOT NULL,
    cnpj character(14) NOT NULL,
    nome character varying(50) NOT NULL,
    quantidade_de_vagas_descobertas integer NOT NULL,
    quantidade_de_vagas_cobertas integer
);
 "   DROP TABLE public.estacionamento;
       public         heap r       postgres    false            �            1259    18272    estoque    TABLE     �   CREATE TABLE public.estoque (
    codestoque integer NOT NULL,
    nome character varying(50) NOT NULL,
    quantidade integer NOT NULL,
    cnpj character varying(13)
);
    DROP TABLE public.estoque;
       public         heap r       postgres    false            �            1259    18275 
   f_recebe_b    TABLE     a   CREATE TABLE public.f_recebe_b (
    idbenef integer NOT NULL,
    cpf character(11) NOT NULL
);
    DROP TABLE public.f_recebe_b;
       public         heap r       postgres    false            �            1259    18278    funcionario    TABLE     /  CREATE TABLE public.funcionario (
    cpf character(11) NOT NULL,
    salario real NOT NULL,
    primeiro_nome character varying(50) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    contrato character varying(50) NOT NULL,
    cargo character varying(50) NOT NULL,
    cnpj character(14)
);
    DROP TABLE public.funcionario;
       public         heap r       postgres    false            �            1259    18281    h_consome_item    TABLE     �   CREATE TABLE public.h_consome_item (
    cpf character(11) NOT NULL,
    coditem integer NOT NULL,
    quantidade integer NOT NULL
);
 "   DROP TABLE public.h_consome_item;
       public         heap r       postgres    false            �            1259    18284    hospede    TABLE     �   CREATE TABLE public.hospede (
    cpf character(11) NOT NULL,
    nom_primeironome character varying(50) NOT NULL,
    nom_sobrenome character varying(50) NOT NULL,
    telefone character varying(11) NOT NULL,
    email character varying(50) NOT NULL
);
    DROP TABLE public.hospede;
       public         heap r       postgres    false            �            1259    18287    hospital    TABLE     �   CREATE TABLE public.hospital (
    idhospital integer NOT NULL,
    cnpj character(14) NOT NULL,
    nome character varying(100) NOT NULL,
    quantidade_leitos integer NOT NULL
);
    DROP TABLE public.hospital;
       public         heap r       postgres    false            �            1259    18290    hotel    TABLE     �   CREATE TABLE public.hotel (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    avaliacao integer NOT NULL
);
    DROP TABLE public.hotel;
       public         heap r       postgres    false            �            1259    18293    item    TABLE     �   CREATE TABLE public.item (
    coditem integer NOT NULL,
    produto character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.item;
       public         heap r       postgres    false            �            1259    18296    item_sai_do_e    TABLE     e   CREATE TABLE public.item_sai_do_e (
    codestoque integer NOT NULL,
    coditem integer NOT NULL
);
 !   DROP TABLE public.item_sai_do_e;
       public         heap r       postgres    false            �            1259    18299    m_trabalhapara_a    TABLE     e   CREATE TABLE public.m_trabalhapara_a (
    idamb integer NOT NULL,
    cpf character(11) NOT NULL
);
 $   DROP TABLE public.m_trabalhapara_a;
       public         heap r       postgres    false            �            1259    18302    medicamento    TABLE     �   CREATE TABLE public.medicamento (
    idmedic integer NOT NULL,
    data_validade date NOT NULL,
    nome_generico character varying(50) NOT NULL,
    forma character varying(50) NOT NULL,
    concentracao real NOT NULL
);
    DROP TABLE public.medicamento;
       public         heap r       postgres    false            �            1259    18305    medico    TABLE     �   CREATE TABLE public.medico (
    cpf character(11) NOT NULL,
    crm character varying(30) NOT NULL,
    nom_nome character varying(50) NOT NULL,
    nom_sobrenome character varying(100) NOT NULL
);
    DROP TABLE public.medico;
       public         heap r       postgres    false            �            1259    18308    movimentacao    TABLE     �  CREATE TABLE public.movimentacao (
    idmov integer NOT NULL,
    valor real NOT NULL,
    descricao character varying(500) NOT NULL,
    data date NOT NULL,
    forma_pagamento character varying(50) NOT NULL,
    saida integer,
    entrada integer,
    CONSTRAINT extone_movimentacao CHECK ((((saida IS NOT NULL) AND (entrada IS NULL)) OR ((saida IS NULL) AND (entrada IS NOT NULL))))
);
     DROP TABLE public.movimentacao;
       public         heap r       postgres    false            �            1259    18314    nota_fiscal    TABLE     �   CREATE TABLE public.nota_fiscal (
    idnf integer NOT NULL,
    idmov integer NOT NULL,
    xml character varying(500) NOT NULL,
    numero integer NOT NULL,
    data_emissao date NOT NULL
);
    DROP TABLE public.nota_fiscal;
       public         heap r       postgres    false            �            1259    18319    paciente    TABLE     �   CREATE TABLE public.paciente (
    cpf character(11) NOT NULL,
    tipo character varying(20) NOT NULL,
    idade integer NOT NULL,
    peso real NOT NULL,
    problema character varying(100) NOT NULL,
    idamb integer NOT NULL
);
    DROP TABLE public.paciente;
       public         heap r       postgres    false            �            1259    18322 
   pertence_a    TABLE     a   CREATE TABLE public.pertence_a (
    protocolo integer NOT NULL,
    idmedic integer NOT NULL
);
    DROP TABLE public.pertence_a;
       public         heap r       postgres    false            �            1259    18325    piscina    TABLE     �   CREATE TABLE public.piscina (
    iddep integer NOT NULL,
    idpis integer NOT NULL,
    volume real NOT NULL,
    temperatura integer NOT NULL,
    eh_coberta character(1) NOT NULL,
    eh_aquecida character(1) NOT NULL
);
    DROP TABLE public.piscina;
       public         heap r       postgres    false            �            1259    18328    programa_de_fidelidade    TABLE     �   CREATE TABLE public.programa_de_fidelidade (
    idbonus integer NOT NULL,
    tipobonus character varying(50) NOT NULL,
    valor real NOT NULL,
    codigo integer NOT NULL,
    codigo_reserva integer
);
 *   DROP TABLE public.programa_de_fidelidade;
       public         heap r       postgres    false            �            1259    18331 
   r_inclui_a    TABLE     d   CREATE TABLE public.r_inclui_a (
    codigo_quarto integer NOT NULL,
    codigo integer NOT NULL
);
    DROP TABLE public.r_inclui_a;
       public         heap r       postgres    false            �            1259    18334 
   requisicao    TABLE     `  CREATE TABLE public.requisicao (
    idreq integer NOT NULL,
    cpf character(11) NOT NULL,
    status character varying(50) NOT NULL,
    dat_abertura timestamp without time zone NOT NULL,
    dat_fechamento timestamp without time zone,
    tipo character varying(50) NOT NULL,
    ordem character varying(500) NOT NULL,
    f_a_cpf character(11)
);
    DROP TABLE public.requisicao;
       public         heap r       postgres    false            �            1259    18339    reserva    TABLE     
  CREATE TABLE public.reserva (
    codigo integer NOT NULL,
    hos_check_in timestamp without time zone NOT NULL,
    hos_check_out timestamp without time zone NOT NULL,
    valor real NOT NULL,
    numero_pessoas integer NOT NULL,
    cpf character(11) NOT NULL
);
    DROP TABLE public.reserva;
       public         heap r       postgres    false            �            1259    18342    restaurante    TABLE     �   CREATE TABLE public.restaurante (
    iddep integer NOT NULL,
    idres integer NOT NULL,
    avaliacao integer NOT NULL,
    culinaria character varying(50) NOT NULL
);
    DROP TABLE public.restaurante;
       public         heap r       postgres    false            �            1259    18345    robo_de_delivey    TABLE       CREATE TABLE public.robo_de_delivey (
    idrobo integer NOT NULL,
    data_pedido date NOT NULL,
    produto character varying(50) NOT NULL,
    quantidade integer NOT NULL,
    empresa character varying(50) NOT NULL,
    cnpj character(14) NOT NULL,
    codigo_reserva integer
);
 #   DROP TABLE public.robo_de_delivey;
       public         heap r       postgres    false            �            1259    18348    saida    TABLE     �   CREATE TABLE public.saida (
    idmov integer NOT NULL,
    idsaida integer NOT NULL,
    favorecido character varying(100) NOT NULL
);
    DROP TABLE public.saida;
       public         heap r       postgres    false            �            1259    18351    setor    TABLE     �   CREATE TABLE public.setor (
    idsetor integer NOT NULL,
    capacidade integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.setor;
       public         heap r       postgres    false            �            1259    18354    u_realiza_m    TABLE     a   CREATE TABLE public.u_realiza_m (
    idmov integer NOT NULL,
    cnpj character(14) NOT NULL
);
    DROP TABLE public.u_realiza_m;
       public         heap r       postgres    false            �            1259    18357    unidade    TABLE     �  CREATE TABLE public.unidade (
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
    DROP TABLE public.unidade;
       public         heap r       postgres    false                        1259    18360    vaga    TABLE     �   CREATE TABLE public.vaga (
    idvaga integer NOT NULL,
    numero integer NOT NULL,
    eh_coberta character(1) NOT NULL,
    tipo character varying(50) NOT NULL,
    codigo integer NOT NULL,
    codigoest integer NOT NULL
);
    DROP TABLE public.vaga;
       public         heap r       postgres    false            �          0    18235    a_oferece_item 
   TABLE DATA                 public               postgres    false    217   U�       �          0    18238    academia 
   TABLE DATA                 public               postgres    false    218   ��                  0    18241 
   acomodacao 
   TABLE DATA                 public               postgres    false    219   	�                 0    18244    ambulatorio 
   TABLE DATA                 public               postgres    false    220   ��                 0    18247    area 
   TABLE DATA                 public               postgres    false    221   4�                 0    18250    atendimento 
   TABLE DATA                 public               postgres    false    222   ��                 0    18253 	   beneficio 
   TABLE DATA                 public               postgres    false    223   ��                 0    18256 
   condominio 
   TABLE DATA                 public               postgres    false    224   ��                 0    18259    dependencias 
   TABLE DATA                 public               postgres    false    225   ��                 0    18263    entrada 
   TABLE DATA                 public               postgres    false    226   �                0    18266    espaco_de_eventos 
   TABLE DATA                 public               postgres    false    227   �      	          0    18269    estacionamento 
   TABLE DATA                 public               postgres    false    228   �      
          0    18272    estoque 
   TABLE DATA                 public               postgres    false    229   C                0    18275 
   f_recebe_b 
   TABLE DATA                 public               postgres    false    230   ]                0    18278    funcionario 
   TABLE DATA                 public               postgres    false    231   �                0    18281    h_consome_item 
   TABLE DATA                 public               postgres    false    232                   0    18284    hospede 
   TABLE DATA                 public               postgres    false    233   .                0    18287    hospital 
   TABLE DATA                 public               postgres    false    234   �                0    18290    hotel 
   TABLE DATA                 public               postgres    false    235   ^                0    18293    item 
   TABLE DATA                 public               postgres    false    236   J                0    18296    item_sai_do_e 
   TABLE DATA                 public               postgres    false    237   �                0    18299    m_trabalhapara_a 
   TABLE DATA                 public               postgres    false    238   �                0    18302    medicamento 
   TABLE DATA                 public               postgres    false    239   B                0    18305    medico 
   TABLE DATA                 public               postgres    false    240   9                0    18308    movimentacao 
   TABLE DATA                 public               postgres    false    241   #                0    18314    nota_fiscal 
   TABLE DATA                 public               postgres    false    242   �                0    18319    paciente 
   TABLE DATA                 public               postgres    false    243   �                0    18322 
   pertence_a 
   TABLE DATA                 public               postgres    false    244   �                0    18325    piscina 
   TABLE DATA                 public               postgres    false    245   #                0    18328    programa_de_fidelidade 
   TABLE DATA                 public               postgres    false    246   �                0    18331 
   r_inclui_a 
   TABLE DATA                 public               postgres    false    247                   0    18334 
   requisicao 
   TABLE DATA                 public               postgres    false    248   �                0    18339    reserva 
   TABLE DATA                 public               postgres    false    249   R                 0    18342    restaurante 
   TABLE DATA                 public               postgres    false    250   +"                 0    18345    robo_de_delivey 
   TABLE DATA                 public               postgres    false    251   �"      !          0    18348    saida 
   TABLE DATA                 public               postgres    false    252   0$      "          0    18351    setor 
   TABLE DATA                 public               postgres    false    253   �%      #          0    18354    u_realiza_m 
   TABLE DATA                 public               postgres    false    254   &      $          0    18357    unidade 
   TABLE DATA                 public               postgres    false    255   �&      %          0    18360    vaga 
   TABLE DATA                 public               postgres    false    256   �)      �           2606    18364    academia fkdep_aca_id 
   CONSTRAINT     V   ALTER TABLE ONLY public.academia
    ADD CONSTRAINT fkdep_aca_id PRIMARY KEY (iddep);
 ?   ALTER TABLE ONLY public.academia DROP CONSTRAINT fkdep_aca_id;
       public                 postgres    false    218            �           2606    18366    acomodacao fkdep_aco_id 
   CONSTRAINT     S   ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT fkdep_aco_id UNIQUE (iddep);
 A   ALTER TABLE ONLY public.acomodacao DROP CONSTRAINT fkdep_aco_id;
       public                 postgres    false    219            �           2606    18368    ambulatorio fkdep_amb_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fkdep_amb_id UNIQUE (iddep);
 B   ALTER TABLE ONLY public.ambulatorio DROP CONSTRAINT fkdep_amb_id;
       public                 postgres    false    220            �           2606    18370    espaco_de_eventos fkdep_esp_id 
   CONSTRAINT     _   ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT fkdep_esp_id PRIMARY KEY (iddep);
 H   ALTER TABLE ONLY public.espaco_de_eventos DROP CONSTRAINT fkdep_esp_id;
       public                 postgres    false    227                       2606    18372    piscina fkdep_pis_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT fkdep_pis_id PRIMARY KEY (iddep);
 >   ALTER TABLE ONLY public.piscina DROP CONSTRAINT fkdep_pis_id;
       public                 postgres    false    245            '           2606    18374    restaurante fkdep_res_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT fkdep_res_id PRIMARY KEY (iddep);
 B   ALTER TABLE ONLY public.restaurante DROP CONSTRAINT fkdep_res_id;
       public                 postgres    false    250            �           2606    18376    entrada fkmov_ent_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT fkmov_ent_id PRIMARY KEY (idmov);
 >   ALTER TABLE ONLY public.entrada DROP CONSTRAINT fkmov_ent_id;
       public                 postgres    false    226            .           2606    18378    saida fkmov_sai_id 
   CONSTRAINT     S   ALTER TABLE ONLY public.saida
    ADD CONSTRAINT fkmov_sai_id PRIMARY KEY (idmov);
 <   ALTER TABLE ONLY public.saida DROP CONSTRAINT fkmov_sai_id;
       public                 postgres    false    252            �           2606    18380    condominio fku_possui_c_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fku_possui_c_id UNIQUE (cnpj);
 D   ALTER TABLE ONLY public.condominio DROP CONSTRAINT fku_possui_c_id;
       public                 postgres    false    224            �           2606    18382    estacionamento fku_possui_e_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT fku_possui_e_id UNIQUE (cnpj);
 H   ALTER TABLE ONLY public.estacionamento DROP CONSTRAINT fku_possui_e_id;
       public                 postgres    false    228            �           2606    18384     a_oferece_item id_a_oferece_item 
   CONSTRAINT     r   ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT id_a_oferece_item PRIMARY KEY (coditem, codigo_quarto);
 J   ALTER TABLE ONLY public.a_oferece_item DROP CONSTRAINT id_a_oferece_item;
       public                 postgres    false    217    217            �           2606    18386    acomodacao id_acomodacao 
   CONSTRAINT     a   ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT id_acomodacao PRIMARY KEY (codigo_quarto);
 B   ALTER TABLE ONLY public.acomodacao DROP CONSTRAINT id_acomodacao;
       public                 postgres    false    219            �           2606    18388    ambulatorio id_ambulatorio_id 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT id_ambulatorio_id PRIMARY KEY (idamb);
 G   ALTER TABLE ONLY public.ambulatorio DROP CONSTRAINT id_ambulatorio_id;
       public                 postgres    false    220            �           2606    18390    area id_area 
   CONSTRAINT     N   ALTER TABLE ONLY public.area
    ADD CONSTRAINT id_area PRIMARY KEY (idarea);
 6   ALTER TABLE ONLY public.area DROP CONSTRAINT id_area;
       public                 postgres    false    221            �           2606    18392    atendimento id_atendimento 
   CONSTRAINT     _   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT id_atendimento PRIMARY KEY (protocolo);
 D   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT id_atendimento;
       public                 postgres    false    222            �           2606    18394    beneficio id_beneficio_id 
   CONSTRAINT     \   ALTER TABLE ONLY public.beneficio
    ADD CONSTRAINT id_beneficio_id PRIMARY KEY (idbenef);
 C   ALTER TABLE ONLY public.beneficio DROP CONSTRAINT id_beneficio_id;
       public                 postgres    false    223            �           2606    18396    condominio id_condominio 
   CONSTRAINT     ^   ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT id_condominio PRIMARY KEY (codigocond);
 B   ALTER TABLE ONLY public.condominio DROP CONSTRAINT id_condominio;
       public                 postgres    false    224            �           2606    18398    dependencias id_dependencias 
   CONSTRAINT     ]   ALTER TABLE ONLY public.dependencias
    ADD CONSTRAINT id_dependencias PRIMARY KEY (iddep);
 F   ALTER TABLE ONLY public.dependencias DROP CONSTRAINT id_dependencias;
       public                 postgres    false    225            �           2606    18400 #   estacionamento id_estacionamento_id 
   CONSTRAINT     h   ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT id_estacionamento_id PRIMARY KEY (codigoest);
 M   ALTER TABLE ONLY public.estacionamento DROP CONSTRAINT id_estacionamento_id;
       public                 postgres    false    228            �           2606    18402    estoque id_estoque 
   CONSTRAINT     X   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT id_estoque PRIMARY KEY (codestoque);
 <   ALTER TABLE ONLY public.estoque DROP CONSTRAINT id_estoque;
       public                 postgres    false    229            �           2606    18404    f_recebe_b id_f_recebe_b 
   CONSTRAINT     `   ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT id_f_recebe_b PRIMARY KEY (idbenef, cpf);
 B   ALTER TABLE ONLY public.f_recebe_b DROP CONSTRAINT id_f_recebe_b;
       public                 postgres    false    230    230            �           2606    18406    funcionario id_funcionario 
   CONSTRAINT     Y   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT id_funcionario PRIMARY KEY (cpf);
 D   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT id_funcionario;
       public                 postgres    false    231            �           2606    18408     h_consome_item id_h_consome_item 
   CONSTRAINT     h   ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT id_h_consome_item PRIMARY KEY (coditem, cpf);
 J   ALTER TABLE ONLY public.h_consome_item DROP CONSTRAINT id_h_consome_item;
       public                 postgres    false    232    232            �           2606    18410    hospede id_hospede_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.hospede
    ADD CONSTRAINT id_hospede_id PRIMARY KEY (cpf);
 ?   ALTER TABLE ONLY public.hospede DROP CONSTRAINT id_hospede_id;
       public                 postgres    false    233            �           2606    18412    hospital id_hospital 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT id_hospital PRIMARY KEY (idhospital);
 >   ALTER TABLE ONLY public.hospital DROP CONSTRAINT id_hospital;
       public                 postgres    false    234            �           2606    18414    hotel id_hotel_id 
   CONSTRAINT     S   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT id_hotel_id PRIMARY KEY (codigo);
 ;   ALTER TABLE ONLY public.hotel DROP CONSTRAINT id_hotel_id;
       public                 postgres    false    235            �           2606    18416    item id_item_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.item
    ADD CONSTRAINT id_item_id PRIMARY KEY (coditem);
 9   ALTER TABLE ONLY public.item DROP CONSTRAINT id_item_id;
       public                 postgres    false    236                        2606    18418    item_sai_do_e id_item_sai_do_e 
   CONSTRAINT     m   ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT id_item_sai_do_e PRIMARY KEY (codestoque, coditem);
 H   ALTER TABLE ONLY public.item_sai_do_e DROP CONSTRAINT id_item_sai_do_e;
       public                 postgres    false    237    237                       2606    18420 $   m_trabalhapara_a id_m_trabalhapara_a 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT id_m_trabalhapara_a PRIMARY KEY (idamb, cpf);
 N   ALTER TABLE ONLY public.m_trabalhapara_a DROP CONSTRAINT id_m_trabalhapara_a;
       public                 postgres    false    238    238                       2606    18422    medicamento id_medicamento 
   CONSTRAINT     ]   ALTER TABLE ONLY public.medicamento
    ADD CONSTRAINT id_medicamento PRIMARY KEY (idmedic);
 D   ALTER TABLE ONLY public.medicamento DROP CONSTRAINT id_medicamento;
       public                 postgres    false    239                       2606    18424    medico id_medico_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT id_medico_id PRIMARY KEY (cpf);
 =   ALTER TABLE ONLY public.medico DROP CONSTRAINT id_medico_id;
       public                 postgres    false    240            	           2606    18426    movimentacao id_movimentacao_id 
   CONSTRAINT     `   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT id_movimentacao_id PRIMARY KEY (idmov);
 I   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT id_movimentacao_id;
       public                 postgres    false    241                       2606    18428    nota_fiscal id_nota_fiscal 
   CONSTRAINT     Z   ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT id_nota_fiscal PRIMARY KEY (idnf);
 D   ALTER TABLE ONLY public.nota_fiscal DROP CONSTRAINT id_nota_fiscal;
       public                 postgres    false    242                       2606    18430    paciente id_paciente_id 
   CONSTRAINT     V   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT id_paciente_id PRIMARY KEY (cpf);
 A   ALTER TABLE ONLY public.paciente DROP CONSTRAINT id_paciente_id;
       public                 postgres    false    243                       2606    18432    pertence_a id_pertence_a 
   CONSTRAINT     f   ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT id_pertence_a PRIMARY KEY (protocolo, idmedic);
 B   ALTER TABLE ONLY public.pertence_a DROP CONSTRAINT id_pertence_a;
       public                 postgres    false    244    244                       2606    18434 3   programa_de_fidelidade id_programa_de_fidelidade_id 
   CONSTRAINT     v   ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT id_programa_de_fidelidade_id PRIMARY KEY (idbonus);
 ]   ALTER TABLE ONLY public.programa_de_fidelidade DROP CONSTRAINT id_programa_de_fidelidade_id;
       public                 postgres    false    246                       2606    18436    r_inclui_a id_r_inclui_a 
   CONSTRAINT     i   ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT id_r_inclui_a PRIMARY KEY (codigo, codigo_quarto);
 B   ALTER TABLE ONLY public.r_inclui_a DROP CONSTRAINT id_r_inclui_a;
       public                 postgres    false    247    247                        2606    18438    requisicao id_requisicao 
   CONSTRAINT     Y   ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT id_requisicao PRIMARY KEY (idreq);
 B   ALTER TABLE ONLY public.requisicao DROP CONSTRAINT id_requisicao;
       public                 postgres    false    248            %           2606    18440    reserva id_reserva_id 
   CONSTRAINT     W   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT id_reserva_id PRIMARY KEY (codigo);
 ?   ALTER TABLE ONLY public.reserva DROP CONSTRAINT id_reserva_id;
       public                 postgres    false    249            ,           2606    18442 %   robo_de_delivey id_robo_de_delivey_id 
   CONSTRAINT     g   ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT id_robo_de_delivey_id PRIMARY KEY (idrobo);
 O   ALTER TABLE ONLY public.robo_de_delivey DROP CONSTRAINT id_robo_de_delivey_id;
       public                 postgres    false    251            2           2606    18444    setor id_setor_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.setor
    ADD CONSTRAINT id_setor_id PRIMARY KEY (idsetor);
 ;   ALTER TABLE ONLY public.setor DROP CONSTRAINT id_setor_id;
       public                 postgres    false    253            5           2606    18446    u_realiza_m id_u_realiza_m 
   CONSTRAINT     a   ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT id_u_realiza_m PRIMARY KEY (cnpj, idmov);
 D   ALTER TABLE ONLY public.u_realiza_m DROP CONSTRAINT id_u_realiza_m;
       public                 postgres    false    254    254            9           2606    18448    unidade id_unidade_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT id_unidade_id PRIMARY KEY (cnpj);
 ?   ALTER TABLE ONLY public.unidade DROP CONSTRAINT id_unidade_id;
       public                 postgres    false    255            =           2606    18450    vaga id_vaga 
   CONSTRAINT     N   ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT id_vaga PRIMARY KEY (idvaga);
 6   ALTER TABLE ONLY public.vaga DROP CONSTRAINT id_vaga;
       public                 postgres    false    256            �           2606    18452    academia sid_academia 
   CONSTRAINT     R   ALTER TABLE ONLY public.academia
    ADD CONSTRAINT sid_academia UNIQUE (idacad);
 ?   ALTER TABLE ONLY public.academia DROP CONSTRAINT sid_academia;
       public                 postgres    false    218            �           2606    18454    area sid_area 
   CONSTRAINT     Q   ALTER TABLE ONLY public.area
    ADD CONSTRAINT sid_area UNIQUE (iddep, idarea);
 7   ALTER TABLE ONLY public.area DROP CONSTRAINT sid_area;
       public                 postgres    false    221    221            �           2606    18456    entrada sid_entrada 
   CONSTRAINT     S   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT sid_entrada UNIQUE (identrada);
 =   ALTER TABLE ONLY public.entrada DROP CONSTRAINT sid_entrada;
       public                 postgres    false    226            �           2606    18458 '   espaco_de_eventos sid_espaco_de_eventos 
   CONSTRAINT     c   ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT sid_espaco_de_eventos UNIQUE (idesp);
 Q   ALTER TABLE ONLY public.espaco_de_eventos DROP CONSTRAINT sid_espaco_de_eventos;
       public                 postgres    false    227                       2606    18460    nota_fiscal sid_nota_fiscal 
   CONSTRAINT     ]   ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT sid_nota_fiscal UNIQUE (idmov, idnf);
 E   ALTER TABLE ONLY public.nota_fiscal DROP CONSTRAINT sid_nota_fiscal;
       public                 postgres    false    242    242                       2606    18462    piscina sid_piscina 
   CONSTRAINT     O   ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT sid_piscina UNIQUE (idpis);
 =   ALTER TABLE ONLY public.piscina DROP CONSTRAINT sid_piscina;
       public                 postgres    false    245            "           2606    18464    requisicao sid_requisicao 
   CONSTRAINT     Z   ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT sid_requisicao UNIQUE (cpf, idreq);
 C   ALTER TABLE ONLY public.requisicao DROP CONSTRAINT sid_requisicao;
       public                 postgres    false    248    248            )           2606    18466    restaurante sid_restaurante 
   CONSTRAINT     W   ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT sid_restaurante UNIQUE (idres);
 E   ALTER TABLE ONLY public.restaurante DROP CONSTRAINT sid_restaurante;
       public                 postgres    false    250            0           2606    18468    saida sid_saida 
   CONSTRAINT     M   ALTER TABLE ONLY public.saida
    ADD CONSTRAINT sid_saida UNIQUE (idsaida);
 9   ALTER TABLE ONLY public.saida DROP CONSTRAINT sid_saida;
       public                 postgres    false    252            �           1259    18469    fka_encaminha_para_h_ind    INDEX     V   CREATE INDEX fka_encaminha_para_h_ind ON public.ambulatorio USING btree (idhospital);
 ,   DROP INDEX public.fka_encaminha_para_h_ind;
       public                 postgres    false    220            �           1259    18470    fka_o_aco_ind    INDEX     Q   CREATE INDEX fka_o_aco_ind ON public.a_oferece_item USING btree (codigo_quarto);
 !   DROP INDEX public.fka_o_aco_ind;
       public                 postgres    false    217                       1259    18471    fkbonifica_ind    INDEX     S   CREATE INDEX fkbonifica_ind ON public.programa_de_fidelidade USING btree (codigo);
 "   DROP INDEX public.fkbonifica_ind;
       public                 postgres    false    246            :           1259    18472    fke_possui_v_ind    INDEX     F   CREATE INDEX fke_possui_v_ind ON public.vaga USING btree (codigoest);
 $   DROP INDEX public.fke_possui_v_ind;
       public                 postgres    false    256                       1259    18473    fkf_atende_r_ind    INDEX     J   CREATE INDEX fkf_atende_r_ind ON public.requisicao USING btree (f_a_cpf);
 $   DROP INDEX public.fkf_atende_r_ind;
       public                 postgres    false    248            �           1259    18474    fkf_r_fun_ind    INDEX     C   CREATE INDEX fkf_r_fun_ind ON public.f_recebe_b USING btree (cpf);
 !   DROP INDEX public.fkf_r_fun_ind;
       public                 postgres    false    230            �           1259    18475    fkf_trabalhapara_u_ind    INDEX     N   CREATE INDEX fkf_trabalhapara_u_ind ON public.funcionario USING btree (cnpj);
 *   DROP INDEX public.fkf_trabalhapara_u_ind;
       public                 postgres    false    231            �           1259    18476    fkh_c_hos_ind    INDEX     G   CREATE INDEX fkh_c_hos_ind ON public.h_consome_item USING btree (cpf);
 !   DROP INDEX public.fkh_c_hos_ind;
       public                 postgres    false    232            #           1259    18477    fkh_faz_r_ind    INDEX     @   CREATE INDEX fkh_faz_r_ind ON public.reserva USING btree (cpf);
 !   DROP INDEX public.fkh_faz_r_ind;
       public                 postgres    false    249            6           1259    18478    fkh_possui_u_ind    INDEX     F   CREATE INDEX fkh_possui_u_ind ON public.unidade USING btree (codigo);
 $   DROP INDEX public.fkh_possui_u_ind;
       public                 postgres    false    255            �           1259    18479    fkite_ite_ind    INDEX     J   CREATE INDEX fkite_ite_ind ON public.item_sai_do_e USING btree (coditem);
 !   DROP INDEX public.fkite_ite_ind;
       public                 postgres    false    237            �           1259    18480    fkm_realiza_atend_ind    INDEX     P   CREATE INDEX fkm_realiza_atend_ind ON public.atendimento USING btree (m_r_cpf);
 )   DROP INDEX public.fkm_realiza_atend_ind;
       public                 postgres    false    222                       1259    18481    fkm_t_med_ind    INDEX     I   CREATE INDEX fkm_t_med_ind ON public.m_trabalhapara_a USING btree (cpf);
 !   DROP INDEX public.fkm_t_med_ind;
       public                 postgres    false    238                       1259    18482    fkp_ehlevadopara_a_ind    INDEX     L   CREATE INDEX fkp_ehlevadopara_a_ind ON public.paciente USING btree (idamb);
 *   DROP INDEX public.fkp_ehlevadopara_a_ind;
       public                 postgres    false    243            �           1259    18483    fkp_gera_atend_ind    INDEX     I   CREATE INDEX fkp_gera_atend_ind ON public.atendimento USING btree (cpf);
 &   DROP INDEX public.fkp_gera_atend_ind;
       public                 postgres    false    222                       1259    18484    fkper_med_ind    INDEX     G   CREATE INDEX fkper_med_ind ON public.pertence_a USING btree (idmedic);
 !   DROP INDEX public.fkper_med_ind;
       public                 postgres    false    244                       1259    18485    fkr_i_aco_ind    INDEX     M   CREATE INDEX fkr_i_aco_ind ON public.r_inclui_a USING btree (codigo_quarto);
 !   DROP INDEX public.fkr_i_aco_ind;
       public                 postgres    false    247            ;           1259    18486    fkreservavaga_ind    INDEX     D   CREATE INDEX fkreservavaga_ind ON public.vaga USING btree (codigo);
 %   DROP INDEX public.fkreservavaga_ind;
       public                 postgres    false    256            �           1259    18487    fku_possui_d_ind    INDEX     I   CREATE INDEX fku_possui_d_ind ON public.dependencias USING btree (cnpj);
 $   DROP INDEX public.fku_possui_d_ind;
       public                 postgres    false    225            *           1259    18488    fku_possui_r_ind    INDEX     L   CREATE INDEX fku_possui_r_ind ON public.robo_de_delivey USING btree (cnpj);
 $   DROP INDEX public.fku_possui_r_ind;
       public                 postgres    false    251            7           1259    18489    fku_possui_s_ind    INDEX     G   CREATE INDEX fku_possui_s_ind ON public.unidade USING btree (idsetor);
 $   DROP INDEX public.fku_possui_s_ind;
       public                 postgres    false    255            3           1259    18490    fku_r_mov_ind    INDEX     F   CREATE INDEX fku_r_mov_ind ON public.u_realiza_m USING btree (idmov);
 !   DROP INDEX public.fku_r_mov_ind;
       public                 postgres    false    254            I           2606    18491 #   entrada entrada_codigo_reserva_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);
 M   ALTER TABLE ONLY public.entrada DROP CONSTRAINT entrada_codigo_reserva_fkey;
       public               postgres    false    249    4901    226            M           2606    18496    estoque estoque_cnpj_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_cnpj_fkey FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 C   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_cnpj_fkey;
       public               postgres    false    229    255    4921            B           2606    18501 #   ambulatorio fka_encaminha_para_h_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fka_encaminha_para_h_fk FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);
 M   ALTER TABLE ONLY public.ambulatorio DROP CONSTRAINT fka_encaminha_para_h_fk;
       public               postgres    false    234    4857    220            >           2606    18506    a_oferece_item fka_o_aco_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT fka_o_aco_fk FOREIGN KEY (codigo_quarto) REFERENCES public.acomodacao(codigo_quarto);
 E   ALTER TABLE ONLY public.a_oferece_item DROP CONSTRAINT fka_o_aco_fk;
       public               postgres    false    4808    219    217            ?           2606    18511    a_oferece_item fka_o_ite    FK CONSTRAINT     {   ALTER TABLE ONLY public.a_oferece_item
    ADD CONSTRAINT fka_o_ite FOREIGN KEY (coditem) REFERENCES public.item(coditem);
 B   ALTER TABLE ONLY public.a_oferece_item DROP CONSTRAINT fka_o_ite;
       public               postgres    false    217    236    4861            D           2606    18516    area fkacad_possui_area    FK CONSTRAINT     z   ALTER TABLE ONLY public.area
    ADD CONSTRAINT fkacad_possui_area FOREIGN KEY (iddep) REFERENCES public.academia(iddep);
 A   ALTER TABLE ONLY public.area DROP CONSTRAINT fkacad_possui_area;
       public               postgres    false    218    4802    221            \           2606    18521 $   programa_de_fidelidade fkbonifica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT fkbonifica_fk FOREIGN KEY (codigo) REFERENCES public.hotel(codigo);
 N   ALTER TABLE ONLY public.programa_de_fidelidade DROP CONSTRAINT fkbonifica_fk;
       public               postgres    false    246    235    4859            @           2606    18526    academia fkdep_aca_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.academia
    ADD CONSTRAINT fkdep_aca_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 ?   ALTER TABLE ONLY public.academia DROP CONSTRAINT fkdep_aca_fk;
       public               postgres    false    218    4830    225            A           2606    18531    acomodacao fkdep_aco_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.acomodacao
    ADD CONSTRAINT fkdep_aco_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 A   ALTER TABLE ONLY public.acomodacao DROP CONSTRAINT fkdep_aco_fk;
       public               postgres    false    219    4830    225            C           2606    18536    ambulatorio fkdep_amb_fk    FK CONSTRAINT        ALTER TABLE ONLY public.ambulatorio
    ADD CONSTRAINT fkdep_amb_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 B   ALTER TABLE ONLY public.ambulatorio DROP CONSTRAINT fkdep_amb_fk;
       public               postgres    false    4830    220    225            K           2606    18541    espaco_de_eventos fkdep_esp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.espaco_de_eventos
    ADD CONSTRAINT fkdep_esp_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 H   ALTER TABLE ONLY public.espaco_de_eventos DROP CONSTRAINT fkdep_esp_fk;
       public               postgres    false    227    225    4830            [           2606    18546    piscina fkdep_pis_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.piscina
    ADD CONSTRAINT fkdep_pis_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 >   ALTER TABLE ONLY public.piscina DROP CONSTRAINT fkdep_pis_fk;
       public               postgres    false    245    4830    225            c           2606    18551    restaurante fkdep_res_fk    FK CONSTRAINT        ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT fkdep_res_fk FOREIGN KEY (iddep) REFERENCES public.dependencias(iddep);
 B   ALTER TABLE ONLY public.restaurante DROP CONSTRAINT fkdep_res_fk;
       public               postgres    false    225    250    4830            W           2606    18556    nota_fiscal fke_gera_nf    FK CONSTRAINT     y   ALTER TABLE ONLY public.nota_fiscal
    ADD CONSTRAINT fke_gera_nf FOREIGN KEY (idmov) REFERENCES public.entrada(idmov);
 A   ALTER TABLE ONLY public.nota_fiscal DROP CONSTRAINT fke_gera_nf;
       public               postgres    false    242    226    4832            k           2606    18561    vaga fke_possui_v_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT fke_possui_v_fk FOREIGN KEY (codigoest) REFERENCES public.estacionamento(codigoest);
 >   ALTER TABLE ONLY public.vaga DROP CONSTRAINT fke_possui_v_fk;
       public               postgres    false    4842    256    228            `           2606    18566    requisicao fkf_atende_r_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT fkf_atende_r_fk FOREIGN KEY (f_a_cpf) REFERENCES public.funcionario(cpf);
 D   ALTER TABLE ONLY public.requisicao DROP CONSTRAINT fkf_atende_r_fk;
       public               postgres    false    248    4850    231            N           2606    18571    f_recebe_b fkf_r_ben    FK CONSTRAINT     |   ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT fkf_r_ben FOREIGN KEY (idbenef) REFERENCES public.beneficio(idbenef);
 >   ALTER TABLE ONLY public.f_recebe_b DROP CONSTRAINT fkf_r_ben;
       public               postgres    false    4823    223    230            O           2606    18576    f_recebe_b fkf_r_fun_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.f_recebe_b
    ADD CONSTRAINT fkf_r_fun_fk FOREIGN KEY (cpf) REFERENCES public.funcionario(cpf);
 A   ALTER TABLE ONLY public.f_recebe_b DROP CONSTRAINT fkf_r_fun_fk;
       public               postgres    false    230    231    4850            P           2606    18581 !   funcionario fkf_trabalhapara_u_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fkf_trabalhapara_u_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 K   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT fkf_trabalhapara_u_fk;
       public               postgres    false    4921    231    255            a           2606    18586    requisicao fkh_abre_r    FK CONSTRAINT     s   ALTER TABLE ONLY public.requisicao
    ADD CONSTRAINT fkh_abre_r FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);
 ?   ALTER TABLE ONLY public.requisicao DROP CONSTRAINT fkh_abre_r;
       public               postgres    false    4855    233    248            Q           2606    18591    h_consome_item fkh_c_hos_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT fkh_c_hos_fk FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);
 E   ALTER TABLE ONLY public.h_consome_item DROP CONSTRAINT fkh_c_hos_fk;
       public               postgres    false    232    233    4855            R           2606    18596    h_consome_item fkh_c_ite    FK CONSTRAINT     {   ALTER TABLE ONLY public.h_consome_item
    ADD CONSTRAINT fkh_c_ite FOREIGN KEY (coditem) REFERENCES public.item(coditem);
 B   ALTER TABLE ONLY public.h_consome_item DROP CONSTRAINT fkh_c_ite;
       public               postgres    false    236    232    4861            b           2606    18601    reserva fkh_faz_r_fk    FK CONSTRAINT     r   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT fkh_faz_r_fk FOREIGN KEY (cpf) REFERENCES public.hospede(cpf);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT fkh_faz_r_fk;
       public               postgres    false    233    249    4855            i           2606    18606    unidade fkh_possui_u_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT fkh_possui_u_fk FOREIGN KEY (codigo) REFERENCES public.hotel(codigo);
 A   ALTER TABLE ONLY public.unidade DROP CONSTRAINT fkh_possui_u_fk;
       public               postgres    false    255    235    4859            S           2606    18611    item_sai_do_e fkite_est    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT fkite_est FOREIGN KEY (codestoque) REFERENCES public.estoque(codestoque);
 A   ALTER TABLE ONLY public.item_sai_do_e DROP CONSTRAINT fkite_est;
       public               postgres    false    237    229    4844            T           2606    18616    item_sai_do_e fkite_ite_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.item_sai_do_e
    ADD CONSTRAINT fkite_ite_fk FOREIGN KEY (coditem) REFERENCES public.item(coditem);
 D   ALTER TABLE ONLY public.item_sai_do_e DROP CONSTRAINT fkite_ite_fk;
       public               postgres    false    236    4861    237            E           2606    18621     atendimento fkm_realiza_atend_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fkm_realiza_atend_fk FOREIGN KEY (m_r_cpf) REFERENCES public.medico(cpf);
 J   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fkm_realiza_atend_fk;
       public               postgres    false    222    240    4871            U           2606    18626    m_trabalhapara_a fkm_t_amb    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT fkm_t_amb FOREIGN KEY (idamb) REFERENCES public.ambulatorio(idamb);
 D   ALTER TABLE ONLY public.m_trabalhapara_a DROP CONSTRAINT fkm_t_amb;
       public               postgres    false    4813    220    238            V           2606    18631    m_trabalhapara_a fkm_t_med_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.m_trabalhapara_a
    ADD CONSTRAINT fkm_t_med_fk FOREIGN KEY (cpf) REFERENCES public.medico(cpf);
 G   ALTER TABLE ONLY public.m_trabalhapara_a DROP CONSTRAINT fkm_t_med_fk;
       public               postgres    false    238    240    4871            J           2606    18636    entrada fkmov_ent_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT fkmov_ent_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);
 >   ALTER TABLE ONLY public.entrada DROP CONSTRAINT fkmov_ent_fk;
       public               postgres    false    241    4873    226            f           2606    18641    saida fkmov_sai_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.saida
    ADD CONSTRAINT fkmov_sai_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);
 <   ALTER TABLE ONLY public.saida DROP CONSTRAINT fkmov_sai_fk;
       public               postgres    false    241    4873    252            X           2606    18646    paciente fkp_ehlevadopara_a_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT fkp_ehlevadopara_a_fk FOREIGN KEY (idamb) REFERENCES public.ambulatorio(idamb);
 H   ALTER TABLE ONLY public.paciente DROP CONSTRAINT fkp_ehlevadopara_a_fk;
       public               postgres    false    4813    220    243            F           2606    18651    atendimento fkp_gera_atend_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fkp_gera_atend_fk FOREIGN KEY (cpf) REFERENCES public.paciente(cpf);
 G   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fkp_gera_atend_fk;
       public               postgres    false    4880    222    243            Y           2606    18656    pertence_a fkper_ate    FK CONSTRAINT     �   ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT fkper_ate FOREIGN KEY (protocolo) REFERENCES public.atendimento(protocolo);
 >   ALTER TABLE ONLY public.pertence_a DROP CONSTRAINT fkper_ate;
       public               postgres    false    222    244    4821            Z           2606    18661    pertence_a fkper_med_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pertence_a
    ADD CONSTRAINT fkper_med_fk FOREIGN KEY (idmedic) REFERENCES public.medicamento(idmedic);
 A   ALTER TABLE ONLY public.pertence_a DROP CONSTRAINT fkper_med_fk;
       public               postgres    false    4869    239    244            ^           2606    18666    r_inclui_a fkr_i_aco_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT fkr_i_aco_fk FOREIGN KEY (codigo_quarto) REFERENCES public.acomodacao(codigo_quarto);
 A   ALTER TABLE ONLY public.r_inclui_a DROP CONSTRAINT fkr_i_aco_fk;
       public               postgres    false    247    4808    219            _           2606    18671    r_inclui_a fkr_i_res    FK CONSTRAINT     x   ALTER TABLE ONLY public.r_inclui_a
    ADD CONSTRAINT fkr_i_res FOREIGN KEY (codigo) REFERENCES public.reserva(codigo);
 >   ALTER TABLE ONLY public.r_inclui_a DROP CONSTRAINT fkr_i_res;
       public               postgres    false    4901    247    249            l           2606    18676    vaga fkreservavaga_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.vaga
    ADD CONSTRAINT fkreservavaga_fk FOREIGN KEY (codigo) REFERENCES public.reserva(codigo);
 ?   ALTER TABLE ONLY public.vaga DROP CONSTRAINT fkreservavaga_fk;
       public               postgres    false    4901    249    256            G           2606    18681    condominio fku_possui_c_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fku_possui_c_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 D   ALTER TABLE ONLY public.condominio DROP CONSTRAINT fku_possui_c_fk;
       public               postgres    false    4921    255    224            H           2606    18686    dependencias fku_possui_d_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.dependencias
    ADD CONSTRAINT fku_possui_d_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 F   ALTER TABLE ONLY public.dependencias DROP CONSTRAINT fku_possui_d_fk;
       public               postgres    false    225    4921    255            L           2606    18691    estacionamento fku_possui_e_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT fku_possui_e_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 H   ALTER TABLE ONLY public.estacionamento DROP CONSTRAINT fku_possui_e_fk;
       public               postgres    false    4921    228    255            d           2606    18696    robo_de_delivey fku_possui_r_fk    FK CONSTRAINT        ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT fku_possui_r_fk FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 I   ALTER TABLE ONLY public.robo_de_delivey DROP CONSTRAINT fku_possui_r_fk;
       public               postgres    false    251    255    4921            j           2606    18701    unidade fku_possui_s_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT fku_possui_s_fk FOREIGN KEY (idsetor) REFERENCES public.setor(idsetor);
 A   ALTER TABLE ONLY public.unidade DROP CONSTRAINT fku_possui_s_fk;
       public               postgres    false    253    4914    255            g           2606    18706    u_realiza_m fku_r_mov_fk    FK CONSTRAINT        ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT fku_r_mov_fk FOREIGN KEY (idmov) REFERENCES public.movimentacao(idmov);
 B   ALTER TABLE ONLY public.u_realiza_m DROP CONSTRAINT fku_r_mov_fk;
       public               postgres    false    4873    241    254            h           2606    18711    u_realiza_m fku_r_uni    FK CONSTRAINT     u   ALTER TABLE ONLY public.u_realiza_m
    ADD CONSTRAINT fku_r_uni FOREIGN KEY (cnpj) REFERENCES public.unidade(cnpj);
 ?   ALTER TABLE ONLY public.u_realiza_m DROP CONSTRAINT fku_r_uni;
       public               postgres    false    4921    255    254            ]           2606    18716 A   programa_de_fidelidade programa_de_fidelidade_codigo_reserva_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programa_de_fidelidade
    ADD CONSTRAINT programa_de_fidelidade_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);
 k   ALTER TABLE ONLY public.programa_de_fidelidade DROP CONSTRAINT programa_de_fidelidade_codigo_reserva_fkey;
       public               postgres    false    246    249    4901            e           2606    18721 3   robo_de_delivey robo_de_delivey_codigo_reserva_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.robo_de_delivey
    ADD CONSTRAINT robo_de_delivey_codigo_reserva_fkey FOREIGN KEY (codigo_reserva) REFERENCES public.reserva(codigo);
 ]   ALTER TABLE ONLY public.robo_de_delivey DROP CONSTRAINT robo_de_delivey_codigo_reserva_fkey;
       public               postgres    false    249    251    4901            �   8  x���OK1���)rT(K��<y�À��^]FXP��o��w_�s|���e��~�p�ew��ϟ���i�|�x]���z<���t{����;j'8J�7��o�8j'9ʐ,h)��HE-ɘϤ&��
�rkL+&���w�1am�f�`Ύf�T�t:�W*�U�$����1��a���¤f1j8�� c���MWV�����b&g�ar�-m��7<�-�#ޘ8�VtD��ӕ&t$Xёh�Sc���#�����q�X9���   �
 � T3 é�OY�S�$����0����q��8��/�2      �   \   x���v
Q���W((M��L�KLNLI��LTs�	uV�02�Q "#Mk.Ob��)��u�Ȑh�&:
@dL�{�Lu��d> �<B�          �  x��V�n�0����A!��m�S���� A�;#�1I(��9�Pd�֩�~�G�n%@j�6ɐ��޻����v}w�67���l2��S��m�eٗ����-{]�pu���f��W�A��q
/����g���8��>��5O���c��6iJ�z�O�r�exu��_b�����:�R�l��j�N�U��T�?�����~͗%�T��~Uy��_B�"�.�A�U��N�e�I'Mm����$��cn����L'�h�&�X� ��U+��M�{Hʨ�E4���*��Q2_��}l�"�)D�"�>f{Su$#N��:?CDт���y4���Ne�3jO��:�(�t<9BۉyW&�EbTF��R�r����]�ud��Db`�����v&u6WU�uNFWO��T��O20z˗#�Ӧ���DD@�*�?�u�ڑ���=�;]i�N����T���9��ސ��aM�M\U*�'<I����Ը��R�z#���xJUX�~G"w!/��|LД�N��L�7S쨡��\��g�g�������$[���鮫!�)O.F4P;s�P��������7�{�"ߗ��W��������ɀ4.�@��n<�+k�����X�'��C|��t��a�;�"x�������#���#�]�N���}��0V�8�I����u)ǒs�}B�a�f Y���         `   x���v
Q���W((M��L�K�M*�I,�/��Ws�	uV�0�Q04bMk.O�tU��(�d����1�:����(���RG����� +`IS         �   x���v
Q���W((M��L�K,JMTs�	uV�Pw-.9�+%3_!%U!2?=Q]G��5��<	�N�I�.�����K�5�5"FoT~^��[i^r&���i�iL��Í .������Ҝ���/�`
4��LgB��� x�[�           x����J1����U���d�*{X�
m�7���[�<�}1�,��A{
d��M�զYoY��޳��iݥ��ч]?N�=.o�;��X�[���17zW.dF�T�H��F�d:��d�g<�����0M��}(8v����t��D&#I�P��̈V	M���H��.�ۺ���B���E�_�arÏV,qJ"�\ڒN0�I� �o��UJ5�5��z����"�r�=A&�Z,�5�LS���B�V�VK��!��^s�J         �   x���=�0��S|��bĉ�����o/�4��Q�B�͵������}�4�����i��h����0)��Ć�A2��#\�yr\�@�!-�d���%�͵�4�N4z�ܭ��V�$B(�U����&jBl���q�����2lQ�J�]
�#�c7�ߧ������Y���q�           x��ҿJ�0����"[I��8�I
�y��ۀ�6��s�o#����3��`�Ю!��|)e~_��P݂^?����9kxG��q��Kpᯁ����8�!�~��5@�f}�_0h���D�XM�wy�*f��>ti8ҹ�U÷0�7�='�����|?0N������ᓃ�\+���|:4D:��UvXt����-�9���\�����[Ғ�jl���Q�ӔK�d�VZP�-�X8v_����� �0E�|65�7j�ϼ�D�������8tSdSz�rAk�*-�ҫ��H�-           x����n�6��y
���B$%ٞ���p2A<���-�ʒ�� ��.
t��	�b%e'!EI& ;�?���^n�6��/��ݗ���}�y�C�v��X�rZ_����&�}.X�ж�EÂOe[mYs)�^�펊q(� !��	I�0Dϊ7�=���/1���G~V8?>��ǋK4�C������V*\"�" Q�f�p���Oe�j�q��WII�@��ĝ,�]���h�m&�P��+��-��u���VT�"k��:|��%��E,Q�n
K�;�Jl�a�,��s����Z ���k˹����e)��p�,"@���E�ʵ�[�o��T��+.^�酏��M �M	�%�߻����2�Xp-����a��d��z��\�-��?M�:�G�,��3$���.dWe���^��ʭ�����R�zC��ۧ6�ǒ��z:+;�d�|�z���d�%�d���i�F&2�X���[��j��o�·=#���{�;�<��V_�����L�m�Q�BM��s��C�-'�zx�� �ܼ�J�b�j^QWD�tJ^Q�[����\�%�N���o@�;\��z�Y�6��'O���Ҳ� �PGG3��4��M�jݹ����$��Ы�`WUYׂN�5<�4� ��zL����ղ��!Ck��׌�#���S�t]���<��SG�@ۈ�u��O�pb-n:OqÆ'���u3�Q�L_7����0��@\�u$���#�1�W�qۭRs��v��>�F�*�Gs�"#Z��~ xLF�1#@.����b�B�T,��6�9�DiSw��(���{u�BZ�s����͙��bg	H�� @׈�%�l Y�.�ȴ%(���a%ra3ap��R@�F�(�� 4�^�3�{A�t ��<S~���"p��3v�)�u�����o��
��s6�c@&w.-������i��.!�+� ���V���f���t��[d�d��{��-6�	���R�0�ņ-�.�,��']  ��
����W�3lah��!?���0:�B萟�ǆ+�\ר�7�O�I�I5�o�����{�kx��M�
����Uy�&��
��
�s��@C�zcr�ZK�w��w.�m�y�a����/�$22/w�iQV�?�I��c#�E����=�Y����j��XM+�;a覂��Z�����9cB�vL�W�3��F�Юw�}���x�������B���Rꗤ � �t��m�D���q�/���[��<$:#����{0�         �   x��ѻ
�@��>OqJ�E�5W�,R$����R""���{��ͦ�����h]?���9�o����~M�Ɏ���l�
Ƴ�=_g��>��>��"X��B��`e�K���U����V����&X��F������8[��$��>���pj�֠4\"7��(z��!���pF���"\"ed�2��$q���7�ϲ/� �         �   x����
�@��O17$45�NBX�u�I'X�]�Uߧk���k�������?q�Eiq�����(Wd,UQQA=�V��O�(���������v`��˝�a<�g������������g*�N��CJ����dz�|��6�dZ4P�=i3��Pl�;7�y��U�,���-�����      	   �   x��б
�0�O��
E.iS+N"����i�P���)��^A���\�������Ȫ>����]�1��m笾��ʫPdES�[�� h�b|���X�c�2HH
�}$�&�L�D��y�[F��X�8��/�L�0��ft����Q����E�O��u�%8
Q�T��'      
   
   x���             1  x���MK�@E���UAd�W&CW.�H[�RR\��oRq��M�w}��d�3���c;�/��{��8?^N_�y��ؾ?=���=�#�d�K�o�Ͱj��PK_2'*�2%Y��B�x�P�!��m�h���a�sg*L)�.p~����'�q�S����X������bp���7ǃ�Q�<���`p��9N�`p�_�_��õ�Zi-��c� ����kA8}-��bp8�bp��C����4� �*��
�$� �*��
��8� �*@�
��(� �*@�
Ш����9�         �  x���Kn�0@�9�wn�����r�H`���f��Xb�hP�Q�6EE=�/V~dR�좠H Q��C�O���������h]�r�~z�˔��������r�a8���(DA<��B���#������5��ɇ��5���� ex��b�w ^{ȉP�!�w�?_<�'�G�'���D������q�$�B��)^�AH��PFq� ��y*�k`9���s�0am�5ݑ򝿔�[���%9"bW�'��ʍ��P��"��$�������|5���l#���&�����{~���1��� e�b����aVB�X����h'\fùf��Һ��N�$kA����.�[͠���/Ck��5�)��+V����:+;�-d�����P=A�$�V��\��w�p�)�O����L�����j`�L�rLeӲ^c�%eø�i| 'Qi��s1��2���7>�����d��j5�M:w�=K��=�<ld����S~�:*�_`�VM�c�ͯ�yJ��m){j`��Ec)���	������{Q�&�ns$o4%�oϻ��&f�o��5>�{�����VV�YM�g�J�� �C��=81͜~7��FN+Z�֕�Zk�.N��������:crX�S� vu�*O�q�L,m�з��Y#=�M=5�I)ӉVR��Uо��_��~���:[�k+�o��@wVg�u��QgjyyY������e@����R1?�P�<'geX##�M�:���Xn�ה=4�ݤ��O-^�p=UhNt7���\A��u�J�j��"�[����J�KN�G׃��"k���&e�
VM-w�3v�Ee�w��)mhG����9�n����s����ʹ����s��s]��� =�su%y|�v�aTOS����UU�lN���q�V7����*k�����]M�|T��]׺�1�hܿ�-�8����j�='ud�x8915kKSǅM��=���_`$�         �   x����
�0�{���)��M��x�CA&��u�8pNP�������亩N��u{����>��[�Ϗ�<��&}��U�W���b�-�z���ށe�d�#�d�9�q>sOދ=�@>��g^�/���#�(�̑<�
e��r�$η� ���_��״         F  x���Mn�0��>�wn�"0�OtS7M��n����(Ѡ$/|����)|��3T%�h%x��7\nv��t��?OOM*EvwTՉ�|�s���~��$�}?��	�}���P���9�KBh�� �b��Q|9LȻL���'���x~FqB�ĳ������wB�a�J�$��0��%�Qɷ笚�U be�`�[����3�*�s:���y�ˀ�hܻ���=�I]���TsHH�c���M�w�N��!߹.Y���,Ź-(2N@x��Ɇ�:\�=�5T��
7�@�ݞ�`8���)_9�����i�^Hu ��5�Y
z�e��KH��j�%ԁ���A����߰*7&w�u�Ske#r�ATY�ֵ�e��������1��@-+�r,͌�Z�mv�~(�^���(��E�޾�k�	0��S#��gR�oT��~C՘ ���*�˺g���Q��=�Q5&Ƙ/�`ekU֦2��w}j5c�Lq����*iKJno&��cr�Z�W��\U�n��8�S��1In�ČK(�[c�]��=V��9��Q|1S��'P����<W.���y��Шny��_tEZ         �   x����
�@�O�7"vWהNBB�y�r�qů��=@���b͆v�6�g�13Q���Eqz@Uw.�eyUM%[^�l�?�	���	u\�|�1	���;��B�Z6�~�PC�0<_[���4Ё����ɜ��w������Se���j,�M%j^�7��SU�%F��j�z��~��`���PjT��aQJU#s�籖��ր:         �   x����j�@�{�bn*�hժ�KĀ��D��적aG�ߩO�3����o��&��W	����������!����>t��V�v蹶;}��ޒ��}i����?b�XQ��1z����<���`wh���
�F�u�~V��v�U�������9����.ޢBPha�b������{���P;T����R���X=^ݟ��$7�=�         9  x���MN�@��=�w�"�?bE�J*�Ԕv�L��d꩒��[Nы�,YA��|~��d��KHf�9�Bfٜ��-������'�?|n��h!r����ND��?��%p�U����B���� v�q.TS�J/RKI7�eK(���jcʒ{����Pˊ�����v2z-�K�5�Ea���.ʂ��Z�+�����;��a�U;��1��۲7�^��T{xt���VTCd�T0Ōl7䭪�`ZO�\��$f�C{s�n�����÷)	Ґ����Q\����0����N_�!����-�7���n�m         
   x���             �   x���v
Q���W((M��L�ˍ/)JLJ��H,H,J�OTs�	uV�0�QP�47�4422006W״��$A�P������������ڍ�ځ!&������x3c�v�햤j�j74�4756�032i�� ��Z�         �   x��бj�0��O�--TA:W��)�!)u�]�U8�t�lA�۔>J^��ܡct|��W�z�zb��td>�;l�ִ�hk�@�}����N>��Rp	�b���c ��%G�=�V��?#�4~����� ����9�EݘA[���D�������n./E��s�>��,߾|�t<�q'Wr9��n-]��]n���7��}�P3h5���� �:Zヾ�v���Q-�9ۅ�         �   x���MO1�����-$F�׶�����Ң�jҤPR��o��W�4���̛�va6�-7+8]���n�w>�����I�%ׄ�ٌ�����e\4%X�%Ĳ��[�α�>W���T7LrB���7�*c%h�X���#Ɍ��\d�
�gVo��˶
��|g2å���j�Q�^���{_<��q.Z
�UC�ྴ�����Ѕۗ]�V��>tj         �  x��W�n�0��S�n�� �I�V\mcB���A�z�[,;�I�x&.и��b|�3X(J�$wq��|��������-ίߢ��ME�"S[�qY��)��xysv�����_r����G�J��RL�����vu����(����0��o�K���˽�!�Ѹ2��A��V�0���Dv������E4�z4�Į.zaİ�}~4�q��vu��4k���2�0�TwZ��l��"lX#����k�0 4 ������q��g�+�@������� %������r	�R.ӡ�����f�|��B�D�	� �Flg͸:�53h�qgqF6~�x�
�Bî��:������<�` 6�Ӯ�C��$�)ow�kh�Q'I!�n�S���Ag��p��^�"��W��Zq�R���T�C�z�6�nPl���	_)͍]���X�<�CBP3���e�e����(�ϥ��X�Ш��P�D���{ gZ$r�7�.��9ȅt@K&LzZ��i�G']�o�]aJ���v���`�ҏ�)�æ&���
A��������W`b�I��g:԰S[��̀P���'bŬO 5�/��4��Qm�7�4���97�]�Z_X��8�4�A���9P�_@J��@�S�Z[�D���
4��6F��ߏc&
v:\r�q$��M�(,������;��         �  x���ˎ�0@�|�w�R<��y�V�>f�TM�Zu7�PE2
��]N���0!�ri� � 7>�>����]�.��f�<>=���j���~���&��~�z}G^�C�c*;�b�-7�>9k��e�K�,Qy|���b��2%_�TQ�rv�(�j�1pƮ��5��R�*挻�r��P�!Wy�Q���ڤ�2����eV����]���ߏ�Yw��f����o&�a��!����é�$5�Pf@-"jaI-X/��,��b��Y￬�a=�3`u�"��%k�m0�0����0�vK�X��C<ӳ-��D�y�E�P��*-��I��;�M��lH>{���C|޷�{����x�*��cd��!B�Vq��
�J=����*����	�жO�w����V�a����4rH�pF�����R柙G#�8z��o` LOr�I��dt2q�ËZk�Tڄ��/T�l�K��`|5�_���juL��ּ��-�y�;ȈL�n�gf%�}0[	s�7\����R]�S�
mB�0#��*Ym���d���O#/-5��تb�n5W�հ�^[���0Ze 1�51.0'ag�dLU���03K=�����Crۿ��
�6�}�&�'=`�־`���qln�ܤ
f�G���sn�&�}�>�}kDns�9m4�l2�1n�@           x����J�@��y��E!���=E��Ul���Q�ݐ4��>���sF<��e���~��V���~�fw����zѹ�7���c�~Xm�,5�\Z̈́I3H�::^5]O�C��r��d��_�="ݞ/�j�*ir�9��(��������]����l�%>׽Њ�����2�_h=���A��ǚ�8#�g��On3PD�p?'_�P����\Oy�RRic�\�j��az����H�����W���P(�?I� ����         P   x���v
Q���W((M��L�+H-*I�KN�OTs�	uV�0�Q0Դ��$J�)��u��Vl��`L�bSS�b.. ��C$         {   x���v
Q���W((M��L�+�,N��KTs�	uV�0�Q0�Q020 :
��@�@]Ӛ˓�f3�&�~S�f�fC"5��(5�m6[J��@�L@����H���hS�F���0����� Y�MC         I  x����J�@�{�bnU��d�O�=��m���Yk ib�>��/�lV��ҁ������X��k(��G莯u����v߫FmK�}�J]W�*5��=l+�� ��zص����{;t�T{��a Y x};+.��Y�U��:}�>[�Q��;XxD������ȕ�Ѵ�����n:ZA���8�~�>6$�v�T����v$KN΅Nx��Sw�)��U�r3GșE3��2�H6�ƒM�ސ��1���9!�~1���t��򺇑/�l���s�Y�WDs�8�ie^1qd�J{��*h��=1�v�+�ٓV��t��ٳyS���<��         �   x��б
�@����bJ�E2G	V)$���AS�@�?�O0���/u}{�������tZ����5�/</�G��@�琤8���R�+C%ǵ������1�(��A���I���Q���Y��D�wL�U���	av۾�         �  x����N�0��}��$��'!V8T����41ȫ����A{�w�k_l'iE�*�J��`�=��7��X=?<�a�Z?B�n������5�����v���g��\e��J2U�iz��>b?L�	�H��k����e����ݟ�TþG[ih\:���p�P��DmX�n�͛w�A���of��H�)U�Ǭ��:�3�闄����8�z�'��=�L��\�����Ro�
�0�q��9�=�r�5�~�~��u�h���H��>)��4�"�-m���g"Z
��{��6���o�s���Gar��0��8?�+�jҞ;W;x#�$U���HNAо3�
9�Ѣ�np&��������%���ǋ�	����7dƄ�X웏R��#�h�"&:��ʯ�T
N�H�l�o�         �  x���KK1����U���Hf2�r�EA*Xu�҅�B*��M2�9/tu���=给���}xT�����~�x�:�����|{��=�ܨ5���(�k�u-
)�H ��9:;2;7�/oV���(�JP��ͼlk3��,���F7�Ќ�SY��h�ɢLP�13�/�������S�ܼ�c�2Vh6̧Z��g���\��xB�1���	yqc��dXb�)��5
�r;|��Yns���� "uk�w��3<6Ar���<��G�<�����R[�H�8Ӏ1�$؁j(�V��&1����e�ݦT[�_J$ڪ�pg��h\n67���2���r� ĩ�� N��rbC��_� �&H�d�5R�)%���DF�%��4Z�6)�=�=�&�Z��)Ֆ�Xz!�z���w�O�@�����C�ϲ��(�XnH)!S}*�7s�Y�E�W�`�V���ַ         �   x����
�@��O17��4=t�Z���-1����Գ�b�ui��8��?���X ϊ���T-��z4U/�ٟ�f����mj� �;��4���S��V�b$��]�(	��2��L��F��ŉF$��jR�Iq0}6����F�t�b�W��Z� y���.��a�A�'9��          1  x���AN�0E�=��F���E�H��);4M�`ɩ#'A���ر��j��BYQ�{f<���H��e�d�U�Q2�6z��sa����ֳ�k����S�=�z#fzk���J�0�k�6�cL)ew�����a���n�3�D��VRZ���h�n�I���\�C�����<����)a�^����8�����l,�	�����?���SB�/����f�FfXW�4�]��H��7=���������N��`󝛶��h>.���H	6�Ak���a ,�
F�|`��      !   @  x����N�@E�|�t�
������H�8�_�3b�k�!BɷP ���1&Q*,�b��]͝�<KWk���h⳦��+*<��4����F��3X`iL��B�r���7�W0�0�+iڢ	��ء�t�%0b�Lhگ��B��QG�L�V�(��B#k|p1X��>�.����F" ��	dVGN�����J#rC�u[��t�"��E��鮛�Z#Fu�m
R����L�Աc�	��lޔCx@���؀Z9H��%W�j�&�����j��jQUT`a���}>����m�̆��Ԡ����~�QAHSxO������t�      "   �   x���v
Q���W((M��L�+N-�/Rs�	uV�0�Q040�QP/)JLJ���W״��$��HG��+#�����b��ĢD�����ks2�2�h�)��)�9%��D�`���b@ai�BAjQnfIj.�Q6�� ҙQ?      #   �   x��Ա
�0�O��
"w�6ipr�P�
���B���&tu���#�㿿i��ԛ���5ߦ񾝇��:����4���\wf��s`O�:"�B��.k����ۄY���E�ˈK���>b���C�^�� �2V��@:�,�u�3Vk��^�������lM;��ϰ6��P,R,%U�o�$U*��% [���R��w2�4      $   �  x���ˊ�0���ڥ����7�J����0�L�jlZ�k��@�7�b��м��r,ǲed(da�c�8�����߯`s�Nշ49:U�D,���j��ރ7�=�Aŋ%X|�e���9���$��<^>B`[F�E���Ҥ(Y��e��/��ϔ,�x�*�����"����%��~���')�������+5�n��<();���2�K��:�ׅ�2gQrLx�R�?KT׀�>Nx�;6����-&	t�j��
���#�p�n�rv~)88���Y:�8��tT�R��ڎ��!.x^^FN-Q}�]�����=O��W'����$p�C��������3��깚jg["C�*G�Y"��9��,9C�r��W�uvdYɢa�ͥr��Cw�Z��M��-I���<+c�J���T����a�x��{���"\�|h�o�Sˡ��TM����ې�5�����g�Ж��k|�F����W;�${j'mݎ�,�밺ۛJ\��ĥ��#{�#:C�:g_�A���vA�Z`��ڑ;_�:�ڛ@7с���Gۛy�̮S�~����Ns41r[�#�Z�:�ر/��&D�<*;ACD�Ŏ��b,��a7{
;�{�+����YbtU{Н<b�m�q��Nb/vl8x�Į��b�U���J��N�͎'Ϙ�ɔٱwu� �_�vl8�f�a���M��on^���!      %   �   x���v
Q���W((M��L�+KLOTs�	uV�0�Q "uu Z�����[�����5�'�F�� �.�i�ə�y%�@��a�1��(���~ϔ��| �����HZQ���)P?  �SC     