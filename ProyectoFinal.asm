
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'

org 100h  
 
call ciclo 

ret  

    ciclo:
    call menuP
    call opcion 
    
    cmp al,35h
     jg ciclo
     
    cmp al,30h
    je ciclo
    
     
     ret
     


    menuP PROC  
        
    call clear
    
    ;Ubicar posiciones especificas en pantalla
    mov dh,10   ;fila
    mov dl,25  ;columna
    mov ah,2
    int 10h


    ;mensaje 1
    mov dx, offset cadena1
    mov ah,9
    int 21h 

    ;Ubicar posiciones especificas en pantalla
    mov dh,11   ;fila
    mov dl,30  ;columna
    mov ah,2
    int 10h

    ;mensaje 2
    mov dx, offset cadena2
    mov ah,9
    int 21h  

    ;mensaje 3
    mov dx, offset cadena3
    mov ah,9
    int 21h 

    ;mensaje 4
    mov dx, offset cadena4
    mov ah,9
    int 21h

    ;mensaje 5
    mov dx, offset cadena5
    mov ah,9
    int 21h
    
    ;mensaje 6
    mov dx, offset cadena6
    mov ah,9
    int 21h

    ;mensaje 7
    mov dx, offset cadena7
    mov ah,9
    int 21h

    ;mensaje 8
    mov dx, offset cadena8
    mov ah,9
    int 21h 
    
    ;Recibir opcion
    mov ah, 1
    mov dx,20
    int 21h     
     
    ret
    menuP ENDP 


    opcion PROC
        
    cmp al,31h;     Compara el dato ingresado con el numero 1 ascii
    je sub_menu1 ;  Salta al sub menu1
 
    cmp al,32h ;    Compara el dato ingresado con el numero 2 ascii
    je sub_menu2 ;  Salta al sub menu2  

    cmp al,33h;      Compara el dato ingresado con el numero 3 ascii
    je sub_menu3;   Salta al sub menu3

    cmp al,34h;     Compara el dato ingresado con el numero 4 ascii
    je sub_menu4;   Salta al sub menu4

    cmp al,35h;     Compara el dato ingresado con el numero 5 ascii
    je sub_menu5;    Salta al sub menu4
    
    ret
    opcion ENDP

            ;--- submenu --- 
    sub_menu1:   
    
    call clear
    call position
    
    mov dx, offset subcadenat1 ; Titulo de la seleccion
    mov ah,9
    int 21h 
     
    mov dx, offset subcadena1_1 ; mesaje submenu1_1
    mov ah,9
    int 21h
    
    mov dx, offset subcadena1_2 ; mesaje submenu1_2
    mov ah,9
    int 21h 
    
    mov dx, offset subcadena1_3 ; mesaje submenu1_3
    mov ah,9
    int 21h  
    
     
    
    ;-- lectura / Recibir opcion
    mov ah, 1
    mov dx,20
    int 21h
    
    ;-- llamada a submenu 1
    call opcion_submenu1
    ret             
    
     ; --- procedimiento proc
    opcion_submenu1 PROC     
        cmp al, 31h     ;compara el dato ingresado con el numero 1 ascii
        je Suma1         ;salta al submenu1
        
        cmp al, 32h     ;compara el dato ingresado con el numero 2 ascii
        je Resta1         ;salta al submenu1 
        
        cmp al, 33h     ;compara el dato ingresado con el numero 3 ascii
        je Multi1         ;salta al submenu1
        
        ret
     opcion_submenu1 ENDP   
        
    
    sub_menu2:
     
    call clear
    
    call position
    
    mov dx, offset subcadenat2 ; Titulo de la seleccion
    mov ah,9
    int 21h 
     
    mov dx, offset subcadena2_1 ; mesaje submenu2_1
    mov ah,9
    int 21h
    
    
     ;-- lectura / Recibir opcion
    mov ah, 1
    mov dx,20
    int 21h
    
    ;-- llamada a submenu2
    call opcion_submenu2
    ret 
     ; --- procedimiento proc
    opcion_submenu2 PROC     
        cmp al, 31h     ;compara el dato ingresado con el numero 1 ascii
        je palindroma         ;salta al submenu1
        
        ret
     opcion_submenu2 ENDP  
       

    
    sub_menu3:
    call clear
    call position
    
    mov dx, offset subcadenat3 ; Titulo de la seleccion
    mov ah,9
    int 21h 
     
    mov dx, offset subcadena3_1 ; mesaje submenu3_1
    mov ah,9
    int 21h
    
    ret
    
    
    
    sub_menu4:
    
    call clear
    call position   
    
    mov dx, offset subcadenat4 ; Titulo de la seleccion
    mov ah,9
    int 21h 
     
    mov dx, offset subcadena4_1 ; mesaje submenu4_1
    mov ah,9
    int 21h
         
       ;-- lectura / Recibir opcion
    mov ah, 1
    mov dx,20
    int 21h
    
    ;-- llamada a submenu4
    call opcion_submenu4
    ret                      
    
     ; --- procedimiento proc
    opcion_submenu4 PROC     
        cmp al, 31h     ;compara el dato ingresado con el numero 1 ascii
        je Fibonacci         ;salta al submenu1
        
        ret
     opcion_submenu4 ENDP 
     
   
        
    sub_menu5:
    call clear
    call position
    
    mov dx, offset subcadenat5 ; Titulo de la seleccion
    mov ah,9
    int 21h
    ret                              
    
    
    clear:
    mov ah,00h ; limpiar pantalla
    mov al,03h 
    int 10h 
    ret 
    
    position:
    ;Ubicar posiciones especificas en pantalla
    mov dh,10   ;fila
    mov dl,25  ;columna
    mov ah,2
    int 10h
    ret
    
    
                                               

