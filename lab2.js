// Задание №1.2-------------------------------------------------------------------------------------
console.log("Задание №1.2");
let str = "abc1231def42"; // введённая строка
let max = 0;
let numb = 0;

for (let i = 0; i < str.length; i++) {
    let a = str.charAt(i);
    if ('0' <= a && a <= '9') {
        numb += parseInt(a);
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

// шагаем по грядке пока не достигнем конца, если воды хватает поливаем и идём вперёд, иначе возвращаемся в конец
let i = 0;
while (i < grad.length - 1) {
    if (leikaOld < grad[i+1]){
        console.log("Ошибка");
        throw 0;
    }
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

// Вывод значений
console.log(steps);
// Задание №3.18-------------------------------------------------------------------------------------
console.log("Задание №3.18");
console.log("Кол-во чисел: ");
let n = parseInt(prompt()); //ввод и преобразование полученного в int
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