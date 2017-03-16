#pragma once
#include "Vector.h"
#include "Rayo.h"
#include <iostream>
using namespace std;

class Triangulo
{
	Vector a;
	Vector b;
	Vector c;
public:
	Triangulo();
	Triangulo(Vector, Vector, Vector);
	~Triangulo();
	bool interseccion(Rayo ray);
};

