;Universidad del Valle de Guatemala 
;Isabella Miralles 22293, Giovanni Santos 22523, Derek Kelson 22537
;Descripcion; Proyecto 4 Assembler, Battlefield
;y uso de GPRs
;19/04/2023

.386
.model flat, stdcall, c
.stack 4096
;ExitProcess proto,dwExitCode:dword


includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib
includelib msvcrt.lib

extrn printf:near
extrn exit:near


.data


;--------------FORMATO-----------

fmt db "%s",0  
        

;VALORES PARA IMPRIMIR

titulo1 BYTE ' _____  _____  _____  _____  __     _____    _____  _____  _____  _____', 0Ah, 0
titulo2 BYTE '| __  ||  _  ||_   _||_   _||  |   |   __|  |   __||  |  ||     ||  _  |', 0Ah, 0
titulo3 BYTE '| __ -||     |  | |    | |  |  |__ |   __|  |__   ||     ||-   -||   __|', 0Ah, 0
titulo4 BYTE '|_____||__|__|  |_|    |_|  |_____||_____|  |_____||__|__||_____||__|', 0Ah, 0   
                                                                        

;------------------INPUT------------------

barco db "%d %d %d %d %d %d %d %d %d", 0
nobarco db "No ingreso una columna o fila correcta",0
posX dd ?
posY dd ?


;Final



;-----------------------
;		  VALORES			
;-----------------------

J1FilA dword   "0","0","0","0","0","0","0","0","0"
J1FilB dword   "0","0","0","0","0","0","0","0","0"
J1FilC dword   "0","1","1","1","0","0","0","0","0"
J1FilD dword   "0","0","0","0","0","0","0","0","0"
J1FilE dword   "0","0","1","1","1","0","0","0","0"
J1FilF dword   "0","0","0","0","0","0","0","0","0"
J1FilG dword   "0","0","0","0","0","0","0","0","0"
J1FilH dword   "0","0","0","0","0","1","1","1","0"
J1FilI dword   "0","0","0","0","0","0","0","0","0"

J2FilA dword   "0","0","0","0","0","0","0","0","0"
J2FilB dword   "0","0","0","0","0","0","0","0","0"
J2FilC dword   "1","1","1","0","1","1","1","0","0"
J2FilD dword   "0","0","0","0","0","0","0","0","0"
J2FilE dword   "0","0","0","0","0","0","0","0","0"
J2FilF dword   "0","0","0","0","0","0","0","0","0"
J2FilG dword   "0","0","0","1","1","1","0","0","0"
J2FilH dword   "0","0","0","0","0","0","0","0","0"
J2FilI dword   "0","0","0","0","0","0","0","0","0"




;Tablero
mensajeTJ1  BYTE    ' ________________JUGADOR 1______________', 0Ah, 0
mensajeTJ2  BYTE    ' ________________JUGADOR 2______________', 0Ah, 0 
mensaje1J BYTE ' _______________________________________', 0Ah, 0
mensaje2J BYTE '|   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |', 0Ah, 0
mensaje3J BYTE '| A | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje4J BYTE '| B | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje5J BYTE '| C | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje6J BYTE '| D | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje7J BYTE '| E | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje8J BYTE '| F | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje9J BYTE '| G | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje10J BYTE '| H | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje11J BYTE '| I | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje12J BYTE ' ---------------------------------------', 0Ah, 0

;Pedir datos
 
msg1 DB "Ingrese la posicion de la fila y columna en la que desea poner su barco:",0AH, 0

posFila dword ? ; posicion de la fila
posColumna dword ?; posicion de la columna







.code

;librerias:
    includelib libucrt.lib
    includelib legacy_stdio_definitions.lib
    includelib libcmt.lib
    includelib libvcruntime.lib
    includelib msvcrt.lib

    extrn printf:near
    extrn scanf:near
    extrn exit:near


public main


;--------------------------------------------------------------------------------------------------
;--------------------------------------SUB RUTINAS-------------------------------------------------
;--------------------------------------------------------------------------------------------------

;------------------------------------------IMPRIMIR TITULO INICIAL---------------------------------------------------
printTT proc
    push offset titulo1
    call printf
    push offset titulo2
    call printf
    push offset titulo3
    call printf
    push offset titulo4
    call printf
printTT endp


