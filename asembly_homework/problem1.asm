extern printf
extern scanf

section .data
    text db "can't divide by 0",10,0
    frm db "%d",0
    scanfrm db "%d %d",0
    printfrm db "answer is %d",10,0
section .bss
    num1 resd 1
    num2 resd 1
    opr resb 1
section .text
    global main:
main:
    push rbp
    mov rbp,rsp
    mov rax,0
    mov rdi,scanfrm
    lea rsi,num1
    lea rdx,num2
    call scanf
    mov rdi,frm
    lea rsi,opr
    call scanf
    cmp byte[opr],1
    je add
    cmp byte[opr],2
    je sub
    cmp byte[opr],3
    je mul
    cmp byte[opr],4
    je div
add:
    mov rax,0
    mov rdi,printfrm 
    movsx rsi,dword[num1]
    add esi,dword[num2]
    call printf
    jmp end
sub:
    mov rax,0
    mov rdi,printfrm 
    movsx rsi,dword[num1]
    sub esi,dword[num2]
    call printf
    jmp end
mul:
    mov rax,0
    mov rdi,printfrm 
    movsx rax,dword[num1]
    mul dword[num2]
    mov rsi,rax
    call printf
    jmp end
div:
    cmp dword[num2],0
    je zero
    mov rdi,printfrm 
    movsx rax,dword[num1]
    movsx rbx,dword[num2]
    mov rdx,0
    div rbx
    mov rsi,rax
    mov rax,0
    call printf
    jmp end
zero:
    mov rdi,text
    call printf
    jmp end
end:   
    mov rsp,rbp
    pop rbp
    ret
