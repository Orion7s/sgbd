-- ============================================================
--   Séquence pour les identifiants                                       
-- ============================================================
drop sequence   sq_id_objectifs;
drop sequence   sq_id_associations;
drop sequence   sq_id_personne;
drop sequence   sq_id_contenu;
drop sequence   sq_id_commentaire;

create sequence sq_id_objectifs order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_associations order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_personne order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_contenu order nocycle minvalue 0 maxvalue 999;
create sequence sq_id_commentaire order nocycle minvalue 0 maxvalue 99999;
