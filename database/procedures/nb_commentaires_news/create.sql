
-- ===================================================================
-- = Fonction : nb_commentaire_news                                  =
-- = USAGE : select nb_commentaire_news(nid) from dual               =
-- = Résumé ==========================================================
-- = Renvoie le nombre de commentaires pour une news d'id nid        =
-- ===================================================================
create function nb_commentaire_news (f_id_news number) return number
as
    retval number;
begin
    select NB_COMMENTAIRES INTO retval
    from (select COUNT(ID_COMMENTAIRE) NB_COMMENTAIRES from COMMENTAIRES
    where ID_CONTENU_COMMENTE = f_id_news);
    return retval;
end;
/
show errors function nb_commentaire_news;