


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

