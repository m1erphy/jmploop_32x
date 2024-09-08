section .data
    type_basic db 'open', 0
    command db 'cmd', 0
    cmd db '/c notepad.exe', 0
    cmd_duo db '/c calc.exe', 0
    cmd_tree db 'powershell.exe', 0

extern _ShellExecuteA

section .text
    global _start

_start:
    jmp main_loop

main_loop:
    call _main
    jmp _calc

_calc:
    call _calc_function
    jmp _cmd

_cmd:
    call _cmd_function
    jmp main_loop

_main:
    push 4
    push 0
    push 0
    push command
    push type_basic
    push cmd
    push 0
    call _ShellExecuteA
    ret

_calc_function:
    push 4
    push 0
    push 0
    push command
    push type_basic
    push cmd_duo
    push 0
    call _ShellExecuteA
    ret

_cmd_function:
    push 4
    push 0
    push 0
    push command
    push type_basic
    push cmd_tree
    push 0
    call _ShellExecuteA
    ret
