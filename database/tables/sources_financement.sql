-- ============================================================
--   Table : SOURCES_FINANCEMENT
-- ============================================================
create table SOURCES_FINANCEMENT
(
    NOM_SOURCE_FINANCEMENT          CHAR(20)              not null,
    constraint pk_source_financement primary key (NOM_SOURCE_FINANCEMENT)
);
create trigger check_sources_financement
before insert or update on SOURCES_FINANCEMENT
for each row 
declare
begin
    if :new.NOM_SOURCE_FINANCEMENT = dbsettings.nom_cotisation then
        RAISE_APPLICATION_ERROR( -20001, 'Valeur ' || dbsettings.nom_cotisation || ' interdite pour le champ NOM_SOURCE_FINANCEMENT' );
    end if;
end;
/
show errors trigger check_sources_financement;
-- Déclaration des objets créés
begin
    register_object('table', 'SOURCES_FINANCEMENT');
    register_object('trigger', 'check_sources_financement');
end;
/