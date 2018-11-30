set LINESIZE 160;
set pages 16;
set recsep WRAPPED;
set wrap off;
COLUMN P_NOM        HEADING 'NOM';
COLUMN P_NOM        FORMAT A10;
COLUMN P_PRENOM     HEADING 'PRENOM';
COLUMN P_PRENOM     FORMAT A10;
COLUMN A_MOT_DE_PASSE HEADING 'MOT DE PASSE';
COLUMN A_MOT_DE_PASSE FORMAT A15;
COLUMN A_EMAIL      FORMAT A30;
COLUMN A_LOGIN      FORMAT A10;
COLUMN A_LOGIN      HEADING 'LOGIN';
COLUMN A_PROMOTION  HEADING 'PROMO';
COLUMN A_FILIERE    HEADING 'FILIERE';
COLUMN A_FILIERE    FORMAT  A20;
COLUMN TEXTE_NEWS   FORMAT  A30;
COLUMN TEXTE_NEWS   HEADING 'TEXTE NEWS';
COLUMN COTISATION_REGLEE_ADHESION HEADING 'A PAYE';