


/*------ SYSDBA 21/02/2018 13:40:31 --------*/

COMMENT ON COLUMN USR_PERFIL_PERMISSAO.TP_PERMISSAO IS
'Tipo de acesso:
0 - Sem acesso
1 - Visualizar
2 - Alterar
3 - Incluir / Alterar

4 - Controle Total';




/*------ SYSDBA 21/02/2018 13:42:21 --------*/

COMMENT ON TABLE USR_PERFIL_PERMISSAO IS 'Tabela Permissao Acesso x Perfil.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/02/2018

Tabela responsavel por armazenar o relacionamento entre os permissoes de acesso e
os perfis de acesso aos sistemas do pacote Agil.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/02/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 22/02/2018 17:46:01 --------*/

ALTER TABLE USR_PERFIL_PERMISSAO DROP CONSTRAINT PK_USR_PERFIL_PERMISSAO;




/*------ SYSDBA 22/02/2018 17:46:11 --------*/

ALTER TABLE USR_PERFIL_PERMISSAO
ADD CONSTRAINT PK_USR_PERFIL_PERMISSAO
PRIMARY KEY (ID_ACESSO,ID_PERFIL);



/*------ SYSDBA 22/02/2018 17:57:08 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 4, column 3.
.

*/

/*------ SYSDBA 22/02/2018 18:15:00 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 4, column 3.
.

*/


/*------ SYSDBA 22/02/2018 19:07:00 --------*/

COMMENT ON COLUMN USR_PERFIL_PERMISSAO.TP_PERMISSAO IS
'Tipo de acesso:
0 - Sem acesso
1 - Visualizar
2 - Alterar
3 - Incluir / Alterar
4 - Controle Total';




/*------ SYSDBA 30/03/2018 15:30:36 --------*/

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

  --Execute Procedure SET_PERFIL_PERMISSAO(new.id);
end^

SET TERM ; ^




/*------ SYSDBA 30/03/2018 15:34:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PERFIL_PERMISSAO (
    ID_ACESSO DMN_GUID,
    TP_ROTINA DMN_SMALLINT)
as
declare variable ID_PERFIL DMN_GUID;
begin
  /* 1. Lista os perfis de acesso */
  for
    Select
      p.id_perfil
    from USR_PERFIL p
    Into
      id_perfil
  do
  begin
    if (not exists(
      Select
        pp.id_acesso
      from USR_PERFIL_PERMISSAO pp
      where pp.id_acesso = :id_acesso
        and pp.id_perfil = :id_perfil
    )) then
    begin
      /* 2. Inserir a relacao Acesso x Perfil */
      Insert Into USR_PERFIL_PERMISSAO (
          id_acesso
        , id_perfil
        , tp_permissao
      ) values (
          :id_acesso
        , :id_perfil
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




/*------ SYSDBA 30/03/2018 15:34:38 --------*/

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
end^

SET TERM ; ^




/*------ SYSDBA 30/03/2018 15:35:37 --------*/

COMMENT ON TRIGGER TG_SISTEMA_ROTINA_PERMISSAO IS 'Trigger Gerar ID Sistema x Rotina.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/01/2018

Trigger responsavel por gerar um novo ID (Guid) para cada novo registro de associacao
entre sistema e rotinas, quando este nao for informado.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/01/2018 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 30/03/2018 15:38:26 --------*/

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
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_SISTEMA_ROTINA_PERMISSAO IS 'Trigger Rotina Sistema x Permissao Perfil.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/03/2018

Trigger responsavel inserir na lista de permissoes dos perfis novas rotina inseridas
no(s) sistema(s).

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/03/2018 - IMR :
        * Documentacao do objeto.';