ret

cadena1 db "Arquitectura de computadoras II ","$"
cadena2 db "Segundo semestre 2022 ","$"
cadena3  db 10,13,"1. Operaciones Basicas","$"
cadena4  db 10,13,"2. Operaciones de Cadenas","$"
cadena5  db 10,13,"3. Juego","$"
cadena6  db 10,13,"4. Operaciones de Recurrencia","$"
cadena7  db 10,13,"5. Salir","$" 
cadena8  db 10,13,"Ingrese una opcion :","$"  

   ;--- OPERACIONES BASICAS --------------------------------------------------
subcadenat1  db "Operaciones Basicas","$"  
subcadena1_1 db 10,13, "1. Suma ","$" 
subcadena1_2 db 10,13, "2. Resta ","$"
subcadena1_3 db 10,13, "3. Multiplicacion ","$" 


   ;---- PALINDORMA ----------------------------------------------------------
subcadenat2  db "Operaciones De Cadenas","$" 
subcadena2_1 db 10,13, "1. Determinar si una cadena es palindroma ","$" 
   
   ;------ JUEGOS -------------------------------------------------------------
subcadenat3  db " Juegos ","$" 
subcadena3_1 db 10,13, "1. Juego Snake ","$"


                                                     
                                                      
; --------- FIBONACCI --------------------------------------------------------   

subcadenat4  db "Operaciones De Recurrencia ","$" 
subcadena4_1 db 10,13, "1. Serie de Fibonacci ","$"
 


subcadenat5  db " Saliendo ... ","$" 
ret

;--- Librerias a utilizar ---
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS 
DEFINE_PTHIS
DEFINE_CLEAR_SCREEN
DEFINE_GET_STRING 


;------- Suma ---------------------------------------------------------     

Suma1: 
suma db 2 dup (?)  ;declaracion de variablede suma
                   ;acumulara los datos

call clear_screen
gotoxy 30,1
call pthis
db '***Suma***',0    
gotoxy 0,1
call pthis
db 'Ingrese el primer numero: ',0   
call scan_num
mov suma[0],cl
gotoxy 0,2
call pthis
db 'Ingrese el segundo numero: ',0   
call scan_num
mov suma[1],cl                
xor ax, ax ;Limpieza de operacion
add al,suma[0]
add al,suma[1]   
gotoxy 0,3
call pthis
db 'El resultado de la suma es: ',0      
call print_num  
ret  

;--- Resta ------------------------------------------------------ -------------
Resta1:
resta db 2 dup (?) ;declaracion de variablede resta
                       ;acumulara los datos

