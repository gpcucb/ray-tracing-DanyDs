#pragma once

#include "Vector.h"

class Camara
{
private:
	Vector e;
	Vector center;
	Vector up;
	float fov;
	float df;
public:
	Camara();
	Camara(Vector, Vector, Vector, float,  float);
	~Camara();
	Vector vectorW();
	Vector vectorU(Vector vw);
	Vector vectorV(Vector vw, Vector vu);
	Vector direccionRayo(int i, int j, int nx, int ny);
};

