DATA SEGMENT
  MSG1  DB '***********SELECT UR OPERATION WHICH U PEFORM $'
  MSG7 DB 'P ==> FOR PUSH $'
MSG8	 DB 'R ==> FOR POP $'
MSG9	 DB 'D ==> FOR DISPLAY $'
MSG10	 DB 'ANY OTHER KEY FOR EXIT $'
    MSG2 DB 'ENTER DATA ==> $'
MSG3 DB 'IF  U WANT TO CONTINUE THEN PRESS C  OTHERWISE ANY KEY ==> $'
	MSG4 DB 'UR DATA ARE ==> $'
	MSG5 DB 'POPED VALUE IS ==>  $'
	MSG6 DB 'UR QUEUE IS EMPTY !!!!!!!!!!!!!!!$'
	FRONT DB 1 DUP(0)
	REAR DB 1 DUP(0)
	TEMPC DB 1 DUP(0)
	CHOOSE DB 1 DUP(0)
	ANS DB 1 DUP(0)
	ARRAY DB 100 DUP(0)
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA,ES:DATA
	START:     MOV AX,DATA
			MOV DS,AX
			MOV SI,OFFSET ARRAY      ;STARTING ADDRESS OF   
			MOV DI, OFFSET ARRAY
			MOV BX, OFFSET ARRAY
			MOV REAR,01H
			MOV FRONT,01H
	MENU:	MOV AH,09H		;DISPLAY  O/P MESSAGE
			LEA DX,MSG1
			INT 21H
MOV AH,09H
LEA DX,MSG7
INT 21

MOV AH,09H
LEA DX,MSG8
INT 21

MOV AH,09H
LEA DX,MSG9
INT 21

MOV AH,10H
LEA DX,MSG10
INT 21
			MOV AH,01H		   ;TAKE I/P FROM USER
			INT 21H
			MOV CHOOSE,AL
			CMP CHOOSE,'P'
			JE PUSH1
			CMP CHOOSE,'R'
			JE POP1
			CMP CHOOSE,'D'
			JE DISP
			JNE P
	PUSH1:	
		
			MOV AH,09H
			LEA DX,MSG2
			INT 21H
			MOV AH,01H
			INT 21H
			MOV [SI],AL		 ;PUT DATA INTO ARRAY
			INC SI
			INC FRONT
			MOV AH,09H
			LEA DX,MSG3
			INT 21H
			MOV AH,01H
			INT 21H
		         CMP AL,'C'
		         JE PUSH1
			JMP MENU
	POP1:
			MOV CL,REAR
			MOV CH,FRONT
			CMP CL,CH
			JAE EMP
          		 MOV AH,09H
			LEA DX, MSG5
			INT 21H
			 
			MOV DH,[DI]   ;MOVE THE DATA FROM ARRAY TO DH  			
                                                     MOV AH,02H
			MOV DL,DH		         ;DISPLAY THE DATA
			INT 21H
			INC DI
			
			INC REAR
			JMP MENU
	 DISP: 	
			MOV CL,REAR
			MOV CH,FRONT
			CMP CL,CH
			JAE EMP
			MOV AH,09H
			LEA DX,MSG4
			INT 21H
		L3:	MOV AL,[BX]	;DISPLAY ALL CONTENT OF ARRAY
			MOV AH,02H
			MOV DL,AL
			INT 21H
			INC CL
			INC BX
			CMP CH,CL
			JNE L3
			MOV BX,DI
			JMP MENU
	EMP:          MOV AH,09H
			LEA DX,MSG6
			INT 21H
			JMP MENU	
	P:
    		INT 3
			
CODE ENDS
END

 
