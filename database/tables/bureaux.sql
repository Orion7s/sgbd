-- ============================================================
--   Table :  BUREAUX
-- ============================================================
create table BUREAUX
(
    ID_ASSOCIATION_MEMBRE           NUMBER(3)              not null,
    ID_ADHERENT_MEMBRE              NUMBER(3)              not null,
    ROLE_MEMBRE                     CHAR(25)               not null,
    constraint pk_bureaux  primary key (ID_ASSOCIATION_MEMBRE, ID_ADHERENT_MEMBRE),
    constraint fk1_bureaux   foreign key (ID_ASSOCIATION_MEMBRE) references ASSOCIATIONS (ID_ASSOCIATION),
    constraint fk2_bureaux   foreign key (ID_ADHERENT_MEMBRE) references ADHERENTS (ID_ADHERENT) 
);
-- Déclaration des objets créés
begin
    register_object('table', 'BUREAUX');
end;
/