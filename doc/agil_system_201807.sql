


/*------ SYSDBA 01/07/2018 10:55:42 --------*/

ALTER TABLE SYS_CLIENTE
    ADD ID_ENDERECO DMN_GUID;

COMMENT ON COLUMN SYS_CLIENTE.ID_ENDERECO IS
'Endereco';




/*------ SYSDBA 01/07/2018 10:56:19 --------*/

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT FK_SYS_CLIENTE_ENDERECO
FOREIGN KEY (ID_ENDERECO)
REFERENCES TBL_CEP(ID_CEP)
ON DELETE SET NULL;




/*------ SYSDBA 01/07/2018 11:15:40 --------*/

ALTER TABLE SYS_CLIENTE
    ADD DS_ENDERECO DMN_VCHAR_250,
    ADD NR_ENDERECO DMN_VCHAR_10,
    ADD DS_COMPLEMENTO DMN_VCHAR_50,
    ADD ID_BAIRRO DMN_GUID,
    ADD CD_CIDADE DMN_INTEGER,
    ADD NR_CEP DMN_BIGINT;

COMMENT ON COLUMN SYS_CLIENTE.ID_ENDERECO IS
'Endereco - ID';

COMMENT ON COLUMN SYS_CLIENTE.DS_ENDERECO IS
'Endereco - Descricao';

COMMENT ON COLUMN SYS_CLIENTE.NR_ENDERECO IS
'Endereco - Numero';

COMMENT ON COLUMN SYS_CLIENTE.DS_COMPLEMENTO IS
'Endereco - Complemento';

COMMENT ON COLUMN SYS_CLIENTE.ID_BAIRRO IS
'Bairro';

COMMENT ON COLUMN SYS_CLIENTE.CD_CIDADE IS
'Cidade';

COMMENT ON COLUMN SYS_CLIENTE.NR_CEP IS
'CEP';




/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column ID_CLIENTE position 1;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column CD_CLIENTE position 2;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column NM_CLIENTE position 3;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column DS_CLIENTE position 4;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column NR_CPF_CNPJ position 5;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column NR_RG_IE position 6;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column LG_CLIENTE position 7;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column TP_CADASTRO position 8;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column TP_CLIENTE position 9;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column ID_ENDERECO position 10;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column DS_ENDERECO position 11;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column NR_ENDERECO position 12;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column DS_COMPLEMENTO position 13;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column ID_BAIRRO position 14;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column CD_CIDADE position 15;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column CD_ESTADO position 16;


/*------ SYSDBA 01/07/2018 11:15:48 --------*/

alter table SYS_CLIENTE
alter column NR_CEP position 17;


/*------ SYSDBA 01/07/2018 11:16:43 --------*/

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT FK_SYS_CLIENTE_BAIRRO
FOREIGN KEY (ID_BAIRRO)
REFERENCES TBL_BAIRRO(ID_BAIRRO);

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT FK_SYS_CLIENTE_CIDADE
FOREIGN KEY (CD_CIDADE)
REFERENCES TBL_CIDADE(CD_CIDADE);




/*------ SYSDBA 01/07/2018 14:32:31 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT'
where (RDB$FIELD_NAME = 'NR_CEP_INICIAL') and
(RDB$RELATION_NAME = 'TBL_CIDADE')
;




/*------ SYSDBA 01/07/2018 14:32:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT'
where (RDB$FIELD_NAME = 'NR_CEP_FINAL') and
(RDB$RELATION_NAME = 'TBL_CIDADE')
;



/*------ SYSDBA 01/07/2018 19:14:41 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
B.CD_CIDADE.
At line 4, column 11.

*/


/*------ SYSDBA 01/07/2018 19:23:22 --------*/

CREATE INDEX IDX_TBL_CEP_ENDERECO
ON TBL_CEP (DS_ENDERECO);

CREATE INDEX IDX_TBL_CEP_LOGRAD
ON TBL_CEP (DS_LOGRADOURO);




/*------ SYSDBA 01/07/2018 19:26:54 --------*/

ALTER TABLE TBL_CEP
    ADD SN_ATIVO DMN_BOOLEAN;

COMMENT ON COLUMN TBL_CEP.SN_ATIVO IS
'Ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 01/07/2018 19:27:08 --------*/

UPDATE TBL_CEP
SET SN_ATIVO = 1;




/*------ SYSDBA 01/07/2018 19:27:31 --------*/

CREATE INDEX IDX_TBL_CEP_ATIVO
ON TBL_CEP (SN_ATIVO);

