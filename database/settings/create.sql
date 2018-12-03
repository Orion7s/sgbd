create package dbsettings IS
    adhesion_date_debut char(5); -- format : mm-dd
    adhesion_date_fin char(5); -- format : mm-dd
    nom_cotisation CHAR(20);
end;
/
show errors package dbsettings;
-- Déclaration des objets créés
begin
    register_object('package', 'dbsettings');
end;
/