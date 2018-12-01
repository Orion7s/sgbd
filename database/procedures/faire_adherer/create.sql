
-- ======================================================================
-- = Procédure : faire_adherer                                          =
-- = USAGE : select faire_adherer(ID_ASSOCIATION_ADHEREE,               =
-- =                              ID_ADHERENT_ADHERANT,                 =
-- =                              DATE_ADHESION,                        =
-- =                              COTISATION_REGLEE_ADHESION) from dual =
-- = Résumé =============================================================
-- = Créer une adhésion à l'association d'un adhérents via leurs ident- =
-- = tifiants                                                           =
-- ======================================================================
prompt [Création procédure faire_adherer];
create procedure faire_adherer
(ID_ASSOCIATION_ADHEREE          ADHESIONS.ID_ASSOCIATION_ADHEREE%type,
 ID_ADHERENT_ADHERANT            ADHESIONS.ID_ASSOCIATION_ADHEREE%type,
 DATE_ADHESION                   ADHESIONS.DATE_ADHESION%type,
 COTISATION_REGLEE_ADHESION      ADHESIONS.COTISATION_REGLEE_ADHESION%type)
as
begin
    insert into ADHESIONS VALUES (ID_ASSOCIATION_ADHEREE,
                                  ID_ADHERENT_ADHERANT,
                                  DATE_ADHESION,
                                  COTISATION_REGLEE_ADHESION);
end;
/
show errors function faire_adherer;