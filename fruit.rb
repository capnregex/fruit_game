
class Fruit < Point
  def initialize x, y, v=1
    moveto x, y
    @velocity = v
  end
  attr_reader :velocity
end
