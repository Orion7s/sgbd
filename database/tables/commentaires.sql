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