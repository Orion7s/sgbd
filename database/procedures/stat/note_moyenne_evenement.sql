
-- ===================================================================
-- = Fonction : note_moyenne_evenement                               =
-- = USAGE : select note_moyenne_evenement(eid) from dual            =
-- = Résumé ==========================================================
-- = Renvoie la note moyenne pour un évènement d'id eid              =
-- ===================================================================
prompt [Création fonction note_moyenne_evenement];
create function note_moyenne_evenement (f_id_evenement number) return number
as
    retval number;
begin
    select NOTE_MOYENNE INTO retval
    from (select AVG(NOTE) NOTE_MOYENNE
          from PARTICIPATIONS
          where not(NOTE is null) and ID_EVENEMENT_PARTICIPE = f_id_evenement);
    return retval;
end;
/
show errors function note_moyenne_evenement;
-- Déclaration des objets créés
begin
    register_object('function', 'note_moyenne_evenement');
end;
/