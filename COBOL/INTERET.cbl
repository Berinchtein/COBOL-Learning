      *****************************************************************
      * Nom du programme:    INTR0001                               
      * Auteur original: MANUEL JARRY                                
      *
      * Journal d'entretien                                             
      * Date       Auteur        Exigence de maintenance               
      * ---------- ------------  --------------------------------------- 
      * 29/10/2025 MANUEL JARRY  Créé pour classe COBOL       
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  INTR0001.
       AUTHOR. MANUEL JARRY. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 29/10/2025. 
       DATE-COMPILED. JJ/MM/AA. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION. 
      *
       DATA DIVISION. 
      *
       FILE SECTION. 
      *
       WORKING-STORAGE SECTION. 
      *
       01  VALEURS-CALCUL-INTERET.
           05  VALEURS-MONETAIRES.
              10  VALEUR-ACTUELLE           PIC 9(7)V99.
              10  VALEUR-FUTURE             PIC 9(7)V99.
              10  VALEUR-FUTURE-FORMATTEE   PIC Z,ZZZ,ZZZ.99.
           05 VALEURS-AUTRES.
              10 TAUX-INTERET               PIC 9(7)V99.
              10 NOMBRE-D-ANNEES            PIC 9(2).
      *
       77  FIN-DE-SECTION-SWITCH            PIC 9             VALUE 0.
      *
       PROCEDURE DIVISION.
      *
       000-CALCUL-TOTAL-INTERET.
      *
           PERFORM 100-CALCUL-UN-INTERET
              UNTIL FIN-DE-SECTION-SWITCH = 1.
           DISPLAY "FIN DU PROGRAMME.".
           STOP RUN.
      *
       100-CALCUL-UN-INTERET.
      *
           DISPLAY "--------------------------------------------------".
           DISPLAY "POUR TERMINER LE PROGRAMME, ENTRER 0.".
           DISPLAY "ENTRER LE MONTANT DE L'INVESTISSEMENT.".
           ACCEPT VALEUR-ACTUELLE.
           IF VALEUR-ACTUELLE = 0
              MOVE 1 TO FIN-DE-SECTION-SWITCH
           ELSE
              PERFORM 200-MONTRER-VALEUR-FUTURE
           END-IF.
      *
       200-MONTRER-VALEUR-FUTURE.
      *
           DISPLAY "ENTRER LE NOMBRE D'ANNÉES.".
           ACCEPT NOMBRE-D-ANNEES.
           DISPLAY "ENTRER LE TAUX D'INTÉRÊT".
           ACCEPT TAUX-INTERET.
           COMPUTE VALEUR-FUTURE =
              VALEUR-ACTUELLE * (1 +
              TAUX-INTERET / 100) ** NOMBRE-D-ANNEES.
           MOVE VALEUR-FUTURE TO VALEUR-FUTURE-FORMATTEE.
           DISPLAY "VALEUR-FUTURE = " VALEUR-FUTURE.
      *