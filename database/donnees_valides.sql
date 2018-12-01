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
  -- Associations
    gcc           number;
    clubee        number;
    bda           number;
    bde           number;
    bds           number;
    solideirb     number;
    pixeirb       number;
    aei           number;
    rapeirb       number;
    spaceeirb     number;
    ekip_bar      number;
    gala          number;
  -- Objectifs
    integration   number;
    federation    number;
    pousserArt    number;
    pousserSport  number;
    cohesion      number;
    collecteDon   number;
    contruction   number;
    gestionBar    number;
    creationJeux  number;
    contactBoites number;
    faireRap      number;
    faireSport    number;
    prendrePhotos number;
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
  -- News
    News1         number;
    News2         number;
    News3         number;
  -- Evenements
    ev_gala       number;
    ev_soireeNoel number;
    ev_accueil    number;
    ev_afterNoel  number;
  -- Commentaires
    com1          number;
    com2          number;
begin
-- ASSOCIATIONS

    gcc         := creer_association( 'GCC'           ) ;
    clubee      := creer_association( 'CLUBEE'        ) ;
    bda         := creer_association( 'BDA'           ) ;
    bde         := creer_association( 'BDE'           ) ;
    bds         := creer_association( 'BDS'           ) ;
    solideirb   := creer_association( 'SOLIDEIRB'     ) ;
    pixeirb     := creer_association( 'PIXEIRB'       ) ;
    aei         := creer_association( 'AEI'           ) ;
    rapeirb     := creer_association( 'RAPEIRB'       ) ;
    spaceeirb   := creer_association( 'SPACEEIRB'     ) ;
    ekip_bar    := creer_association( 'EKIP_BAR'      ) ;
    gala        := creer_association( 'GALA'          ) ;

