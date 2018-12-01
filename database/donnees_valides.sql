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
insert into PERSONNES values (  1 ,  'MAGHRAOUI'  , 'SAHAR'            ) ;
insert into PERSONNES values (  2 ,  'JULIENNE '  , 'YANN'             ) ;
insert into PERSONNES values (  3 ,  'EL MANSOURI', 'MOHAMMED ADNANE'  ) ;
insert into PERSONNES values (  4 ,  'CHAFAI'     , 'SARA'             ) ;
insert into PERSONNES values (  5 ,  'CHEIKH'     ,  'LILIA'           ) ;
insert into PERSONNES values (  6 ,  'HAMDINI'    ,  'MOHAMMED'        ) ;
insert into PERSONNES values (  7 ,  'DUPONT'     ,  'CYRIL'           ) ;
insert into PERSONNES values (  8 ,  'DUPONT'     ,  'SOPHIE'          ) ;
insert into PERSONNES values (  9 ,  'POTTER'     ,  'HARRY'           ) ;
insert into PERSONNES values ( 10 ,  'GRACE'      ,  'HAZEL'           ) ;
insert into PERSONNES values ( 11 ,  'WIZELY'     ,  'RON'             ) ;

-- ADHERENTS
insert into ADHERENTS values (  1 ,  'smaghraoui'  , 'sop2'     , 'maghraouisahar@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  2 ,  'yjulienne'   , 'mpo6'     , 'yannjulienne@gmail.com'      , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  3 ,  'melmansouri' , 'yol23'    , 'adnanemansouri@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  4 ,  'schafai'     , 'foiup2'   , 'sarachafai@gmail.com'        , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  5 ,  'lcheikh'     , 'mpo6536'  , 'lcheikh@gmail.com'           , 2020 , 'INFORMATIQUE'     ) ;
insert into ADHERENTS values (  6 ,  'mhamdini'    , 'polieu'   , 'mohammedhamdini@gmail.com'   , 2020 , 'INFORMATIQUE'     ) ;

  
 -- ADHESIONS
insert into ADHESIONS values (  1 , 1  , TO_DATE('2017-09-12', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values (  2 , 3  , TO_DATE('2017-09-23', 'yyyy-mm-dd') , 1  ) ;
insert into ADHESIONS values (  3 , 6  , TO_DATE('2017-11-06', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values (  4 , 5  , TO_DATE('2017-12-12', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  6 , 1  , TO_DATE('2017-10-02', 'yyyy-mm-dd') , 1  ) ;
insert into ADHESIONS values (  5 , 1  , TO_DATE('2017-09-13', 'yyyy-mm-dd') , 1  ) ;
insert into ADHESIONS values ( 10 , 2  , TO_DATE('2017-06-05', 'yyyy-mm-dd')  , 1  ) ;
insert into ADHESIONS values ( 11 , 2  , TO_DATE('2017-12-19', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values ( 10 , 8  , TO_DATE('2017-10-10', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values ( 10 , 4  , TO_DATE('2017-09-15', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values (  8 , 1  , TO_DATE('2017-09-16', 'yyyy-mm-dd') , 1  ) ;
insert into ADHESIONS values (  7 , 8  , TO_DATE('2017-09-20', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values ( 10 , 5  , TO_DATE('2016-10-14', 'yyyy-mm-dd') , 1 ) ;


-- BUREAUX
insert into BUREAUX values (  1 , 1  , 'President'     ) ;
insert into BUREAUX values (  3 , 6  , 'President'     ) ;
insert into BUREAUX values (  4 , 5  , 'President'     ) ;
insert into BUREAUX values (  5 , 1  , 'Vice-president') ;
insert into BUREAUX values (  1 , 4  , 'Tresorier'     ) ;
insert into BUREAUX values (  1 , 8  , 'secretaire'    ) ;


-- FILIERES
insert into FILIERES values (  'INFORMATIQUE'                ) ;
insert into FILIERES values (  'TELECOM'                     ) ;
insert into FILIERES values (  'ELECTRONIQUE'                ) ;
insert into FILIERES values (  'MATHEMATIQUES ET MECANIQUE'  ) ;

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
insert into NEWS values (5,1,1, 'News 1');
insert into NEWS values (6,3,6, 'News 2');
insert into NEWS values (7,5,1, 'News 3');

-- ORGANISATEURS
insert into ORGANISATEURS values (2, 3);
insert into ORGANISATEURS values (4, 3);
-- PARTIPATIONS
insert into PARTICIPATIONS values (3, 3, null);
insert into PARTICIPATIONS values (6, 3, 10);
insert into PARTICIPATIONS values (9, 3, 20);
insert into PARTICIPATIONS values (11, 3, 3);

-- COMMENTAIRES
insert into COMMENTAIRES values (1, 1, 5, TO_DATE('2017-09-22', 'yyyy-mm-dd'),'coucouuu');
insert into COMMENTAIRES values (2, 2, 6, TO_DATE('2017-10-23', 'yyyy-mm-dd'),'salut lenseirb');

-- SOURCES_FINANCEMENT
insert into SOURCES_FINANCEMENT values ('Cotisations');
insert into SOURCES_FINANCEMENT values ('banques');
insert into SOURCES_FINANCEMENT values ('Vente de repas');

-- financements
insert into FINANCEMENTS values (1, 'Cotisations');

-- ORGANISATEURS
insert into ORGANISATEURS values (6,2);

-- PARTICIPATIONS
insert into PARTICIPATIONS values (1,1,5);
insert into PARTICIPATIONS values (6,1,3);
insert into PARTICIPATIONS values (5,1,9);

commit;
