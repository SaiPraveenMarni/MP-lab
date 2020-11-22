.model small
DISPLAY MACRO MSG
lea dx,msg
mov ah,09h
int 21h
ENDM

.DATA
  MSG1 db 0DH,0AH,"ENTER STRING: $"
  MSG2 db 0DH,0AH,"REVERSE STRING: $"
  MSG3 db 0DH,0AH,"I/P STRING IS PALINDROME. $"
  MSG4 db 0DH,0AH,"NOT PALINDROME. $"
  STRING db 80H DUP(?)
  RSTRING db 80H DUP(?)

.CODE

START: MOV AX,@DATA
       MOV DS,AX
       DISPLAY MSG1
       MOV SI,OFFSET STRING
       XOR CL,CL

AGAIN: MOV AH,01H
        INT 21H
        CMP AL,00H
        JE NEXT
        MOV[SI],AL
        INC SI
        INC CL
        JMP AGAIN

NEXT: MOV[SI],BYTE PTR '$'
      DEC SI
      MOV CH,CL
      MOV DI,OFFSET RSTRING

BACK: MOV AL,[SI]
      MOV[DI],AL
      DEC SI
      INC DI
      DEC CH
      JNZ BACK
      MOV[DI], BYTE PTR '$'
      DISPLAY MSG2
      DISPLAY RSTRING
      MOV SI,OFFSET STRING
      MOV DI,OFFSET RSTRING

AG: MOV AL, [SI]
    CMP AL, [DI]
    JNE FAIL
    INC SI
    INC DI
    DEC CX
    JZ SUCCESS
    JMP AG

FAIL: DISPLAY MSG4
      JMP FINAL

SUCCESS: DISPLAY MSG3
FINAL: MOV AH,4CH
       INT 21H
       END
















