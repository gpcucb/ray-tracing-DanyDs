#include "Esfera.h"


Esfera::Esfera()
{
}


Esfera::Esfera(Vector v, float radio)
{
	this->centro = v;
	this->radio = radio;
}

Esfera::~Esfera()
{
}

float Esfera::discriminante(float a, float b, float c){
	return pow(b,2) - 4 * a *c;
}

float Esfera::solucionCuadraticaSum(int a, int b, int c){
	float resp;
	resp = (-b + sqrt(discriminante(a,b,c)))/(2*a);
	return resp;
}

float Esfera::solucionCuadraticaRes(int a, int b, int c){
	float resp;
	resp = (-b - sqrt(discriminante(a,b,c)))/(2*a);
	return resp;
}

bool Esfera::interseccion(Rayo ray, float radio){
	Camara cam;
	float a,b,c;
	Vector d,e;
	d = ray.getDireccion();
	a = d.prodEscalar(d);

	e = ray.getPosicion();

	b = d.prodPorNumero(2).prodEscalar(e.resta(this->centro));

	c = e.resta(this->centro).prodEscalar(e.resta(this->centro));		

	cout<<"a: ";
	printf("%.8f",a);
	cout<<"	b: ";
	printf("%f",b);
	cout<<"	c: ";
	printf("%f",c);
	cout<<endl;
	return true;
}