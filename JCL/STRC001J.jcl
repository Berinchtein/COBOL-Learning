//STRC001J   JOB ,'M JARRY',MSGLEVEL=(2,0),CLASS=A,NOTIFY=&SYSUID
//*--------------------------------------------------------------------*
//* COMPILE, LINK, AND EXECUTE A COBOL REPORT PROGRAM FOR Z/OS (MANU)
//*--------------------------------------------------------------------*
//STEP1    EXEC PROC=IGYWCL
//COBOL.SYSIN   DD DSN=&SYSUID..CBL(CBLJSON),DISP=SHR
//COBOL.SYSLIB  DD DSN=&SYSUID..COPYLIB,DISP=SHR
//*--------------------------------------------------------------------*
//LKED.SYSLMOD  DD DSN=&SYSUID..LOAD(STRC001),DISP=SHR
//LKED.SYSLIB   DD
//              DD DSN=&SYSUID..OBJLIB,DISP=SHR
//*--------------------------------------------------------------------*
//GO.COBLPROG   DD DSN=&SYSUID..COBLPROG.DATA,DISP=SHR
//GO.STRCCHRT   DD SYSOUT=*
//GO.SYSOUT     DD SYSOUT=*
//
