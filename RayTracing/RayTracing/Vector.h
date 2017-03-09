#ifndef VECTOR_H
#define VECTOR_H
#include <iostream>
#include <math.h>
using namespace std;

class Vector
{
private:
	float x;
	float y;
	float z;
public:
	Vector();
	Vector(float x, float y, float z);
	float getX() { return x;}
	float getY() { return y;}
	float getZ() { return z;}
	void setX(float x) { this->x = x;}
	void setY(float y) { this->y = y;}
	void setZ(float z) { this->z = z;}
	~Vector();
	void show();
	Vector suma(Vector v);
	Vector resta(Vector v);
	float modulo(Vector v);
	Vector prodVectorial(Vector v); 
	float prodEscalar(Vector v);
};

#endif