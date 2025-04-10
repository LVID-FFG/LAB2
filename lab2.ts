// Задание №1.2
console.log("задание №1.2");
const inputString: string = "abc1231de45f42"; // abc1234def4256gh789ab999c14234def516gh789
let max: number = 0;
let numb: number = 0;

for (let i = 0; i < inputString.length; i++) {
    const a: number = inputString.charCodeAt(i);
    if (a >= '0'.charCodeAt(0) && a <= '9'.charCodeAt(0)) { // Проверка на цифру
        numb += a - '0'.charCodeAt(0);
        console.log(a - '0'.charCodeAt(0), " ", numb);
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

// Задание №2.8
console.log("задание №2.8");
let grad: number[] = [0];
let steps: number = 0;
const leikaOld: number = 10;
let leikaNow: number = leikaOld;
const str2: string = "2 2 3 3 3 5";
let aF: number = 0;

for (let i = 0; i < str2.length; i++) {
    const a: number = str2.charCodeAt(i);
    if (a >= '0'.charCodeAt(0) && a <= '9'.charCodeAt(0)) { // Проверка на цифру
        aF = aF * 10 + (a - '0'.charCodeAt(0));
    } else if (a === ' '.charCodeAt(0)) {
        grad.push(aF);
        aF = 0;
    }
}
grad.push(aF); // Добавляем последнее число
aF = 0;

// Вывод значений grad
console.log(grad.join(" "));

let i = 0;
while (i < grad.length - 1) {
    if (leikaNow >= grad[i + 1]) {
        i++;
        leikaNow -= grad[i];
        grad[i] = 0;
        steps++;
    } else {
        while (i > 0) {
            steps += 1;
            i--;
        }
        leikaNow = leikaOld;
    }
}

// Вывод значений grad после обработки
console.log(grad.join(" "));
console.log(steps);

// Задание №3.18
console.log("задание №3.18");
const n: number = parseInt(prompt("Кол-во чисел: ") || "0");
let num: number;
let numR: number;
let numTex: number;

for (let j = 0; j < n; j++) {
    num = parseInt(prompt("Введите число: ") || "0");
    numTex = num;
    numR = 0;

    while (numTex !== 0) {
        numR = numR * 10 + (numTex % 10);
        numTex = Math.floor(numTex / 10);
    }

    if (num > numR) {
        console.log(num - numR);
    } else {
        console.log(numR - num);
    }
}