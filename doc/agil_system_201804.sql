


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

