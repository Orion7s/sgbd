
-- ===================================================================
-- = Procédure : maj_adherent                                        =
-- = USAGE : begin maj_adherent(id, prenom, nom, mot_de_passe,       =
-- =                            mail, promotion, filiere); end;      =
-- = Résumé ==========================================================
-- = Met à jour un adhérent dont l'id est spécifié avec les données  =
-- = fournies.                                                       =
-- ===================================================================
prompt [Création fonction maj_adherent];
create procedure maj_adherent
(ID            ADHERENTS.ID_ADHERENT%type,
 PRENOM        PERSONNES.P_PRENOM%type,
 NOM           PERSONNES.P_NOM%type,  
 MOT_DE_PASSE  ADHERENTS.A_MOT_DE_PASSE%type,
 MAIL          ADHERENTS.A_EMAIL%type,
 PROMOTION     ADHERENTS.A_PROMOTION%type,
 FILIERE       ADHERENTS.A_FILIERE%type)
as
begin
    update PERSONNES SET
        P_NOM = NOM,
        P_PRENOM = PRENOM
        where ID_PERSONNE = ID;
    update ADHERENTS SET 
        A_MOT_DE_PASSE = MOT_DE_PASSE ,
        A_EMAIL         = MAIL         ,
        A_PROMOTION    = PROMOTION    ,
        A_FILIERE      = FILIERE      
        where ID_ADHERENT = ID ;
end;
/
show errors procedure maj_adherent;
begin
    register_object('procedure', 'maj_adherent');
end;
/