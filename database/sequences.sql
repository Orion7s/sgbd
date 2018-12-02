-- ============================================================
--   Séquence pour les identifiants                                       
-- ============================================================
create sequence sq_id_objectifs order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_associations order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_personnes order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_evenements order nocycle minvalue 0 maxvalue 4999;
create sequence sq_id_news order nocycle minvalue 5000 maxvalue 9999;
create sequence sq_id_commentaires order nocycle minvalue 0 maxvalue 99999;

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
    register_object('trigger', 'objectifs_set_id');
    register_object('trigger', 'associations_set_id');
    register_object('trigger', 'personnes_set_id');
    register_object('trigger', 'evenements_set_id');
    register_object('trigger', 'news_set_id');
    register_object('trigger', 'commentaires_set_id');
end;
/