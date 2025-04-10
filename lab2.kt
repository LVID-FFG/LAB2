fun main() {
    // Задание №1.2
    println("Задание №1.2")
    val inputString = "abc1231de45f42" //abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
    var max = 0
    var numb = 0

    for (char in inputString) {
        val a = char.toInt()
        if (a in '0'.toInt()..'9'.toInt()) { // Проверка на цифру
            numb += a - '0'.toInt()
            println("${a - '0'.toInt()} $numb")
        } else {
            if (max < numb) {
                max = numb
            }
            numb = 0
        }
    }
    if (max < numb) {
        max = numb
    }
    println(max)
    //Задание №2.8
    println("Задание №2.8")
    val grad = mutableListOf(0) // Инициализация списка grad
    var steps = 0
    val leika_old = 10
    var leika_now = leika_old
    val str2 = "2 2 3 3 3 5"
    var a_f = 0

    // Обработка строки для извлечения чисел
    for (char in str2) {
        val a = char.toInt()
        if (a in '0'.toInt()..'9'.toInt()) { // Проверка на цифру
            a_f = a_f * 10 + (a - '0'.toInt())
        } else if (a == ' '.toInt()) { // Обработка пробела
            if (a_f > 0) {
                grad.add(a_f)
                a_f = 0
            }
        }
    }
    if (a_f > 0) {
        grad.add(a_f)
    }

    // Вывод значений grad
    println(grad.joinToString(" "))

    // Логика для подсчета шагов
    var i = 0
    while (i < grad.size - 1) {
        if (leika_now >= grad[i + 1]) {
            i++
            leika_now -= grad[i]
            grad[i] = 0
            steps++
        } else {
            while (i > 0) {
                steps++
                i--
            }
            leika_now = leika_old
        }
    }

    // Вывод значений grad после обработки
    println(grad.joinToString(" "))
    println(steps)
    // Задание №3.18
    println("Задание №3.18")
    println("Кол-во чисел: ")
    val n = readLine()!!.toInt()
    var num: Int
    var numR: Int
    var numTex: Int

    for (j in 0 until n) {
        println("Введите число: ")
        num = readLine()!!.toInt()
        numTex = num
        numR = 0

        while (numTex != 0) {
            numR = numR * 10 + numTex % 10
            numTex /= 10
        }

        if (num > numR) {
            println(num - numR)
        } else {
            println(numR - num)
        }
    }
}