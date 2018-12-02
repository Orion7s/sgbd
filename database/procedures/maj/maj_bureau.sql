
-- ===================================================================
-- = Procédure : maj_bureau                                     =
-- = USAGE : begin maj_bureau(id, nom); end;                    =
-- = Résumé ==========================================================
-- = Met à une association dont l'id est spécifié avec les données   =
-- = fournies                                                        =
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