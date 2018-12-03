-- ============================================================
--   Table : FINANCEMENTS
-- ============================================================
create table FINANCEMENTS
(
    ID_ASSOCIATION_FINANCEE         NUMBER(3)              not null,
    NOM_SOURCE_FINANCANT            CHAR(20)               not null,
    MONTANT                         NUMBER(6)              not null,
    DATE_FINANCEMENT                DATE                   not null,
    constraint pk_financements primary key (ID_ASSOCIATION_FINANCEE, NOM_SOURCE_FINANCANT),
    constraint fk1_financements foreign key (ID_ASSOCIATION_FINANCEE) 
      references ASSOCIATIONS (ID_ASSOCIATION) on delete cascade,
    constraint fk2_financements foreign key (NOM_SOURCE_FINANCANT) 
      references SOURCES_FINANCEMENT (NOM_SOURCE_FINANCEMENT) on delete cascade
);
-- Déclaration des objets créés
begin
    register_object('table', 'FINANCEMENTS');
end;
/