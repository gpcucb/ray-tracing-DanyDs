class Rgb
  attr_accessor :r, :g, :b

  def initialize(r,g,b)
    @r = r.to_f
    @g = g.to_f
    @b = b.to_f
  end
    
  def color_product(color)
      @r = @r * color.r
      @g = @g * color.g
      @b = @b * color.b
  end
  
  def num_product(num)
      return @r * num + @g * num + @b * num
  end
    
  def plus_color (a_color)
    Rgb.new(@r+a_color.r, @g+a_color.g, @b+a_color.b)
  end

  def minus_color (a_color)
    Rgb.new(@r-a_color.r, @g-a_color.g, @b-a_color.b)
  end

  def multiply_color (a_color)
    red = @r*a_color.r
    green = @g*a_color.g
    blue = @b*a_color.b

    Rgb.new(red,green,blue)
  end

  def scalar_color (a_number)
    number_as_float = a_number.to_f
    Rgb.new(@r*number_as_float, @g*number_as_float, @b*number_as_float)
  end
end
