.section .rodata
.Lstr_permission:
    .string "r"
.Lstr_err:
    .string "unable to open %s\n"


.text
.global main
.type main, @function



main:
    pushq %rbp
    movq %rsp, %rbp
    subq $256, %rsp

    movslq %edi, %rbx
    movq %rbx, -8(%rbp) #argc
    movq %rsi, -16(%rbp) #argv
    movq $1, -24(%rbp) # index

.Lmain_loop:
    movq -24(%rbp), %rbx
    cmpq -8(%rbp), %rbx
    jge .Lmain_quit #if index >= argc then jump
    call cat@plt
    addq $1, -24(%rbp)
    jmp .Lmain_loop

.Lmain_quit:
    leave
    movq $0, %rax
    ret

.size main, .-main
