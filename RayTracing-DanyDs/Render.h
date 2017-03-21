#ifndef RENDER_H
#define RENDER_H
#include <iostream>
#include "RGB.h"
using namespace std;


class Render
{
protected:
	double width;
	double height;
	RGB background_color;
	float x_pos;
	float y_pos;
	bool is_drawing;
	
public:
	Render();
	Render(float, float,float background_red,float background_green,float background_blue);
	~Render();
	void reset();
	RGB calculate_pixel(float i,float j);
	void render(string title, string file_name);
protected:
	void init_gl();
	void draw_scene();
	void reshape(float width, float height);
	void idle();
	void save_image(string file_name);

};

#endif