      *****************************************************************
      * Program name:    GASC0001                               
      * Original author: MANUEL JARRY                                
      *
      * Maintenence Log                                              
      * Date        Author        Maintenance Requirement               
      * ----------- ------------  --------------------------------------
      * 03/11/2025   MANUEL JARRY  Created for COBOL-Learning      
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  GASC0001.
       AUTHOR. MANUEL JARRY. 
       INSTALLATION. COBOL-Learning
       DATE-WRITTEN. 03/11/2025. 
       DATE-COMPILED. DD/MM/YYYY. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *
      *****************************************************************
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. PC-MANU. 
       OBJECT-COMPUTER. PC-MANU. 
       INPUT-OUTPUT SECTION.
      *****************************************************************
      *
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
      *****************************************************************
      *
      *****************************************************************
       WORKING-STORAGE SECTION.
      *
       01 SWITCHES.
          05 END-OF-SESSION-SWITCH       PIC X          VALUE "N".
          05 FIRST-SESSION-SWITCH        PIC X          VALUE "Y".
      *
      *01 USER-ENTRIES.
      *
       01 WORK-FIELDS.
      *   05 NUMERICAL-FIELDS.
      *      10 
      *   05 OTHER-FIELDS.
             10 SEPARATOR-LINE           PIC X(50)
                                                        VALUE
                   "--------------------------------------------------".
      *****************************************************************
      *
      ******************************************************************
       PROCEDURE DIVISION.
      *
           PERFORM 000-CALCULATE-GAS-CONSUMPTION THRU 000-EXIT
              UNTIL (END-OF-SESSION-SWITCH = "Y").
           DISPLAY "END OF PROGRAM.".
           STOP RUN.
      *
      ******************************************************************
      *  This routine demands an initial input or exit request
      ******************************************************************
       000-CALCULATE-GAS-CONSUMPTION.
      *
           IF (FIRST-SESSION-SWITCH = "Y")
              DISPLAY SEPARATOR-LINE
              DISPLAY "WELCOME TO MANU'S GAS CONSUMPTION CALCULATOR!"
              MOVE "N" TO FIRST-SESSION-SWITCH
           END-IF.
           DISPLAY SEPARATOR-LINE.
           DISPLAY "TO START PROGRAM, ENTER 0.".
           ACCEPT VALEUR-ACTUELLE.
           IF (VALEUR-ACTUELLE = 0)
              MOVE "Y" TO FIN-DE-SECTION-SWITCH
           ELSE
              *>PERFORM XXX-NEXT-ROUTINE
           END-IF.
      *
       000-EXIT.
           EXIT.
      *
      ******************************************************************
      *  This routine [???]
      ******************************************************************