-- ============================================================
--   Table : NEWS
-- ============================================================
create table NEWS
(
    ID_NEWS                         NUMBER(3)              not null,
    ID_ASSOCIATION_MEMBRE_NEWS      NUMBER(3)              not null,
    ID_ADHERENT_MEMBRE_NEWS         NUMBER(3)              not null,
    TEXTE_NEWS                      CHAR(255)              not null,
    -- TODO : Ajouter une contrainte pour empêcher un évènement d'être un commentaire
    constraint pk_news primary key (ID_NEWS),
    constraint fk1_news foreign key (ID_NEWS) references CONTENUS (ID_CONTENU),
    constraint fk2_news foreign key (ID_ASSOCIATION_MEMBRE_NEWS, ID_ADHERENT_MEMBRE_NEWS) references BUREAUX(ID_ASSOCIATION_MEMBRE, ID_ADHERENT_MEMBRE)
);