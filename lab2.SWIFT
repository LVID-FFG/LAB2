// Задание №1.2
print("Задание №1.2")
let inputString = "abc1231de45f42" // abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
var maxSum = 0
var numb = 0

for char in inputString {
    let a = Int(char.asciiValue!)
    if a >= Int(Character("0").asciiValue!) && a <= Int(Character("9").asciiValue!) { // Проверка на цифру
        numb += a - Int(Character("0").asciiValue!)
        print("\(a - Int(Character("0").asciiValue!)) \(numb)")
    } else {
        if maxSum < numb {
            maxSum = numb
        }
        numb = 0
    }
}

if maxSum < numb {
    maxSum = numb
}
print(maxSum)

// Задание №2.8
print("Задание №2.8")
var grad = [0] // Инициализация массива grad
var steps = 0
let leikaOld = 10
var leikaNow = leikaOld
let str2 = "2 2 3 3 3 5"
var aF = 0

// Обработка строки для извлечения чисел
for char in str2 {
    let a = Int(char.asciiValue!)
    if a >= Int(Character("0").asciiValue!) && a < Int(Character("9").asciiValue!) { // Проверка на цифру
        aF = aF * 10 + (a - Int(Character("0").asciiValue!))
    } else { // Обработка пробела
        grad.append(aF)
        aF = 0
    }
}

// Добавляем последнее число, если оно есть
if aF > 0 {
    grad.append(aF)
}

// Вывод значений grad
var k = 0
while k < grad.count{
    print(grad[k], terminator: " ")
    k += 1
}
print("")
// Логика для подсчета шагов
var i = 0
while i < grad.count - 1 {
    if leikaNow >= grad[i + 1] {
        i += 1
        leikaNow -= grad[i]
        grad[i] = 0
        steps += 1
    } else {
        while i > 0 {
            steps += 1
            i -= 1
        }
        leikaNow = leikaOld
    }
}

// Вывод значений grad после обработки
var j = 0
while j < grad.count{
    print(grad[j], terminator: " ")
    j += 1
}
print("")
// Задание №3.18
print("Задание №3.18")
print("Кол-во чисел: ")
if let n = Int(readLine() ?? "") {
    for _ in 0..<n {
        print("Введите число: ")
        if let input = readLine(), let num = Int(input) {
            var numTex = num
            var numR = 0

            while numTex != 0 {
                numR = numR * 10 + numTex % 10
                numTex /= 10
            }

            if num > numR {
                print(num - numR)
            } else {
                print(numR - num)
            }
        }
    }
}