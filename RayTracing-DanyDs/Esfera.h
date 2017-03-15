#pragma once
#include "Rayo.h"
#include <math.h>
#include "Camara.h"
#include <iostream>
using namespace std;
class Esfera
{
private:
	float radio;
	Vector centro;	

public:
	Esfera();
	Esfera(Vector, float);
	~Esfera();
	bool interseccion(Rayo, float );
	float discriminante(float a, float b, float c);
	float solucionCuadraticaSum(int a, int b, int c);
	float solucionCuadraticaRes(int a, int b, int c);
};

