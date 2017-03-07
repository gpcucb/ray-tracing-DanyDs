#include "RGB.h"
#include "Vector.h"
#include "Rayo.h"

int main(){
	//inicializacones
	RGB rgb;
	RGB rgb_lleno(12.343, 123.23, 342.342);
	Vector v1(13.12, 25.26, 45.10);
	Vector v2(24.10, 13.58, 81.78);
	Vector vPrueba;
	Rayo rayo(v1,v2);

	//RGB Pruebas
	cout << "---------RGB pruebas------" << endl;
	cout << "RGB -> ";
	rgb_lleno.show();


	//Vector Pruebas
	cout << "---------Vector pruebas------" << endl;
	cout << "V1 -> ";
	v1.show();
	cout << "V2 -> ";
	v2.show();
	cout << "Suma de V1 + V2 -> ";
	vPrueba = v1.suma(v2);
	vPrueba.show();

	cout << "Resta de V1 + V2 -> ";
	vPrueba = v1.resta(v2);
	vPrueba.show();

	//Rayo Pruebas
	cout << "---------Rayo pruebas------" << endl;
	rayo.show();

	return 0;
}