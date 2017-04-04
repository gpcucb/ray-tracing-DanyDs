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
    e= Vector.new(0,0,1500)
    center= Vector.new(0,0,1400)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    # Light Values
    light_color = Rgb.new(1,1,1)
    light_position = Vector.new(-80,300,4000)
    @light = Light.new(light_position,light_color)

    #colors
    mediumBlue = Rgb.new(0.196078,0.196078,0.8)
    fucsia = Rgb.new(1.0, 0.0, 1.0)
    orange = Rgb.new(1, 0.5,0.0)
    pink = Rgb.new(0.737255 , 0.560784 , 0.560784)
    skyBlue = Rgb.new(0.196078,0.6,0.8)
    silver = Rgb.new(0.90,0.91,0.98)
    yellow = Rgb.new(1.0, 1.0, 0)
    seaGreen = Rgb.new(0.137255,0.556863,0.419608)
      
    # Sphere 1 values
    position = Vector.new(-240,0,0)
    radius = 240
    s_diffuse = Rgb.new(1.0,1.0,1.0)
    s_specular = Rgb.new(1.0,1.0,1.0)
    s_reflection = 0.5
    s_power = 100
    sphere_material = Material.new(s_diffuse, s_reflection, s_specular, s_power)
    
    # Sphere 2 values
    position2 = Vector.new(-200,20,100)
    radius2 = 150    
    s2_diffuse = Rgb.new(0.196078,0.6,0.8)
    s2_specular = Rgb.new(1.0,1.0,1.0)
    s2_reflection = 0.5
    s2_power = 60
    sphere2_material = Material.new(s2_diffuse, s2_reflection, s2_specular, s2_power)
    
    
    # Sphere 3 values
    position3 = Vector.new(-180,25,150)
    radius3 = 100
    s3_diffuse = Rgb.new(0.1,0.1,0.1)
    s3_specular = Rgb.new(1.0,1.0,1.0)
    s3_reflection = 0.5
    s3_power = 60
    sphere3_material = Material.new(s3_diffuse, s3_reflection, s3_specular, s3_power)
      
    #OjoDerecho
    # Sphere 4 values
    position4 = Vector.new(240,0,0)
    radius4 = 240
    s4_diffuse = Rgb.new(1.0,1.0,1.0)
    s4_specular = Rgb.new(1.0,1.0,1.0)
    s4_reflection = 0.2
    s4_power = 60
    sphere4_material = Material.new(s4_diffuse, s4_reflection, s4_specular, s4_power)
    
    # Sphere 5 values
    position5 = Vector.new(200,20,100)
    radius5 = 150    
    s5_diffuse = Rgb.new(0.196078,0.6,0.8)
    s5_specular = Rgb.new(1.0,1.0,1.0)
    s5_reflection = 0.5
    s5_power = 60
    sphere5_material = Material.new(s5_diffuse, s5_reflection, s5_specular, s5_power)
    
    
    # Sphere 6 values
    position6 = Vector.new(180,25,150)
    radius6 = 100
    s6_diffuse = Rgb.new(0.1,0.1,0.1)
    s6_specular = Rgb.new(1.0,1.0,1.0)
    s6_reflection = 0.5
    s6_power = 60
    sphere6_material = Material.new(s6_diffuse, s6_reflection, s6_specular, s6_power)      
    #finOjoDerecho
      
      
    # Triangle 1 values
    a = Vector.new(550,350,0)
    b = Vector.new(0,300,0)
    c = Vector.new(0,300,0) # 12.2, 5.9, 2.4    
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
    @sphere4 = Sphere.new(position4, radius4, sphere4_material)
    @sphere5 = Sphere.new(position5, radius5, sphere5_material)
    @sphere6 = Sphere.new(position6, radius6, sphere6_material)
    @triangle = Triangle.new(a, b, c, t_material )
    @triangle2 = Triangle.new(a2, b2, c2, t2_material)
    @objects=[]
    @objects << @sphere << @triangle << @sphere2 << @triangle2 << @sphere3 << @sphere4 << @sphere5 << @sphere6
   
  end

  def max(number1,number2)
    if number1 > number2
      return number1
    else
      return number2
    end
  end

  def c_lamberthian_Shading(intersectionPoint, intersectionNormal, ray, light, object)
    n = intersectionNormal.normalize
    l = light.position.minus(intersectionPoint).normalize
    nl = n.scalar_product(l)
    max = max(0,nl)
    kd = object.material.diffuse
    kdI = kd.multiply_color(light.color)
    return kdI.scalar_color(max)
  end

  def c_BP_Shading(intersectionPoint, intersectionNormal, ray, light, object)
    n = intersectionNormal.normalize
    v = ray.position.minus(intersectionPoint).normalize
    l = light.position.minus(intersectionPoint).normalize
    h = v.plus(l).normalize
    nh = n.scalar_product(h)
    ks = object.material.specular
    power = object.material.power
    ksI = ks.multiply_color(light.color)
    max = max(0,nh)

    return ksI.scalar_color(max**power)
  end

  def c_ambient_shading(object)
    @ambientLight = Rgb.new(0.003,0.003,0.003)
    ka = object.material.diffuse
    return @ambientLight.multiply_color(ka)
  end

  def calculate_pixel(i, j)
    e = @camera.e
    dir = @camera.ray_direction(i,j,@nx,@ny)
    ray = Ray.new(e, dir)
    t = Float::INFINITY

    @obj_int = nil#intersected object
    @objects.each do |obj|
      intersection = obj.intersection?(ray, t)
      if intersection.successful?
        @obj_int = obj
        t = intersection.t
      end
    end
    if @obj_int==nil
      color = Rgb.new(1.0, 1.0, 0.0)
    else
      #color = @obj_int.material.diffuse #2D
      intersectionPoint = ray.position.plus(ray.direction.num_product(t))
      intersectionNormal = @obj_int.normal(intersectionPoint)
      lambertian_shadow = c_lamberthian_Shading(intersectionPoint, intersectionNormal, ray, @light, @obj_int)
      blinn_phong = c_BP_Shading(intersectionPoint, intersectionNormal, ray, @light, @obj_int)
      ambient_shadow = c_ambient_shading(@obj_int)
      #puts "lambert r:#{lamberShadow.r} g:#{lamberShadow.g} b:#{lamberShadow.b}"
      #puts "blinnPhong r:#{blinnPhong.r} g:#{blinnPhong.g} b:#{blinnPhong.b}"
      #puts "ambientShadow r:#{ambientShadow.r} g:#{ambientShadow.g} b:#{ambientShadow.b}"
      #color = lamberShadow
      color = blinn_phong.plus_color(lambertian_shadow).plus_color(ambient_shadow)
    end

    return {red: color.r, green: color.g, blue: color.b}
  end
end
