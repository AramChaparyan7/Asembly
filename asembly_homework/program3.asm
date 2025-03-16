extern printf
section .data
    frt db "max element is %d",10,0
    size dd 10
    array dd -5,9,8,6,3,4,7,5,-8,11
section .bss
section .text
global main:
a:
    mov rbx,[rax]
    jmp endjump
main:
    push rbp
    mov rbp,rsp
    mov rbx,[array]
    mov rax,array
    mov rcx,[size]
label:
    cmp [rax],rbx
    ja a
endjump:
    add rax,4
    loop label
    mov rdi,frt
    mov rsi,rbx
    call printf
    mov rsp,rbp
    pop rbp
    ret
