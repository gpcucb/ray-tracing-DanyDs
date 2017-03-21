#include "Raytracer.h"


Raytracer::Raytracer()
{
	nx = width;
	ny = height;

	/*


	*/
}


Raytracer::~Raytracer()
{
}


RGB Raytracer::calculate_pixel(float i, float j){
	/*
	 e = @camera.e
    dir = @camera.ray_direction(i,j,@nx,@ny)
    ray = Ray.new(e, dir)
    t = Float::INFINITY

    @obj_int = nil
    @objects.each do |obj|
      intersection = obj.intersection?(ray, t)
      if intersection.successful?
        @obj_int = obj
      end
    end
    if @obj_int==nil
      color = Rgb.new(0.0,0.0,0.0)
    else
      color =  Rgb.new(1.0,1.0,0.0)
    end

    return {red: color.r, green: color.g, blue: color.b}
  end

	*/
	return RGB(0.0,0.0,0.0);
}