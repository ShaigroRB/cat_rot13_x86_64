.section .rodata
.Lstr_permission:
    .string "r"
.Lstr_err:
    .string "unable to open %s\n"

.text

.global cat
.type cat, @function

cat:
    pushq %rbp
    movq %rsp, %rbp
    subq $256, %rsp

    movq (%rdi), %rdi
    movq %rdi, -8(%rbp) #keep the filename in case of error
    movq $.Lstr_permission, %rsi
    call fopen@plt
    movq %rax, -16(%rbp) #file
    testq %rax, %rax
    je .Lcat_err #if file is NULL

.Lcat_loop:
    movq -16(%rbp), %rdi
    call fgetc@plt
    cmpb $-1, %al #check for EOF
    je .Lcat_quit
    movsbl %al, %edi
    call putchar@plt
    jmp .Lcat_loop

.Lcat_err:
    movq -8(%rbp), %rsi
    movq $.Lstr_err, %rdi
    call printf@plt

.Lcat_quit:
    leave
    nop
    ret

.size cat, .-cat

.global main
.type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $256, %rsp

    movslq %edi, %rbx
    movq %rbx, -8(%rbp) #argc
    movq %rsi, -16(%rbp) #argv
    movq $1, -24(%rbp) #index

.Lmain_loop:
    movq -24(%rbp), %rbx
    cmpq -8(%rbp), %rbx
    jge .Lmain_quit #if index >= argc then jump

    movq -16(%rbp), %rax
    leaq (%rax, %rbx, 8), %rdi # argv[index]
    call cat@plt

    addq $1, -24(%rbp)
    jmp .Lmain_loop

.Lmain_quit:
    leave
    movq $0, %rax
    ret

.size main, .-main
