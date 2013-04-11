
class Point
  def initialize x, y
    moveto x, y
  end
  attr_reader :x, :y
  def location 
    [@x, @y]
  end
  def moveto x, y = 1
    if (x.kind_of? Point)
      @x = x.x
      @y = x.y
    elsif (x.kind_of? Numeric and y.kind_of? Numeric)
      @x = x
      @y = y
    else
      raise "moveto expects either a point or two numbers"
    end
    location
  end
  def move x, y
    @x += x
    @y += y
    location
  end
  def distance point
    a = x - point.x
    b = y - point.y
    Math.sqrt(a * a + b * b) 
  end
  def to_csv
    [x,y].join(',')
  end
end
