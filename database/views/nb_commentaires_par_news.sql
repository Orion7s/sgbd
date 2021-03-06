prompt [Création vue NB_COMMENTAIRES_PAR_NEWS];
create view NB_COMMENTAIRES_PAR_NEWS AS
select NEWS.*, NB_COMMENTAIRES from 
(select ID_NEWS, COUNT(ID_COMMENTAIRE) NB_COMMENTAIRES from COMMENTAIRES
   inner join NEWS on ID_CONTENU_COMMENTE = ID_NEWS
   group by ID_NEWS) SR
inner join NEWS on NEWS.ID_NEWS = SR.ID_NEWS;
-- Déclaration des objets créés
begin
    register_object('view', 'NB_COMMENTAIRES_PAR_NEWS');
end;
/