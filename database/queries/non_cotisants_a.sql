-- ===================================================================
-- = Fonction requête : non_cotisants_a                                  =
-- = USAGE : select * from TABLE(NON_COTISANTS_A(aid, t))                =
-- = Résumé ==========================================================
-- = Liste les adérants à une association d'id aid à un instant t    =
-- ===================================================================

prompt [Création requête NON_COTISANTS_A];

-- Déclaration du type des lignes
CREATE TYPE rt__non_cotisants_a AS OBJECT
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
CREATE or replace TYPE t__non_cotisants_a IS TABLE OF rt__non_cotisants_a;
/

-- Déclaration de la fonction à utiliser
create or replace function NON_COTISANTS_A (f_id_association_adheree number) return t__non_cotisants_a PIPELINED
AS  
begin
  FOR r IN (SELECT  *
            from ADHERENTS
            INNER JOIN ADHESIONS ON ID_ADHERENT_ADHERANT = ID_ADHERENT
            INNER JOIN PERSONNES ON ID_PERSONNE = ID_ADHERENT
            where f_id_association_adheree = ID_ASSOCIATION_ADHEREE
              and DATE_REGLEMENT_COTISATION is null)
  LOOP
    PIPE ROW(rt__non_cotisants_a(r.ID_ADHERENT, r.A_LOGIN, r.A_MOT_DE_PASSE,
                                 r.A_EMAIL, r.A_PROMOTION, r.A_FILIERE,
                                 r.P_NOM, r.P_PRENOM));
  END LOOP;
end;
/
show errors type rt__non_cotisants_a;
show errors type t__non_cotisants_a;
show errors function NON_COTISANTS_A;

-- Déclaration des objets créés
begin
    register_object('type', 'rt__non_cotisants_a');
    register_object('type', 't__non_cotisants_a');
    register_object('function', 'NON_COTISANTS_A');
end;
/