call clear_screen
gotoxy 30,1
call pthis
db '***Resta***',0    
gotoxy 0,4
call pthis
db 'Ingrese el primer numero: ',0   
call scan_num
mov resta[0],cl
gotoxy 0,5
call pthis
db 'Ingrese el segundo numero: ',0   
call scan_num
mov resta[1],cl                
xor ax, ax ;Limpieza de operacion
mov al,resta[0]
sub al,resta[1]   
gotoxy 0,6
call pthis
db 'El resultado de la resta es: ',0      
call print_num  
ret

;--- Multiplicacion -------------------------------------------------------
Multi1: 

multi db 2 dup (?)    ;declaracion de variablede multiplicacion
                       ;acumulara los datos

call clear_screen
gotoxy 30,1
call pthis
db '***Multiplicacion***',0    
gotoxy 0,7
call pthis
db 'Ingrese el primer numero: ',0   
call scan_num
mov multi[0],cl
gotoxy 0,8
call pthis
db 'Ingrese el segundo numero: ',0   
call scan_num
mov multi[1],cl                
xor ax, ax              ;Limpieza de operacion
add al, multi[0]
mul multi[1]   
gotoxy 0,9
call pthis
db 'El resultado de la multiplicacion es: ',0      
call print_num  
ret

;------------------- palindroma ----------------------------

palindroma:  

call clear_screen

jmp inicio()
palabra db 50h dup(?)
aux1 db 0
aux2 dw 0

mensajes1:
primero db 'Ingrese palabra: '
;lz = $ - cod
db 1Ah, '$'
exito:
exitomsj db 'La palabra ingresada es palindroma.'
;lz = $ - cod
db 7Fh,'$'
fallo:
fallomsj db 'La palabra ingresada no es palindroma.'
;lz = $ - cod
db 58h,'$'

inicio():
mov ah,9
mov dx,offset primero
int 21h

mov bl,0dh ;tecla enter
mov si,00d ;inicio del contador string
mov ah,1

lectura():
int 21h   ;lectura de caracter
mov palabra[si],al ;almacenamos en el vector string
inc si    ;incremento variable SI
cmp al,bl ;comparamos el caracter ingresado con el enter
jne lectura()

mov di,si
dec di ;la variable si se pasa en dos posiciones, ya que almacena
dec di ; el enter y el retorn, decrementa dos veces

mov si,00d

mov aux2,di ;almacenamos el largo en una variable

compara():

mov al,palabra[si]
cmp palabra[di],al ;si son distintos no es palindroma
jne no_palindromo()

cmp si,aux2
je palindromo()

inc si
dec di

jmp compara()

no_palindromo():
mov aux1,1
jmp imprime()
mensaje1():
;mov ah,0eh
mov al,0ah
int 10h

mov dx,offset fallomsj
mov ah,9
int 21h
jmp fin()

palindromo():
jmp imprime()
mensaje2():
;mov ah,0eh
mov al,0ah
int 10h

mov dx,offset exitomsj
mov ah,9
int 21h
jmp fin()

imprime():
mov di,aux2
mov ah,0eh
mov al,0ah
int 10h
mov si,-01d
for():
mov ah,0eh
inc si
mov al,palabra[si]
int 10h
cmp si,di
jne for()

mov al,aux1 ;devuelve
cmp al,1
je mensaje1() ;vuelve donde corresponda
jmp mensaje2()
fin():
ret
;end  
;-----------------------juego ------------------------------------






;-----------------------Serie Fibobacci ------------------------
Fibonacci:
call clear_screen

PUSH    AX        ; this maro is copied from emu8086.inc ;

        MOV     AH, 0Eh
        INT     10h     
        POP     AX
ENDM

JMP start2       ; jump to start label
msg1 db "please enter the number of elemants in the sequance $" , 0Dh,0Ah, 24h ; define variable (message):
num1 dw ?       ; number

start2:  LEA     DX, msg1  ; load effective address of msg into dx.
        MOV     AH, 09h   ; print function is 9.
        INT     21h       ; do it 
              
CALL SCAN_NUM   ; get the multi-digit signed number from the keyboard, and store the result in cx register:
MOV num1,cx     
putc 0Dh        ; new line:
putc 0Ah        

CMP CX, 1                  ; compare cx with one
JLE lessthan               ; if cx is less than 1 jump to lessthan label
    
