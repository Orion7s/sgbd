-- ============================================================
--   Nom de la base   :  ASSOCIATIONS                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table ASSOCIATIONS cascade constraints;

drop table SOURCE_FINANCEMENTS cascade constraints;

drop table FINANCEMENTS cascade constraints;

drop table OBJECTIFS cascade constraints;

drop table POURSUIVRE cascade constraints;

drop table ADHERENTS cascade constraints;

drop table ADHESIONS cascade constraints;

drop table FILIERES cascade constraints;

drop table CONTENUS cascade constraints;

drop table NEWS cascade constraints;

drop table COMMENTAIRES cascade constraints;


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
--   Table : SOURCE_FINANCEMENTS                                       
-- ============================================================
create table SOURCE_FINANCEMENTS
(
    NOM_SOURCE_FINANCEMENT          CHAR(20)              not null,
    constraint pk_source_financement primary key (NOM_SOURCE_FINANCEMENT)
);
-- ============================================================
--   Table : FINANCEMENTS                                            
-- ============================================================
create table FINANCEMENTS
(
    ID_ASSOCIATION_FINANCEE         NUMBER(3)              not null,
    NOM_SOURCE_FINANCANT            CHAR(20)               not null,
    constraint pk_financements primary key (ID_ASSOCIATION_FINANCEE, NOM_SOURCE_FINANCANT)
);
alter table FINANCEMENTS
    add constraint fk1_financements foreign key (ID_ASSOCIATION_FINANCEE)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table FINANCEMENTS
    add constraint fk2_financements foreign key (NOM_SOURCE_FINANCANT)
       references SOURCE_FINANCEMENTS (NOM_SOURCE_FINANCEMENT);
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
    ID_ASSOCIATION_POURSUIVANT      NUMBER(3)              not null,
    ID_OBJECTIF_POURSUIVI           NUMBER(3)              not null,
    constraint pk_poursuivre primary key (ID_ASSOCIATION_POURSUIVANT, ID_OBJECTIF_POURSUIVI)
);
alter table POURSUIVRE
    add constraint fk1_poursuivre foreign key (ID_ASSOCIATION_POURSUIVANT)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table POURSUIVRE
    add constraint fk2_poursuivre foreign key (ID_OBJECTIF_POURSUIVI)
       references OBJECTIFS (ID_OBJECTIF);
-- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (POURSUIVRE->ASSOCATION, POURSUIVRE->OBJECTIF)--

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
    constraint pk_adherant primary key (ID_ADHERENT)
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
    COTISATION_REGLEE_ADHESION      NUMBER(1)              not null -- Use as boolean
);
alter table ADHESIONS
    add constraint fk1_adhesions foreign key (ID_ASSOCIATION_ADHEREE)
       references ASSOCIATIONS (ID_ASSOCIATION);

alter table ADHESIONS
    add constraint fk2_adhesions foreign key (ID_ADHERENT_ADHERANT)
       references ADHERENTS (ID_ADHERENT);
-- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ADHESIONS->ADHERENTS)--

-- ============================================================
--   Table : FILIERES                                       
-- ============================================================
create table FILIERES
(
    NOM_FILIERE                     NUMBER(3)              not null,
    constraint pk_filieres primary key (NOM_FILIERE)
);
alter table ADHERENTS
    add constraint fk_adherents foreign key (FILIERE_ADHERENT)
       references FILIERES (NOM_FILIERE);


-- ============================================================
--   Table : CONTENUS                                       
-- ============================================================
create table CONTENUS
(
    ID_CONTENU                      NUMBER(3)              not null,
    constraint pk_contenus primary key (ID_CONTENU)
);
-- ============================================================
--   Table : NEWS                                       
-- ============================================================
create table NEWS
(
    ID_CONTENU                      NUMBER(3)              not null,
    ID_AUTEUR                       NUMBER(3)                not null,
    TITRE_NEWS                      CHAR(60)               not null,
    TEXTE_NEWS                      CHAR(255)              not null,
    DATE_PUBLICATION_NEWS           DATE                   not null,
    constraint pk_news primary key (ID_CONTENU)
);
alter table NEWS
    add constraint fk1_news foreign key (ID_CONTENU)
       references CONTENUS (ID_CONTENU);
alter table NEWS
    add constraint fk2_news foreign key (ID_AUTEUR)
       references ADHERENTS (ID_ADHERENT);
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
    -- Peut-être peut on faire une clé primaire à partir du couple (DATE_PUBLICATION_COMENTAIRE, ID_ADHERENT_COMMENTANT)
    constraint pk_commentaire primary key (ID_COMMENTAIRE) 
);
alter table COMMENTAIRES
    add constraint fk1_commentaires foreign key (ID_ADHERENT_COMMENTANT)
       references ADHERENTS (ID_ADHERENT);
alter table COMMENTAIRES
    add constraint fk2_commentaires foreign key (ID_CONTENU_COMMENTE)
       references CONTENUS (ID_CONTENU);
