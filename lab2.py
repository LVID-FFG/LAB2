# Задание №1.2
print("Задание №1.2")
input_string = "abc1231de45f42"  # abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
max_sum = 0
numb = 0
for char in input_string:
    a = ord(char)
    if '0' <= char <= '9':  # Проверка на цифру
        numb += a - ord('0')
        print(a - ord('0'), " ", numb)
    else:
        if max_sum < numb:
            max_sum = numb
        numb = 0

if max_sum < numb:
    max_sum = numb
print(max_sum)

# Задание №2.8
print("Задание №2.8")
grad = [0]  # Инициализация списка grad
steps = 0
leika_old = 10
leika_now = leika_old
str2 = "2 2 3 3 3 5"
a_f = 0

# Обработка строки для извлечения чисел
for char in str2:
    a = ord(char)
    if '0' <= char <= '9':  # Проверка на цифру
        a_f = a_f * 10 + (a - ord('0'))
    elif char == ' ':  # Обработка пробела
        grad.append(a_f)
        a_f = 0

# Добавляем последнее число, если оно есть
if a_f > 0:
    grad.append(a_f)

# Вывод значений grad
print(" ".join(map(str, grad)))

# Логика для подсчета шагов
i = 0
while i < len(grad) - 1:
    if leika_now >= grad[i + 1]:
        i += 1
        leika_now -= grad[i]
        grad[i] = 0
        steps += 1
    else:
        while i > 0:
            steps += 1
            i -= 1
        leika_now = leika_old

# Вывод значений grad после обработки
print(" ".join(map(str, grad)))
print(steps)

# Задание №3.18
print("Задание №3.18")
n = int(input("Кол-во чисел: "))
for j in range(n):
    num = int(input("Введите число: "))
    num_tex = num
    num_r = 0

    while num_tex != 0:
        num_r = num_r * 10 + num_tex % 10
        num_tex //= 10

    if num > num_r:
        print(num - num_r)
    else:
        print(num_r - num)

