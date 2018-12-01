
-- ===================================================================
-- = Fonction : faire_commenter                                      =
-- = USAGE : select faire_commenter(nom) from dual                   =
-- = Résumé ==========================================================
-- = Créer un commentaire avec les données spécifiées.               =
-- = Renvoie l'identifiant du commentaire créé.                      =
-- ===================================================================
prompt [Création fonction faire_commenter];
create function faire_commenter
(ID_ADHERENT_COMMENTANT      COMMENTAIRES.ID_ADHERENT_COMMENTANT%type,
 ID_CONTENU_COMMENTE         COMMENTAIRES.ID_CONTENU_COMMENTE%type,
 DATE_PUBLICATION_COMENTAIRE COMMENTAIRES.DATE_PUBLICATION_COMENTAIRE%type,
 TEXTE_COMMENTAIRE           COMMENTAIRES.TEXTE_COMMENTAIRE%type) return number
as
    id_commentaire number;
begin
    id_commentaire := sq_id_commentaires.nextval();
    insert into COMMENTAIRES VALUES (id_commentaire, ID_ADHERENT_COMMENTANT, ID_CONTENU_COMMENTE,
                                     DATE_PUBLICATION_COMENTAIRE, TEXTE_COMMENTAIRE);
    return id_commentaire;
end;
/
show errors function faire_commenter;