greater_or_equal:          ; if cx isn't less than 1
    CMP CX, 25             ; compare cx with 25
    JLE lessthan_or_equal  ; if cx less than 25 jump to less_or_equal
    
    greater__or__equal:    ; if cx more than 25
        JMP restart        ; jump to restart label
        msg2 db "please enter suitabal number in range of [1,25] $" , 0Dh,0Ah, 24h  ; define variable (message):
        
    
        restart:  LEA     DX, msg2  ; load effective address of msg into dx.
                  MOV     AH, 09h   ; print function is 9.
                  INT     21h       ; do it
                
                  MOV     AH, 0 
                  INT     16h       ; wait for any key any....  
                  putc 0Dh          ; new line:
                  putc 0Ah
                  JMP start2         ; jump to start label
                                  
lessthan:                 ; less than label
    CMP     CX, 0         ; compare cx with 0
    JNZ     restart2      ; if cx not equal 0 jump to restart2
    JE stop               ; if cx equal to 0 jump to stop label

    stop:                 ; stop label
    MOV AH, 4CH
    MOV AL, 01            ; your return code.
    INT 21H               ; do it
        
    JMP restart2          ; jump to restart2 label                               
    msg3 db "please enter suitabal number in range of [1,25] $" , 0Dh,0Ah, 24h      ; define variable (message):
    
    restart2:
               CMP     CX, 1                 ; compare cx with one
               JE      faboo                 ; faboo than labe
               LEA     DX, msg3              ; load effective address of msg into dx.
               MOV     AH, 09h               ; print function is 9.
               INT     21h                   ; do it
               
               MOV     AH, 0 
               INT     16h                   ; wait for any key any....
               putc 0Dh                      ; new line:
               putc 0Ah
               JMP start2                     ; jump to start label
                             
    lessthan_or_equal:              ; lessthan_or_equal label
        MOV BX, 1                   ; move 1 to bx
        MOV AX , 0                  ; move 0 to ax
        CALL PRINT_NUM              ; call print_num label (print the value in ax)
        MOV AX , 1                  ; move 1 to ax
        CALL PRINT_NUM              ; call print_num label (print the value in ax)
        SUB CX, 1                   ; substract 1 from cx
        fabo:   
                ADD AX,BX           ; add ax to bx and store result at ax
                MOV [SI],AX         ; move ax to memory location si
                MOV AX,BX           ; move bx to ax
                MOV BX,[SI]         ; move data of memory location si to bx
                CALL PRINT_NUM      ; call print_num label (print the value in ax)
                INC SI              ; increment si
                
        LOOP fabo R                 ; loop the label fabo number of loops equal to the value of cx
        putc 0Dh                    ; new line:
        putc 0Ah
        JMP start2                   ; jump to start label 
        
        faboo:                 
                MOV AX , 0                  ; move 0 to ax; move 0 to ax
                CALL PRINT_NUM              ; call print_num label (print the value in ax)
                MOV AX , 1                  ; move 1 to ax
                CALL PRINT_NUM              ; call print_num label (print the value in ax)
                putc 0Dh                    ; new line:
                putc 0Ah
                JMP start2                   ; jump to start label 

; these functions are copied from emu8086.inc                                                            
; gets the multi-digit SIGNED number from the keyboard and stores the result in CX register:                                  
SCAN_NUM2        PROC    NEAR
        PUSH    DX         
        PUSH    AX         
        PUSH    SI        
        
        MOV     CX, 0

        ; reset flag:
        MOV     CS:make_minus, 0

next_digit:

        ; get char from keyboard
        ; into AL:
        MOV     AH, 00h
        INT     16h
        ; and print it:
        MOV     AH, 0Eh
        INT     10h

        ; check for MINUS:
        CMP     AL, '-'
        JE      set_minus

        ; check for ENTER key:
        CMP     AL, 0Dh  ; carriage return?
        JNE     not_cr
        JMP     stop_input
not_cr:

        CMP     AL, 8                   ; 'BACKSPACE' pressed?
        JNE     backspace_checked
        MOV     DX, 0                   ; remove last digit by
        MOV     AX, CX                  ; division:
        DIV     CS:ten                  ; AX = DX:AX / 10 (DX-rem).
        MOV     CX, AX
        PUTC    ' '                     ; clear position.
        PUTC    8                       ; backspace again.
        JMP     next_digit
