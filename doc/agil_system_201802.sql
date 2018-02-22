


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

