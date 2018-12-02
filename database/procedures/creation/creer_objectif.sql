
-- ===================================================================
-- = Fonction : creer_objectif                                       =
-- = USAGE : select creer_objectif(description) from dual            =
-- = Résumé ==========================================================
-- = Créer un objectif avec la description spécifiée.                =
-- = Renvoie l'identifiant de l'objectif créé.                       =
-- ===================================================================
prompt [Création fonction creer_objectif];
create function creer_objectif
(DESCRIPTION_OBJECTIF OBJECTIFS.DESCRIPTION_OBJECTIF%type) return number
as
    id_objectif number;
begin
    id_objectif := sq_id_objectifs.nextval();
    insert into OBJECTIFS VALUES (id_objectif, DESCRIPTION_OBJECTIF);
    return id_objectif;
end;
/
show errors function creer_objectif;
begin
    register_object('function', 'creer_objectif');
end;
/