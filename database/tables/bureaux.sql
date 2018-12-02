-- ============================================================
--   Table :  BUREAUX
-- ============================================================
create table BUREAUX
(
    ID_ASSOCIATION_MEMBRE           NUMBER(3)              not null,
    ID_ADHERENT_MEMBRE              NUMBER(3)              not null,
    ROLE_MEMBRE                     CHAR(25)               not null,
    constraint pk_bureaux  primary key (ID_ASSOCIATION_MEMBRE, ID_ADHERENT_MEMBRE),
    constraint fk1_bureaux   foreign key (ID_ASSOCIATION_MEMBRE) 
      references ASSOCIATIONS (ID_ASSOCIATION) on delete cascade,
    constraint fk2_bureaux   foreign key (ID_ADHERENT_MEMBRE)
      references ADHERENTS (ID_ADHERENT) on delete cascade
);
CREATE TRIGGER bureaux_roc
  BEFORE UPDATE ON BUREAUX  
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.ID_ASSOCIATION_MEMBRE != :old.ID_ASSOCIATION_MEMBRE )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_ASSOCIATION_MEMBRE impossible' );
  END IF;
  IF( :new.ID_ADHERENT_MEMBRE != :old.ID_ADHERENT_MEMBRE )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_ADHERENT_MEMBRE impossible' );
  END IF;
END;
/
show errors trigger bureaux_roc;
-- Déclaration des objets créés
begin
    register_object('table', 'BUREAUX');
    register_object('trigger', 'bureaux_roc');
end;
/