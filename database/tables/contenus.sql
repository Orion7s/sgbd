-- ============================================================
--   Table : CONTENUS
-- ============================================================
create table CONTENUS
(
    ID_CONTENU                      NUMBER(4)              not null,
    DATE_PUBLICATION_CONTENU        DATE                   not null,
    TITRE_CONTENU                   CHAR(60)               not null,
    constraint pk_contenus primary key (ID_CONTENU)
);
CREATE TRIGGER contenus_roc
  BEFORE UPDATE ON CONTENUS  
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.ID_CONTENU != :old.ID_CONTENU )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_CONTENU impossible.' );
  END IF;
  IF( :new.DATE_PUBLICATION_CONTENU != :old.DATE_PUBLICATION_CONTENU )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ DATE_PUBLICATION_CONTENU impossible.' );
  END IF;
END;
/
-- Déclaration des objets créés
begin
    register_object('table', 'CONTENUS');
    register_object('trigger', 'contenus_roc');
end;
/