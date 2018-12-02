-- ============================================================
--   Table : ADHESIONS
-- ============================================================
create table ADHESIONS
(
    ID_ASSOCIATION_ADHEREE          NUMBER(3)              not null,
    ID_ADHERENT_ADHERANT            NUMBER(3)              not null,
    DATE_ADHESION                   DATE                   not null,
    COTISATION_REGLEE_ADHESION      NUMBER(1)              not null, -- Use as boolean
    constraint pk_adhesions  primary key (ID_ASSOCIATION_ADHEREE, ID_ADHERENT_ADHERANT),
    constraint fk1_adhesions foreign key (ID_ASSOCIATION_ADHEREE)
      references ASSOCIATIONS (ID_ASSOCIATION) on delete cascade,
    constraint fk2_adhesions foreign key (ID_ADHERENT_ADHERANT)
      references ADHERENTS (ID_ADHERENT) on delete cascade
);
-- Déclaration des objets créés
begin
    register_object('table', 'ADHESIONS');
end;
/