-- ============================================================
--   Table : CONTENUS
-- ============================================================
create table CONTENUS
(
    ID_CONTENU                      NUMBER(3)              not null,
    DATE_PUBLICATION_CONTENU        DATE                   not null,
    TITRE_CONTENU                   CHAR(60)               not null,
    constraint pk_contenus primary key (ID_CONTENU)
);