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
-- Déclaration des objets créés
begin
    register_object('table', 'ORGANISATEURS');
end;
/