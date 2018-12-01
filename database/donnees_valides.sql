-- ============================================================
--    suppression des donnees
-- ============================================================

delete from ORGANISATEURS;
delete from PARTICIPATIONS;
delete from EVENEMENTS;
delete from NEWS;
delete from COMMENTAIRES;
delete from CONTENUS;
delete from BUREAUX;
delete from ADHESIONS;
delete from ADHERENTS;
delete from PERSONNES;
delete from POURSUITES;
delete from FINANCEMENTS;
delete from ASSOCIATIONS;
delete from OBJECTIFS;
delete from SOURCES_FINANCEMENT;
delete from FILIERES;
delete from LIEUX;


commit ;




declare 
    -- Personnes
    sahar         number;
    yann          number;
    mohammedEl    number;
    sara          number;
    lilia         number;
    mohammedAm    number;
    cyril         number;
    sophie        number;
    harry         number;
    hazel         number;
    ron           number;
begin
-- ASSOCIATIONS

   insert into ASSOCIATIONS values (  1 , 'GCC'           ) ;
   insert into ASSOCIATIONS values (  2 , 'CLUBEE'        ) ;
   insert into ASSOCIATIONS values (  3 , 'BDA'           ) ;
   insert into ASSOCIATIONS values (  4 , 'BDE'           ) ;
   insert into ASSOCIATIONS values (  5 , 'BDS'           ) ;
   insert into ASSOCIATIONS values (  6 , 'SOLIDEIRB'     ) ;
   insert into ASSOCIATIONS values (  7 , 'PIXEIRB'       ) ;
   insert into ASSOCIATIONS values (  8 , 'AEI'           ) ;
   insert into ASSOCIATIONS values (  9 , 'RAPEIRB'       ) ;
   insert into ASSOCIATIONS values ( 10 , 'SPACEEIRB'     ) ;
   insert into ASSOCIATIONS values ( 11 , 'EKIP_BAR'      ) ;
   insert into ASSOCIATIONS values ( 12 , 'GALA'          ) ;

