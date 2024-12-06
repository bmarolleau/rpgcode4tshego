CREATE SCHEMA STUDENTRSC;
CREATE TABLE STUDENTRSC.STUDENTDB (
        "Student ID"  FOR COLUMN studentID CHAR (9) NOT NULL,     
        "First Name"  FOR COLUMN firstName CHAR (50) NOT NULL,    
        "last Name"   FOR COLUMN lastName  CHAR (50) NOT NULL,    
        "Gender Type" FOR COLUMN gender CHAR (10) NOT NULL,       
         PRIMARY KEY ( studentID ))                                
         RCDFMT studentr   ;

INSERT INTO STUDENTRSC.STUDENTDB(studentID, firstName, lastName, gender)  
  VALUES('823M934LA', 'Nadir', 'Amra', 'Male'),  
        ('826M660CF', 'John', 'Doe', 'Male'),     
        ('747F023ZX', 'Jane', 'Amra', 'Female') ;

CL: ADDLIBLE STUDENTRSC; 
CL: CRTRPGMOD MODULE(STUDENTRSC/STUDENTRSC) SRCSTMF('/home/benoit/rpgcode/studentrsc1.rpgle');
CL: CRTSRVPGM SRVPGM(STUDENTRSC/STUDENTRSC) EXPORT(*ALL);
/* If necessary 
CL: CRTDUPOBJ OBJ(STUDENTDB) FROMLIB(STUDENTSRC) OBJTYPE(*FILE) TOLIB(STUDENTRSC) NEWOBJ(*SAME) DATA(*YES)                                                    
*/
/* TEST IWS Service 
CREATE:
curl -X POST -H 'Content-Type: application/json' -i 'http://10.3.61.2:10014/web/services/STUDENTRSC/students' --data '{"studentID":"916S660CF","firstName":"John","lastName":"RAMBO","gender":"Male"}'
UPDATE:
curl -X PUT -H 'Content-Type: application/json' -i 'http://10.3.61.2:10014/web/services/STUDENTRSC/students' --data '{"studentID":"916S660CF","firstName":"John","lastName":"RAMBO","gender":"Male"}'
READ:
curl -X GET -H 'Content-Type: application/json' -i 'http://10.3.61.2:10014/web/services/STUDENTRSC/students/916S660CF'
DELETE:
curl -X DELETE -H 'Content-Type: application/json' -i 'http://10.3.61.2:10014/web/services/STUDENTRSC/students/916S660CF'
READALL:
curl -X GET -H 'Content-Type: application/json' -i 'http://10.3.61.2:10014/web/services/STUDENTRSC/students'
*/