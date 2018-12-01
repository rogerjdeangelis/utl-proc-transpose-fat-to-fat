Proc transpose fat to fat

github
https://github.com/rogerjdeangelis/utl-proc-transpose-fat-to-fat

Similar to
stackoverflow
https://stackoverflow.com/questions/53452767/sas-restructure-data

INPUT
=====


 WORK.HAVE total obs=6

  NAMDPT            TEST    DELTA    DB    VUL

  Nancy_Health       55      33      33    63
  Jim_Air            25      22      23    11
  Shu_Water          26      88      44    12
  Dick_Electric      77      55      66    10
  Elena_General      88      22      67    9
  Nancy_Internet     66      12      44    79


EXAMPLE OUTPUT
--------------


           NANCY_               SHU_      DICK_      ELENA_      NANCY_
 _NAME_    HEALTH    JIM_AIR    WATER    ELECTRIC    GENERAL    INTERNET

 TEST        55        25        26         77         88          66
 DELTA       33        22        88         55         22          12
 DB          33        23        44         66         67          44
 VUL         63        11        12         10         9           79


PROCESS
=======

proc transpose data=have out=want;
id namDpt;
var test--vul;
run;quit;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;


data have;
 retain namDpt;
 input (Name Dept test Delta DB Vul) ($);
 NamDpt=catx('_',name,dept);
 drop name dept;
cards4;
 Nancy Health 55 33 33 63
 Jim Air 25 22 23 11
 Shu Water 26 88 44 12
 Dick Electric 77 55 66 10
 Elena General 88 22 67 9
 Nancy Internet 66 12 44 79
;;;;
run;quit;

