-- ===================================================================
-- = Fonction requête : participants_a                               =
-- = USAGE : select * from TABLE(PARTICIPANTS_A(n))                  =
-- = Résumé ==========================================================
-- = Liste les participants à un évènement d'id n                    =
-- ===================================================================

prompt [Création requête PARTICIPANTS_A];

-- Déclaration du type des lignes
CREATE TYPE rt__participants_a AS OBJECT
(
    ID_ADHERENT                     NUMBER(3),
    P_NOM                           CHAR(60) ,
    P_PRENOM                        CHAR(60) 
);
/
-- Déclaration du type de retour
CREATE or replace TYPE t__participants_a IS TABLE OF rt__participants_a;
/

-- Déclaration de la fonction à utiliser
create or replace function PARTICIPANTS_A (f_id_evenement number) return t__participants_a PIPELINED
AS  
begin
  FOR r IN (SELECT PERSONNES.* from PERSONNES
            inner join (select ID_PERSONNE_PARTICIPANT from PARTICIPATIONS
                        where ID_EVENEMENT_PARTICIPE = f_id_evenement) ON ID_PERSONNE_PARTICIPANT=ID_PERSONNE)
  LOOP
    PIPE ROW(rt__participants_a(r.ID_PERSONNE, r.P_NOM, r.P_PRENOM));
  END LOOP;
end;
/
show errors type rt__participants_a;
show errors type t__participants_a;
show errors function PARTICIPANTS_A;