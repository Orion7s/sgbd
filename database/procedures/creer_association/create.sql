
-- ===================================================================
-- = Fonction : creer_association                                    =
-- = USAGE : select creer_association(nom) from dual                 =
-- = Résumé ==========================================================
-- = Créer une association avec le nom spécifié.                     =
-- = Renvoie l'identifiant de l'association crée.                    =
-- ===================================================================
prompt [Création fonction creer_association];
create function creer_association
(NOM_ASSOCIATION ASSOCIATIONS.NOM_ASSOCIATION%type) return number
as
    id_association number;
begin
    id_association := sq_id_associations.nextval();
    insert into ASSOCIATIONS VALUES (id_association, NOM_ASSOCIATION);
    return id_association;
end;
/
show errors function creer_association;