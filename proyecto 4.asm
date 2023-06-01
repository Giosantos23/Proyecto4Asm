;Universidad del Valle de Guatemala 
;Isabella Miralles 22293, Giovanni Santos 22523, Derek Kelson 22537
;Descripcion; Proyecto 4 Assembler, Battlefield
;y uso de GPRs
;19/04/2023

.386
.model flat, stdcall, c
.stack 4096
ExitProcess proto,dwExitCode:dword


includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib
includelib msvcrt.lib

extrn printf:near
extrn exit:near

.data

mensaje1J1 BYTE ' _______________________________________', 0Ah, 0
mensaje2J1 BYTE '|   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |', 0Ah, 0
mensaje3J1 BYTE '| A | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje4J1 BYTE '| B | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje5J1 BYTE '| C | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje6J1 BYTE '| D | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje7J1 BYTE '| E | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje8J1 BYTE '| F | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje9J1 BYTE '| G | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje10J1 BYTE '| H | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje11J1 BYTE '| I | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje12J1 BYTE ' ---------------------------------------', 0Ah, 0


mensaje1J2 BYTE ' _______________________________________', 0Ah, 0
mensaje2J2 BYTE '|   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |', 0Ah, 0
mensaje3J2 BYTE '| A | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje4J2 BYTE '| B | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje5J2 BYTE '| C | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje6J2 BYTE '| D | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje7J2 BYTE '| E | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje8J2 BYTE '| F | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje9J2 BYTE '| G | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje10J2 BYTE '| H | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje11J2 BYTE '| I | %c | %c | %c | %c | %c | %c | %c | %c | %c |', 0Ah, 0
mensaje12J2 BYTE ' ---------------------------------------', 0Ah, 0

.code

public main
main proc

push offset mensaje1J1
call printf
push offset mensaje2J1
call printf
push offset mensaje3J1
call printf
push offset mensaje4J1
call printf
push offset mensaje5J1
call printf
push offset mensaje6J1
call printf
push offset mensaje7J1
call printf
push offset mensaje8J1
call printf
push offset mensaje9J1
call printf
push offset mensaje10J1
call printf
push offset mensaje11J1
call printf
push offset mensaje12J1
call printf

push offset mensaje1J2
call printf
push offset mensaje2J2
call printf
push offset mensaje3J2
call printf
push offset mensaje4J2
call printf
push offset mensaje5J2
call printf
push offset mensaje6J2
call printf
push offset mensaje7J2
call printf
push offset mensaje8J2
call printf
push offset mensaje9J2
call printf
push offset mensaje10J2
call printf
push offset mensaje11J2
call printf
push offset mensaje12J2
call printf
RET


main endp
end