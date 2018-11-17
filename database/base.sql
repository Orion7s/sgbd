-- ============================================================
--   Nom de la base   :  ASSOCIATIONS                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table ASSOCIATIONS cascade constraints;

drop table SOURCE_FINANCEMENTS cascade constraints;

drop table FINANCEMENTS cascade constraints;

drop table OBJECTIFS cascade constraints;

drop table POURSUITES cascade constraints;

drop table ADHERENTS cascade constraints;

drop table ADHESIONS cascade constraints;

drop table FILIERES cascade constraints;

drop table CONTENUS cascade constraints;

drop table NEWS cascade constraints;

drop table COMMENTAIRES cascade constraints;

drop table PERSONNES cascade constraints;

drop table LIEUX cascade constraints;

drop table EVENEMENTS cascade constraints;

drop table PARTICIPATIONS cascade constraints;

drop table ORGANISATEURS cascade constraints;



-- ============================================================
--   Table : LIEUX                                       
-- ============================================================
create table LIEUX
(
    NOM_LIEU                        CHAR(40)               not null,
    constraint pk_lieux primary key (NOM_LIEU)
);
-- ============================================================
--   Table : FILIERES                                       
-- ============================================================
create table FILIERES
(
    NOM_FILIERE                     NUMBER(3)              not null,
    constraint pk_filieres primary key (NOM_FILIERE)
);
-- ============================================================
--   Table : SOURCE_FINANCEMENTS                                       
-- ============================================================
create table SOURCE_FINANCEMENTS
(
    NOM_SOURCE_FINANCEMENT          CHAR(20)              not null,
    constraint pk_source_financement primary key (NOM_SOURCE_FINANCEMENT)
);
-- ============================================================
--   Table : OBJECTIFS                                       
-- ============================================================
create table OBJECTIFS
(
    ID_OBJECTIF                     NUMBER(3)              not null,
    DESCRIPTION_OBJECTIF            CHAR(255)              not null,
    constraint pk_objectifs primary key (ID_OBJECTIF)
);



-- ============================================================
--   Table : ASSOCIATIONS                                            
-- ============================================================
create table ASSOCIATIONS
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    NOM_ASSOCIATION                 CHAR(20)               not null,
    constraint pk_association primary key (ID_ASSOCIATION)
);
-- ============================================================
--   Table : FINANCEMENTS                                            
-- ============================================================
create table FINANCEMENTS
(
    ID_ASSOCIATION_FINANCEE         NUMBER(3)              not null,
    NOM_SOURCE_FINANCANT            CHAR(20)               not null,
    constraint pk_financements primary key (ID_ASSOCIATION_FINANCEE, NOM_SOURCE_FINANCANT),
    constraint fk1_financements foreign key (ID_ASSOCIATION_FINANCEE) references ASSOCIATIONS (ID_ASSOCIATION),
    constraint fk2_financements foreign key (NOM_SOURCE_FINANCANT) references SOURCE_FINANCEMENTS (NOM_SOURCE_FINANCEMENT)
);
-- ============================================================
--   Table : POURSUITES                                            
-- ============================================================
create table POURSUITES
(
    ID_ASSOCIATION_POURSUIVANT      NUMBER(3)              not null,
    ID_OBJECTIF_POURSUIVI           NUMBER(3)              not null,
    constraint pk_poursuites primary key (ID_ASSOCIATION_POURSUIVANT, ID_OBJECTIF_POURSUIVI),
    constraint fk1_poursuites foreign key (ID_ASSOCIATION_POURSUIVANT) references ASSOCIATIONS (ID_ASSOCIATION),
    constraint fk2_poursuites foreign key (ID_OBJECTIF_POURSUIVI) references OBJECTIFS (ID_OBJECTIF)
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (POURSUIVRE->ASSOCATION, POURSUIVRE->OBJECTIF)--
);




-- ============================================================
--   Table : PERSONNES                                       
-- ============================================================
create table PERSONNES
(
    ID_PERSONNE                     NUMBER(3)              not null,
    NOM_PERSONNE                    CHAR(60)               not null,
    PRENOM_PERSONNE                 CHAR(255)              not null,
    constraint pk_personnes primary key (ID_PERSONNE)
);
-- ============================================================
--   Table : ADHERENTS                                       
-- ============================================================
create table ADHERENTS
(
    ID_ADHERENT                     NUMBER(3)              not null,
    LOGIN_ADHERENT                  CHAR(255)              not null,
    MOT_DE_PASSE_ADHERENT           CHAR(20)               not null,
    EMAIL_ADHERENT                  CHAR(80)               not null,
    PROMOTION_ADEHRENT              NUMBER(4)              not null,
    FILIERE_ADHERENT                NUMBER(3)              not null,
    constraint pk_adherant primary key (ID_ADHERENT)               ,
    constraint fk1_adherents foreign key (ID_ADHERENT) references PERSONNES (ID_PERSONNE),
    constraint fk2_adherents foreign key (FILIERE_ADHERENT) references FILIERES (NOM_FILIERE)
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ADHESIONS->ADHERENTS)--
);
-- ============================================================
--   Table : ADHESIONS                                            
-- ============================================================
create table ADHESIONS
(
    ID_ASSOCIATION_ADHEREE          NUMBER(3)              not null,
    ID_ADHERENT_ADHERANT            NUMBER(3)              not null,
    DATE_ADHESION                   DATE                   not null,
    ROLE_ADHERENT                   CHAR(16)                       ,
    COTISATION_REGLEE_ADHESION      NUMBER(1)              not null, -- Use as boolean
    constraint fk1_adhesions foreign key (ID_ASSOCIATION_ADHEREE) references ASSOCIATIONS (ID_ASSOCIATION),
    constraint fk2_adhesions foreign key (ID_ADHERENT_ADHERANT) references ADHERENTS (ID_ADHERENT)
);




