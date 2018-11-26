-- ============================================================
--    suppression des donnees
-- ============================================================

delete from ASSOCIATIONS ;
delete from SOURCE_FINANCEMENTS ;
delete from FINANCEMENTS ;
delete from OBJECTIFS ;
delete from POURSUITES ;
delete from ADHERENTS ;
delete from ADHESIONS ;
delete from FILIERES ;
delete from CONTENUS ;
delete from NEWS ;
delete from COMMENTAIRES ;
delete from PERSONNES ;
delete from LIEUX ;
delete from EVENEMENTS ;
delete from PARTICIPATIONS ;
delete from ORGANISATEURS ;

commit ;


-- ============================================================
--    creation des donnees
-- ============================================================

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
insert into ADHERENTS values (  1 ,  'smaghraoui'  , 'sop2'     ,    'maghraouisahar@gmail.com' , 2020 , 'INFORMATIQUE'     ) ;
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
insert into ADHESIONS values (  1 , 8  , TO_DATE('2017-10-10', 'yyyy-mm-dd'), 0  ) ;
insert into ADHESIONS values (  1 , 4  , TO_DATE('2017-09-15', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values (  8 , 1  , TO_DATE('2017-09-16', 'yyyy-mm-dd') , 1  ) ;
insert into ADHESIONS values (  7 , 8  , TO_DATE('2017-09-20', 'yyyy-mm-dd') , 0  ) ;
insert into ADHESIONS values (  9 , 5  , TO_DATE('2017-10-14', 'yyyy-mm-dd') , 1 ) ;






commit;
