#ifndef VECTOR_H
#define VECTOR_H
#include <iostream>
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
	~Vector();
	void show();
	Vector suma(Vector v);
	Vector resta(Vector v);
};

#endif