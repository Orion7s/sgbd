-- ============================================================
--   Table : PARTICIPATIONS
-- ============================================================
create table PARTICIPATIONS
(
    ID_PERSONNE_PARTICIPANT         NUMBER(3)              not null,
    ID_EVENEMENT_PARTICIPE          NUMBER(3)              not null,
    NOTE                            NUMBER(2)                      ,
    constraint pk_participations primary key (ID_PERSONNE_PARTICIPANT, ID_EVENEMENT_PARTICIPE),
    constraint fk1_participations foreign key (ID_PERSONNE_PARTICIPANT) references PERSONNES (ID_PERSONNE),
    constraint fk2_participations foreign key (ID_EVENEMENT_PARTICIPE) references EVENEMENTS (ID_EVENEMENT),
    constraint ch_participations check (NOTE between 0 and 10)
);
-- Déclaration des objets créés
begin
    register_object('table', 'PARTICIPATIONS');
end;
/