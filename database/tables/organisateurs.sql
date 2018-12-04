-- ============================================================
--   Table : ORGANISATEURS
-- ============================================================
create table ORGANISATEURS
(
    ID_ADHERENT_ORGANISATEUR        NUMBER(3)              not null,
    ID_EVENEMENT_ORGANISE           NUMBER(3)              not null,
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ORAGNISATEURS->EVENEMENTS)--
    constraint pk_organisateurs primary key (ID_ADHERENT_ORGANISATEUR, ID_EVENEMENT_ORGANISE),
    constraint fk1_organisateurs foreign key (ID_ADHERENT_ORGANISATEUR) 
      references ADHERENTS (ID_ADHERENT) on delete cascade,
    constraint fk2_organisateurs foreign key (ID_EVENEMENT_ORGANISE) 
      references EVENEMENTS (ID_EVENEMENT) on delete cascade
);
CREATE TRIGGER organisateurs_roc
  BEFORE INSERT ON ORGANISATEURS  
  FOR EACH ROW
DECLARE
  asso_ev number;
  adh_count number;
BEGIN
  select ID_ASSOCIATION_HOTE INTO asso_ev FROM EVENEMENTS WHERE ID_EVENEMENT = :new.ID_EVENEMENT_ORGANISE;
  select COUNT(ID_ASSOCIATION_ADHEREE) INTO adh_count 
  FROM ADHESIONS WHERE ID_ADHERENT_ADHERANT = :new.ID_ADHERENT_ORGANISATEUR 
                  and ID_ASSOCIATION_ADHEREE = asso_ev;
  IF( adh_count = 0 )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Evenement et adherent doivent être organisé/adérer à la même association.' );
  END IF;
END;
/
show errors trigger organisateurs_roc;
-- Déclaration des objets créés
begin
    register_object('table', 'ORGANISATEURS');
    register_object('trigger', 'organisateurs_roc');
end;
/