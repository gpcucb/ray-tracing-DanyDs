#include "RGB.h"

RGB::RGB()
{
}

RGB::RGB(float red, float green, float blue)
{
	this->red = red;
	this->green = green;
	this->blue = blue;
}


RGB::~RGB()
{
}

void RGB::show(){
	cout << "RED: " << red << ", GREEN: " << green << ", BLUE: " << blue << endl;
}
