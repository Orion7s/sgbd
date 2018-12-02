-- ============================================================
--   Table : ASSOCIATIONS
-- ============================================================
create table ASSOCIATIONS
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    NOM_ASSOCIATION                 CHAR(20)               not null,
    constraint pk_association primary key (ID_ASSOCIATION)
);
CREATE TRIGGER associations_roc
  BEFORE UPDATE ON ASSOCIATIONS  
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.ID_ASSOCIATION != :old.ID_ASSOCIATION )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_ASSOCIATION impossible.' );
  END IF;
END;
/
show errors trigger associations_roc;
-- Déclaration des objets créés
begin
    register_object('table', 'ASSOCIATIONS');
    register_object('trigger', 'associations_roc');
end;
/