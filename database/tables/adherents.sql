-- ============================================================
--   Table : ADHERENTS
-- ============================================================
create table ADHERENTS
(
    ID_ADHERENT                     NUMBER(3)              not null,
    A_LOGIN                         CHAR(24)               not null,
    A_MOT_DE_PASSE                  CHAR(20)               not null,
    A_EMAIL                         CHAR(50)               not null,
    A_PROMOTION                     NUMBER(4)              not null,
    A_FILIERE                       CHAR(40)               not null,
    constraint pk_adherant primary key (ID_ADHERENT)               ,
    constraint fk1_adherents foreign key (ID_ADHERENT) references PERSONNES (ID_PERSONNE)--,
    --constraint fk2_adherents foreign key (FILIERE_ADHERENT) references FILIERES (NOM_FILIERE)
    -- TODO : AJOUTER UNE CONTRAINTE POUR LA CARDINALITÉ MINIMALE (ADHESIONS->ADHERENTS)--
);