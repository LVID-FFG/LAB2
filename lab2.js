// Задание №1.2-------------------------------------------------------------------------------------
console.log("Задание №1.2");
let str = "abc1231def42"; // abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
let max = 0;
let numb = 0;

for (let i = 0; i < str.length; i++) {
    let a = str.charAt(i);
    if ('0' <= a && a <= '9') {
        numb += parseInt(a);
        console.log(parseInt(a) + " " + numb);
    } else {
        if (max < numb) {
            max = numb;
        }
        numb = 0;
    }
}
if (max < numb) {
    max = numb;
}
console.log(max);
// Задание №2.8-------------------------------------------------------------------------------------
console.log("Задание №2.8");

let grad = [0]; // Инициализация списка grad
let steps = 0;
let leikaOld = 10;
let leikaNow = leikaOld;
let str2 = "2 2 3 3 3 5";
let a_f = 0;

// Обработка строки для извлечения чисел
for (let i = 0; i < str2.length; i++) {
    let a = str2.charAt(i);
    if ('0' <= a && a <= '9') {
        a_f = a_f * 10 + (parseInt(a));
    } else if (a === ' ') { // Обработка пробела
        if (a_f > 0) {
            grad.push(a_f);
            a_f = 0;
        }
    }
}
// Добавляем последнее число, если оно есть
if (a_f > 0) {
    grad.push(a_f);
}

// Вывод значений grad
console.log(grad.join(" "));

// Логика для подсчета шагов
let i = 0; // Переменная i должна быть инициализирована
while (i < grad.length - 1) {
    if (leikaNow >= grad[i + 1]) {
        i++;
        leikaNow -= grad[i];
        grad[i] = 0;
        steps++;
    } else {
        while (i > 0) {
            steps++;
            i--;
        }
        leikaNow = leikaOld;
    }
}

// Вывод значений grad после обработки
console.log(grad.join(" "));
console.log(steps);
// Задание №3.18-------------------------------------------------------------------------------------
console.log("Задание №3.18");
console.log("Кол-во чисел: ");
let n = parseInt(prompt());
let num;
let numR;
let numTex;

for (let j = 0; j < n; j++) {
    console.log("Введите число: ");
    num = parseInt(prompt());
    numTex = num;
    numR = 0;

    while (numTex !== 0) {
        numR = numR * 10 + numTex % 10;
        numTex = Math.floor(numTex / 10);
    }

    if (num > numR) {
        console.log(num - numR);
    } else {
        console.log(numR - num);
    }
}