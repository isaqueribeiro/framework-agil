


/*------ SYSDBA 04/04/2018 15:31:39 --------*/

CREATE TABLE USR_USUARIO_PERMISSAO (
    ID_ACESSO DMN_GUID_NN NOT NULL,
    ID_USUARIO DMN_GUID_NN NOT NULL,
    TP_PERMISSAO DMN_TIPO_4);

ALTER TABLE USR_USUARIO_PERMISSAO
ADD CONSTRAINT PK_USR_USUARIO_PERMISSAO
PRIMARY KEY (ID_ACESSO,ID_USUARIO);

COMMENT ON COLUMN USR_USUARIO_PERMISSAO.ID_ACESSO IS
'Acesso (Sistema x Rotina)';

COMMENT ON COLUMN USR_USUARIO_PERMISSAO.ID_USUARIO IS
'Usuario';

COMMENT ON COLUMN USR_USUARIO_PERMISSAO.TP_PERMISSAO IS
'Tipo de acesso:
0 - Sem acesso
1 - Visualizar
2 - Alterar
3 - Incluir / Alterar
4 - Controle Total';




/*------ SYSDBA 04/04/2018 15:31:40 --------*/

COMMENT ON TABLE USR_USUARIO_PERMISSAO IS 'Tabela Permissao Acesso x Usuario.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/04/2018

Tabela responsavel por armazenar o relacionamento entre os permissoes de acesso e
os usuarios de acesso aos sistemas do pacote Agil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/04/2018 - IMR :
        * Documentacao do objeto.';

GRANT ALL ON USR_USUARIO_PERMISSAO TO "PUBLIC";



/*------ SYSDBA 04/04/2018 15:34:48 --------*/

