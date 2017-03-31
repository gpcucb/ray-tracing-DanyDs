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
end
