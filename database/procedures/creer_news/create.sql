
-- ===================================================================
-- = Fonction : creer_news                                           =
-- = USAGE : select creer_news(DATE_PUBLICATION_CONTENU,             =
-- =                           TITRE_CONTENU,                        =
-- =                           ID_ASSOCIATION_MEMBRE_NEWS,           =
-- =                           ID_ADHERENT_MEMBRE_NEWS,              = 
-- =                           TEXTE_NEWS) from dual                 =
-- = Résumé ==========================================================
-- = Créer une news avec le données spécifiés.                       =
-- = Renvoie l'identifiant de la news créée.                         =
-- ===================================================================
prompt [Création fonction creer_news];
create function creer_news
(DATE_PUBLICATION_CONTENU        CONTENUS.DATE_PUBLICATION_CONTENU%type,
 TITRE_CONTENU                   CONTENUS.TITRE_CONTENU%type,
 ID_ASSOCIATION_MEMBRE_NEWS      NEWS.ID_ASSOCIATION_MEMBRE_NEWS%type,
 ID_ADHERENT_MEMBRE_NEWS         NEWS.ID_ADHERENT_MEMBRE_NEWS%type,
 TEXTE_NEWS                      NEWS.TEXTE_NEWS%type) return number
as
    id_news number;
begin
    id_news := sq_id_news.nextval();
    insert into CONTENUS VALUES(id_news, DATE_PUBLICATION_CONTENU, TITRE_CONTENU);
    insert into NEWS VALUES (id_news, ID_ASSOCIATION_MEMBRE_NEWS, ID_ADHERENT_MEMBRE_NEWS, TEXTE_NEWS);
    return id_news;
end;
/
show errors function creer_news;