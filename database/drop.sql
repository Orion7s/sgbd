declare
    dropstatement VARCHAR2(100);
begin
    FOR obj IN (SELECT * FROM ASSOCIATIONS_DB_ITEMS order by ID desc) LOOP
        dropstatement := 'drop ' || obj.OBJECT_TYPE || ' ' || obj.OBJECT_NAME;
        if obj.OBJECT_TYPE = 'table' then
            dropstatement := dropstatement || ' cascade constraints';
        end if;
        execute immediate dropstatement;
    END LOOP;
    execute immediate 'drop procedure register_object';
    execute immediate 'drop table ASSOCIATIONS_DB_ITEMS cascade constraints';
    execute immediate 'drop sequence sq_db_item_id';
end;
/
prompt [Database Droped];