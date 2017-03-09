#include "Camara.h"


Camara::Camara()
{
}

Camara::Camara(Vector e, Vector center, Vector up)
{
	this->e = e;
	this->center = center;
	this->up = up;
}

Camara::~Camara()
{
}

Vector Camara::vectorW(){
	float x,y,z;
	x = e.getX() /e.modulo(e);
	y = e.getY() /e.modulo(e);
	z = e.getZ() /e.modulo(e);
	Vector resp(x,y,z);
	return resp;
}

Vector Camara::vectorU(Vector vw){		
	Vector prod;
	prod = up.prodVectorial(vw);
	float x,y,z;
	x = prod.getX() /prod.modulo(e);
	y = prod.getY() /prod.modulo(e);
	z = prod.getZ() /prod.modulo(e);
	Vector resp(x,y,z);
	return resp;
}

Vector Camara::vectorV(Vector vw, Vector vu){	
	return vw.prodVectorial(vu);
}