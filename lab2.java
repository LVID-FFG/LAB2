import java.util.ArrayList;
import java.util.Scanner;

public class lab2 {
    public static void main(String[] args) {
        // задание №1.2-------------------------------------------------------------------------------------
        System.out.println("задание №1.2");
        String is = "abc1231def42"; // abc1234def4256gh789ab999c14234def516gh789abc12314def56gh789
        int max = 0;
        int numb = 0;

        for (int i = 0; i < is.length(); i++) {
            char a = is.charAt(i);
            if ( '0' <= a && a <= '9') {
                numb += a - '0';
                System.out.println(a - '0' + " " + numb);
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
        System.out.println(max);
        // задание №2.8-------------------------------------------------------------------------------------
        System.out.println("Задание  №2.8");
        
        ArrayList<Integer> grad = new ArrayList<>(); // Инициализация списка grad
        grad.add(0);
        
        int steps = 0;
        int leika_old = 10;
        int leika_now = leika_old;
        String str2 = "2 2 3 3 3 5";
        int a_f = 0;

        // Обработка строки для извлечения чисел
        for (int i = 0; i < str2.length(); i++) {
            char a = str2.charAt(i);
            if ( '0' <= a &&  a <= '9') {
                a_f = a_f * 10 + (a - '0');
            } else if (a == ' ') { // Обработка пробела
                if (a_f > 0) {
                    grad.add(a_f);
                    a_f = 0;
                }
            }
        }
        // Добавляем последнее число, если оно есть
        if (a_f > 0) {
            grad.add(a_f);
        }

        // Вывод значений grad
        for (int k : grad) {
            System.out.print(k + " ");
        }
        System.out.println();

        // Логика для подсчета шагов
        int i = 0; // Переменная i должна быть инициализирована
        while (i < grad.size() - 1) {
            if (leika_now >= grad.get(i + 1)) {
                i++;
                leika_now -= grad.get(i);
                grad.set(i, 0);
                steps++;
            } else {
                while (i > 0) {
                    steps++;
                    i--;
                }
                leika_now = leika_old;
            }
        }

        // Вывод значений grad после обработки
        for (int k : grad) {
            System.out.print(k + " ");
        }
        System.out.println();
        System.out.println(steps);
        // №3.18-------------------------------------------------------------------------------------
        System.out.println("Задание  №3.18");
        Scanner scanner = new Scanner(System.in);
        System.out.println("Кол-во чисел: ");
        int n = scanner.nextInt();
        int num;
        int num_r;
        int num_tex;
        
        for (int j = 0; j < n; j++) {
            System.out.println("Введите число: ");
            num = scanner.nextInt();
            num_tex = num;
            num_r = 0;

            while (num_tex != 0) {
                num_r = num_r * 10 + num_tex % 10;
                num_tex /= 10;
            }

            if (num > num_r) {
                System.out.println(num - num_r);
            } else {
                System.out.println(num_r - num);
            }
        }
        scanner.close();
    }
}