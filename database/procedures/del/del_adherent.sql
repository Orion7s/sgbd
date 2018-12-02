
-- ===================================================================
-- = Procédure : del_adherent                                        =
-- = USAGE : begin del_adherent(id); end;                            =
-- = Résumé ==========================================================
-- = Supprime un adhérent dont l'id est spécifié.                    =
-- ===================================================================
prompt [Création fonction del_adherent];
create procedure del_adherent
(ID            ADHERENTS.ID_ADHERENT%type)
as
begin
    DELETE FROM ADHERENTS WHERE ID_ADHERENT = ID;
end;
/
show errors procedure del_adherent;
begin
    register_object('procedure', 'del_adherent');
end;
/