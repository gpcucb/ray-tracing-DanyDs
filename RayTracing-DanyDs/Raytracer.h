#ifndef RAYTRACER_H
#define RAYTRACER_H
#include "Camara.h"
#include "Vector.h"
#include "RGB.h"
#include "Render.h"

class Raytracer:Render
{
	Camara camera;
	float nx;
	float ny;
public:
	Raytracer();
	~Raytracer();
	RGB calculate_pixel(float i, float j);
};
#endif
