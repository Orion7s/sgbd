-- ===================================================================
-- = Fonction requête : adherents_a                                  =
-- = USAGE : select * from TABLE(ADHERENTS_A(aid, t))                =
-- = Résumé ==========================================================
-- = Liste les adérants à une association d'id aid à un instant t    =
-- ===================================================================

prompt [Création requête ADHERENTS_A];

-- Déclaration du type des lignes
CREATE TYPE rt__adherents_a AS OBJECT
(
    ID_ADHERENT                     NUMBER(3),
    A_LOGIN                         CHAR(24) ,
    A_MOT_DE_PASSE                  CHAR(20) ,
    A_EMAIL                         CHAR(50) ,
    A_PROMOTION                     NUMBER(4),
    A_FILIERE                       CHAR(40) ,
    P_NOM                           CHAR(60) ,
    P_PRENOM                        CHAR(60) ,
    DATE_ADHESION                   DATE     ,
    COTISATION_REGLEE_ADHESION      NUMBER(1)
);
/
-- Déclaration du type de retour
CREATE or replace TYPE t__adherents_a IS TABLE OF rt__adherents_a;
/

-- Déclaration de la fonction à utiliser
create or replace function ADHERENTS_A (f_id_association_adheree number, instant date) return t__adherents_a PIPELINED
AS  
  annee_date number;
  debut_annee date;
  fin_annee date;
begin
    annee_date := extract (year from instant);
    if  (extract (month from instant)) < 9 then 
        annee_date := annee_date - 1;
    end if;
    debut_annee := TO_DATE(annee_date||'-'||dbsettings.adhesion_date_debut, 'yyyy-mm-dd');
    fin_annee := TO_DATE(annee_date+1||'-'||dbsettings.adhesion_date_fin, 'yyyy-mm-dd');
  FOR r IN (SELECT ADHERENTS.*, P_NOM, P_PRENOM, DATE_ADHESION, COTISATION_REGLEE_ADHESION from ADHESIONS
            inner join ADHERENTS on ID_ADHERENT = ID_ADHERENT_ADHERANT
            inner join PERSONNES on ID_PERSONNE = ID_ADHERENT
            where (DATE_ADHESION between debut_annee and fin_annee)
              and (ID_ASSOCIATION_ADHEREE = f_id_association_adheree))
  LOOP
    PIPE ROW(rt__adherents_a(r.ID_ADHERENT, r.A_LOGIN, r.A_MOT_DE_PASSE,
                                 r.A_EMAIL, r.A_PROMOTION, r.A_FILIERE,
                                 r.P_NOM, r.P_PRENOM, r.DATE_ADHESION, 
                                 r.COTISATION_REGLEE_ADHESION));
  END LOOP;
end;
/
show errors type rt__adherents_a;
show errors type t__adherents_a;
show errors function ADHERENTS_A;