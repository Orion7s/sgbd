
-- ===================================================================
-- = Procédure : maj_association                                     =
-- = USAGE : begin maj_association(id, nom); end;                    =
-- = Résumé ==========================================================
-- = Met à jour une association dont l'id est spécifié avec les      =
-- données fournies.                                                 =
-- ===================================================================
prompt [Création fonction maj_association];
create procedure maj_association
(ID  ASSOCIATIONS.ID_ASSOCIATION%type,
 NOM ASSOCIATIONS.NOM_ASSOCIATION%type)
as
begin
    update ASSOCIATIONS ASSO SET 
        ASSO.NOM_ASSOCIATION = NOM
        where ASSO.ID_ASSOCIATION = ID;
end;
/
show errors procedure maj_association;
begin
    register_object('procedure', 'maj_association');
end;
/