-- ============================================================
--   Table : FILIERES
-- ============================================================
create table FILIERES
(
    NOM_FILIERE                     CHAR(40)              not null,
    constraint pk_filieres primary key (NOM_FILIERE)
);
-- Déclaration des objets créés
begin
    register_object('table', 'FILIERES');
end;
/