require_relative 'renderer.rb'
require_relative 'camera.rb'
require_relative 'vector.rb'
require_relative 'rgb.rb'
require_relative 'intersection.rb'
require_relative 'sphere.rb'
require_relative 'triangle.rb'
require_relative 'light.rb'
require_relative 'material.rb'

class RayTracer < Renderer

  attr_accessor :camera

  def initialize(width, height)
    super(width, height, 250.0, 250.0, 250.0)
    
    @nx = @width
    @ny = @height
    # Camera values
    e= Vector.new(278,273,-800)
    center= Vector.new(278,273,-700)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    # Sphere 1 values
    position = Vector.new(340,120,370)
    radius = 240
    s_diffuse = Rgb.new(1.0,1.0,1.0)
    s_specular = Rgb.new(1.0,1.0,1.0)
    s_reflection = 0.5
    s_power = 60
    sphere_material = Material.new(s_diffuse, s_reflection, s_specular, s_power)
    
    # Sphere 2 values
    position2 = Vector.new(230,115,470)
    radius2 = 150    
    s2_diffuse = Rgb.new(0.5,0.4,1.0)
    s2_specular = Rgb.new(1.0,1.0,1.0)
    s2_reflection = 0.5
    s2_power = 60
    sphere2_material = Material.new(s2_diffuse, s2_reflection, s2_specular, s2_power)
    
    
    # Sphere 3 values
    position3 = Vector.new(180,110,470)
    radius3 = 100
    s3_diffuse = Rgb.new(0.4,0.4,0.8)
    s3_specular = Rgb.new(1.0,1.0,1.0)
    s3_reflection = 0.5
    s3_power = 60
    sphere3_material = Material.new(s3_diffuse, s3_reflection, s3_specular, s3_power)
                     
    # Triangle 1 values
    a = Vector.new(552,400,0)
    b = Vector.new(0,300,0)
    c = Vector.new(0,300,1260) # 12.2, 5.9, 2.4    
    t_diffuse = Rgb.new(0.122, 0.59, 0.24)
    t_specular = Rgb.new(1.0,1.0,1.0)
    t_reflection = 0.5
    t_power = 60
    t_material = Material.new(t_diffuse, t_reflection, t_specular, t_power)    
      
    # Triangle 2 values
    a2 = Vector.new(500,412,0)
    b2 = Vector.new(15,305,0)
    c2 = Vector.new(20,305,1160)    
    t2_diffuse = Rgb.new(0.142, 0.59, 0.24)
    t2_specular = Rgb.new(1.0,1.0,1.0)
    t2_reflection = 0.5
    t2_power = 60
    t2_material = Material.new(t2_diffuse, t2_reflection, t2_specular, t2_power)      

    @sphere = Sphere.new(position, radius, sphere_material)
    @sphere2 = Sphere.new(position2, radius2, sphere2_material)
    @sphere3 = Sphere.new(position3, radius3, sphere3_material)
    @triangle = Triangle.new(a, b, c, t_material )
    @triangle2 = Triangle.new(a2, b2, c2, t2_material)
    @objects=[]
    @objects << @sphere << @triangle << @sphere2 << @triangle2 << @sphere3
  end
    
  def calculate_lambertian_shading (intersection_point, intersection_normal, ray, light, object)
    n = intersection_normal.normalize
    l = @light.position.minus(intersection_point).normalize

    nl = n.dot_product(l)
    max = max(0,nl)
    kd = object.material.diffuse
    kdI = kd.multiply_color(light.color)
    return kdI.times_color(max)
  end
        
  def calculate_pixel(i, j)
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
      color = @obj_int.material.diffuse
    
      
    end

    return {red: color.r, green: color.g, blue: color.b}
  end
end
