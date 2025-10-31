      *****************************************************************
      * Nom du programme:    INTR0003
      * Auteur original: MANUEL JARRY
      *
      * Journal d'entretien
      * Date       Auteur        Exigence de maintenance
      * ---------- ------------  --------------------------------------- 
      * 31/10/2025 MANUEL JARRY  Créé pour classe COBOL
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  INTR0003.
       AUTHOR. MANUEL JARRY. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 31/10/2025. 
       DATE-COMPILED. 31/10/2025. 
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
       01 SWITCHES.
          05 FIN-DE-SECTION-SWITCH      PIC X          VALUE "N".
          05 CONFIRM-ENTREE-SWITCH      PIC X          VALUE "N".
      *
       01 ENTREES-UTILISATEUR.
          05 VALEURS-MONETAIRES.
             10 VALEUR-ACTUELLE         PIC 9(7)V99.
          05 VALEURS-AUTRES.
             10 TAUX-INTERET            PIC 9(2)V99.
             10 TYPE-TAUX-INTERET       PIC X(9).
             10 NOMBRE-D-ANNEES         PIC 9(2).
      *
       01 VARIABLES-TRAVAIL.
          05 VALEURS-MONETAIRES.
             10 TAUX-INTERET-FORTMATTE  PIC Z9.99.
             10 VALEUR-FUTURE           PIC 9(7)V99.
             10 VALEUR-FUTURE-FORMATTEE PIC Z,ZZZ,ZZZ.99.
      *
       PROCEDURE DIVISION.
      *
       000-CALCUL-TOTAL-INTERET.
      *
           PERFORM 100-CALCUL-UN-INTERET
              UNTIL FIN-DE-SECTION-SWITCH = "Y".
           DISPLAY "FIN DU PROGRAMME.".
           STOP RUN.
      *
       100-CALCUL-UN-INTERET.
      *
           DISPLAY "--------------------------------------------------".
           DISPLAY "POUR TERMINER LE PROGRAMME, ENTRER 0.".
           DISPLAY "ENTRER LE MONTANT DE L'INVESTISSEMENT:".
           ACCEPT VALEUR-ACTUELLE.
           IF (VALEUR-ACTUELLE = 0)
              MOVE "Y" TO FIN-DE-SECTION-SWITCH
           ELSE
              PERFORM 200-MONTRER-VALEUR-FUTURE
           END-IF.
      *
       200-MONTRER-VALEUR-FUTURE.
           PERFORM 210-DMD-NOMBRE-ANNEES.
           PERFORM 220-DMD-TAUX-INTERET.
           PERFORM 230-DMD-TYPE-TAUX-INTERET.
           IF (TYPE-TAUX-INTERET = "ANNUEL" OR "annuel")
              COMPUTE VALEUR-FUTURE =
                 VALEUR-ACTUELLE *(1 +
                 TAUX-INTERET / 100) **
                 NOMBRE-D-ANNEES
           ELSE
              IF (TYPE-TAUX-INTERET = "MENSUEL" OR "mensuel")
                 COMPUTE VALEUR-FUTURE =
                    VALEUR-ACTUELLE *(1 +
                    (TAUX-INTERET / 12) / 100) **
                    (NOMBRE-D-ANNEES * 12)
              ELSE
                 COMPUTE VALEUR-FUTURE =
                    VALEUR-ACTUELLE *(1 +
                    (TAUX-INTERET / 365) / 100) **
                    (NOMBRE-D-ANNEES * 365)
              END-IF
           END-IF.
           MOVE VALEUR-FUTURE TO VALEUR-FUTURE-FORMATTEE.
           DISPLAY "VALEUR-FUTURE = " VALEUR-FUTURE-FORMATTEE "$".
      *
       210-DMD-NOMBRE-ANNEES.
           DISPLAY "ENTRER LE NOMBRE D'ANNEES:".
           ACCEPT NOMBRE-D-ANNEES.
           IF (NOMBRE-D-ANNEES < 0)
              DISPLAY "NOMBRE D'ANNEES INCORRECT. VEUILLEZ REESSAYER."
              *> GO TO INTERNE POUR BOUCLE
              GO TO 210-DMD-NOMBRE-ANNEES
           END-IF.
      *
       220-DMD-TAUX-INTERET.
           DISPLAY "ENTRER LE TAUX D'INTERET ANNUEL:".
           ACCEPT TAUX-INTERET.
           IF (TAUX-INTERET < 0 OR > 50)
              DISPLAY "TAUX D'INTERET ANNUEL INCORRECT. "
                      "VEUILLEZ REESSAYER."
              *> GO TO INTERNE POUR BOUCLE
              GO TO 220-DMD-TAUX-INTERET
           END-IF.
           PERFORM 221-DMD-CONFIRM-TAUX-INTERET.
      *
       221-DMD-CONFIRM-TAUX-INTERET.
           MOVE TAUX-INTERET TO TAUX-INTERET-FORTMATTE.
           DISPLAY "VOUS AVEZ ENTRÉ "
                   TAUX-INTERET-FORTMATTE
                   "% DE TAUX D'INTERET. EST-CE EXACT? (Y/N)".
           ACCEPT CONFIRM-ENTREE-SWITCH.
           IF (CONFIRM-ENTREE-SWITCH NOT = "Y" AND "N")
              DISPLAY "ENTREE INCORRECTE. "
                      "VEUILLEZ REESSAYER."
                 *> GO TO INTERNE POUR BOUCLE
              GO TO 221-DMD-CONFIRM-TAUX-INTERET
           ELSE
              IF CONFIRM-ENTREE-SWITCH = "N"
                 PERFORM 220-DMD-TAUX-INTERET
              END-IF.
      *
       230-DMD-TYPE-TAUX-INTERET.
           DISPLAY "ENTRER LA "
                   "FREQUENCE D'APPLICATION DU TAUX D'INTERET:".
           DISPLAY "TYPES POSSIBLE: 'ANNUEL', 'MENSUEL' ET 'QUOTIDIEN'".
           ACCEPT TYPE-TAUX-INTERET.
           IF (TYPE-TAUX-INTERET NOT = "ANNUEL" AND "annuel"
              AND "MENSUEL" AND "mensuel"
              AND "QUOTIDIEN" AND "quotidien")
              DISPLAY "FREQUENCE D'APPLICATION DU TAUX D'INTERET "
                      "INCORRECT. VEUILLEZ REESSAYER."
                 *> GO TO INTERNE POUR BOUCLE
              GO TO 230-DMD-TYPE-TAUX-INTERET
           END-IF.
           