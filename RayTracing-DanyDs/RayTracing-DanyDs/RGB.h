#ifndef RGB_H
#define RGB_H
#include <iostream>
using namespace std;
class RGB
{
private:
	float red;
	float green;
	float blue;
public:
	RGB();
	RGB(float red, float green, float blue);
	~RGB();
	void show();
};

#endif