#include "Triangulo.h"


Triangulo::Triangulo()
{
}

Triangulo::Triangulo(Vector a, Vector b, Vector c)
{
	this->a = a;
	this->b = b;
	this->c = c;
}


Triangulo::~Triangulo()
{
	
}


bool Triangulo::interseccion(Rayo ray)
{
	float t, beta, gama;
	float a,b,c,d,e,f,g,h,i,j,k,l;

	a = this->a.getX() - this->b.getX();
	b = this->a.getY() - this->b.getY();
	c = this->a.getZ() - this->b.getZ();
	d = this->a.getX() - this->c.getX();
	e = this->a.getY() - this->c.getY();
	f = this->a.getZ() - this->c.getZ();

	Vector dir_r, pos_r;
	dir_r = ray.getDireccion();
	pos_r = ray.getPosicion();
	
	g = dir_r.getX();
	h = dir_r.getY();
	i = dir_r.getZ();
	
	j = this->a.getX() - pos_r.getX();
	k = this->a.getY() - pos_r.getY();
	l = this->a.getZ() - pos_r.getZ();

	float M;

	M = a * ( e * i - h * f ) + b * ( g * f - d * i ) + c*( d * h - e * g);

	beta = j *( e * i - h * f) + k *(g * f -d*i) + l *(d * h - e * g );
		beta = beta / M;
		gama = i *( a * k - j * b) + h *( j * c - a * l) + g *( b * l - k * c);
		gama = gama / M;

		t = f *( a * k - j * b) + e *( j * c - a * l) + d *( b * l - k * c);
		t = t / M;
	cout<<"beta: ";
	printf("%.8f",beta);
	cout<<"	gama: ";
	printf("%f",gama);
	cout<<"	t: ";
	printf("%f",t);
	cout<<endl;
	return true;
}