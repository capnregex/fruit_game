
require "./point"

class Path
  attr_reader :points
  def initialize points
    @points = points
  end
  def self.read filename
    points = []
    open(filename) do |f|
      f.each_line do |line|
	x,y = line.split(',').collect{|s| s.to_f }
	points.push Point.new(x,y)
      end
    end
    Path.new(points)
  end
  def each_line
    max = points.length - 1
    max.times do |i|
      p1 = points[i]
      p2 = points[i+1]
      yield p1.x, p1.y, p2.x, p2.y 
    end
  end
  def add x, y
    points.push Point.new(x,y)
  end
  def save filename
    open(filename, "w") do |file|
      points.each do |point|
        file.puts point.to_csv
      end
    end
  end
  def draw screen, color
    each_line do |x1, y1, x2, y2|
      screen.draw_line x1, y1, x2, y2, color
    end
  end
end

