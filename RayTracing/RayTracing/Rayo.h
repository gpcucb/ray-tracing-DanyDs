#ifndef RAYO_H
#define RAYO_H
#include "Vector.h"
class Rayo
{
private:
	Vector posicion;
	Vector direccion;
public:
	Rayo();
	Rayo(Vector posicion, Vector Direccion);
	~Rayo();
	void show();
	Vector direccionRayo(int i, int j, int nx, int ny);
};

#endif