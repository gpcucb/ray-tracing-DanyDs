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
      
    #intento de ceja  
    # Triangle 1 values
    a = Vector.new(550,350,0)
    b = Vector.new(0,300,0)
    c = Vector.new(0,300,0) # 12.2, 5.9, 2.4    
    t_diffuse = Rgb.new(0.122, 0.59, 0.24)
    t_specular = Rgb.new(1.0,1.0,1.0)
    t_reflection = 0.5
    t_power = 60
    t_material = Material.new(t_diffuse, t_reflection, t_specular, t_power)    
    
    #nariz
    position7 = Vector.new(0,-70,150)
    radius7 = 70
    s7_diffuse = Rgb.new(1.0,1.0,0.1)
    s7_specular = Rgb.new(1.0,1.0,1.0)
    s7_reflection = 0.5
    s7_power = 100
    sphere7_material = Material.new(s7_diffuse, s7_reflection, s7_specular, s7_power)
    
    position8 = Vector.new(0,-73,149)
    radius8 = 69
    s8_diffuse = Rgb.new(1.0,1.0,0.1)
    s8_specular = Rgb.new(1.0,1.0,1.0)
    s8_reflection = 0.5
    s8_power = 100
    sphere8_material = Material.new(s8_diffuse, s8_reflection, s8_specular, s8_power)
      
    position9 = Vector.new(0,-76,148)
    radius9 = 68
    s9_diffuse = Rgb.new(1.0,1.0,0.1)
    s9_specular = Rgb.new(1.0,1.0,1.0)
    s9_reflection = 0.5
    s9_power = 100
    sphere9_material = Material.new(s9_diffuse, s9_reflection, s9_specular, s9_power)
      
    position10 = Vector.new(0,-79,147)
    radius10 = 67
    s10_diffuse = Rgb.new(1.0,1.0,0.1)
    s10_specular = Rgb.new(1.0,1.0,1.0)
    s10_reflection = 0.5
    s10_power = 100
    sphere10_material = Material.new(s10_diffuse, s10_reflection, s10_specular, s10_power)
      
    position11 = Vector.new(0,-82,146)
    radius11 = 66
    s11_diffuse = Rgb.new(1.0,1.0,0.1)
    s11_specular = Rgb.new(1.0,1.0,1.0)
    s11_reflection = 0.5
    s11_power = 100
    sphere11_material = Material.new(s11_diffuse, s11_reflection, s11_specular, s11_power)
      
    position12 = Vector.new(0,-85,145)
    radius12 = 65
    s12_diffuse = Rgb.new(1.0,1.0,0.1)
    s12_specular = Rgb.new(1.0,1.0,1.0)
    s12_reflection = 0.5
    s12_power = 100
    sphere12_material = Material.new(s12_diffuse, s12_reflection, s12_specular, s12_power)
      
    position13 = Vector.new(0,-88,144)
    radius13 = 64
    s13_diffuse = Rgb.new(1.0,1.0,0.1)
    s13_specular = Rgb.new(1.0,1.0,1.0)
    s13_reflection = 0.5
    s13_power = 100
    sphere13_material = Material.new(s13_diffuse, s13_reflection, s13_specular, s13_power)
      
    position14 = Vector.new(0,-91,143)
    radius14 = 63
    s14_diffuse = Rgb.new(1.0,1.0,0.1)
    s14_specular = Rgb.new(1.0,1.0,1.0)
    s14_reflection = 0.5
    s14_power = 100
    sphere14_material = Material.new(s14_diffuse, s14_reflection, s14_specular, s14_power)
      
    position15 = Vector.new(0,-94,142)
    radius15 = 62
    s15_diffuse = Rgb.new(1.0,1.0,0.1)
    s15_specular = Rgb.new(1.0,1.0,1.0)
    s15_reflection = 0.5
    s15_power = 100
    sphere15_material = Material.new(s15_diffuse, s15_reflection, s15_specular, s15_power)
      
    position16 = Vector.new(0,-97,141)
    radius16 = 61
    s16_diffuse = Rgb.new(1.0,1.0,0.1)
    s16_specular = Rgb.new(1.0,1.0,1.0)
    s16_reflection = 0.5
    s16_power = 100
    sphere16_material = Material.new(s16_diffuse, s16_reflection, s16_specular, s16_power)
      
    position17 = Vector.new(0,-100,140)
    radius17 = 60
    s17_diffuse = Rgb.new(1.0,1.0,0.1)
    s17_specular = Rgb.new(1.0,1.0,1.0)
    s17_reflection = 0.5
    s17_power = 100
    sphere17_material = Material.new(s17_diffuse, s17_reflection, s17_specular, s17_power)
      
    position18 = Vector.new(0,-103,139)
    radius18 = 60
    s18_diffuse = Rgb.new(1.0,1.0,0.1)
    s18_specular = Rgb.new(1.0,1.0,1.0)
    s18_reflection = 0.5
    s18_power = 100
    sphere18_material = Material.new(s18_diffuse, s18_reflection, s18_specular, s18_power)
    
    position19 = Vector.new(0,-106,138)
    radius19 = 59
    s19_diffuse = Rgb.new(1.0,1.0,0.1)
    s19_specular = Rgb.new(1.0,1.0,1.0)
    s19_reflection = 0.5
    s19_power = 100
    sphere19_material = Material.new(s19_diffuse, s19_reflection, s19_specular, s19_power)
      
    position20 = Vector.new(0,-109,137)
    radius20 = 58
    s20_diffuse = Rgb.new(1.0,1.0,0.1)
    s20_specular = Rgb.new(1.0,1.0,1.0)
    s20_reflection = 0.5
    s20_power = 100
    sphere20_material = Material.new(s20_diffuse, s20_reflection, s20_specular, s20_power)
      
    position21 = Vector.new(0,-112,136)
    radius21 = 57
    s21_diffuse = Rgb.new(1.0,1.0,0.1)
    s21_specular = Rgb.new(1.0,1.0,1.0)
    s21_reflection = 0.5
    s21_power = 100
    sphere21_material = Material.new(s21_diffuse, s21_reflection, s21_specular, s21_power)
      
    position22 = Vector.new(0,-115,135)
    radius22 = 56
    s22_diffuse = Rgb.new(1.0,1.0,0.1)
    s22_specular = Rgb.new(1.0,1.0,1.0)
    s22_reflection = 0.5
    s22_power = 100
    sphere22_material = Material.new(s22_diffuse, s22_reflection, s22_specular, s22_power)
      
    position23 = Vector.new(0,-118,134)
    radius23 = 55
    s23_diffuse = Rgb.new(1.0,1.0,0.1)
    s23_specular = Rgb.new(1.0,1.0,1.0)
    s23_reflection = 0.5
    s23_power = 100
    sphere23_material = Material.new(s23_diffuse, s23_reflection, s23_specular, s23_power)
      
    position24 = Vector.new(0,-121,133)
    radius24 = 54
    s24_diffuse = Rgb.new(1.0,1.0,0.1)
    s24_specular = Rgb.new(1.0,1.0,1.0)
    s24_reflection = 0.5
    s24_power = 100
    sphere24_material = Material.new(s24_diffuse, s24_reflection, s24_specular, s24_power)
      
    position25 = Vector.new(0,-124,132)
    radius25 = 53
    s25_diffuse = Rgb.new(1.0,1.0,0.1)
    s25_specular = Rgb.new(1.0,1.0,1.0)
    s25_reflection = 0.5
    s25_power = 100
    sphere25_material = Material.new(s25_diffuse, s25_reflection, s25_specular, s25_power)
    #finNariz
      
    #lunar
    #lunar_position = Vector.new(550,480,132)
    #lunar_radius = 200
    #lunar_s_diffuse = Rgb.new(0.984,0.984,0.145)
    #lunar_s_specular = Rgb.new(1.0,1.0,1.0)
    #lunar_s_reflection = 0.5
    #lunar_s_power = 10
    #lunar_sphere_material = Material.new(lunar_s_diffuse, lunar_s_reflection, lunar_s_specular, lunar_s_power)            
    #fin lunar

    @sphere = Sphere.new(position, radius, sphere_material)
    @sphere2 = Sphere.new(position2, radius2, sphere2_material)
    @sphere3 = Sphere.new(position3, radius3, sphere3_material)
    @sphere4 = Sphere.new(position4, radius4, sphere4_material)
    @sphere5 = Sphere.new(position5, radius5, sphere5_material)
    @sphere6 = Sphere.new(position6, radius6, sphere6_material)
    @triangle = Triangle.new(a, b, c, t_material )    
    @sphere7 = Sphere.new(position7, radius7, sphere7_material)
    @sphere8 = Sphere.new(position8, radius8, sphere8_material)
    @sphere9 = Sphere.new(position9, radius9, sphere9_material)
    @sphere10 = Sphere.new(position10, radius10, sphere10_material)
    @sphere11 = Sphere.new(position11, radius11, sphere11_material)
    @sphere12 = Sphere.new(position12, radius12, sphere12_material)
    @sphere13 = Sphere.new(position13, radius13, sphere13_material)
    @sphere14 = Sphere.new(position14, radius14, sphere14_material)
    @sphere15 = Sphere.new(position15, radius15, sphere15_material)
    @sphere16 = Sphere.new(position16, radius16, sphere16_material)
    @sphere17 = Sphere.new(position17, radius17, sphere17_material)
    @sphere18 = Sphere.new(position18, radius18, sphere18_material)
    @sphere19 = Sphere.new(position19, radius19, sphere19_material)
    @sphere20 = Sphere.new(position20, radius20, sphere20_material)
    @sphere21 = Sphere.new(position21, radius21, sphere21_material)
    @sphere22 = Sphere.new(position22, radius22, sphere22_material)
    @sphere23 = Sphere.new(position23, radius23, sphere23_material)
    @sphere24 = Sphere.new(position24, radius24, sphere24_material)
    @sphere25 = Sphere.new(position25, radius25, sphere25_material)
    #@lunar = Sphere.new(lunar_position, lunar_radius, lunar_sphere_material)
    @objects=[]
    @objects << @sphere << @triangle << @sphere2 << @sphere3 << @sphere4 << @sphere5 << @sphere6 << @sphere7 << @sphere8 << @sphere9  << @sphere10 << @sphere11 << @sphere12 << @sphere13 << @sphere14 << @sphere15 << @sphere16 << @sphere17 << @sphere18 << @sphere19 << @sphere20 << @sphere21 << @sphere22 << @sphere23 << @sphere24 << @sphere25 #<< @lunar
   
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