;------------------------------------------IMPRIMIR TABLERO DEL J1---------------------------------------------------
printTJ1 proc
    push offset mensajeTJ1
    call printf
    push offset mensaje1J
    call printf
    push offset mensaje2J
    call printf

    mov edi,32
    mov ebx,9
    bucleFilaA:  
            push DWORD ptr [J1FilA+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaA                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje3J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaB:  
            push DWORD ptr [J1FilB+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaB                   ;Si el contador no es 0, se repite el bucle

    push offset mensaje4J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaC:  
            push DWORD ptr [J1FilC+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaC                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje5J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaD:  
            push DWORD ptr [J1FilD+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaD                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje6J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaE:  
            push DWORD ptr [J1FilE+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaE                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje7J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaF:  
            push DWORD ptr [J1FilF+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaF                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje8J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaG:  
            push DWORD ptr [J1FilG+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaG                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje9J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaH:  
            push DWORD ptr [J1FilH+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaH                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje10J
    call printf
    mov edi,32
    mov ebx,9
    bucleFilaI:  
            push DWORD ptr [J1FilI+edi]
            sub edi,4
            dec     ebx                     ;ebx restar al contador
            jnz     bucleFilaI                   ;Si el contador no es 0, se repite el bucle
    push offset mensaje11J
    call printf
    push offset mensaje12J
    call printf
    

printTJ1 endp

;------------------------------------------iMPRIMIR TABLERO DEL J2---------------------------------------------------

printTJ2 proc

push offset mensajeTJ2
call printf
push offset mensaje1J
call printf
push offset mensaje2J
call printf

mov edi,32
mov ebx,9
bucleFilaA2:  
        push DWORD ptr [J2FilA+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaA2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje3J
call printf
mov edi,32
mov ebx,9
bucleFilaB2:  
        push DWORD ptr [J2FilB+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaB2                   ;Si el contador no es 0, se repite el bucle

push offset mensaje4J
call printf
mov edi,32
mov ebx,9
bucleFilaC2:  
        push DWORD ptr [J2FilC+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaC2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje5J
call printf
mov edi,32
mov ebx,9
bucleFilaD2:  
        push DWORD ptr [J2FilD+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaD2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje6J
call printf
mov edi,32
mov ebx,9
bucleFilaE2:  
        push DWORD ptr [J2FilE+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaE2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje7J
call printf
mov edi,32
mov ebx,9
bucleFilaF2:  
        push DWORD ptr [J2FilF+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaF2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje8J
call printf
mov edi,32
mov ebx,9
bucleFilaG2:  
        push DWORD ptr [J2FilG+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaG2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje9J
call printf
mov edi,32
mov ebx,9

bucleFilaH2:  
        push DWORD ptr [J2FilH+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaH2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje10J
call printf
mov edi,32
mov ebx,9
bucleFilaI2:  
        push DWORD ptr [J2FilI+edi]
        sub edi,4
        dec     ebx                     ;ebx restar al contador
        jnz     bucleFilaI2                   ;Si el contador no es 0, se repite el bucle
push offset mensaje11J
call printf
push offset mensaje12J
call printf

printTJ2 endp
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------

setShip proc
    push offset msg1; imprime el msg 1
    call printf
    add esp, 4

    lea eax, [strBuff] ; lee lo que el usuario ingresa
    push eax
    lea eax, [fmt]
    push eax
    call scanf
    add esp,8

    mov ecx, [strBuff]
    mov edx, [strBuff + 4]

    cmp ecx, 1 ; verifica las posiciones en caso de error
    jl error
    cmp ecx, 9
    jg error
    cmp edx, 1
    jl error
    cmp edx,9
    jl error

    mov ebx, ecx
    dec ebx
    imul ebx, 9
    add ebx, edx ;indice del array
    dec ebx
    shl edi, 2
 
    mov byte ptr [J1FilA + ebx], 1

    lea eax, [J1FilA]
    push eax
    lea eax, barco
    push eax
    call printf
    add esp, 8
    jmp printTJ2
    

error:
    push offset nobarco
    call printf
    add esp, 4

    mov eax, 1
    

strBuff DD ?

setShip endp

turno1 proc

RET
turno1 endp


turno2 proc

RET
turno2 endp

;-FINAL-

OutGanador proc

RET
OutGanador endp

;MAIN

main proc ;Inicializa el procedimiento y llama las funciones

call printTT
call printTJ1
call printTJ2
call setShip


call exit

salir:
    mov eax, 0
    ret

main ENDP ;termina el procedimiento


end