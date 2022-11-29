
; --------------------------------------------------------------
; Writes "Hello, World!" to the console using only system calls.
; Runs on 64-bit x86 Linux only.
;
; By Jackson Naufal
; Version 1.0
; Since: 2022-11-22
; --------------------------------------------------------------

SYS_WR equ 1
SYS_RD equ 0
SYS_EXIT equ 60

STDIN equ 0
STOUT equ 1

section .bss
    ; variables
    inp_len equ 3
    inp     resb    inp_len

section .data
    ; constants
    msg: db "Please input a 2 digit number: "
    msgLen: equ $-msg
    out: db 10, "You enterted: "
    outLength: equ $-out
    done: db 10, "Done!", 10
    doneLen: equ $-done


section .text
    global _start

    _start:
        mov rax, SYS_WR
        mov rdi, STOUT
        mov rsi, msg
        mov rdx, msgLen
        syscall

        ; input
        mov rax, SYS_RD
        mov rdi, STDIN
        mov rsi, inp
        mov rdx, inp_len
        syscall
        
        ; output
        mov rax, SYS_WR
        mov rdi, STOUT
        mov rsi, out
        mov rdx, outLength
        syscall

        mov rax, SYS_WR
        mov rdi, STOUT
        mov rsi, inp
        mov rdx, inp_len
        syscall

        mov rax, SYS_WR
        mov rdi, STOUT
        mov rsi, done
        mov rdx, doneLen
        syscall

        ; exit
        mov rbx, 0
        mov rax, SYS_EXIT
        syscall
