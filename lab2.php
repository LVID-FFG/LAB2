<?php

// Задание №1.2-------------------------------------------------------------------------------------
echo "задание №1.2\n";
$is = "abc1231de45f42"; // введённая строка
$max = 0;
$numb = 0;

for ($i = 0; $i < strlen($is); $i++) {
    $a = ord($is[$i]);
    if ($a >= ord('0') && $a <= ord('9')) { // Проверка на цифру
        $numb += $a - ord('0');
    } else {
        if ($max < $numb) {
            $max = $numb;
        }
        $numb = 0;
    }
}
if ($max < $numb) {
    $max = $numb;
}
echo $max . "\n";

// Задание №2.8-------------------------------------------------------------------------------------
echo "задание №2.8\n";
$grad = [0]; 
$steps = 0;
$leika_old = 10;
$leika_now = $leika_old;
$str2 = "2 2 3 3 3 5";
$a_f = 0;

for ($i = 0; $i < strlen($str2); $i++) {
    $a = ord($str2[$i]); //преобразование в целое число
    if ($a >= ord('0') && $a <= ord('9')) { // Проверка на цифру
        $a_f = $a_f * 10 + ($a - ord('0'));
    } else if ($a == ord(' ')) {
        $grad[] = $a_f;
        $a_f = 0;
    }
}
$grad[] = $a_f; // Добавляем последнее число
$a_f = 0;

// Вывод значений grad
echo implode(" ", $grad) . "\n"; // объединение масива в строку с разделителем " " и вывод
// подсчет шагов
$i = 0;
while ($i < count($grad) - 1) {
    if ($leika_old < $grad[$i + 1]){
        echo "Ошибка";
        exit();
    }
    if ($leika_now >= $grad[$i]) {
        $i++;
        $leika_now -= $grad[$i];
        $grad[$i] = 0;
        $steps++;
    } else {
        while ($i > 0) {
            $steps++;
            $i--;
        }
        $leika_now = $leika_old;
    }
}

// Вывод значений grad после обработки
echo $steps . "\n";

// Задание №3.18-------------------------------------------------------------------------------------
echo "задание №3.18\n";
echo "Кол-во чисел: \n";
$n = intval(trim(fgets(STDIN))); //вызов ввода
$num = 0;
$num_r = 0;

for ($j = 0; $j < $n; $j++) {
    echo "Введите число: \n";
    $num = intval(trim(fgets(STDIN)));
    $num_tex = $num;
    $num_r = 0;

    while ($num_tex != 0) {
        $num_r = $num_r * 10 + ($num_tex % 10);
        $num_tex = intval($num_tex / 10);
    }

    if ($num > $num_r) {
        echo ($num - $num_r) . "\n";
    } else {
        echo ($num_r - $num) . "\n";
    }
}
?>