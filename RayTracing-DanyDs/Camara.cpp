#include "Camara.h"


Camara::Camara()
{
}

Camara::Camara(Vector e, Vector center, Vector up, float fov, float df)
{
	this->e = e;
	this->center = center;
	this->up = up;
	this->fov = fov;
	this->df = df;
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

Vector Camara::direccionRayo(int i, int j, int nx, int ny){
	Vector vecv, vecw, vecu;
	vecw = vectorW();
	vecu = vectorU(vecw);
	vecv = vectorV(vecw, vecu);

	float t, b, r, l;
	float u,v;
	Vector dw, uu, vv;	

	t = df * tan(fov/2);
	b = -t;
	r = (t * nx)/ny;
	l = -r;
	
	u = l + ((r - l) * (i + 0.5))/nx;
	v = r + ((t - b) * (i + 0.5))/ny;

	dw = vecw.prodPorNumero(-df);
	uu = vecu.prodPorNumero(u);
	vv = vecv.prodPorNumero(v);

	return (dw.suma(uu).suma(vv));
}