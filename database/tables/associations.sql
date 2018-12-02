-- ============================================================
--   Table : ASSOCIATIONS
-- ============================================================
create table ASSOCIATIONS
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    NOM_ASSOCIATION                 CHAR(20)               not null,
    constraint pk_association primary key (ID_ASSOCIATION)
);
-- Déclaration des objets créés
begin
    register_object('table', 'ASSOCIATIONS');
end;
/