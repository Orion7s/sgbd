
-- ===================================================================
-- = Procédure : del_association                                     =
-- = USAGE : begin del_association(id); end;                         =
-- = Résumé ==========================================================
-- = Supprime une association dont l'id est spécifié.                =
-- ===================================================================
prompt [Création fonction del_association];
create procedure del_association
(ID            ASSOCIATIONS.ID_ASSOCIATION%type)
as
begin
    DELETE FROM ASSOCIATIONS WHERE ID_ASSOCIATION = ID;
end;
/
show errors procedure del_association;
begin
    register_object('procedure', 'del_association');
end;
/