-- OBJECTIFS

    integration   := creer_objectif( 'Intégrer les élèves étrangers.'                                ) ;
    federation    := creer_objectif( 'Féderer les élèves de l ecole.'                                ) ;
    pousserArt    := creer_objectif( 'Mettre en avant l art et la musique.'                          ) ;
    pousserSport  := creer_objectif( 'Mettre en avant les activités sportives.'                      ) ;
    cohesion      := creer_objectif( 'Améliorer la cohesion sociale.'                                ) ;
    collecteDon   := creer_objectif( 'Collecter des dons à destination d\'' autres associations.'    ) ;
    contruction   := creer_objectif( 'Mener des projets de construction des drones.'                 ) ;
    gestionBar    := creer_objectif( 'Gerer le Bar de l ecole.'                                      ) ;
    creationJeux  := creer_objectif( 'Creation de jeux.'                                             ) ;
    contactBoites := creer_objectif( 'Contacter le plus d entreprises possible.'                     ) ;
    faireRap      := creer_objectif( 'Faire du rap.'                                                 ) ;
    faireSport    := creer_objectif( 'Faire du sport et organiser des tournois.'                     ) ;
    prendrePhotos := creer_objectif( 'Prendre des photos.'                                           ) ;



-- POURSUITES
   insert into POURSUITES values (  gcc       ,  federation     ) ;
   insert into POURSUITES values (  gcc       ,  creationJeux   ) ;
   insert into POURSUITES values (  clubee    ,  integration    ) ;
   insert into POURSUITES values (  bda       ,  pousserArt     ) ;
   insert into POURSUITES values (  bde       ,  federation     ) ;
   insert into POURSUITES values (  bds       ,  pousserSport   ) ;
   insert into POURSUITES values (  bds       ,  faireSport     ) ;
   insert into POURSUITES values (  solideirb ,  cohesion       ) ;
   insert into POURSUITES values (  solideirb ,  collecteDon    ) ;
   insert into POURSUITES values (  pixeirb   ,  prendrePhotos  ) ;
   insert into POURSUITES values (  aei       ,  contactBoites  ) ;
   insert into POURSUITES values (  rapeirb   ,  faireRap       ) ;
   insert into POURSUITES values (  spaceeirb ,  contruction    ) ;
   insert into POURSUITES values (  ekip_bar  ,  gestionBar     ) ;

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

-- FILIERES
    insert into FILIERES values (  'INFORMATIQUE'                ) ;
    insert into FILIERES values (  'TELECOM'                     ) ;
    insert into FILIERES values (  'ELECTRONIQUE'                ) ;
    insert into FILIERES values (  'MATHEMATIQUES ET MECANIQUE'  ) ;

-- ADHERENTS
    insert into ADHERENTS values (  sahar      ,  'smaghraoui'  , 'sop2'     , 'maghraouisahar@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  yann       ,  'yjulienne'   , 'mpo6'     , 'yannjulienne@gmail.com'      , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  mohammedEl ,  'melmansouri' , 'yol23'    , 'adnanemansouri@gmail.com'    , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  sara       ,  'schafai'     , 'foiup2'   , 'sarachafai@gmail.com'        , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  lilia      ,  'lcheikh'     , 'mpo6536'  , 'lcheikh@gmail.com'           , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  mohammedAm ,  'mhamdini'    , 'polieu'   , 'mohammedhamdini@gmail.com'   , 2020 , 'INFORMATIQUE'     ) ;
    insert into ADHERENTS values (  sophie     ,  'sdupont'     , 'sd1695'   , 'spohie.dupont@outlook.com'   , 2020 , 'ELECTRONIQUE'     ) ;
  
 -- ADHESIONS
    insert into ADHESIONS values (  gcc       , sahar       , TO_DATE('2017-09-12', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  clubee    , mohammedEl  , TO_DATE('2017-09-23', 'yyyy-mm-dd'), 1  ) ;
    insert into ADHESIONS values (  bda       , mohammedAm  , TO_DATE('2017-11-06', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  bde       , lilia       , TO_DATE('2017-12-12', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  solideirb , sahar       , TO_DATE('2017-10-02', 'yyyy-mm-dd'), 1  ) ;
    insert into ADHESIONS values (  bds       , sahar       , TO_DATE('2017-09-13', 'yyyy-mm-dd'), 1  ) ;
    insert into ADHESIONS values (  spaceeirb , yann        , TO_DATE('2017-06-05', 'yyyy-mm-dd'), 1  ) ;
    insert into ADHESIONS values (  ekip_bar  , yann        , TO_DATE('2017-12-19', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  spaceeirb , sophie      , TO_DATE('2017-10-10', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  spaceeirb , sara        , TO_DATE('2017-09-15', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  aei       , sahar       , TO_DATE('2017-09-16', 'yyyy-mm-dd'), 1  ) ;
    insert into ADHESIONS values (  pixeirb   , sophie      , TO_DATE('2017-09-20', 'yyyy-mm-dd'), 0  ) ;
    insert into ADHESIONS values (  spaceeirb , lilia       , TO_DATE('2016-10-14', 'yyyy-mm-dd'), 1  ) ;


-- BUREAUX
    insert into BUREAUX values (  gcc , sahar       , 'President'     ) ;
    insert into BUREAUX values (  bda , mohammedAm  , 'President'     ) ;
    insert into BUREAUX values (  bde , lilia       , 'President'     ) ;
    insert into BUREAUX values (  bds , sahar       , 'Vice-president') ;
    insert into BUREAUX values (  gcc , sara        , 'Tresorier'     ) ;
    insert into BUREAUX values (  gcc , sophie      , 'secretaire'    ) ;

-- LIEUX
    insert into LIEUX values (  'CHATEAU LAFITTE'                ) ;
    insert into LIEUX values (  'GRAND AMPHI'                    ) ;
    insert into LIEUX values (  'JARDIN PUBLIC'                  ) ;
    insert into LIEUX values (  'RUE '                           ) ;

-- EVENEMENTS
    ev_gala       := creer_evenement( TO_DATE('2017-09-10' , 'yyyy-mm-dd') , 'Contenu 1'             , gala      , 'CHATEAU LAFITTE' , 'Gala '                                  , 10000 , 65 , 0, TO_DATE('2018-11-23', 'yyyy-mm-dd') , NULL , NULL);
    ev_soireeNoel := creer_evenement( TO_DATE('2017-09-15' , 'yyyy-mm-dd') , 'Contenu 2'             , bda       , 'GRAND AMPHI'     , 'Soiree Noel '                           ,  1000 ,  0 , 0, TO_DATE('2018-12-20', 'yyyy-mm-dd') , NULL , NULL);
    ev_accueil    := creer_evenement( TO_DATE('2017-09-12' , 'yyyy-mm-dd') ,  'Accueil des entrants' , spaceeirb , 'GRAND AMPHI'     ,  'Un grand discours pour peu de choses.' ,    20 ,  1 , 4, TO_DATE('2017-10-02', 'yyyy-mm-dd') , NULL , NULL);
    ev_afterNoel  := creer_evenement( TO_DATE('2017-12-26' , 'yyyy-mm-dd') , 'Contenu 3'             , bda       , 'GRAND AMPHI'     , 'After de Noel '                         ,  1000 ,  0 , 0, TO_DATE('2018-12-20', 'yyyy-mm-dd') , NULL , NULL);

-- NEWS 
    News1 :=creer_news( TO_DATE('2017-12-26' , 'yyyy-mm-dd') , 'news 1' , gcc , sahar      , 'Contenu de la news 1');
    News2 :=creer_news( TO_DATE('2017-12-26' , 'yyyy-mm-dd') , 'news 2' , bda , mohammedAm , 'Contenu de la news 2');
    News3 :=creer_news( TO_DATE('2017-12-26' , 'yyyy-mm-dd') , 'news 3' , bds , sahar      , 'Contenu de la news 3');

-- ORGANISATEURS
    insert into ORGANISATEURS values ( yann       , ev_accueil    );
    insert into ORGANISATEURS values ( sara       , ev_accueil    );
    insert into ORGANISATEURS values ( mohammedAm , ev_soireeNoel );
-- PARTIPATIONS
    insert into PARTICIPATIONS values ( mohammedEl , ev_accueil , null);
    insert into PARTICIPATIONS values ( mohammedAm , ev_accueil ,    5);
    insert into PARTICIPATIONS values ( harry      , ev_accueil ,   10);
    insert into PARTICIPATIONS values ( ron        , ev_accueil ,    2);
    insert into PARTICIPATIONS values ( sahar      , ev_gala    ,    3);
    insert into PARTICIPATIONS values ( mohammedAm , ev_gala    ,    2);
    insert into PARTICIPATIONS values ( lilia      , ev_gala    ,    4);

-- COMMENTAIRES
    com1 := faire_commenter(sahar , News1, TO_DATE('2017-09-22 07:02', 'yyyy-mm-dd hh:mi'),'coucouuu'      );
    com2 := faire_commenter(yann  , News2, TO_DATE('2017-10-23 12:40', 'yyyy-mm-dd hh:mi'),'salut lenseirb');

-- SOURCES_FINANCEMENT
    insert into SOURCES_FINANCEMENT values ('Cotisations'    );
    insert into SOURCES_FINANCEMENT values ('banques'        );
    insert into SOURCES_FINANCEMENT values ('Vente de repas' );

-- FINANCEMENTS
     insert into FINANCEMENTS values (gcc, 'Cotisations');

end;
/

commit;
