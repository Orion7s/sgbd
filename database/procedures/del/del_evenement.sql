
-- ===================================================================
-- = Procédure : del_evenement                                       =
-- = USAGE : begin del_evenement(id); end;                           =
-- = Résumé ==========================================================
-- = Supprime un évènement dont l'id est spécifié.                   =
-- ===================================================================
prompt [Création fonction del_evenement];
create procedure del_evenement
(ID            EVENEMENTS.ID_EVENEMENT%type)
as
begin
    DELETE FROM CONTENUS WHERE ID_CONTENU = ID;
end;
/
show errors procedure del_evenement;
begin
    register_object('procedure', 'del_evenement');
end;
/