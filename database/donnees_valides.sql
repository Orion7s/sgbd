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

-- OBJECTIFS

insert into OBJECTIFS values (  1 , 'Intégrer les élèves étrangers.'                                ) ;
insert into OBJECTIFS values (  2 , 'Féderer les élèves de l ecole.'                              ) ;
insert into OBJECTIFS values (  3 , 'Mettre en avant l art et la musique.'                        ) ;
insert into OBJECTIFS values (  4 , 'Mettre en avant les activités sportives.'                      ) ;
insert into OBJECTIFS values (  5 , 'Améliorer la cohesion sociale.'                                ) ;
insert into OBJECTIFS values (  6 , 'Collecter des dons à destination d\'' autres associations'     ) ;

-- POURSUITES
insert into POURSUITES values (  1 , 2  ) ;
insert into POURSUITES values (  2 , 1  ) ;
insert into POURSUITES values (  3 , 3  ) ;
insert into POURSUITES values (  4 , 2  ) ;
insert into POURSUITES values (  5 , 4  ) ;
insert into POURSUITES values (  6 , 5  ) ;
insert into POURSUITES values (  6 , 6  ) ;

commit;
