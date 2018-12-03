-- ===================================================================
-- = Fonction requête : financements_le                                  =
-- = USAGE : select * from TABLE(FINANCEMENTS_LE(aid, t))                =
-- = Résumé ==========================================================
-- = Liste les adérants à une association d'id aid à un instant t    =
-- ===================================================================

prompt [Création requête FINANCEMENTS_LE];

-- Déclaration du type des lignes
CREATE TYPE rt__financements_le AS OBJECT
(
    NOM_SOURCE_FINANCEMENT          CHAR(20),
    MONTANT_TOTAL                     NUMBER
);
/
-- Déclaration du type de retour
CREATE or replace TYPE t__financements_le IS TABLE OF rt__financements_le;
/

-- Déclaration de la fonction à utiliser
create or replace function FINANCEMENTS_LE (f_id_association number, instant date) return t__financements_le PIPELINED
AS
begin
  FOR r IN (
      SELECT NOM_SOURCE_FINANCEMENT, SUM(MONTANT) MONTANT_TOTAL
      FROM (SELECT NOM_SOURCE_FINANCANT NOM_SOURCE_FINANCEMENT, MONTANT 
            FROM FINANCEMENTS
            WHERE ID_ASSOCIATION_FINANCEE = f_id_association
              and DATE_FINANCEMENT < instant
      UNION (SELECT (dbsettings.nom_cotisation) NOM_SOURCE_FINANCEMENT, MONTANT
             FROM (SELECT SUM(MONTANT_COTISATION_REGLEE) MONTANT
                   FROM ADHESIONS
                   WHERE (ID_ASSOCIATION_ADHEREE = f_id_association)
                     and (not (DATE_REGLEMENT_COTISATION is null)) 
                     and DATE_REGLEMENT_COTISATION < instant)))
      GROUP BY NOM_SOURCE_FINANCEMENT
      ORDER BY MONTANT_TOTAL DESC
  )
  LOOP
    PIPE ROW(rt__financements_le(r.NOM_SOURCE_FINANCEMENT, r.MONTANT_TOTAL));
  END LOOP;
end;
/
show errors type rt__financements_le;
show errors type t__financements_le;
show errors function FINANCEMENTS_LE;

-- Déclaration des objets créés
begin
    register_object('type', 'rt__financements_le');
    register_object('type', 't__financements_le');
    register_object('function', 'FINANCEMENTS_LE');
end;
/