extern printf
extern scanf

section .data 
    scanfrm db "%d",0
    printfrm db "answer is %d",10,0
section .bss
    num resd 1
section .text
    global main:
main:
    push rbp
    mov rbp,rsp
    mov rax,0
    mov rdi,scanfrm 
    lea rsi,num
    call scanf
    movsx rcx,dword[num]
    mov rbx,0
    mov rax,0
Loop:
    inc rax
    add rbx,rax 
    loop Loop
    mov rsi,rbx
    mov rdi,printfrm 
    call  printf
    mov rsp,rbp
    pop rbp
    ret
