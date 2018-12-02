prompt [Création vue ADHERENTS_NON_COTISANT];
create view ADHERENTS_NON_COTISANT AS
SELECT ADHERENTS.*, P_NOM, P_PRENOM FROM ADHERENTS
natural join PERSONNES;
-- Déclaration des objets créés
begin
    register_object('view', 'ADHERENTS_NON_COTISANT');
end;
/