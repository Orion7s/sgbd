
-- ===================================================================
-- = Procédure : maj_evenement                                       =
-- = USAGE : begin maj_evenement(id, prenom, nom, mot_de_passe,      =
-- =                            mail, promotion, filiere); end;      =
-- = Résumé ==========================================================
-- = Met à jour un évènement dont l'id est spécifié avec les données =
-- = fournies.                                                       =
-- ===================================================================
prompt [Création fonction maj_evenement];
create procedure maj_evenement
(ID            EVENEMENTS.ID_EVENEMENT%type,
 TITRE         CONTENUS.TITRE_CONTENU%type,  
 LIEU          EVENEMENTS.LIEU_EVENEMENT%type,  
 DESCRIPTION   EVENEMENTS.DESCRIPTION_EVENEMENT%type,
 COUT          EVENEMENTS.COUT_EVENEMENT%type,
 T_STD         EVENEMENTS.TARIF_STANDARD%type,
 T_ADH         EVENEMENTS.TARIF_ADHERENT%type,
 DATE_E        EVENEMENTS.DATE_EVENEMENT%type,
 DATE_FR       EVENEMENTS.DATE_FIN_RECURRENCE_EVENEMENT%type,
 FREQ          EVENEMENTS.FREQUENCE%type)
as
begin
    update CONTENUS SET
        TITRE_CONTENU = TITRE
        where ID_CONTENU = ID;
    update EVENEMENTS SET 
            LIEU_EVENEMENT = LIEU,  
            DESCRIPTION_EVENEMENT = DESCRIPTION,
            COUT_EVENEMENT = COUT,
            TARIF_STANDARD = T_STD,
            TARIF_ADHERENT = T_ADH,
            DATE_EVENEMENT = DATE_E,
            DATE_FIN_RECURRENCE_EVENEMENT = DATE_FR,
            FREQUENCE = FREQ
        where ID_EVENEMENT = ID ;
end;
/
show errors procedure maj_evenement;
begin
    register_object('procedure', 'maj_evenement');
end;
/