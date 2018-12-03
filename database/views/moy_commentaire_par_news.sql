prompt [Création vue MOY_COMMENTAIRES_PAR_NEWS];
create view MOY_COMMENTAIRES_PAR_NEWS AS
select AVG(NB_COMMENTAIRES) MOY_COMMENTAIRE
from NB_COMMENTAIRES_PAR_NEWS;
-- Déclaration des objets créés
begin
    register_object('view', 'MOY_COMMENTAIRES_PAR_NEWS');
end;
/