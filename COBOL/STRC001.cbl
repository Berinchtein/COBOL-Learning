      *****************************************************************
      * Program name:    STRC001
      * Original author: MANUEL JARRY
      *
      * Maintenence Log
      * Date       Author        Maintenance Requirement
      * ---------- ------------  ---------------------------------------
      * 25/11/2025 MANUEL JARRY  Created for COBOL-Learning
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  STRC001.
       AUTHOR. MANUEL JARRY Z85614.
       INSTALLATION. IBM Z Xplore Learning Platform.
       DATE-WRITTEN. 15/11/2025.
       DATE-COMPILED. DD/11/2025.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-Z.
       OBJECT-COMPUTER. IBM-Z.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT COBLPROG ASSIGN  TO COBLPROG.
           SELECT STRCCHRT ASSIGN TO STRCCHRT.
      *****************************************************************
      *
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
      *
       FD  COBLPROG.
       01 PROCEDURE-INFORMATIONS.
          05 OLD-SEQUENCE-NUMBER        PIC 9(3).
          05 FILLER                     PIC X(1)     VALUE SPACE.
          05 PROCEDURE-NAME             PIC X(26).
          05 FILLER                     PIC X(1)     VALUE SPACE.
          05 COMMON-MODULE              PIC X(3)     VALUE "(c)".
      *
       FD  STRCCHRT.
       01  PRINT-AREA    PIC X(132).
      *****************************************************************
       WORKING-STORAGE SECTION.
      *
       01 SWITCHES.
          05 COBLPROG-EOF-SWITCH        PIC X        VALUE "N".
             88 COBLPROG-EOF                         VALUE "Y".
      *
       01 PROCEDURE-INFORMATIONS.
          05 NEW-SEQUENCE-NUMBER        PIC 9(3).
          05 FILLER                     PIC X(1)     VALUE SPACE.
          05 PROCEDURE-NAME             PIC X(26).
          05 FILLER                     PIC X(1)     VALUE SPACE.
          05 COMMON-MODULE              PIC X(3)     VALUE "(c)".
      *
       01 CURRENT-DATE-AND-TIME.
          05 CURRENT-DATE.
             10 CD-CURRENT-YEAR         PIC 9(4).
             10 CD-CURRENT-MONTH        PIC 9(2).
             10 CD-CURRENT-DAY          PIC 9(2).
          05 CURRENT-TIME.
             10 CD-CURRENT-HOURS        PIC 9(2).
             10 CD-CURRENT-MINUTES      PIC 9(2).
      *****************************************************************
      *
      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
      *  This procedure ???
      ******************************************************************

