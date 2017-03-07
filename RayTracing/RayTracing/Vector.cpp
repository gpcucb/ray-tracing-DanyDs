#include "Vector.h"

Vector::Vector()
{
}

Vector::Vector(float x, float y, float z){
	this->x = x;
	this->y = y;
	this->z = z;
}

Vector::~Vector()
{
}

Vector Vector::suma(Vector vector){
	Vector vr;
	vr.x = this->x + vector.x;
	vr.y = this->y + vector.y;
	vr.z = this->z + vector.z;
	return vr;
}

Vector Vector::resta(Vector vector){
	Vector vr;
	vr.x = this->x - vector.x;
	vr.y = this->y - vector.y;
	vr.z = this->z - vector.z;
	return vr;
}

void Vector::show(){
	cout << "X: " << this->x << ", Y: " << this->y << ", Z: " << this->z << endl;
}
