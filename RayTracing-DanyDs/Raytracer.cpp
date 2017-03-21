#include "Raytracer.h"


Raytracer::Raytracer()
{
	nx = width;
	ny = height;

	/*
	 e= Vector.new(278,273,-800)
    center= Vector.new(278,273,-700)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    # Sphere values
    position = Vector.new(370,120,370)
    radius = 120

    @sphere = Sphere.new(position, radius)
    @objects=[]
    @objects << @sphere

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