-- ============================================================
--   Table : CONTENUS                                       
-- ============================================================
create table CONTENUS
(
    ID_CONTENU                      NUMBER(3)              not null,
    constraint pk_contenus primary key (ID_CONTENU)
);
-- ============================================================
--   Table : COMMENTAIRES                                            
-- ============================================================
create table COMMENTAIRES
(
    ID_COMMENTAIRE                  NUMBER(5)              not null,
    ID_ADHERENT_COMMENTANT          NUMBER(3)              not null,
    ID_CONTENU_COMMENTE             NUMBER(3)              not null,
    DATE_PUBLICATION_COMENTAIRE     DATE                   not null,
    TEXTE_COMMENTAIRE               CHAR(255)              not null,
    constraint pk_commentaire primary key (ID_COMMENTAIRE)         ,
    constraint fk1_commentaires foreign key (ID_ADHERENT_COMMENTANT) references ADHERENTS (ID_ADHERENT),
    constraint fk2_commentaires foreign key (ID_CONTENU_COMMENTE) references CONTENUS (ID_CONTENU)
);


-- ============================================================
--   Table : NEWS                                       
-- ============================================================
create table NEWS
(
    ID_NEWS                         NUMBER(3)              not null,
    ID_AUTEUR                       NUMBER(3)              not null,
    TITRE_NEWS                      CHAR(60)               not null,
    TEXTE_NEWS                      CHAR(255)              not null,
    DATE_PUBLICATION_NEWS           DATE                   not null,
    -- TODO : Ajouter une contrainte pour empêcher un évènement d'être un commentaire
    constraint pk_news primary key (ID_NEWS)                       ,
    constraint fk1_news foreign key (ID_NEWS) references CONTENUS (ID_CONTENU),
    constraint fk2_news foreign key (ID_AUTEUR) references ADHERENTS (ID_ADHERENT)
);


-- ============================================================
--   Table : EVENEMENTS                                       
-- ============================================================
create table EVENEMENTS
(
    ID_EVENEMENT                    NUMBER(3)              not null,
    LIEU_EVENEMENT                  CHAR(40)               not null,
    TITRE_EVENEMENT                 CHAR(60)               not null,
    DESCRIPTION_EVENEMENT           CHAR(255)              not null,
    DATE_CREATION_EVENEMENT         DATE                   not null,
    COUT_EVENEMENT                  NUMBER(4)              not null,
    TARIF_STANDARD                  NUMBER(3)              not null,
    TARIF_ADHERENT                  NUMBER(3)              not null,
    DATE_EVENEMENT                  DATE                   not null,
    DATE_FIN_RECURRENCE_EVENEMENT   DATE                           ,
    FREQUENCE                       CHAR(15)                       ,
    -- TODO : Ajouter contrainte énumération + contrainte DATE_FIN_RECURENCE => FREQUENCE
    -- TODO : Ajouter une contrainte pour empêcher une news d'être un évènement
    constraint pk_evenements primary key (ID_EVENEMENT)            ,
    constraint fk1_evenements foreign key (ID_EVENEMENT) references CONTENUS (ID_CONTENU),
    constraint fk2_evenements foreign key (LIEU_EVENEMENT) references LIEUX (NOM_LIEU)
);
-- ============================================================
--   Table : PARTICIPATIONS                                       
-- ============================================================
create table PARTICIPATIONS
(
    ID_PERSONNE_PARTICIPANT         NUMBER(3)              not null,
    ID_EVENEMENT_PARTICIPE          NUMBER(3)              not null,
    NOTE                            CHAR(1)                        ,
    constraint pk_participations primary key (ID_PERSONNE_PARTICIPANT, ID_EVENEMENT_PARTICIPE),
    constraint fk1_participations foreign key (ID_PERSONNE_PARTICIPANT) references PERSONNES (ID_PERSONNE),
    constraint fk2_participations foreign key (ID_EVENEMENT_PARTICIPE) references EVENEMENTS (ID_EVENEMENT)
);
-- ============================================================
--   Table : ORGANISATEURS                                       
-- ============================================================
create table ORGANISATEURS
(
    ID_ADHERENT_ORGANISATEUR        NUMBER(3)              not null,
    ID_EVENEMENT_ORGANISE           NUMBER(3)              not null,
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ORAGNISATEURS->EVENEMENTS)--
    constraint pk_organisateurs primary key (ID_ADHERENT_ORGANISATEUR, ID_EVENEMENT_ORGANISE),
    constraint fk1_organisateurs foreign key (ID_ADHERENT_ORGANISATEUR) references ADHERENTS (ID_ADHERENT),
    constraint fk2_organisateurs foreign key (ID_EVENEMENT_ORGANISE) references EVENEMENTS (ID_EVENEMENT)
);



-- ============================================================
--   Gestionnaires de suppression                                       
-- ============================================================
create or replace trigger del_cas_objectifs
after delete on OBJECTIFS
for each row
begin
  delete from POURSUITES where ID_OBJECTIF_POURSUIVI = :old.ID_OBJECTIF;
end;
/

show errors trigger del_cas_objectifs;

drop sequence   sq_is_associations;
drop sequence   sq_is_objectifs;

create sequence sq_is_associations order nocycle minvalue 0 maxvalue 999;
create sequence sq_is_objectifs order nocycle minvalue 0 maxvalue 999;

