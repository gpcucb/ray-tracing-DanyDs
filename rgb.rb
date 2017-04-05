class Rgb
  attr_accessor :r, :g, :b

  def initialize(r,g,b)
    @r = r.to_f
    @g = g.to_f
    @b = b.to_f
  end
    
  def validate_color(color)
    if(color>1)
        return 1;
    end
    if (color<0)
        return 0;
    end
    return color;
  end
    
  def color_product(color)
      @r = validate_color(@r * color.r)      
      @g = validate_color(@g * color.g)
      @b = validate_color(@b * color.b)
  end
  
  def num_product(num)
      return @r * num + @g * num + @b * num
  end
    
  def plus_color (a_color)
    Rgb.new(validate_color(@r+a_color.r), validate_color(@g+a_color.g), validate_color(@b+a_color.b))
  end

  def minus_color (a_color)
    Rgb.new(validate_color(@r-a_color.r), validate_color(@g-a_color.g), validate_color(@b-a_color.b))
  end

  def multiply_color (a_color)
    red = @r*a_color.r      
    green = @g*a_color.g      
    blue = @b*a_color.b      
    Rgb.new(validate_color(red),validate_color(green),validate_color(blue))
  end

  def scalar_color (a_number)
    number_as_float = a_number.to_f
    Rgb.new(validate_color(@r*number_as_float),validate_color( @g*number_as_float), validate_color(@b*number_as_float))
  end
end