backspace_checked:

        ; allow only digits:
        CMP     AL, '0'
        JAE     ok_AE_0
        JMP     remove_not_digit
ok_AE_0:        
        CMP     AL, '9'
        JBE     ok_digit
remove_not_digit:       
        PUTC    8          ; backspace.
        PUTC    ' '        ; clear last entered not digit.
        PUTC    8          ; backspace again.        
        JMP     next_digit ; wait for next input.       
ok_digit:


        ; multiply CX by 10 (first time the result is zero)
        PUSH    AX
        MOV     AX, CX
        MUL     CS:ten     ; DX:AX = AX*10
        MOV     CX, AX
        POP     AX

        ; check if the number is too big (result should be 16 bits) 
        CMP     DX, 0
        JNE     too_big

        ; convert from ASCII code:
        SUB     AL, 30h

        ; add AL to CX:
        MOV     AH, 0
        MOV     DX, CX     ; backup, in case the result will be too big.
        ADD     CX, AX
        JC      too_big2   ; jump if the number is too big.

        JMP     next_digit

set_minus:
        MOV     CS:make_minus, 1
        JMP     next_digit

too_big2:
        MOV     CX, DX     ; restore the backuped value before add.
        MOV     DX, 0      ; DX was zero before backup!
too_big:
        MOV     AX, CX
        DIV     CS:ten     ; reverse last DX:AX = AX*10, make AX = DX:AX / 10
        MOV     CX, AX
        PUTC    8          ; backspace.
        PUTC    ' '        ; clear last entered digit.
        PUTC    8          ; backspace again.        
        JMP     next_digit ; wait for Enter/Backspace.
        
        
stop_input:
        ; check flag:
        CMP     CS:make_minus, 0
        JE      not_minus
        NEG     CX
not_minus:

        POP     SI
        POP     AX
        POP     DX
        RET
make_minus      DB      ?       ; used as a flag.
SCAN_NUM2        ENDP

; this procedure prints number in AX used with PRINT_NUM_UNS to print signed numbers: 
PRINT_NUM2       PROC    NEAR
        PUSH    DX
        PUSH    AX
         
        CMP     AX, 0
        JNZ     not_zero

        PUTC    '0'
        JMP     printed

not_zero:
        ; the check SIGN of AX make absolute if it's negative: 
        CMP     AX, 0
        JNS     positive
        NEG     AX

        PUTC    '-'

positive:
        CALL    PRINT_NUM_UNS
printed:
        POP     AX 
        PUTC    ','
        POP     DX
        RET
PRINT_NUM2       ENDP
    
; this procedure prints out an unsigned number in AX (not just a single digit) allowed values are from 0 to 65535 (FFFF) 
PRINT_NUM_UNS2   PROC    NEAR
        PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    DX

        ; flag to prevent printing zeros before number:
        MOV     CX, 1

        ; (result of "/ 10000" is always less or equal to 9).
        MOV     BX, 10000       ; 2710h - divider.

        ; AX is zero?
        CMP     AX, 0
        JZ      print_zero

begin_print:

        ; check divider (if zero go to end_print):
        CMP     BX,0
        JZ      end_print

        ; avoid printing zeros before number:
        CMP     CX, 0
        JE      calc
        ; if AX<BX then result of DIV will be zero:
        CMP     AX, BX
        JB      skip
calc:
        MOV     CX, 0   ; set flag.

        MOV     DX, 0
        DIV     BX      ; AX = DX:AX / BX   (DX=remainder).

        ; print last digit
        ; AH is always ZERO, so it's ignored
        ADD     AL, 30h    ; convert to ASCII code.
        PUTC    AL


        MOV     AX, DX  ; get remainder from last div.

skip:
        ; calculate BX=BX/10
        PUSH    AX
        MOV     DX, 0
        MOV     AX, BX
        DIV     CS:ten  ; AX = DX:AX / 10   (DX=remainder).
        MOV     BX, AX
        POP     AX

        JMP     begin_print
        
print_zero:
        PUTC    '0'
        
end_print:

        POP     DX
        POP     CX
        POP     BX
        POP     AX
        RET
PRINT_NUM_UNS2   ENDP  

ten DW 10      ; used as multiplier/divider by SCAN_NU

ret