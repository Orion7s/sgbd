-- ============================================================
--   Table : PERSONNES
-- ============================================================
create table PERSONNES
(
    ID_PERSONNE                     NUMBER(3)              not null,
    P_NOM                           CHAR(60)               not null,
    P_PRENOM                        CHAR(60)               not null,
    constraint pk_personnes primary key (ID_PERSONNE)
);