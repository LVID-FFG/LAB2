using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Задание №1.2
        Console.WriteLine("задание №1.2");
        string inputString = "abc1231de45f42"; // abc1234def4256gh789ab999c14234def516gh789
        int max = 0;
        int numb = 0;

        for (int i = 0; i < inputString.Length; i++)
        {
            int a = (int)inputString[i];
            if (a >= '0' && a <= '9') // Проверка на цифру
            {
                numb += a - '0';
                Console.Write(a - '0');
                Console.Write(' ');
                Console.WriteLine(numb);
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
        List<int> grad = new List<int> { 0 };
        int steps = 0;
        int leikaOld = 10;
        int leikaNow = leikaOld;
        string str2 = "2 2 3 3 3 5";
        int aF = 0;

        for (int i = 0; i < str2.Length; i++)
        {
            int a = (int)str2[i];
            if (a >= '0' && a <= '9') // Проверка на цифру
            {
                aF = aF * 10 + (a - '0');
            }
            else if (a == ' ')
            {
                grad.Add(aF);
                aF = 0;
            }
        }
        grad.Add(aF); // Добавляем последнее число
        aF = 0;

        // Вывод значений grad
        Console.WriteLine(string.Join(" ", grad));

        int j = 0;
        while (j < grad.Count - 1)
        {
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

        // Вывод значений grad после обработки
        Console.WriteLine(string.Join(" ", grad));
        Console.WriteLine(steps);

        // Задание №3.18
        Console.WriteLine("задание №3.18");
        Console.Write("Кол-во чисел: ");
        int n = int.Parse(Console.ReadLine());
        int num;
        int numR;
        int numTex;

        for (int k = 0; k < n; k++)
        {
            Console.Write("Введите число: ");
            num = int.Parse(Console.ReadLine());
            numTex = num;
            numR = 0;

            while (numTex != 0)
            {
                numR = numR * 10 + (numTex % 10);
                numTex /= 10;
            }

            if (num > numR)
            {
                Console.WriteLine(num - numR);
            }
            else
            {
                Console.WriteLine(numR - num);
            }
        }
    }
}