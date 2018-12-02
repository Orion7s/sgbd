-- ============================================================
--   Table : LIEUX
-- ============================================================
create table LIEUX
(
    NOM_LIEU                        CHAR(40)               not null,
    constraint pk_lieux primary key (NOM_LIEU)
);
-- Déclaration des objets créés
begin
    register_object('table', 'LIEUX');
end;
/