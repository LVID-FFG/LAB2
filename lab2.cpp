#include <iostream>
#include <sstream>
#include <vector>
using namespace std;
int main(){
	setlocale(LC_ALL, "");

	// задание №1.2-------------------------------------------------------------------------------------
	cout << "задание №1.2" << endl;
	istringstream is {"abc1231de45f42"}; // входящая строка
	char a;
	int max = 0;
	int numb = 0;
    while (is >> a) {
        if ('0' <= a && a <= '9') { //если число то сложить  
            numb += a - '0';
        }
		else { //иначе сравниваем с максимальной суммой и сбрасываем сумму
			if (max < numb) {
				max = numb;
			}
			numb = 0;
		}
    }
	if (max < numb) { //проверка последней суммы
		max = numb;
	}
	cout << max << endl;

	// задание №2.8-------------------------------------------------------------------------------------
	cout << "задание №2.8" << endl;
	vector<int> grad = {0}; // вектор "грядка"
	int steps = 0; // шаги
	int leika_old = 10; // объём лейки
	int leika_now = leika_old; // текущее кол-во воды в лейке
	istringstream str2{"6 1 1 1 4 2 3 4"}; // потребности цветов в воде
	int b = 0;
	cout << "0" << " ";
	while (str2 >> b) { // поместим цветы в грядку
		grad.push_back(b);
		cout << b << " ";
	}
	cout << endl;
	for (int i = 0; i < size(grad)-1;) { // шагаем по грядке пока не достигнем конца
        if (leika_old < grad[i+1]){
			cout << "Ошибка" << endl;
            return 0;
        }
		if (leika_now >= grad[i + 1]) { // если воды хватает поливаем и идём вперёд
			i++;
			leika_now -= grad[i];
			grad[i] = 0;
			steps += 1;
		}
		else { // иначе возвращаемся в конец
			while (i != 0) {
				steps += 1;
				i--;
			}
			leika_now = leika_old;
		}
	}
	cout << steps << endl;

	// №3.18-------------------------------------------------------------------------------------
	cout << "задание №3.18" << endl;
	cout << "Кол-во чисел: ";
	int n = 0;
	cin >> n; // запрашиваем кол-во чисел
	int num = 0; // введённое число
	int num_r = 0; // перевёрнутое число
	int num_tex = 0; // техническое число (нужно чтобы найти num_r и сохранить num)
	for (int i = 0; i < n; i++) {
		cout << "Введите число: " << endl;
		cin >> num;
		num_tex = num;
		while (num_tex != 0) {
			num_r = num_r * 10 + num_tex % 10;
			num_tex /= 10;
		}
		if (num > num_r) {
			cout << num - num_r << endl;
		}
		else {
			cout << num_r - num << endl;
		}
		num_r = 0;
	}
	
}