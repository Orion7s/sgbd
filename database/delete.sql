declare
    deletestatement VARCHAR2(100);
begin
    FOR obj IN (SELECT * FROM ASSOCIATIONS_DB_ITEMS where OBJECT_TYPE = 'table' order by ID desc) LOOP
        deletestatement := 'delete from ' || obj.OBJECT_NAME;
        execute immediate deletestatement;
    END LOOP;
end;
/
@sequences/reset