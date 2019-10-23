data segment
str1 db 0ah,0dh,"CHOOSE OPERATION",0ah,0dh,'$'
str2 db 0ah,0dh,"P FOR PUSH",0ah,0dh,'$'
str3 db 0ah,0dh,"Q FOR POP",0ah,0dh,'$'
str8 db 0ah,0dh,"D FOR DISPLAY",0ah,0dh,'$'
str9 db 0ah,0dh,"Any key for exit",0ah,0dh,'$'
str4 db 0ah,0dh,"Enter value to be pushed",0ah,0dh,'$'
str5 db 0ah,0dh,"Overflow",0ah,0dh,'$'
str6 db 0ah,0dh,"Do you want to continue? (y/n)",0ah,0dh,'$'
str7 db 0ah,0dh,"Empty queue",0ah,0dh,'$'
str10 db 0ah,0dh,"Popping...",'$'
choose db 1 dup(0)
front db 1 dup(0)
rear db 1 dup(0)
newr db 1 dup(0)
maxsize db 1 dup (0)
f db 1 dup(0)
re db 1 dup(0)
t db 1 dup(0)
array db 100 dup(0)
data ends
code segment
        assume cs:code, ds:data
               mov ax,data
               mov ds,ax
               mov maxsize,05
               mov front,00
               mov rear,00
        menu:  mov dx, offset str1
               mov ah,09h
               int 21h
               mov dx, offset str2
               mov ah,09h
               int 21h
               mov dx, offset str3
               mov ah,09h
               int 21h
               mov dx, offset str8
               mov ah,09h
               int 21h
               mov dx, offset str9
               mov ah,09h
               int 21h
               mov ah,01
               int 21h
               cmp al, 'p'
               je p
               cmp al, 'q'
               je q
               cmp al, 'd'
               je call_d
               jmp e
       call_d: jmp d
       p:      mov al,rear
               inc al
               mov ah,00
               div maxsize
               mov newr,ah
               mov al, newr
               mov dl, front
               mov ah,rear
               cmp al,dl
               jne x
               mov dx, offset str5
               mov ah,09h
               int 21h
               jmp menu
       x:      
               mov ah, newr
               mov rear,ah
               mov dx, offset str4
               mov ah,09h
               int 21h
               mov ah,01
               int 21h
               mov bl,rear
               mov bh,00 
               mov [si+array+bx],al
               mov dx, offset str6
               mov ah,09h
               int 21h
               mov ah,01
               int 21h
               cmp al, 'y'
               je p
               jmp menu
       q:      mov al, front
               mov dl, rear
               cmp al,dl
               jne y
               mov dx, offset str7
               mov ah,09h
               int 21h
               jmp menu
       y:      mov dx, offset str10
               mov ah,09h
               int 21h
               mov al,front
               inc al
               mov ah,0
               div maxsize
               mov front,ah
               mov bl,front
               mov bh,00
               mov dl,[si+array+bx]
               mov [si+array+bx],00
               mov ah, 02
               int 21h
               mov dx, offset str6
               mov ah,09h
               int 21h
               mov ah,01
               int 21h
               cmp al,'y'
               je q
               jmp menu
		d:
			MOV AL, 13H
	        MOV AH, 0
	        INT 10H
	        MOV AL,4
	        MOV AH,0CH
			
	MOV SI,10
AGAIN:	MOV DX,10
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN
	
	
	
	MOV DX,10
	MOV SI,30
AGAIN1:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,40
	JBE AGAIN1
	
	MOV DX,10
	MOV SI,50
AGAIN2:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN2
	

	
	MOV SI,10
AGAIN3:	MOV DX,20
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN3
	
	
	
	MOV DX,20
	MOV SI,30
AGAIN4:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,40
	JBE AGAIN4
	
	MOV DX,20
	MOV SI,50
AGAIN5:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN5	
	
	
	
	
	
	
	
	
	MOV SI,10
N:	MOV CX,10
	MOV DX,SI
	INT 10H
	MOV CX,20
	INT 10H
	MOV CX,30
	INT 10H
	MOV CX,40
	INT 10H
	MOV CX,50
	INT 10H
	MOV CX,60
	INT 10H
	INC SI	
	CMP SI,20
	JBE N
	
	
;PART TWO	
	
    MOV AL,4
	        MOV AH,0CH
			
	MOV SI,10
AGAIN6:	MOV DX,50
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN6
	
	
	
	MOV DX,50
	MOV SI,30
AGAIN7:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,40
	JBE AGAIN7
	
	MOV DX,50
	MOV SI,50
AGAIN8:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN8
	

	
	MOV SI,10
AGAIN9:	MOV DX,60
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN9
	
	
	
	MOV DX,60
	MOV SI,30
AGAIN10:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,40
	JBE AGAIN10
	
	MOV DX,60
	MOV SI,50
AGAIN11:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN11		
	
	
	
	
	MOV SI,50
N2:	MOV CX,10
	MOV DX,SI
	INT 10H
	MOV CX,20
	INT 10H
	MOV CX,30
	INT 10H
	MOV CX,40
	INT 10H
	MOV CX,50
	INT 10H
	MOV CX,60
	INT 10H
	INC SI	
	CMP SI,60
	JBE N2
		
;PART THREE	
	
	
	MOV SI,30
N3:	MOV CX,10
	MOV DX,SI
	INT 10H
	MOV CX,20
	INT 10H
	
	MOV CX,50
	INT 10H
	MOV CX,60
	INT 10H
	INC SI	
	CMP SI,40
	JBE N3	
	
			
			
			  MOV AL,4
	        MOV AH,0CH
			
	MOV SI,10
AGAIN12:	MOV DX,30
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN12
	
	
	

	
	MOV DX,30
	MOV SI,50
AGAIN13:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN13
	

	
	MOV SI,10
AGAIN14:	MOV DX,40
  MOV CX,SI
	INT 10H
    INC SI
	CMP SI,20
	JBE AGAIN14
	
	
	
	
	MOV DX,40
	MOV SI,50
AGAIN15:  MOV CX,SI
	INT 10H
	INC SI
	CMP SI,60
	JBE AGAIN15	
			
			
			
	        MOV AH,0
	        INT 16H
	        MOV AH,0
	        MOV AL,3
	        INT 10H
        e:     int 3
        
code ends
end
