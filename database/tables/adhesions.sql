-- ============================================================
--   Table : ADHESIONS
-- ============================================================
create table ADHESIONS
(
    ID_ASSOCIATION_ADHEREE          NUMBER(3)              not null,
    ID_ADHERENT_ADHERANT            NUMBER(3)              not null,
    DATE_ADHESION                   DATE                   not null,
    DATE_REGLEMENT_COTISATION       DATE                           ,
    MONTANT_COTISATION_REGLEE       NUMBER(3)                      ,
    constraint pk_adhesions  primary key (ID_ASSOCIATION_ADHEREE, ID_ADHERENT_ADHERANT),
    constraint fk1_adhesions foreign key (ID_ASSOCIATION_ADHEREE)
      references ASSOCIATIONS (ID_ASSOCIATION) on delete cascade,
    constraint fk2_adhesions foreign key (ID_ADHERENT_ADHERANT)
      references ADHERENTS (ID_ADHERENT) on delete cascade
);
create trigger check_adhesions
before insert or update on ADHESIONS
for each row 
declare
begin
    if (:new.DATE_REGLEMENT_COTISATION is null) != (:new.MONTANT_COTISATION_REGLEE is null) then
        RAISE_APPLICATION_ERROR( -20001, 'DATE_REGLEMENT_COTISATION et MONTANT_COTISATION_REGLEE doivent être simultanément défini ou indéfinis.' );
    end if;
end;
/
show errors trigger check_adhesions;
-- Déclaration des objets créés
begin
    register_object('table', 'ADHESIONS');
    register_object('trigger', 'check_adhesions');
end;
/