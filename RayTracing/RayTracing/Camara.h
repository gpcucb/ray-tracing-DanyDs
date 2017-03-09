#pragma once

#include "Vector.h"

class Camara
{
private:
	Vector e;
	Vector center;
	Vector up;
public:
	Camara();
	Camara(Vector, Vector, Vector);
	~Camara();
	Vector vectorW();
	Vector vectorU(Vector vw);
	Vector vectorV(Vector vw, Vector vu);
};

