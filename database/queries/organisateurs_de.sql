-- ===================================================================
-- = Fonction requête : organisateurs_de                             =
-- = USAGE : select * from TABLE(ORGANISATEURS_DE(n))                =
-- = Résumé ==========================================================
-- = Liste les organisateurs d'un évènement d'id n                   =
-- ===================================================================

prompt [Création requête ORGANISATEURS_DE];

-- Déclaration du type des lignes
CREATE TYPE rt__organisateurs_de AS OBJECT
(
    ID_ADHERENT                     NUMBER(3),
    A_LOGIN                         CHAR(24) ,
    A_MOT_DE_PASSE                  CHAR(20) ,
    A_EMAIL                         CHAR(50) ,
    A_PROMOTION                     NUMBER(4),
    A_FILIERE                       CHAR(40) ,
    P_NOM                           CHAR(60) ,
    P_PRENOM                        CHAR(60) 
);
/
-- Déclaration du type de retour
CREATE or replace TYPE t__organisateurs_de IS TABLE OF rt__organisateurs_de;
/

-- Déclaration de la fonction à utiliser
create or replace function ORGANISATEURS_DE (f_id_evenement number) return t__organisateurs_de PIPELINED
AS  
begin
  FOR r IN (SELECT ADHERENTS.*, P_NOM, P_PRENOM from ADHERENTS
            inner join (select ID_ADHERENT_ORGANISATEUR from ORGANISATEURS
                        where ID_EVENEMENT_ORGANISE = f_id_evenement) ON ID_ADHERENT_ORGANISATEUR=ID_ADHERENT
            inner join PERSONNES ON ID_PERSONNE = ID_ADHERENT)
  LOOP
    PIPE ROW(rt__organisateurs_de(r.ID_ADHERENT, r.A_LOGIN, r.A_MOT_DE_PASSE,
                                 r.A_EMAIL, r.A_PROMOTION, r.A_FILIERE,
                                 r.P_NOM, r.P_PRENOM));
  END LOOP;
end;
/
show errors type rt__organisateurs_de;
show errors type t__organisateurs_de;
show errors function ORGANISATEURS_DE;

-- Déclaration des objets créés
begin
    register_object('type', 'rt__organisateurs_de');
    register_object('type', 't__organisateurs_de');
    register_object('function', 'ORGANISATEURS_DE');
end;
/