-- OBJECTIFS

   insert into OBJECTIFS values (  1 , 'Intégrer les élèves étrangers.'                                ) ;
   insert into OBJECTIFS values (  2 , 'Féderer les élèves de l ecole.'                                ) ;
   insert into OBJECTIFS values (  3 , 'Mettre en avant l art et la musique.'                          ) ;
   insert into OBJECTIFS values (  4 , 'Mettre en avant les activités sportives.'                      ) ;
   insert into OBJECTIFS values (  5 , 'Améliorer la cohesion sociale.'                                ) ;
   insert into OBJECTIFS values (  6 , 'Collecter des dons à destination d\'' autres associations.'    ) ;
   insert into OBJECTIFS values (  7 , 'Mener des projets de construction des drones.'                 ) ;
   insert into OBJECTIFS values (  8 , 'Gerer le Bar de l ecole.'                                      ) ;
   insert into OBJECTIFS values (  9 , 'Creation de jeux.'                                             ) ;
   insert into OBJECTIFS values ( 10 , 'Contacter le plus d entreprises possible.'                     ) ;
   insert into OBJECTIFS values ( 11 , 'Faire du rap.'                                                 ) ;
   insert into OBJECTIFS values ( 12 , 'Faire du sport et organiser des tournois.'                     ) ;
   insert into OBJECTIFS values ( 13 , 'Prendre des photos.'                                           ) ;



-- POURSUITES
   insert into POURSUITES values (  1 ,  2   ) ;
   insert into POURSUITES values (  1 ,  9   ) ;
   insert into POURSUITES values (  2 ,  1   ) ;
   insert into POURSUITES values (  3 ,  3   ) ;
   insert into POURSUITES values (  4 ,  2   ) ;
   insert into POURSUITES values (  5 ,  4   ) ;
   insert into POURSUITES values (  5 ,  12  ) ;
   insert into POURSUITES values (  6 ,  5   ) ;
   insert into POURSUITES values (  6 ,  6   ) ;
   insert into POURSUITES values (  7 ,  13  ) ;
   insert into POURSUITES values (  8 ,  10  ) ;
   insert into POURSUITES values (  9 ,  11  ) ;
   insert into POURSUITES values ( 10 ,  7   ) ;
   insert into POURSUITES values ( 11 ,  8   ) ;

-- PERSONNES
  sahar      := creer_personne(  'MAGHRAOUI'  , 'SAHAR'            ) ;
  yann       := creer_personne(  'JULIENNE '  , 'YANN'             ) ;
  mohammedEl := creer_personne(  'EL MANSOURI', 'MOHAMMED ADNANE'  ) ;
  sara       := creer_personne(  'CHAFAI'     , 'SARA'             ) ;
  lilia      := creer_personne(  'CHEIKH'     ,  'LILIA'           ) ;
  mohammedAm := creer_personne(  'HAMDINI'    ,  'MOHAMMED'        ) ;
  cyril      := creer_personne(  'DUPONT'     ,  'CYRIL'           ) ;
  sophie     := creer_personne(  'DUPONT'     ,  'SOPHIE'          ) ;
  harry      := creer_personne(  'POTTER'     ,  'HARRY'           ) ;
  hazel      := creer_personne(  'GRACE'      ,  'HAZEL'           ) ;
  ron        := creer_personne(  'WIZELY'     ,  'RON'             ) ;

FOR a in (select ID_PERSONNE, P_PRENOM from PERSONNES order by ID_PERSONNE)
LOOP
    dbms_output.put_line(a.ID_PERSONNE || a.P_PRENOM);
END LOOP; 

-- FILIERES
   insert into FILIERES values (  'INFORMATIQUE'                ) ;
   insert into FILIERES values (  'TELECOM'                     ) ;
   insert into FILIERES values (  'ELECTRONIQUE'                ) ;
   insert into FILIERES values (  'MATHEMATIQUES ET MECANIQUE'  ) ;

-- ADHERENTS
insert into ADHERENTS values (  sahar      ,  'smaghraoui'  , 'sop2'     , 'maghraouisahar@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  yann       ,  'yjulienne'   , 'mpo6'     , 'yannjulienne@gmail.com'      , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  mohammedEl ,  'melmansouri' , 'yol23'    , 'adnanemansouri@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  sara ,  'schafai'     , 'foiup2'   , 'sarachafai@gmail.com'        , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  lilia ,  'lcheikh'     , 'mpo6536'  , 'lcheikh@gmail.com'           , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  mohammedAm ,  'mhamdini'    , 'polieu'   , 'mohammedhamdini@gmail.com'   , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  sophie ,  'sdupont'    , 'sd1695'   , 'spohie.dupont@outlook.com'   , 2020 , 'ELECTRONIQUE'     ) ;
  
 -- ADHESIONS
insert into ADHESIONS values (  1 , sahar       , TO_DATE('2017-09-12', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  2 , mohammedEl  , TO_DATE('2017-09-23', 'yyyy-mm-dd'), 1  ) ;
insert into ADHESIONS values (  3 , mohammedAm  , TO_DATE('2017-11-06', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  4 , lilia       , TO_DATE('2017-12-12', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  6 , sahar       , TO_DATE('2017-10-02', 'yyyy-mm-dd'), 1  ) ;
insert into ADHESIONS values (  5 , sahar       , TO_DATE('2017-09-13', 'yyyy-mm-dd'), 1  ) ;
insert into ADHESIONS values ( 10 , yann        , TO_DATE('2017-06-05', 'yyyy-mm-dd'), 1  ) ;
insert into ADHESIONS values ( 11 , yann        , TO_DATE('2017-12-19', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values ( 10 , sophie           , TO_DATE('2017-10-10', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values ( 10 , sara        , TO_DATE('2017-09-15', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  8 , sahar       , TO_DATE('2017-09-16', 'yyyy-mm-dd'), 1  ) ;
insert into ADHESIONS values (  7 , sophie           , TO_DATE('2017-09-20', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values ( 10 , lilia       , TO_DATE('2016-10-14', 'yyyy-mm-dd'), 1  ) ;


-- BUREAUX
insert into BUREAUX values (  1 , sahar  , 'President'     ) ;
insert into BUREAUX values (  3 , mohammedAm  , 'President'     ) ;
insert into BUREAUX values (  4 , lilia  , 'President'     ) ;
insert into BUREAUX values (  5 , sahar  , 'Vice-president') ;
insert into BUREAUX values (  1 , sara  , 'Tresorier'     ) ;
insert into BUREAUX values (  1 , sophie  , 'secretaire'    ) ;


-- LIEUX
insert into LIEUX values (  'CHATEAU LAFITTE'                ) ;
insert into LIEUX values (  'GRAND AMPHI'                    ) ;
insert into LIEUX values (  'JARDIN PUBLIC'                  ) ;
insert into LIEUX values (  'RUE '                           ) ;

-- CONTENUS
insert into CONTENUS values (1, TO_DATE('2017-09-10', 'yyyy-mm-dd'),'Contenu 1');
insert into CONTENUS values (2, TO_DATE('2017-09-15', 'yyyy-mm-dd'),'Contenu 2');
insert into CONTENUS values (3, TO_DATE('2017-09-12', 'yyyy-mm-dd'), 'Accueil des entrants');
insert into CONTENUS values (4, TO_DATE('2017-12-26', 'yyyy-mm-dd'),'Contenu 3');
insert into CONTENUS values (5, TO_DATE('2017-12-26', 'yyyy-mm-dd'),'news 1');
insert into CONTENUS values (6, TO_DATE('2017-12-26', 'yyyy-mm-dd'),'news 2');
insert into CONTENUS values (7, TO_DATE('2017-12-26', 'yyyy-mm-dd'),'news 3');
-- EVENEMENTS
insert into EVENEMENTS values (1, 12, 'CHATEAU LAFITTE','Gala '         ,10000  ,65,0,TO_DATE('2018-11-23', 'yyyy-mm-dd'),NULL,NULL);
insert into EVENEMENTS values (2, 3 , 'GRAND AMPHI'    ,'Soiree Noel '  ,1000   ,0 ,0,TO_DATE('2018-12-20', 'yyyy-mm-dd'),NULL,NULL);
insert into EVENEMENTS values (3, 10, 'GRAND AMPHI', 'Un grand discours pour peu de choses.', 20, 1, 4, TO_DATE('2017-10-02 21:00', 'yyyy-mm-dd hh24:mi'), null, null);
insert into EVENEMENTS values (4, 3 , 'GRAND AMPHI'    ,'After de Noel ',1000   ,0 ,0,TO_DATE('2018-12-20', 'yyyy-mm-dd'),NULL,NULL);

-- NEWS 
insert into NEWS values (5,1,sahar, 'News 1');
insert into NEWS values (6,3,mohammedAm, 'News 2');
insert into NEWS values (7,5,sahar, 'News 3');

-- ORGANISATEURS
insert into ORGANISATEURS values (yann, 3);
insert into ORGANISATEURS values (sara, 3);
insert into ORGANISATEURS values (mohammedAm,2);
-- PARTIPATIONS
insert into PARTICIPATIONS values (mohammedEl, 3, null);
insert into PARTICIPATIONS values (mohammedAm, 3, 10);
insert into PARTICIPATIONS values (harry, 3, 20);
insert into PARTICIPATIONS values (ron, 3, 3);
insert into PARTICIPATIONS values (sahar,1,5);
insert into PARTICIPATIONS values (mohammedAm,1,3);
insert into PARTICIPATIONS values (lilia,1,9);

-- COMMENTAIRES
insert into COMMENTAIRES values (1, sahar, 5, TO_DATE('2017-09-22', 'yyyy-mm-dd'),'coucouuu');
insert into COMMENTAIRES values (2, yann, 6, TO_DATE('2017-10-23', 'yyyy-mm-dd'),'salut lenseirb');

-- SOURCES_FINANCEMENT
insert into SOURCES_FINANCEMENT values ('Cotisations');
insert into SOURCES_FINANCEMENT values ('banques');
insert into SOURCES_FINANCEMENT values ('Vente de repas');

-- financements
insert into FINANCEMENTS values (1, 'Cotisations');

end;
/

commit;
