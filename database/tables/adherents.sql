-- ============================================================
--   Table : ADHERENTS
-- ============================================================
create table ADHERENTS
(
    ID_ADHERENT                     NUMBER(3)              not null,
    A_LOGIN                         CHAR(24)               not null,
    A_MOT_DE_PASSE                  CHAR(20)               not null,
    A_EMAIL                         CHAR(50)               not null,
    A_PROMOTION                     NUMBER(4)              not null,
    A_FILIERE                       CHAR(40)               not null,
    constraint pk_adherant primary key (ID_ADHERENT)               ,
    constraint fk1_adherents foreign key (ID_ADHERENT)
      references PERSONNES (ID_PERSONNE) on delete cascade,
    constraint fk2_adherents foreign key (A_FILIERE) 
      references FILIERES (NOM_FILIERE) on delete cascade,
    constraint un_adherents unique (A_LOGIN)
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ADHESIONS->ADHERENTS)--
);
CREATE TRIGGER adherents_roc
  BEFORE UPDATE ON ADHERENTS  
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.ID_ADHERENT != :old.ID_ADHERENT )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ ID_ADHERENT impossible.' );
  END IF;
  IF( :new.A_LOGIN != :old.A_LOGIN )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 'Modification du champ A_LOGIN impossible.' );
  END IF;
END;
/
-- Déclaration des objets créés
begin
    register_object('table', 'ADHERENTS');
    register_object('trigger', 'adherents_roc');
end;
/