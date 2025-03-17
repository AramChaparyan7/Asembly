extern printf
extern scanf

section .data
    scanf_format db "%d",0
    printf_format db "max element is %d",10,0

section .bss
    arr resd 10
    max_elem resd 1
section .text
    global main
main:
    push rbp
    mov rbp,rsp

    mov rbx,0
 L1:

    cmp rbx,10
    jae L1_END
    mov rdi,scanf_format
    lea rsi,[arr + 4 * rbx]
    xor rax,rax
    call scanf
    inc rbx
    jmp L1
L1_END:
    mov rax,0
    mov eax,[arr]
    mov rbx,1
L2:
    cmp rbx,10
    jae L2_END

    cmp eax,[arr + 4 *rbx]
    jl Assign  
    jmp L2
Assign:
    mov eax, [arr + 4 *rbx]
    inc rbx
    jmp L2
L2_END:
    mov rdi,printf_format 
    movsx rsi,eax
    xor rax,rax
    call printf 
    add rax,[arr]
    mov rsi,rbp
    pop rbp
    xor rax,rax
    ret
