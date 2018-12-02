
-- ===================================================================
-- = Procédure : maj_bureau                                          =
-- = USAGE : begin maj_bureau(id_asso, id_adherent, role); end;      =
-- = Résumé ==========================================================
-- = Met à jour un bureau dont la clé (id_asso, id_adherent) est     =
-- = spécifiée avec les données fournies.                            =                                                        =
-- ===================================================================
prompt [Création fonction maj_bureau];
create procedure maj_bureau
(ID_ASSO  BUREAUX.ID_ASSOCIATION_MEMBRE%type,
 ID_ADH   BUREAUX.ID_ADHERENT_MEMBRE%type,
 ROLE     BUREAUX.ROLE_MEMBRE%type)
as
begin
    update BUREAUX SET 
        ROLE_MEMBRE = ROLE
        where ID_ASSOCIATION_MEMBRE = ID_ASSO
          and ID_ADHERENT_MEMBRE = ID_ADH;
end;
/
show errors procedure maj_bureau;
begin
    register_object('procedure', 'maj_bureau');
end;
/