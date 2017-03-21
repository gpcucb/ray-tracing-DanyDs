#pragma once
#include <iostream>
#include "RGB.h"
using namespace std;

class Render
{
private:
	double width;
	double height;
	RGB background_color;
public:
	Render();
	Render(float, float,RGB(float background_red,float background_green,float background_blue) );
	~Render();
	void reset();
	void calculate_pixel(float i,float j);
	void render(string title, string file_name);
protected:
	void init_gl();
	void draw_scene();
	void reshape();
	void idle();
	void save_image(string file_name);

};

