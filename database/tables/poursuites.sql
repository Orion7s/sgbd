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
-- Déclaration des objets créés
begin
    register_object('table', 'POURSUITES');
end;
/