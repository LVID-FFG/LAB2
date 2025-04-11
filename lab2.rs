use std::io;

fn main() {
    // Задание №1.2
    println!("Задание №1.2");
    let string = "abc1231de45f42"; // введённая строка
    let mut max_sum = 0;
    let mut numb = 0;

    for char in string.chars() {
        let a = char as u8; // преобразование в целое число (8 бит безнаковое)
        if ('0' as u8 <= a && a <= '9' as u8) { // Проверка на цифру
            numb += (a - '0' as u8) as i32;
        } else {
            if max_sum < numb {
                max_sum = numb;
            }
            numb = 0;
        }
    }
    
    if max_sum < numb {
        max_sum = numb;
    }
    println!("{}", max_sum);

    // Задание №2.8
    println!("Задание №2.8");
    let mut grad = vec![0]; // Инициализация вектора grad
    let mut steps = 0;
    let leika_old = 10;
    let mut leika_now = leika_old;
    let str2 = "2 2 3 3 3 5";
    let mut a_f = 0;

    // Обработка строки для извлечения чисел
    for char in str2.chars() {
        let a = char as u8;
        if ('0' as u8 <= a && a < '9' as u8) { // Проверка на цифру
            a_f = a_f * 10 + (a - '0' as u8) as i32;
        } else if char == ' ' { // Обработка пробела
            grad.push(a_f);
            a_f = 0;
        }
    }
    
    // Добавляем последнее число, если оно есть
    if a_f > 0 {
        grad.push(a_f);
    }

    // Вывод значений grad с помощью цикла
    for &g in &grad {
        print!("{} ", g);
    }
    println!();

    // Логика для подсчета шагов
    let mut i = 0;
    while i < grad.len() - 1 {
        if leika_old < grad[i + 1]{
            println!("Ошибка");
            return;
        }
        if leika_now >= grad[i + 1] {
            i += 1;
            leika_now -= grad[i];
            grad[i] = 0;
            steps += 1;
        } else {
            while i > 0 {
                steps += 1;
                i -= 1;
            }
            leika_now = leika_old;
        }
    }

    // Вывод значений grad после обработки
    println!("{}", steps);

    // Задание №3.18
    println!("Задание №3.18");
    println!("Кол-во чисел: ");
    let mut n = String::new(); //инициализация n как строки
    io::stdin().read_line(&mut n); //ввод в строку n
    let n: usize = n.trim().parse().unwrap(); // преобразование n в число
    
    for s in 0..n {
        println!("Введите число: ");
        let mut num = String::new();
        io::stdin().read_line(&mut num);
        let num: i32 = num.trim().parse().unwrap();
        let mut num_tex = num;
        let mut num_r = 0;

        while num_tex != 0 {
            num_r = num_r * 10 + num_tex % 10;
            num_tex /= 10;
        }

        if num > num_r {
            println!("{}", num - num_r);
        } else {
            println!("{}", num_r - num);
        }
    }
}