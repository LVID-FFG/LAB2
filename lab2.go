package main

import "fmt"

func main() {
	// задание №1.2-------------------------------------------------------------------------------------
	fmt.Println("задание №1.2")
	var is string = "abc1231de45f42" // входящая строка
	var max int = 0
	var numb int = 0
	for i := 0; i < len(is); i++ {
		a := int(is[i])           // а принимает значения из строки и преобразует их в целое число
		if '0' <= a && a <= '9' { // если число, сумируется
			numb = numb + a - '0'
		} else { // иначе сравнивается с максимумом
			if max < numb {
				max = numb
			}
			numb = 0
		}
	}
	if max < numb {
		max = numb
	}
	fmt.Println(max)

	// задание №2.8-------------------------------------------------------------------------------------
	fmt.Println("задание №2.8")
	var grad = []int{0}
	var steps int = 0
	var leika_old int = 10
	var leika_now int = leika_old
	var str2 string = "2 2 3 3 3 5"
	var i int = 0
	var a_f int = 0
	var a int = 0
	for ; i < len(str2); i++ { // заполняем грядку числами из строки
		a = int(str2[i])
		if '0' <= a && a <= '9' {
			a_f = a_f*10 + a - '0'
		} else {
			grad = append(grad, a_f)
			a_f = 0
		}
	}
	grad = append(grad, a_f)
	a_f = 0
	for k := range grad { // вывод значений грядки
		fmt.Print(grad[k], " ")
	}
	fmt.Println()
	for i = 0; i < len(grad)-1; { // шагаем по грядке пока не достигнем конца, если воды хватает поливаем и идём вперёд, иначе возвращаемся в конец
		if leika_old < grad[i+1] {
			fmt.Println("Ошибка")
			return
		}
		if leika_now >= grad[i+1] {
			i++
			leika_now = leika_now - grad[i]
			grad[i] = 0
			steps++
		} else {
			for i != 0 {
				steps += 1
				i--
			}
			leika_now = leika_old
		}
	}
	fmt.Println(steps)

	// №3.18-------------------------------------------------------------------------------------
	fmt.Println("задание №3.18")
	fmt.Println("Кол-во чисел: ")
	var n int = 0
	fmt.Scanln(&n) // ввод из консоли
	var num int = 0
	var num_r int = 0
	var num_tex int = 0
	var j int
	for j = 0; j < n; j++ {
		fmt.Println("Введите число: ")
		fmt.Scanln(&num)
		num_tex = num
		for num_tex != 0 { // переварот числа
			num_r = num_r*10 + num_tex%10
			num_tex /= 10
		}
		if num > num_r { // вывод модуля разности
			fmt.Println(num - num_r)
		} else {
			fmt.Println(num_r - num)
		}
		num_r = 0
	}
}
