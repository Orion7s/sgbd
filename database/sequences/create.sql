-- ============================================================
--   Séquence pour les identifiants                                       
-- ============================================================
create sequence sq_id_objectifs order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_associations order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_personnes order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_evenements order nocycle minvalue 0 maxvalue 4999;
create sequence sq_id_news order nocycle minvalue 5000 maxvalue 9999;
create sequence sq_id_commentaires order nocycle minvalue 0 maxvalue 99999;

create procedure reset_seq( p_seq_name in varchar2 ) -- Inspiré de https://asktom.oracle.com/pls/apex/asktom.search?tag=how-to-reset-sequences
is
    l_val number;
    l_min number;
begin
    SELECT min_value INTO l_min from all_sequences 
    where sequence_owner = user and sequence_name = p_seq_name;
    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;

    if (l_val - l_min) > 0 then
        execute immediate
        'alter sequence ' || p_seq_name || ' increment by ' || (l_min - l_val) || 
                                                          ' minvalue ' || l_min;
                                                          
        execute immediate
        'select ' || p_seq_name || '.nextval from dual' INTO l_val;

        execute immediate
        'alter sequence ' || p_seq_name || ' increment by 1 minvalue ' || l_min;
    end if;
end;
/
show errors procedure reset_seq;
create procedure reset_all_seq
is
begin
    FOR obj IN (SELECT * FROM ASSOCIATIONS_DB_ITEMS where OBJECT_TYPE='sequence' order by ID desc) LOOP
        reset_seq(obj.OBJECT_NAME);
    END LOOP;
end;
/
show errors procedure reset_all_seq;

create trigger objectifs_set_id
    before insert on OBJECTIFS
    for each row when (new.ID_OBJECTIF is null)
    begin
        select sq_id_objectifs.nextval
        into :new.ID_OBJECTIF
        from dual;
    end;
/
show errors trigger objectifs_set_id;

create trigger associations_set_id
    before insert on ASSOCIATIONS
    for each row when (new.ID_ASSOCIATION is null)
    begin
        select sq_id_associations.nextval
        into :new.ID_ASSOCIATION
        from dual;
    end;
/
show errors trigger associations_set_id;

create trigger personnes_set_id
    before insert on PERSONNES
    for each row when (new.ID_PERSONNE is null)
    begin
        select sq_id_personnes.nextval
        into :new.ID_PERSONNE
        from dual;
    end;
/
show errors trigger personnes_set_id;

create trigger evenements_set_id
    before insert on CONTENUS
    for each row when (new.ID_CONTENU is null)
    begin
        select sq_id_evenements.nextval
        into :new.ID_CONTENU
        from dual;
    end;
/
show errors trigger evenements_set_id;

create trigger news_set_id
    before insert on CONTENUS
    for each row when (new.ID_CONTENU is null)
    begin
        select sq_id_news.nextval
        into :new.ID_CONTENU
        from dual;
    end;
/
show errors trigger news_set_id;

create trigger commentaires_set_id
    before insert on COMMENTAIRES
    for each row when (new.ID_COMMENTAIRE is null)
    begin
        select sq_id_commentaires.nextval
        into :new.ID_COMMENTAIRE
        from dual;
    end;
/
show errors trigger commentaires_set_id;

-- Déclaration des objets créés
begin
    register_object('sequence', 'sq_id_objectifs');
    register_object('sequence', 'sq_id_associations');
    register_object('sequence', 'sq_id_personnes');
    register_object('sequence', 'sq_id_evenements');
    register_object('sequence', 'sq_id_news');
    register_object('sequence', 'sq_id_commentaires');
    register_object('procedure', 'reset_seq');
    register_object('procedure', 'reset_all_seq');
    register_object('trigger', 'objectifs_set_id');
    register_object('trigger', 'associations_set_id');
    register_object('trigger', 'personnes_set_id');
    register_object('trigger', 'evenements_set_id');
    register_object('trigger', 'news_set_id');
    register_object('trigger', 'commentaires_set_id');    
end;
/