package main

import "fmt"

func main() {
	// задание №1.2-------------------------------------------------------------------------------------
	fmt.Println("задание №1.2")
	var is string = "abc1231de45f42" //abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
	var max int = 0
	var numb int = 0
	for i := 0; i < len(is); i++ {
		a := int(is[i])
		if '0' <= a && a <= '9' { //isdigit(a)
			numb = numb + a - '0'
			fmt.Println(a-'0', " ", numb)
		} else {
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
	for ; i < len(str2); i++ {
		a = int(str2[i])
		if '0' <= a && a < '9' { //isdigit(a)
			a_f = a_f*10 + a - '0'
		} else {
			grad = append(grad, a_f)
			a_f = 0
		}
	}
	grad = append(grad, a_f)
	a_f = 0
	for k := range grad {
		fmt.Print(grad[k], " ")
	}
	fmt.Println()
	for i = 0; i < len(grad)-1; {
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
	for k := range grad {
		fmt.Print(grad[k], " ")
	}
	fmt.Println()
	fmt.Println(steps)

	// №3.18-------------------------------------------------------------------------------------
	fmt.Println("задание №3.18")
	fmt.Println("Кол-во чисел: ")
	var n int = 0
	fmt.Scanln(&n)
	var num int = 0
	var num_r int = 0
	var num_tex int = 0
	var j int
	for j = 0; j < n; j++ {
		fmt.Println("Введите число: ")
		fmt.Scanln(&num)
		num_tex = num
		for num_tex != 0 {
			num_r = num_r*10 + num_tex%10
			num_tex /= 10
		}
		if num > num_r {
			fmt.Println(num - num_r)
		} else {
			fmt.Println(num_r - num)
		}
		num_r = 0
	}
}
