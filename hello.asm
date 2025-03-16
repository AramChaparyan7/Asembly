extern printf

section .data
    text db "hello, world",0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rdi,text
    mov rax,0
    call printf
    mov rsp,rbp
    pop rbp
    ret