ALTER TABLE USR_USUARIO_PERMISSAO
ADD CONSTRAINT FK_USR_USUARIO_ACESSO
FOREIGN KEY (ID_ACESSO)
REFERENCES SYS_SISTEMA_ROTINA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE USR_USUARIO_PERMISSAO
ADD CONSTRAINT FK_USR_USUARIO_PERMISSAO
FOREIGN KEY (ID_USUARIO)
REFERENCES USR_USUARIO(ID_USUARIO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 04/04/2018 16:04:27 --------*/

SET TERM ^ ;

create or alter procedure SET_USUARIO_PERMISSAO (
    ID_ACESSO DMN_GUID,
    TP_ROTINA DMN_SMALLINT)
as
declare variable ID_USUARIO DMN_GUID;
begin
  /* 1. Lista os usuarios de acesso */
  for
    Select
      u.id_usuario
    from USR_USUARIO u
    Into
      id_usuario
  do
  begin
    if (not exists(
      Select
        pu.id_acesso
      from USR_USUARIO_PERMISSAO pu
      where pu.id_acesso  = :id_acesso
        and pu.id_usuario = :id_usuario
    )) then
    begin
      /* 2. Inserir a relacao Acesso x Usuario */
      Insert Into USR_USUARIO_PERMISSAO (
          id_acesso
        , id_usuario
        , tp_permissao
      ) values (
          :id_acesso
        , :id_usuario
        , Case :tp_rotina
            when 0 then 1 -- Se Menu, visualizar
            when 1 then 0 -- Se Formulario, sem acesso
            when 2 then 0 -- Se Processo, sem acesso
            when 3 then 0 -- Se Relatorio, sem acesso
            when 4 then 2 -- Se Campo, alterar
          end
      );
    end 
  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_USUARIO_PERMISSAO TO "PUBLIC";



/*------ SYSDBA 04/04/2018 16:05:09 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_sistema_rotina_permissao for sys_sistema_rotina
active after insert position 1
AS
  declare variable tp_rotina DMN_SMALLINT;
begin
  Select
    r.tp_rotina
  from SYS_ROTINA r
  where r.id_rotina = new.id_rotina
  Into
    tp_rotina;

  Execute Procedure SET_PERFIL_PERMISSAO(new.id, :tp_rotina);
  Execute Procedure SET_USUARIO_PERMISSAO(new.id, :tp_rotina);
end^

SET TERM ; ^




/*------ SYSDBA 04/04/2018 16:07:40 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_PERMISSAO (
    ID_ACESSO DMN_GUID,
    TP_ROTINA DMN_SMALLINT)
as
declare variable ID_USUARIO DMN_GUID;
begin
  /* 1. Lista os usuarios de acesso */
  for
    Select
      u.id_usuario
    from USR_USUARIO u
    Into
      id_usuario
  do
  begin
    if (not exists(
      Select
        pu.id_acesso
      from USR_USUARIO_PERMISSAO pu
      where pu.id_acesso  = :id_acesso
        and pu.id_usuario = :id_usuario
    )) then
    begin
      /* 2. Inserir a relacao Acesso x Usuario */
      Insert Into USR_USUARIO_PERMISSAO (
          id_acesso
        , id_usuario
        , tp_permissao
      ) values (
          :id_acesso
        , :id_usuario
        , Case :tp_rotina
            when 0 then 1 -- Se Menu, visualizar
            when 1 then 0 -- Se Formulario, sem acesso
            when 2 then 0 -- Se Processo, sem acesso
            when 3 then 0 -- Se Relatorio, sem acesso
            when 4 then 2 -- Se Campo, alterar
          end
      );
    end 
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_USUARIO_PERMISSAO IS 'Procedimento SET Usuario x Permissao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/04/2018

Stored procedure responsavel por inserir o tipo de permissao padrao para cada
usuario de acesso.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/04/2018 - IMR :
        * Documentacao do objeto.';



/*------ SYSDBA 04/04/2018 16:08:45 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.ID_ACESSO.
At line 26, column 7.

*/

/*------ SYSDBA 04/04/2018 16:09:00 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.TP_PERMISSAO.
At line 31, column 14.

*/

/*------ SYSDBA 04/04/2018 16:57:06 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 1, column 1.
description.

*/


/*------ SYSDBA 06/04/2018 11:31:50 --------*/

SET TERM ^ ;

create or alter procedure SP_REPLICAR_PERMISSAO (
    ID_PERFIL DMN_GUID)
as
declare variable ID_USUARIO DMN_GUID;
declare variable ID_ACESSO DMN_GUID;
declare variable TP_PERMISSAO DMN_SMALLINT;
begin
  for
    Select
        p.id_acesso
      , u.id_usuario
      , p.tp_permissao
    from USR_PERFIL_PERMISSAO p
      inner join USR_USUARIO u on (u.id_perfil = p.id_perfil)
    where p.id_perfil = :id_perfil
    Into
        id_acesso
      , id_usuario
      , tp_permissao
  do
  begin
    if (not exists(
      Select
        up.tp_permissao
      from USR_USUARIO_PERMISSAO up
      where up.id_acesso  = :id_acesso
        and up.id_usuario = :id_usuario
    )) then
    begin
      Insert Into USR_USUARIO_PERMISSAO (
          id_acesso
        , id_usuario
        , tp_permissao
      ) values (
          :id_acesso
        , :id_usuario
        , :tp_permissao
      );
    end
    else
    begin
      Update USR_USUARIO_PERMISSAO up Set
        up.tp_permissao   = :tp_permissao
      where up.id_acesso  = :id_acesso
        and up.id_usuario = :id_usuario;
    end
  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_REPLICAR_PERMISSAO TO "PUBLIC";



/*------ SYSDBA 06/04/2018 11:33:23 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_REPLICAR_PERMISSAO (
    ID_PERFIL DMN_GUID)
as
declare variable ID_USUARIO DMN_GUID;
declare variable ID_ACESSO DMN_GUID;
declare variable TP_PERMISSAO DMN_SMALLINT;
begin
  for
    Select
        p.id_acesso
      , u.id_usuario
      , p.tp_permissao
    from USR_PERFIL_PERMISSAO p
      inner join USR_USUARIO u on (u.id_perfil = p.id_perfil)
    where p.id_perfil = :id_perfil
    Into
        id_acesso
      , id_usuario
      , tp_permissao
  do
  begin
    if (not exists(
      Select
        up.tp_permissao
      from USR_USUARIO_PERMISSAO up
      where up.id_acesso  = :id_acesso
        and up.id_usuario = :id_usuario
    )) then
    begin
      Insert Into USR_USUARIO_PERMISSAO (
          id_acesso
        , id_usuario
        , tp_permissao
      ) values (
          :id_acesso
        , :id_usuario
        , :tp_permissao
      );
    end
    else
    begin
      Update USR_USUARIO_PERMISSAO up Set
        up.tp_permissao   = :tp_permissao
      where up.id_acesso  = :id_acesso
        and up.id_usuario = :id_usuario;
    end
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SP_REPLICAR_PERMISSAO IS 'Procedimento Replicar Permissao no Usuario.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   066/04/2018

Stored procedure responsavel por replicar nas permissoes dos usuarios as permissoes
definidas no perfil de acesso destes mesmos usuarios.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/04/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 13/06/2018 15:03:57 --------*/

CREATE DOMAIN DMN_CNPJ AS
VARCHAR(14);COMMENT ON DOMAIN DMN_CNPJ IS 'CNPJ';

CREATE DOMAIN DMN_CNPJ_FORMTADO AS
VARCHAR(18);COMMENT ON DOMAIN DMN_CNPJ_FORMTADO IS 'CNPJ Formatado';

CREATE DOMAIN DMN_CPF AS
VARCHAR(11);COMMENT ON DOMAIN DMN_CPF IS 'CPF';

CREATE DOMAIN DMN_CPF_FORMATADO AS
VARCHAR(14);COMMENT ON DOMAIN DMN_CPF_FORMATADO IS 'CPF Formatado';

CREATE DOMAIN DMN_CPF_CNPJ AS
VARCHAR(14);COMMENT ON DOMAIN DMN_CPF_CNPJ IS 'CPF/CNPJ sem formatacao';




/*------ SYSDBA 13/06/2018 15:04:54 --------*/

CREATE DOMAIN DMN_CPF_CNPJ_NN AS
VARCHAR(14)
NOT NULL;COMMENT ON DOMAIN DMN_CPF_CNPJ_NN IS 'CPF/CNPJ sem formatacao - Nao nulo';




/*------ SYSDBA 13/06/2018 15:11:22 --------*/

CREATE TABLE SYS_LICENCA (
    ID_LICENCA DMN_GUID_NN NOT NULL,
    CD_LICENCA DMN_CPF_CNPJ_NN,
    TX_LICENCA DMN_TEXT);

ALTER TABLE SYS_LICENCA
ADD CONSTRAINT PK_SYS_LICENCA
PRIMARY KEY (ID_LICENCA);

COMMENT ON COLUMN SYS_LICENCA.ID_LICENCA IS
'ID';

COMMENT ON COLUMN SYS_LICENCA.CD_LICENCA IS
'Codigo - CPF/CNPJ do Cliente';

COMMENT ON COLUMN SYS_LICENCA.TX_LICENCA IS
'Licenca - Texto criptografado';




/*------ SYSDBA 13/06/2018 15:11:23 --------*/

COMMENT ON TABLE SYS_LICENCA IS 'Tabela Licenca.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/06/2018

Tabela responsavel por armazenar os dados da licenca de uso do cliente para que
este possa fazer uso dos sistemas do pacote Agil Softwares.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    13/06/2018 - IMR :
        * Documentacao do objeto.';

GRANT ALL ON SYS_LICENCA TO "PUBLIC";



/*------ SYSDBA 13/06/2018 15:11:47 --------*/

ALTER TABLE SYS_LICENCA
ADD CONSTRAINT UNQ_SYS_LICENCA
UNIQUE (CD_LICENCA);




/*------ SYSDBA 13/06/2018 15:15:45 --------*/

SET TERM ^ ;

CREATE trigger tg_licenca_codigo for sys_licenca
active before insert or update position 0
AS
  declare variable codigo DMN_CPF_CNPJ;
begin
  codigo = trim(new.cd_licenca);
  codigo = replace(replace(replace(:codigo, '.', ''), '-', ''), '/', '');
  new.cd_licenca = :codigo;
end^

SET TERM ; ^




/*------ SYSDBA 13/06/2018 15:17:16 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_licenca_codigo for sys_licenca
active before insert or update position 0
AS
  declare variable codigo DMN_CPF_CNPJ;
begin
  codigo = trim(new.cd_licenca);
  codigo = replace(replace(replace(:codigo, '.', ''), '-', ''), '/', '');
  new.cd_licenca = :codigo;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_LICENCA_CODIGO IS 'Trigger Limpar Codigo Licenca.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/06/2018

Trigger responsavel por gerar limpar o codigo da licenca que corresponde ao CPF/CNPJ
do cliente para haja apenas numero no campo.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    13/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 13/06/2018 15:17:25 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_licenca_codigo for sys_licenca
active before insert or update position 1
AS
  declare variable codigo DMN_CPF_CNPJ;
begin
  codigo = trim(new.cd_licenca);
  codigo = replace(replace(replace(:codigo, '.', ''), '-', ''), '/', '');
  new.cd_licenca = :codigo;
end^

SET TERM ; ^




/*------ SYSDBA 13/06/2018 15:19:57 --------*/

SET TERM ^ ;

CREATE trigger id_licenca_id for sys_licenca
active before insert position 0
AS
begin
  if (coalesce(new.id_licenca, '') = '') then
  begin
    Select
      g.hex_uuid_format
    from GET_GUID_UUID_HEX g
    Into
      new.id_licenca;
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER ID_LICENCA_ID IS 'Trigger Gerar ID Licenca.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/06/2018

Trigger responsavel por gerar um novo ID (Guid) para o registro da licenca de uso
para o(s) sistema(s) quando este nao for informado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    13/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 18/06/2018 13:21:37 --------*/

ALTER DOMAIN DMN_CNPJ_FORMTADO TO DMN_CNPJ_FORMATADO;




/*------ SYSDBA 18/06/2018 13:24:50 --------*/

CREATE TABLE TBL_ENTIDADE (
    ID_ENTIDADE DMN_GUID_NN NOT NULL,
    TP_ENTIDADE DMN_TIPO_3,
    NM_ENTIDADE DMN_VCHAR_150,
    DS_ENTIDADE DMN_VCHAR_100,
    NR_CPF_CNPJ DMN_CNPJ_FORMATADO,
    NR_RG_IE DMN_VCHAR_100);

ALTER TABLE TBL_ENTIDADE
ADD CONSTRAINT PK_TBL_ENTIDADE
PRIMARY KEY (ID_ENTIDADE);

COMMENT ON COLUMN TBL_ENTIDADE.ID_ENTIDADE IS
'ID';

COMMENT ON COLUMN TBL_ENTIDADE.TP_ENTIDADE IS
'Tipo:
0 - Pessoa Fisica
1 - Pessoa Juridica
2 - Orgao Publico';

COMMENT ON COLUMN TBL_ENTIDADE.NM_ENTIDADE IS
'Nome / Razao Social';

COMMENT ON COLUMN TBL_ENTIDADE.DS_ENTIDADE IS
'Descricao / Fantasia';

COMMENT ON COLUMN TBL_ENTIDADE.NR_CPF_CNPJ IS
'CPF/CNPJ formatado';

COMMENT ON COLUMN TBL_ENTIDADE.NR_RG_IE IS
'RG / IE';




/*------ SYSDBA 18/06/2018 13:24:52 --------*/

COMMENT ON TABLE TBL_ENTIDADE IS 'Tabela Entidade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   18/08/2018

Tabela responsavel por armazenar os dados de identificacao da(s) entidade(s), ou
seja, dados do(s) cliente(s) de uso dos sistemas do pacote Agil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    18/08/2018 - IMR :
        * Documentacao do objeto.';

GRANT ALL ON TBL_ENTIDADE TO "PUBLIC";



/*------ SYSDBA 18/06/2018 13:26:44 --------*/

ALTER TABLE TBL_ENTIDADE
    ADD CD_ENTIDADE DMN_INTEGER_NN;

COMMENT ON COLUMN TBL_ENTIDADE.CD_ENTIDADE IS
'Codigo';

alter table TBL_ENTIDADE
alter ID_ENTIDADE position 1;

alter table TBL_ENTIDADE
alter CD_ENTIDADE position 2;

alter table TBL_ENTIDADE
alter TP_ENTIDADE position 3;

alter table TBL_ENTIDADE
alter NM_ENTIDADE position 4;

alter table TBL_ENTIDADE
alter DS_ENTIDADE position 5;

alter table TBL_ENTIDADE
alter NR_CPF_CNPJ position 6;

alter table TBL_ENTIDADE
alter NR_RG_IE position 7;




/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column ID_ENTIDADE position 1;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column CD_ENTIDADE position 2;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column NM_ENTIDADE position 3;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column DS_ENTIDADE position 4;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column TP_ENTIDADE position 5;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column NR_CPF_CNPJ position 6;


/*------ SYSDBA 18/06/2018 13:26:55 --------*/

alter table TBL_ENTIDADE
alter column NR_RG_IE position 7;


/*------ SYSDBA 18/06/2018 13:27:36 --------*/

ALTER TABLE TBL_ENTIDADE DROP CONSTRAINT UNQ_TBL_ENTIDADE;




/*------ SYSDBA 18/06/2018 13:27:51 --------*/

ALTER TABLE TBL_ENTIDADE
ADD CONSTRAINT UNQ_TBL_ENTIDADE_COD
UNIQUE (CD_ENTIDADE);

ALTER TABLE TBL_ENTIDADE
ADD CONSTRAINT UNQ_TBL_ENTIDADE_CNPJ
UNIQUE (NR_CPF_CNPJ);




/*------ SYSDBA 18/06/2018 13:29:59 --------*/

SET TERM ^ ;

CREATE trigger tg_entidade_id for tbl_entidade
active before insert position 0
AS
begin
  if (coalesce(new.id_entidade, '') = '') then
  begin
    Select
      g.hex_uuid_format
    from GET_GUID_UUID_HEX g
    Into
      new.id_entidade;
  end

  if (coalesce(new.cd_entidade, 0) = 0) then
  begin
    Select
      max(e.cd_entidade)
    from TBL_ENTIDADE e
    Into
      new.cd_entidade;

    new.cd_entidade = coalesce(new.cd_entidade, 0) + 1;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ENTIDADE_ID IS 'Trigger Gerar ID Entidade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   18/06/2018

Trigger responsavel por gerar um novo ID (Guid) para cada novo registro de entidade
quando este nao for informado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    18/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 18/06/2018 13:34:13 --------*/

CREATE DOMAIN DMN_IMAGE AS
BLOB SUB_TYPE 0 SEGMENT SIZE 80;COMMENT ON DOMAIN DMN_IMAGE IS 'Imagem';




/*------ SYSDBA 19/06/2018 10:33:42 --------*/

CREATE DOMAIN DMN_TIPO_2 AS
SMALLINT
DEFAULT 0
NOT NULL
CHECK (value between 0 and 2);COMMENT ON DOMAIN DMN_TIPO_2 IS 'Tipo com valores baixos de 0 a 2';




/*------ SYSDBA 19/06/2018 10:36:43 --------*/

CREATE TABLE SYS_CLIENTE (
    ID_CLIENTE DMN_GUID_NN NOT NULL,
    CD_CLIENTE DMN_SMALLINT_NN,
    NM_CLIENTE DMN_VCHAR_150,
    DS_CLIENTE DMN_VCHAR_100,
    TP_CLIENTE DMN_TIPO_2,
    NR_CPF_CNPJ DMN_CNPJ_FORMATADO,
    NR_RG_IE DMN_VCHAR_100);

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT PK_SYS_CLIENTE
PRIMARY KEY (ID_CLIENTE);

COMMENT ON COLUMN SYS_CLIENTE.ID_CLIENTE IS
'ID';

COMMENT ON COLUMN SYS_CLIENTE.CD_CLIENTE IS
'Codigo';

COMMENT ON COLUMN SYS_CLIENTE.NM_CLIENTE IS
'Nome / Razao Social';

COMMENT ON COLUMN SYS_CLIENTE.DS_CLIENTE IS
'Descricao / Fantasia';

COMMENT ON COLUMN SYS_CLIENTE.TP_CLIENTE IS
'Tipo:
0 - Pessoa Fisica
1 - Pessoa Juridica
2 - Orgao Publico';

COMMENT ON COLUMN SYS_CLIENTE.NR_CPF_CNPJ IS
'CPF/CNPJ Formatado';

COMMENT ON COLUMN SYS_CLIENTE.NR_RG_IE IS
'RG/IE';




/*------ SYSDBA 19/06/2018 10:36:44 --------*/

COMMENT ON TABLE SYS_CLIENTE IS 'Tabela Entidade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/08/2018

Tabela responsavel por armazenar os dados de identificacao os dados do(s)
cliente(s) de uso dos sistemas do pacote Agil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/08/2018 - IMR :
        * Documentacao do objeto.';

GRANT ALL ON SYS_CLIENTE TO "PUBLIC";



/*------ SYSDBA 19/06/2018 10:39:39 --------*/

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT UNQ_SYS_CLIENTE_CODIGO
UNIQUE (CD_CLIENTE);

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT UNQ_SYS_CLIENTE_CPF_CNPJ
UNIQUE (NR_CPF_CNPJ);




/*------ SYSDBA 19/06/2018 10:41:39 --------*/

SET TERM ^ ;

CREATE trigger tg_cliente_id for sys_cliente
active before insert position 0
AS
begin
  if (coalesce(new.id_cliente, '') = '') then
  begin
    Select
      g.hex_uuid_format
    from GET_GUID_UUID_HEX g
    Into
      new.id_cliente;
  end

  if (coalesce(new.cd_cliente, 0) = 0) then
  begin
    Select
      max(c.cd_cliente)
    from SYS_CLIENTE c
    Into
      new.cd_cliente;

    new.cd_cliente = coalesce(new.cd_cliente, 0) + 1;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CLIENTE_ID IS 'Trigger Gerar ID Cliente Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/06/2018

Trigger responsavel por gerar um novo ID (Guid) para cada novo registro de cliente
do(s) sistema(s) quando este nao for informado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 19/06/2018 10:41:57 --------*/

DROP TABLE TBL_ENTIDADE;




/*------ SYSDBA 19/06/2018 10:44:44 --------*/

ALTER TABLE SYS_CLIENTE
    ADD LG_CLIENTE DMN_IMAGE;

COMMENT ON COLUMN SYS_CLIENTE.LG_CLIENTE IS
'Imagem/Logotipo';




/*------ SYSDBA 19/06/2018 10:51:33 --------*/

CREATE DOMAIN DMN_VCHAR_2 AS
VARCHAR(2);COMMENT ON DOMAIN DMN_VCHAR_2 IS 'String com ate 2 posicoes';




/*------ SYSDBA 19/06/2018 10:52:03 --------*/

CREATE DOMAIN DMN_UF AS
VARCHAR(2)
NOT NULL;COMMENT ON DOMAIN DMN_UF IS 'UF';




/*------ SYSDBA 19/06/2018 10:54:41 --------*/

CREATE TABLE TBL_ESTADO (
    CD_ESTADO DMN_SMALLINT_NN NOT NULL,
    NM_ESTADO DMN_VCHAR_100,
    UF_ESTADO DMN_UF);

ALTER TABLE TBL_ESTADO
ADD CONSTRAINT PK_TBL_ESTADO
PRIMARY KEY (CD_ESTADO);

COMMENT ON COLUMN TBL_ESTADO.CD_ESTADO IS
'Codigo IBGE';

COMMENT ON COLUMN TBL_ESTADO.NM_ESTADO IS
'Nome';

COMMENT ON COLUMN TBL_ESTADO.UF_ESTADO IS
'Sigla (UF)';




/*------ SYSDBA 19/06/2018 10:55:03 --------*/

ALTER TABLE TBL_ESTADO
ADD CONSTRAINT UNQ_TBL_ESTADO_UF
UNIQUE (UF_ESTADO);

GRANT ALL ON TBL_ESTADO TO "PUBLIC";



/*------ SYSDBA 19/06/2018 10:55:48 --------*/

COMMENT ON TABLE SYS_CLIENTE IS 'Tabela Cliente do(s) Sistema(s).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/08/2018

Tabela responsavel por armazenar os dados de identificacao os dados do(s)
cliente(s) de uso dos sistemas do pacote Agil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/08/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 19/06/2018 10:57:21 --------*/

COMMENT ON TABLE TBL_ESTADO IS 'Tabela Estados (UF).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/08/2018

Tabela responsavel por armazenar os nomes dos estados, ou seja, as Unidades
Federativas do Brasil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/08/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 19/06/2018 11:04:43 --------*/

SET TERM ^ ;

CREATE trigger tg_estado_upper for tbl_estado
active before insert or update position 0
AS
begin
  new.nm_estado = upper(trim(new.nm_estado));
  new.uf_estado = upper(trim(new.uf_estado));
end^

SET TERM ; ^




/*------ SYSDBA 19/06/2018 11:13:43 --------*/

ALTER TABLE SYS_CLIENTE
    ADD CD_ESTADO DMN_SMALLINT_NN;

COMMENT ON COLUMN SYS_CLIENTE.CD_ESTADO IS
'Estado';




/*------ SYSDBA 19/06/2018 11:14:04 --------*/

ALTER TABLE SYS_CLIENTE
ADD CONSTRAINT FK_SYS_CLIENTE_ESTADO
FOREIGN KEY (CD_ESTADO)
REFERENCES TBL_ESTADO(CD_ESTADO);




/*------ SYSDBA 21/06/2018 17:19:18 --------*/

CREATE DOMAIN DMN_VCHAR_5 AS
VARCHAR(5);COMMENT ON DOMAIN DMN_VCHAR_5 IS 'String com ate 5 posicoes';




/*------ SYSDBA 21/06/2018 17:20:08 --------*/

ALTER DOMAIN DMN_VCHAR_5 TO DMN_VCHAR_05;




/*------ SYSDBA 21/06/2018 17:20:22 --------*/

ALTER DOMAIN DMN_VCHAR_05 TO DMN_VCHAR_5;




/*------ SYSDBA 21/06/2018 17:25:41 --------*/

CREATE TABLE TBL_TIPO_LOGRADOURO (
    CD_TIPO DMN_SMALLINT_NN NOT NULL,
    NM_TIPO DMN_VCHAR_50,
    DS_TIPO DMN_VCHAR_5);

ALTER TABLE TBL_TIPO_LOGRADOURO
ADD CONSTRAINT PK_TBL_TIPO_LOGRADOURO
PRIMARY KEY (CD_TIPO);

COMMENT ON COLUMN TBL_TIPO_LOGRADOURO.CD_TIPO IS
'Codigo';

COMMENT ON COLUMN TBL_TIPO_LOGRADOURO.NM_TIPO IS
'Nome';

COMMENT ON COLUMN TBL_TIPO_LOGRADOURO.DS_TIPO IS
'Descricao (Sigla)';




/*------ SYSDBA 21/06/2018 17:25:42 --------*/

COMMENT ON TABLE TBL_TIPO_LOGRADOURO IS 'Tabela Tipo de Logradouro (Endereco).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/06/2018

Tabela responsavel por armazenar as descricoes dos tipos de logradouros utilizados
para compor o(s) enredeco(s).

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/06/2018 - IMR :
        * Documentacao do objeto.';

GRANT ALL ON TBL_TIPO_LOGRADOURO TO "PUBLIC";



/*------ SYSDBA 21/06/2018 17:26:12 --------*/

ALTER TABLE TBL_TIPO_LOGRADOURO
ADD CONSTRAINT UNQ_TBL_TIPO_LOGRADOURO
UNIQUE (NM_TIPO);




/*------ SYSDBA 21/06/2018 17:26:29 --------*/

COMMENT ON TABLE TBL_ESTADO IS 'Tabela Estados (UF).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/06/2018

Tabela responsavel por armazenar os nomes dos estados, ou seja, as Unidades
Federativas do Brasil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 21/06/2018 18:23:43 --------*/

CREATE INDEX IDX_TBL_TIPO_LOGRADOURO
ON TBL_TIPO_LOGRADOURO (DS_TIPO);




/*------ SYSDBA 21/06/2018 18:29:43 --------*/

CREATE TABLE TBL_CIDADE (
    CD_CIDADE DMN_INTEGER_NN NOT NULL,
    CD_IBGE DMN_INTEGER,
    CD_SIAFI DMN_INTEGER,
    NM_CIDADE DMN_VCHAR_150,
    NR_CEP_INICIAL DMN_INTEGER,
    NR_CEP_FINAL DMN_INTEGER,
    CD_ESTADO DMN_SMALLINT_NN);

ALTER TABLE TBL_CIDADE
ADD CONSTRAINT PK_TBL_CIDADE
PRIMARY KEY (CD_CIDADE);

COMMENT ON COLUMN TBL_CIDADE.CD_CIDADE IS
'Codigo';

COMMENT ON COLUMN TBL_CIDADE.CD_IBGE IS
'Codigo IBGE';

COMMENT ON COLUMN TBL_CIDADE.CD_SIAFI IS
'Codigo SIAFI ()';

COMMENT ON COLUMN TBL_CIDADE.NM_CIDADE IS
'Nome';

COMMENT ON COLUMN TBL_CIDADE.NR_CEP_INICIAL IS
'CEP Inicial';

COMMENT ON COLUMN TBL_CIDADE.NR_CEP_FINAL IS
'CEP Final';

COMMENT ON COLUMN TBL_CIDADE.CD_ESTADO IS
'Estado';

GRANT ALL ON TBL_CIDADE TO "PUBLIC";



/*------ SYSDBA 21/06/2018 18:30:09 --------*/

ALTER TABLE TBL_CIDADE
ADD CONSTRAINT FK_TBL_CIDADE_ESTADO
FOREIGN KEY (CD_ESTADO)
REFERENCES TBL_ESTADO(CD_ESTADO);




/*------ SYSDBA 21/06/2018 18:30:24 --------*/

ALTER TABLE TBL_CIDADE
ADD CONSTRAINT UNQ_TBL_CIDADE
UNIQUE (CD_IBGE);




/*------ SYSDBA 21/06/2018 18:30:55 --------*/

COMMENT ON COLUMN TBL_CIDADE.CD_SIAFI IS
'Codigo SIAFI (Codigo no Sistema Integrado de Administracao Financeira do Governo Federal)';




/*------ SYSDBA 21/06/2018 18:32:08 --------*/

COMMENT ON TABLE TBL_CIDADE IS 'Tabela Cidades.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/06/2018

Tabela responsavel por armazenar os nomes das cidades/municipios por Estado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 21/06/2018 18:32:45 --------*/

COMMENT ON TABLE TBL_TIPO_LOGRADOURO IS 'Tabela Tipos de Logradouros (Endereco).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/06/2018

Tabela responsavel por armazenar as descricoes dos tipos de logradouros utilizados
para compor o(s) enredeco(s).

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 21/06/2018 18:42:59 --------*/

CREATE INDEX IDX_TBL_CIDADE_SIAFI
ON TBL_CIDADE (CD_SIAFI);

CREATE INDEX IDX_TBL_CIDADE_NOME
ON TBL_CIDADE (NM_CIDADE);

CREATE INDEX IDX_TBL_CIDADE_CEP
ON TBL_CIDADE (NR_CEP_INICIAL,NR_CEP_FINAL);




/*------ SYSDBA 22/06/2018 17:10:22 --------*/

CREATE TABLE TBL_BAIRRO (
    ID_BAIRRO DMN_GUID_NN NOT NULL,
    CD_BAIRRO DMN_BIGINT_NN,
    NM_BAIRRO DMN_VCHAR_150,
    CD_CIDADE DMN_INTEGER_NN);

ALTER TABLE TBL_BAIRRO
ADD CONSTRAINT PK_TBL_BAIRRO
PRIMARY KEY (ID_BAIRRO);

COMMENT ON COLUMN TBL_BAIRRO.ID_BAIRRO IS
'ID';

COMMENT ON COLUMN TBL_BAIRRO.CD_BAIRRO IS
'Codigo';

COMMENT ON COLUMN TBL_BAIRRO.NM_BAIRRO IS
'Nome';

COMMENT ON COLUMN TBL_BAIRRO.CD_CIDADE IS
'Cidade';




/*------ SYSDBA 22/06/2018 17:10:24 --------*/

COMMENT ON TABLE TBL_BAIRRO IS 'Tabela Bairros (Endereco).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/06/2018

Tabela responsavel por armazenar os nomes dos bairros por cidades/municipios.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 22/06/2018 17:10:35 --------*/

COMMENT ON TABLE TBL_BAIRRO IS 'Tabela Bairros (Endereco).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   22/06/2018

Tabela responsavel por armazenar os nomes dos bairros por cidades/municipios.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 22/06/2018 17:10:59 --------*/

ALTER TABLE TBL_BAIRRO
ADD CONSTRAINT UNQ_TBL_BAIRRO
UNIQUE (NM_BAIRRO,CD_CIDADE);




/*------ SYSDBA 22/06/2018 17:12:56 --------*/

SET TERM ^ ;

CREATE trigger tg_bairro_id for tbl_bairro
active before insert position 0
AS
begin
  if (coalesce(new.id_bairro, '') = '') then
  begin
    Select
      g.hex_uuid_format
    from GET_GUID_UUID_HEX g
    Into
      new.id_bairro;
  end

  if (coalesce(new.cd_bairro, 0) = 0) then
  begin
    Select
      max(b.cd_bairro)
    from TBL_BAIRRO b
    Into
      new.cd_bairro;

    new.cd_bairro = coalesce(new.cd_bairro, 0) + 1;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_BAIRRO_ID IS 'Trigger Gerar ID Bairro.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   22/06/2018

Trigger responsavel por gerar um novo ID (Guid) para cada novo registro de bairro
quando este nao for informado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/06/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 22/06/2018 17:13:36 --------*/

ALTER TABLE TBL_BAIRRO
ADD CONSTRAINT UNQ_TBL_BAIRRO_CODIGO
UNIQUE (CD_BAIRRO);




/*------ SYSDBA 22/06/2018 17:13:57 --------*/

ALTER TABLE TBL_BAIRRO
ADD CONSTRAINT FK_TBL_BAIRRO_CIDADE
FOREIGN KEY (CD_CIDADE)
REFERENCES TBL_CIDADE(CD_CIDADE);




/*------ SYSDBA 22/06/2018 17:14:50 --------*/

ALTER TABLE TBL_BAIRRO
    ADD SN_ATIVO DMN_BOOLEAN;

COMMENT ON COLUMN TBL_BAIRRO.SN_ATIVO IS
'Ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 22/06/2018 17:15:11 --------*/

CREATE INDEX IDX_TBL_BAIRRO_ATIVO
ON TBL_BAIRRO (SN_ATIVO);

