-- ============================================================
--   Nom de la base   :  ASSOCIATIONS
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  30/10/96  12:09
-- ============================================================



show errors package dbsettings;

-- TODO : Moyenne des commentaires donnés par chaque adhérents pour une news.
@drop

create sequence sq_db_item_id order nocycle minvalue 0 maxvalue 99;
create table ASSOCIATIONS_DB_ITEMS (
    ID            NUMBER(2)    not null,
    OBJECT_TYPE   VARCHAR2(19) not null,
    OBJECT_NAME   VARCHAR2(30) not null,
    constraint pk_associations_db_items primary key (OBJECT_TYPE, OBJECT_NAME)
);
create procedure register_object
(type ASSOCIATIONS_DB_ITEMS.OBJECT_TYPE%type,
 name ASSOCIATIONS_DB_ITEMS.OBJECT_NAME%type)
AS
begin
    INSERT INTO ASSOCIATIONS_DB_ITEMS VALUES (sq_db_item_id.nextval, type, name);
end;
/
show errors procedure register_object;


@settings/create
@settings
@tables/index
@sequences
@views/index
@queries/index
@procedures/index


--@cascadeDeleteTriggers
--@draft
