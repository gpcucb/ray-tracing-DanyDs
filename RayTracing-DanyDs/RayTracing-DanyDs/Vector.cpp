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

float Vector::modulo(Vector v){
	float resp;
	resp = sqrt(pow(v.x,2) + pow(v.y,2) + pow(v.z,2));  
	return resp;
}

Vector Vector::prodVectorial(Vector v){
	Vector resp;
	resp.x = (this->y * v.z - this->z * v.y);
	resp.y = (this->z * v.x - this->x * v.z);
	resp.z = (this->x * v.y - this->y * v.x);
	return resp;
}
float Vector::prodEscalar(Vector v){
	float i, j, k;
	i = this->x * v.x;
	j = this->y * v.y;
	k = this->z * v.z;
	return i+j+k;
}

Vector Vector::prodPorNumero(int num){
	float i, j, k;	
	i = this->x * num;
	j = this->y * num;
	k = this->z * num;
	Vector resp(i,j,k);
	return resp;
}







