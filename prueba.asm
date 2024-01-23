
#include p16f84a.inc                ; Include register definition file
   __CONFIG _XT_OSC & _PWRTE_ON & _CP_OFF & _WDT_OFF
;====================================================================
; VARIABLES
;====================================================================
PUERTOA 				EQU 05H
PUERTOB 				EQU 06H ; Declaración del puerto B en la dirección 06 H
STATUS 					EQU 03H ; Declaración del registro de estado
       


;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================
; Reset Vector
	ORG 	0
      	goto  Start
	ORG 	5
;====================================================================
; CODE SEGMENT
;====================================================================

Start	 
    BSF STATUS,5 ; Cambio del banco de memoria. Banco 1 activado.
    CLRF TRISB ; Configuración de la puerta B como puerto de salida.
    movlw b'00011111' 
    movwf TRISA
    BCF STATUS,5 ; Cambio del banco de memoria. Banco 0 activado   

LOOP:
    ; Leer el valor del puerto A
    movf PUERTOA, W ; Cargar el valor del puerto A en W
    ; Escribir el valor en el puerto B
    movwf PUERTOB ; Escribir el valor en el puerto B
    goto LOOP ; Volver al inicio del loop

	 END