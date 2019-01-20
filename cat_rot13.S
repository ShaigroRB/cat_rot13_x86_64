.text
.global main
.type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $256, %rsp

    mov %edi, -8(%rbp) #argc
    movq %rsi, -16(%rbp) #argv
    movq $1, -24(%rbp) # index

.Lmain_loop:
    movq -24(%rbp), %rbx
    cmpq -8(%rbp), %rbx
    jge .Lmain_quit_loop #if index >= argc then jump
.Lmain_body_loop:
    movq $42, %rax
    jmp .Lmain_quit
.Lmain_quit_loop:
    movq $0, %rax
.Lmain_quit:
    leave
    ret

.size main, .-main
