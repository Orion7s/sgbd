-- ============================================================
--   Table : EVENEMENTS
-- ============================================================
create table EVENEMENTS
(
    ID_EVENEMENT                    NUMBER(3)              not null,
    ID_ASSOCIATION_HOTE             NUMBER(3)              not null,
    LIEU_EVENEMENT                  CHAR(40)               not null,
    DESCRIPTION_EVENEMENT           CHAR(255)              not null,
    COUT_EVENEMENT                  NUMBER(10)             not null,
    TARIF_STANDARD                  NUMBER(3)              not null,
    TARIF_ADHERENT                  NUMBER(3)              not null,
    DATE_EVENEMENT                  DATE                   not null,
    DATE_FIN_RECURRENCE_EVENEMENT   DATE                           ,
    FREQUENCE                       CHAR(15)                       ,
    -- TODO : Ajouter une contrainte pour empêcher une news d'être un évènement
    -- TODO : Ajouter une contrainte pour vérifier à la création d'un évènement qu'il est lié à l'association de l'adhérant qui l'a créé.
    constraint pk_evenements primary key (ID_EVENEMENT)            ,
    constraint fk1_evenements foreign key (ID_EVENEMENT) references CONTENUS (ID_CONTENU),
    constraint fk2_evenements foreign key (LIEU_EVENEMENT) references LIEUX (NOM_LIEU),
    constraint fk3_evenements foreign key (ID_ASSOCIATION_HOTE ) references ASSOCIATIONS (ID_ASSOCIATION),
    -- La spécification d'une date de fin de récurence implique la psécification d'une fréquence.
    constraint ch1_evenements check ((DATE_FIN_RECURRENCE_EVENEMENT is null) or (not FREQUENCE is null)) 
);