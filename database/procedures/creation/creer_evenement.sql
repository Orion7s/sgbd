
-- ===================================================================
-- = Fonction : creer_evenement                                      =
-- = USAGE : select creer_evenement(DATE_PUBLICATION_CONTENU,        =
-- =                           TITRE_CONTENU,                        =
-- =                           ID_ASSOCIATION_HOTE,                  =
-- =                           LIEU_EVENEMENT,                       =
-- =                           DESCRIPTION_EVENEMENT,                =
-- =                           COUT_EVENEMENT,                       =
-- =                           TARIF_STANDARD,                       =
-- =                           TARIF_ADHERENT,                       =
-- =                           DATE_EVENEMENT,                       =
-- =                           DATE_FIN_RECURRENCE_EVENEMENT,        =
-- =                           FREQUENCE from dual                   =
-- = Résumé ==========================================================
-- = Créer un évènement avec les données spécifiées.                 =
-- = Renvoie l'identifiant de l'évènement créé.                      =
-- ===================================================================
prompt [Création fonction creer_evenement];
create function creer_evenement
(DATE_PUBLICATION_CONTENU        CONTENUS.DATE_PUBLICATION_CONTENU%type,
 TITRE_CONTENU                   CONTENUS.TITRE_CONTENU%type,
 ID_ASSOCIATION_HOTE             EVENEMENTS.ID_ASSOCIATION_HOTE%type,
 LIEU_EVENEMENT                  EVENEMENTS.LIEU_EVENEMENT%type,
 DESCRIPTION_EVENEMENT           EVENEMENTS.DESCRIPTION_EVENEMENT%type,
 COUT_EVENEMENT                  EVENEMENTS.COUT_EVENEMENT%type,
 TARIF_STANDARD                  EVENEMENTS.TARIF_STANDARD%type,
 TARIF_ADHERENT                  EVENEMENTS.TARIF_ADHERENT%type,
 DATE_EVENEMENT                  EVENEMENTS.DATE_EVENEMENT%type,
 DATE_FIN_RECURRENCE_EVENEMENT   EVENEMENTS.DATE_FIN_RECURRENCE_EVENEMENT%type,
 FREQUENCE                       EVENEMENTS.FREQUENCE%type) return number
as
    id_evenements number;
begin
    id_evenements := sq_id_evenements.nextval();
    insert into CONTENUS VALUES(id_evenements, DATE_PUBLICATION_CONTENU, TITRE_CONTENU);
    insert into EVENEMENTS VALUES (id_evenements, ID_ASSOCIATION_HOTE, LIEU_EVENEMENT, DESCRIPTION_EVENEMENT,
                             COUT_EVENEMENT,TARIF_STANDARD,TARIF_ADHERENT,DATE_EVENEMENT,
                             DATE_FIN_RECURRENCE_EVENEMENT,FREQUENCE);
    return id_evenements;
end;
/
show errors function creer_evenement;
begin
    register_object('function', 'creer_evenement');
end;
/