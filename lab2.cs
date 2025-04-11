using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Задание №1.2
        Console.WriteLine("задание №1.2");
        string inputString = "abc1231de45f42"; // введённая строка
        int max = 0;
        int numb = 0;

        for (int i = 0; i < inputString.Length; i++)
        {
            int a = (int)inputString[i]; // а принимает значения из строки и преобразует их в целое число
            if (a >= '0' && a <= '9') // Проверка на цифру
            {
                numb += a - '0';
            }
            else
            {
                if (max < numb)
                {
                    max = numb;
                }
                numb = 0;
            }
        }
        if (max < numb)
        {
            max = numb;
        }
        Console.WriteLine(max);

        // Задание №2.8
        Console.WriteLine("задание №2.8");
        List<int> grad = new List<int> { 0 }; // список чисел аналог вектора в c++
        int steps = 0;
        int leikaOld = 10;
        int leikaNow = leikaOld;
        string str2 = "2 2 3 3 3 5";
        int aF = 0; // переменная для заполнения grad

        for (int i = 0; i < str2.Length; i++)
        {
            int a = (int)str2[i];
            if (a >= '0' && a <= '9') // Проверка на цифру
            {
                aF = aF * 10 + (a - '0');
            }
            else
            {
                grad.Add(aF);
                aF = 0;
            }
        }
        grad.Add(aF); // Добавляем последнее число
        aF = 0;

        // Вывод значений grad
        Console.WriteLine(string.Join(" ", grad));
        // шагаем по грядке пока не достигнем конца, если воды хватает поливаем и идём вперёд, иначе возвращаемся в конец
        int j = 0;
        while (j < grad.Count - 1)
        {
            if (leikaOld < grad[j+1])
            {
                Console.Write("Ошибка");
                return;
            }
            if (leikaNow >= grad[j + 1])
            {
                j++;
                leikaNow -= grad[j];
                grad[j] = 0;
                steps++;
            }
            else
            {
                while (j > 0)
                {
                    steps += 1;
                    j--;
                }
                leikaNow = leikaOld;
            }
        }

        // Вывод значений 
        Console.WriteLine(steps);

        // Задание №3.18
        Console.WriteLine("задание №3.18");
        Console.Write("Кол-во чисел: ");
        int n = int.Parse(Console.ReadLine()); //ввoд из консоли преобразованый в целое число
        int num;
        int numR;
        int numTex;

        for (int k = 0; k < n; k++)
        {
            Console.Write("Введите число: ");
            num = int.Parse(Console.ReadLine());
            numTex = num;
            numR = 0;

            while (numTex != 0) // переворот числа
            {
                numR = numR * 10 + (numTex % 10);
                numTex /= 10;
            }

            if (num > numR) // вывод модуля числа
            {
                Console.WriteLine(num - numR);
            }
            else
            {
                Console.WriteLine(numR - num);
            }
        }
    }