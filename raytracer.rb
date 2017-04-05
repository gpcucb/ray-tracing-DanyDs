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
      
    #Pestanias derecha
    @pestania1 = []
    pestania1_position = Vector.new(210,221,140)
    pestania1_radius = 5
    pestania1_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania1_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania1_s_reflection = 0.5
    pestania1_s_power = 100
      
    for cont in (1..40)
        pestania1_sphere_material = Material.new(pestania1_s_diffuse, pestania1_s_reflection, pestania1_s_specular, pestania1_s_power)
        vector_base_pestania1 = Vector.new(0,cont*2,0)
        @pieza_pestania1 = Sphere.new(pestania1_position.plus(vector_base_pestania1), pestania1_radius, pestania1_sphere_material)
        @pestania1 << @pieza_pestania1
    end  
    
    @pestania2 = []
    pestania2_position = Vector.new(270,210,140)
    pestania2_radius = 5
    pestania2_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania2_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania2_s_reflection = 0.5
    pestania2_s_power = 100
      
    for cont in (1..35)
        pestania2_sphere_material = Material.new(pestania2_s_diffuse, pestania2_s_reflection, pestania2_s_specular, pestania2_s_power)
        vector_base_pestania2 = Vector.new(cont,cont*2,0)
        @pieza_pestania2 = Sphere.new(pestania2_position.plus(vector_base_pestania2), pestania2_radius, pestania2_sphere_material)
        @pestania2 << @pieza_pestania2
    end  
      
    @pestania3 = []
    pestania3_position = Vector.new(150,210,140)
    pestania3_radius = 5
    pestania3_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania3_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania3_s_reflection = 0.5
    pestania3_s_power = 100
      
    for cont in (1..35)
        pestania3_sphere_material = Material.new(pestania3_s_diffuse, pestania3_s_reflection, pestania3_s_specular, pestania3_s_power)
        vector_base_pestania3 = Vector.new(-cont,cont*2,0)
        @pieza_pestania3 = Sphere.new(pestania3_position.plus(vector_base_pestania3), pestania3_radius, pestania3_sphere_material)
        @pestania3 << @pieza_pestania3
    end  
    #fin pestanias derechas
      
      
    #Pestanias izquierda
    @pestania4 = []
    pestania4_position = Vector.new(-210,221,140)
    pestania4_radius = 5
    pestania4_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania4_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania4_s_reflection = 0.5
    pestania4_s_power = 100
      
    for cont in (1..40)
        pestania4_sphere_material = Material.new(pestania4_s_diffuse, pestania4_s_reflection, pestania4_s_specular, pestania4_s_power)
        vector_base_pestania4 = Vector.new(0,cont*2,0)
        @pieza_pestania4 = Sphere.new(pestania4_position.plus(vector_base_pestania4), pestania4_radius, pestania4_sphere_material)
        @pestania4 << @pieza_pestania4
    end  
    
    @pestania5 = []
    pestania5_position = Vector.new(-270,210,140)
    pestania5_radius = 5
    pestania5_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania5_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania5_s_reflection = 0.5
    pestania5_s_power = 100
      
    for cont in (1..35)
        pestania5_sphere_material = Material.new(pestania5_s_diffuse, pestania5_s_reflection, pestania5_s_specular, pestania5_s_power)
        vector_base_pestania5 = Vector.new(-cont,cont*2,0)
        @pieza_pestania5 = Sphere.new(pestania5_position.plus(vector_base_pestania5), pestania5_radius, pestania5_sphere_material)
        @pestania5 << @pieza_pestania5
    end  
      
    @pestania6 = []
    pestania6_position = Vector.new(-150,210,140)
    pestania6_radius = 5
    pestania6_s_diffuse = Rgb.new(0.1,0.1,0.1)
    pestania6_s_specular = Rgb.new(1.0,1.0,1.0)
    pestania6_s_reflection = 0.5
    pestania6_s_power = 100
      
    for cont in (1..35)
        pestania6_sphere_material = Material.new(pestania6_s_diffuse, pestania6_s_reflection, pestania6_s_specular, pestania6_s_power)
        vector_base_pestania6 = Vector.new(cont,cont*2,0)
        @pieza_pestania6 = Sphere.new(pestania6_position.plus(vector_base_pestania6), pestania6_radius, pestania6_sphere_material)
        @pestania6 << @pieza_pestania6
    end  
    #fin pestanias izquierdas
      
      
    # Triangle 1 values
    #a = Vector.new(550,350,0)
    #b = Vector.new(0,300,0)
    #c = Vector.new(0,300,0) # 12.2, 5.9, 2.4    
    #t_diffuse = Rgb.new(0.122, 0.59, 0.24)
    #t_specular = Rgb.new(1.0,1.0,1.0)
    #t_reflection = 0.5
    #t_power = 60
    #t_material = Material.new(t_diffuse, t_reflection, t_specular, t_power) 
    #finpestanias
    
    #nariz
    position7 = Vector.new(0,-70,150)
    radius7 = 75
    s7_diffuse = Rgb.new(1.0,1.0,0.1)
    s7_specular = Rgb.new(1.0,1.0,1.0)
    s7_reflection = 0.5
    s7_power = 100
    sphere7_material = Material.new(s7_diffuse, s7_reflection, s7_specular, s7_power)
    #finNariz          
      
    #masDeNariz
    @nariz_estructura = []
    nariz_position = Vector.new(0,-73,149)
    nariz_radius = 74
    nariz_s_diffuse = Rgb.new(1.0,1.0,0.1)
    nariz_s_specular = Rgb.new(1.0,1.0,1.0)
    nariz_s_reflection = 0.5
    nariz_s_power = 100
    for cont in (1..39)
        nariz_sphere_material = Material.new(nariz_s_diffuse, nariz_s_reflection, nariz_s_specular, nariz_s_power)
        vector_base = Vector.new(0,(3*cont),(cont))
        @sphere26 = Sphere.new(nariz_position.minus(vector_base), nariz_radius-cont, nariz_sphere_material)
        @nariz_estructura << @sphere26
    end
      
    #lunar
    lunar_position = Vector.new(550,480,132)
    lunar_radius = 200
    lunar_s_diffuse = Rgb.new(0.984,0.984,0.145)
    lunar_s_specular = Rgb.new(1.0,1.0,1.0)
    lunar_s_reflection = 1.0
    lunar_s_power = 50
    lunar_sphere_material = Material.new(lunar_s_diffuse, lunar_s_reflection, lunar_s_specular, lunar_s_power)            
    #fin lunar
      
    #finMasDeNariz

    @sphere = Sphere.new(position, radius, sphere_material)
    @sphere2 = Sphere.new(position2, radius2, sphere2_material)
    @sphere3 = Sphere.new(position3, radius3, sphere3_material)
    @sphere4 = Sphere.new(position4, radius4, sphere4_material)
    @sphere5 = Sphere.new(position5, radius5, sphere5_material)
    @sphere6 = Sphere.new(position6, radius6, sphere6_material)
    #@triangle = Triangle.new(a, b, c, t_material )    
    @sphere7 = Sphere.new(position7, radius7, sphere7_material)        
    @lunar = Sphere.new(lunar_position, lunar_radius, lunar_sphere_material)
    @objects=[]
    @objects << @sphere << @sphere2 << @sphere3 << @sphere4 << @sphere5 << @sphere6 << @sphere7 << @lunar 
      
    #add elemento estructura nariz
    for e_nariz in @nariz_estructura
       @objects << e_nariz 
    end
    
    #add elemento pestania
    for e_pestania in @pestania1
       @objects << e_pestania 
    end
      
    for e_pestania in @pestania2
       @objects << e_pestania 
    end
      
    for e_pestania in @pestania3
       @objects << e_pestania 
    end
      
    for e_pestania in @pestania4
       @objects << e_pestania 
    end
      
    for e_pestania in @pestania5
       @objects << e_pestania 
    end
    
    for e_pestania in @pestania6
       @objects << e_pestania 
    end
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
