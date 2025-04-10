# Задание №1.2
puts "Задание №1.2"
str = "abc1231de45f42"  # abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
max_sum = 0
numb = 0

str.each_char do |char|
  a = char.ord
  if ('0'.ord <= a && a <= '9'.ord) # Проверка на цифру
    numb += a - '0'.ord
    puts "#{a - '0'.ord} #{numb}"
  else
    max_sum = [max_sum, numb].max
    numb = 0
  end
end

max_sum = [max_sum, numb].max
puts max_sum
# Задание №2.8
puts "Задание №2.8"
grad = [0] # Инициализация массива grad
steps = 0
leika_old = 10
leika_now = leika_old
str2 = "2 2 3 3 3 5"
a_f = 0

# Обработка строки для извлечения чисел
str2.each_char do |char|
  a = char.ord
  if ('0'.ord <= a && a < '9'.ord) # Проверка на цифру
    a_f = a_f * 10 + (a - '0'.ord)
  elsif char == ' ' # Обработка пробела
    grad << a_f
    a_f = 0
  end
end

# Добавляем последнее число, если оно есть
grad << a_f if a_f > 0

# Вывод значений grad
puts grad.join(" ")

# Логика для подсчета шагов
i = 0
while i < grad.length - 1
  if leika_now >= grad[i + 1]
    i += 1
    leika_now -= grad[i]
    grad[i] = 0
    steps += 1
  else
    while i > 0
      steps += 1
      i -= 1
    end
    leika_now = leika_old
  end
end

# Вывод значений grad после обработки
puts grad.join(" ")
puts steps

# Задание №3.18
puts "Задание №3.18"
print "Кол-во чисел: "
n = gets.to_i
(0...n).each do |j|
  print "Введите число: "
  num = gets.to_i
  num_tex = num
  num_r = 0

  while num_tex != 0
    num_r = num_r * 10 + num_tex % 10
    num_tex /= 10
  end

  if num > num_r
    puts num - num_r
  else
    puts num_r - num
  end
end