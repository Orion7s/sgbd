@donnees
@format

-- Requêtes de consultation

prompt "Nom et Prénom des adherents à l'association 10 au 31/08/2017"
select P_NOM, P_PRENOM from TABLE(adherents_a(10, TO_DATE('2017-08-31', 'yyyy-mm-dd')));

prompt "Adhrents non cotisants à l'association 10"
select * from TABLE(NON_COTISANTS_A(10));

prompt "Participants à l evenement 3"
select * from TABLE(PARTICIPANTS_A(3));

prompt "Organisateurs de l'évenement 3"
select * from TABLE(ORGANISATEURS_DE(3));

prompt "Nombre de commentaires par news"
select * from NB_COMMENTAIRES_PAR_NEWS;

-- Requêtes statistiques

prompt "Nombre moyen de commetaire par news par adhérents"
select * from MOY_COMMENTAIRES_PAR_NEWS;

prompt "Note moyenne de l'évenement 1"
select note_moyenne_evenement(1) from dual;

prompt "Id, Titre et Note moyenne des évenements classé par note moyenne"
select ID_EVENEMENT, TITRE_CONTENU, NOTE_MOYENNE from CLASSEMENT_EVENEMENTS;

prompt "Nombre de commentaire pour la news 5002"
select nb_commentaire_news(5002) from dual;

prompt "Classement des adherents en fonction des participations aux evenements"
select ID_ADHERENT, P_NOM, P_PRENOM, NB_EVENEMENTS from CLASSEMENT_ADHERENTS;

-- Requêtes statistique avancées

prompt "Classement des financements au 02/10/2017"
select * from TABLE(FINANCEMENTS_LE(1, TO_DATE('2017-10-02', 'yyyy-mm-dd')));

prompt "Classement des financements au 16/10/2017"
select * from TABLE(FINANCEMENTS_LE(1, TO_DATE('2017-10-16', 'yyyy-mm-dd')));

prompt "Classement des financements au 29/10/2017"
select * from TABLE(FINANCEMENTS_LE(1, TO_DATE('2017-10-29', 'yyyy-mm-dd')));


-- Requêtes de mise à jour

prompt "Changement du nom de l'association 3 pour 'BDA RENEWED'"
begin maj_association(3, 'BDA RENEWED'); end;
/
select * from ASSOCIATIONS where ID_ASSOCIATION = 3;
rollback;

prompt "Changement du role de l'adhérent 1 dans le bureau de l'association 1 pour secrétaire."
begin maj_bureau(1, 1, 'Secretaire'); end;
/
select * from BUREAUX where ID_ASSOCIATION_MEMBRE = 1 and ID_ADHERENT_MEMBRE = 1;
rollback;

prompt "Mofification de l'adherent 1"
select * from PERSONNES
inner join ADHERENTS on ID_PERSONNE = ID_ADHERENT
where ID_PERSONNE = 1;

begin maj_adherent(1, 'Melanie', 'ANTONIN', '123456789', 'm.antonin@live.fr', 2019, 'ELECTRONIQUE'); end;
/

select * from PERSONNES
inner join ADHERENTS on ID_PERSONNE = ID_ADHERENT
where ID_PERSONNE = 1;
rollback;

prompt "Mofification de l'évènement 1"
select * from CONTENUS
inner join EVENEMENTS on ID_CONTENU = ID_EVENEMENT
where ID_CONTENU = 1;

begin maj_evenement(1, 'Gala carre', 'GRAND AMPHI', 'Un gala au rabais', 1000, 20, 15, TO_DATE('2018-12-24', 'yyyy-mm-dd'), null, null); end;
/

select * from CONTENUS
inner join EVENEMENTS on ID_CONTENU = ID_EVENEMENT
where ID_CONTENU = 1;

-- Requête de supression

prompt "Suppression de l'évènement 1"
begin del_evenement(1); end;
/
select * from EVENEMENTS where ID_EVENEMENT = 1;
select * from CONTENUS where ID_CONTENU = 1;
