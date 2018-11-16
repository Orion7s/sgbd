-- ============================================================
--   Nom de la base   :  CINEMA                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table ASSOCIATIONS cascade constraints;

drop table SOURCE_FINANCEMENT cascade constraints;

drop table FINANCER cascade constraints;

drop table OBJECTIFS cascade constraints;

drop table POURSUIVRE cascade constraints;

drop table ADHERENTS cascade constraints;

drop table ADHESIONS cascade constraints;

drop table FILIERES cascade constraints;

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
--   Table : SOURCE_FINANCEMENT                                       
-- ============================================================
create table SOURCE_FINANCEMENT
(
    NOM_SOURCE_FINANCEMENT          CHAR(20)              not null,
    constraint pk_source_financement primary key (NOM_SOURCE_FINANCEMENT)
);
-- ============================================================
--   Table : FINANCER                                            
-- ============================================================
create table FINANCER
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    NOM_SOURCE_FINANCEMENT          CHAR(20)               not null,
    constraint pk_financer primary key (ID_ASSOCIATION, NOM_SOURCE_FINANCEMENT)
);
alter table FINANCER
    add constraint fk1_financer foreign key (ID_ASSOCIATION)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table FINANCER
    add constraint fk2_financer foreign key (NOM_SOURCE_FINANCEMENT)
       references SOURCE_FINANCEMENT (NOM_SOURCE_FINANCEMENT);
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
--   Table : POURSUIVRE                                            
-- ============================================================
create table POURSUIVRE
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    ID_OBJECTIF                     NUMBER(3)              not null,
    constraint pk_poursuivre primary key (ID_ASSOCIATION, ID_OBJECTIF)
);
alter table POURSUIVRE
    add constraint fk1_poursuivre foreign key (ID_ASSOCIATION)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table POURSUIVRE
    add constraint fk2_poursuivre foreign key (ID_OBJECTIF)
       references OBJECTIFS (ID_OBJECTIF);
-- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (POURSUIVRE->ASSOCATION, POURSUIVRE->OBJECTIF)--

-- ============================================================
--   Table : ADHERENTS                                       
-- ============================================================
create table ADHERENTS
(
    ID_PERSONNE                     NUMBER(3)              not null,
    LOGIN_ADHERENT                  CHAR(255)              not null,
    MOT_DE_PASSE_ADHERENT           CHAR(20)               not null,
    EMAIL_ADHERENT                  CHAR(80)               not null,
    PROMOTION_ADEHRENT              NUMBER(2)              not null,
    FILIERE_ADHERENT                NUMBER(3)              not null,
    constraint pk_adherant primary key (ID_PERSONNE)
);
-- ============================================================
--   Table : ADHESIONS                                            
-- ============================================================
create table ADHESIONS
(
    ID_ASSOCIATION                  NUMBER(3)              not null,
    ID_ADHERENT                     NUMBER(3)              not null,
    DATE_ADHESION                   DATE                   not null,
    ROLE_ADHERENT                   CHAR(16)                       ,
    COTISATION_REGLEE_ADHESION      NUMBER(1)              not null -- Use as boolean
);
alter table ADHESIONS
    add constraint fk1_adhesions foreign key (ID_ASSOCIATION)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table ADHESIONS
    add constraint fk2_adhesions foreign key (ID_ADHERENT)
       references ADHERENTS (ID_PERSONNE);
-- ============================================================
--   Table : FILIERES                                       
-- ============================================================
create table FILIERES
(
    NOM_FILIERE                     NUMBER(3)              not null,
    constraint pk_filieres primary key (NOM_FILIERE)
);
alter table ADHERENTS
    add constraint fk2_adherents foreign key (FILIERE_ADHERENT)
       references FILIERES (NOM_FILIERE);
-- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ADHESIONS->ADHERENTS)--
