
-- ===================================================================
-- = Fonction : creer_personne                                       =
-- = USAGE : select creer_personne(nom, prenom) from dual            =
-- = Résumé ==========================================================
-- = Créer une personne avec le nom et le prénom spécifié.           =
-- = Renvoie l'identifiant de la personne créée.                     =
-- ===================================================================
prompt [Création fonction creer_personne];
create function creer_personne
(p_nom PERSONNES.P_NOM%type, 
 p_prenom PERSONNES.P_NOM%type) return number
as
    id_personne number;
begin
    id_personne := sq_id_personnes.nextval();
    insert into PERSONNES VALUES (id_personne, p_nom, p_prenom);
    return id_personne;
end;
/
show errors function creer_personne;