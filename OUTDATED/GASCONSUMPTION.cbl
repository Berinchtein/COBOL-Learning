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
          05 PROGRAM-SWITCHES.
             10 END-OF-SESSION-SWITCH    PIC X          VALUE "N".
             10 FIRST-SESSION-SWITCH     PIC X          VALUE "Y".
          05 UNIT-SWITCHES.
             10 DISTANCE-UNIT-SWITCH     PIC X          VALUE "M".
             10 FUEL-UNIT-SWITCH         PIC X          VALUE "M".
             10 CONSUMPTION-UNIT-SWITCH  PIC X          VALUE "M".
      *
      01 USER-ENTRIES.
          05 NUMERICAL-FIELDS.
             10 DISTANCE-VALUE           PIC 9(4).
             10 FUEL-USED-VALUE          PIC 9(4).
          05 OTHER-FIELDS.
             10 PROGRAM-START-VALUE      PIC 9.
      *
       01 WORK-FIELDS.
          05 NUMERICAL-FIELDS.
             10 GAS-CONSUMPTION          PIC 
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
           ACCEPT PROGRAM-START-VALUE.
           IF (PROGRAM-START-VALUE = ZERO)
              PERFORM 100-SHOW-GAS-CONSUMPTION
           ELSE
              MOVE "Y" TO END-OF-SESSION-SWITCH
           END-IF.
      *
       000-EXIT.
           EXIT.
      *
      ******************************************************************
      *  This routine calculates the gas consumption
      ******************************************************************
       100-SHOW-GAS-CONSUMPTION.
      *
           PERFORM 110-ASK-DISTANCE.

      *
      ******************************************************************
      *  This routine asks the user for the travelled distance
      ******************************************************************
           