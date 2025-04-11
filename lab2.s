section .data
    msg_1 db "Введите число: ", 10
    msg_2 db "Развёрнутое число: ", 10
    msg_3 db "Кол-во чисел: ", 10
    msg_4 db "Модуль разности: ", 10
    input db 10 dup(0)   ; буфер для ввода числа, размер 10
    output db 10 dup(0)  ; буфер для вывода перевернутого числа
    output2 db 10 dup(0)  ; буфер для вывода числа
    count equ 10
    num: dd 0          ; переменные для хранения чисел
    num_revers: dd 0
    num_numbers: dd 0
    num_sub: dd 0

section .text
    global _start
_start:
    ; Выводим сообщение "кол-во чисел: "
    mov rax, 1          ; системный вызов для записи
    mov rdi, 1          ; файловый дескриптор (stdout)
    mov rsi, msg_3      ; адрес сообщения
    mov rdx, 25         ; длина сообщения
    syscall

    ;  Помещаем кол-во чисел в num_numbers
    mov rdi, 1        ; в RDI - дексриптор вывода в стандартный поток (консоль)
    mov rsi, input    ; в RSI - адрес строки
    mov rdx, count    ; в RDX - длина строки
    mov rax, 0        ; в RAX - номер функции для вывода в поток 
    syscall
    mov rsi, input  ; адрес строки с числом;
    call str_to_int 
    mov [num_numbers], ebx
.main:
    mov ebx, [num_numbers]
    cmp ebx, 0
    je .exit ;выход из программы после num_numbers
    ; Выводим сообщение
    mov rax, 1          ; системный вызов для записи
    mov rdi, 1          ; файловый дескриптор (stdout)
    mov rsi, msg_1      ; адрес сообщения
    mov rdx, 28         ; длина сообщения
    syscall

    ;ввод числа
    mov rdi, 1        ; в RDI - дексриптор вывода в стандартный поток (консоль)
    mov rsi, input    ; в RSI - адрес строки
    mov rdx, count    ; в RDX - длина строки
    mov rax, 0        ; в RAX - номер функции для вывода в поток 
    syscall 

    ;преобразуем введённую строку в int
    mov rsi, input            ; адрес строки с числом;
    call str_to_int           ; вызываем функцию Результат теперь в ebx
    mov [num], ebx            ; 
    

    ; Выводим сообщение 
    mov rax, 1          ; системный вызов для записи
    mov rdi, 1          ; файловый дескриптор (stdout)
    mov rsi, msg_2      ; адрес сообщения
    mov rdx, 36         ; длина сообщения
    syscall

    ; Разворачиваем число и выводим
    call revers
    mov [num_revers], r8d

    ; сравним 2 числа и из большего вычтем меньшее
    mov eax, [num]
    mov ebx, [num_revers]
    cmp eax, ebx
    ja .num_bol_num_revers
    sub ebx, eax
    mov [num_sub], ebx
    jmp .num_revers_bol_num
.num_bol_num_revers:
    sub eax, ebx
    mov [num_sub], eax
.num_revers_bol_num:
    mov rax, 1          ; системный вызов для записи
    mov rdi, 1          ; файловый дескриптор (stdout)
    mov rsi, msg_4      ; адрес сообщения
    mov rdx, 32         ; длина сообщения
    syscall

    ;выведем разницу
    call int_to_string

    mov ebx, [num_numbers]
    sub ebx, 1
    mov [num_numbers], ebx
    jmp .main
.exit:
    ; Завершение программы
    mov rax, 60         ; 60 - номер системного вызова exit 
    xor rdi, rdi        ; код возврата 0
    mov rdi, [num_sub]
    syscall
int_to_string:
    mov eax, [num_sub]      ; Копируем число в eax
    xor ecx, ecx            ; Обнуляем ecx для подсчета длины строки


.top2:
    xor edx, edx            ; Очищаем edx перед делением
    mov ebx, 10             ; Делим на 10
    div ebx                 ; Делим eax на 10, результат в eax, остаток в edx
    add dl, '0'             ; Преобразуем остаток в символ
    mov [output + ecx], dl  ; Сохраняем символ в буфер
    inc ecx                 ; Увеличиваем длину строки
    cmp eax, 0              ; Проверяем, не равно ли число 0
    jne .top2               ; Если не равно 0, продолжаем

.done2:
    ; Теперь копируем строку output в output2 в обратном порядке
    mov r8d, 0              ; Индекс для output2
    mov r9d, ecx            ; Длина строки
    dec r9d                 ; Уменьшаем на 1 для корректного индекса

.new_string:
    cmp r9d, -1             ; Проверяем, достигли ли начала строки
    je .done3               ; Если да, выходим из цикла
    mov dl, [output + r9d]  ; Читаем символ
    mov [output2 + r8d], dl ;

;Сохраняем в output2
    inc r8d                  ; Увеличиваем индекс для output2
    dec r9d                  ; Уменьшаем индекс для output
    jmp .new_string         ; Повторяем

.done3:
    mov byte [output2 + r8d], 10 ; Завершаем строку
    inc r8d
    inc r8d
    ; Теперь можно вывести строку
    mov rax, 1                  ; системный вызов для записи
    mov rdi, 1                  ; файловый дескриптор (stdout)
    mov rsi, output2            ; адрес сообщения
    movsx rdx, r8d                ; длина сообщения
    syscall
    ret

revers:
    mov eax, [num]          ; Копируем число в eax
    xor ecx, ecx          ; Обнуляем ecx для подсчета длины строки
    mov r8d, 0          ; обнуляем r8d для подсчета развёрнутого числа
    mov r9d, 0
    mov r10d, 0          ; Передатчик для регистра eax
.top1:
    cmp eax, 0            ; Проверяем, не равно ли число 0
    je .done1             ; Если равно 0, завершаем цикл

    xor edx, edx          ; Очищаем edx перед делением
    mov ebx, 10           ; Делим на 10
    div ebx               ; Делим eax на 10, результат в eax, остаток в edx

    movzx r9d, dl 

    mov r10d, r8d ; аналог r8d * 10 + dl

    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d
    add r8d, r10d

    add r8d, r9d


    add dl, '0'           ; Преобразуем остаток в символ
    mov [output + ecx], dl ; Сохраняем символ в буфер
    inc ecx               ; Увеличиваем длину строки
    jmp .top1             ; Повторяем

.done1:

    mov byte [output + ecx], 10 ; Завершаем строку
    inc ecx 
    ; Теперь можно вывести строку
    mov rax, 1                  ; системный вызов для записи
    mov rdi, 1                  ; файловый дескриптор (stdout)
    mov rsi, output             ; адрес сообщения
    movsx rdx, ecx               ; длина сообщения
    syscall
    ret
str_to_int:
    xor ebx, ebx        ; обнуляем eax
.top:
    movzx ecx, byte [rsi] ; берем следующий байт
    inc rsi             ; переходим к следующему байту
    cmp ecx, '0'       ; проверяем, не меньше ли '0'
    jb .done
    cmp ecx, '9'       ; проверяем, не больше ли '9'
    ja .done
    sub ecx, '0'       ; преобразуем символ в число
    imul ebx, ebx, 10   ; умножаем eax на 10
    add ebx, ecx        ; добавляем новое число
    jmp .top
.done:
    ret
