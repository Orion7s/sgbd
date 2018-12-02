-- ============================================================
--   Table : PERSONNES
-- ============================================================
create table PERSONNES
(
    ID_PERSONNE                     NUMBER(3)              not null,
    P_NOM                           CHAR(60)               not null,
    P_PRENOM                        CHAR(60)               not null,
    constraint pk_personnes primary key (ID_PERSONNE)
);
CREATE TRIGGER personnes_roc
  BEFORE UPDATE ON PERSONNES  
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.ID_PERSONNE != :old.ID_PERSONNE )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_PERSONNE impossible.' );
  END IF;
END;
/
-- Déclaration des objets créés
begin
    register_object('table', 'PERSONNES');
    register_object('trigger', 'personnes_roc');
end;
/