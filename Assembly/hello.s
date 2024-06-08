.global _start
.align 2

_start:
    b _set_val_1_gt

_check_what_to_print:
    cmp X10, X11 
    bgt _print_hello
    beq _print_ohno
    bal _print_goodbye

_print_hello:
    mov X0, #1
    adr X1, helloworld
    mov X2, #14
    mov X16, #4
    svc 0

    b _default

_print_goodbye:
    mov X0, #1
    adr X1, goodbye
    mov X2, #14
    mov X16, #4
    svc 0

    b _default

_print_ohno:
    mov X0, #1
    adr X1, ohno
    mov X2, #9
    mov X16, #4
    svc 0

    b _terminate

_default:
    cmp X10, X11
    bgt _set_val_1_lt
    beq _set_val_1_gt
    blt _set_val_1_eq
    bal _terminate

_set_val_1_gt:
    mov X10, #1
    mov X11, #0
    b _check_what_to_print

_set_val_1_eq:
    mov X10, #1
    mov X11, #1
    b _check_what_to_print

_set_val_1_lt:  
    mov X10, #1
    mov X11, #2
    b _check_what_to_print

_terminate:
    mov X0, #0
    mov X16, #1
    svc 0

helloworld: .asciz "Hello, World!\n"
goodbye: .asciz "Goodbye, sir!\n"
ohno: .asciz "Oh nooo!\n"