 #! /usr/bin/ruby -w

require 'sdl'
require './path'

SDL.init SDL::INIT_VIDEO
screen = SDL::set_video_mode 640, 480, 24, SDL::SWSURFACE
x = y = 0

BGCOLOR = screen.format.mapRGB 255, 255, 255
LINECOLOR = screen.format.mapRGB 0, 0, 0
PATHCOLOR = screen.format.mapRGB 0, 0, 255

running = true

path = Path.read('path.csv')

while running
  while event = SDL::Event2.poll
    case event
    when SDL::Event2::Quit
      running = false
    when SDL::Event2::MouseMotion
      x = event.x
      y = event.y
    when SDL::Event2::MouseButtonDown
      puts "click #{event.x} #{event.y}"
      path.add(event.x, event.y)
      path.save("path.csv")
    end ## case
  end ## while event

  screen.fill_rect 0, 0, 640, 480, BGCOLOR # 
  screen.draw_line x, 0, x, 479, LINECOLOR
  screen.draw_line 0, y, 639, y, LINECOLOR
   
  # draw points
  path.each_line do |x1, y1, x2, y2|
    screen.draw_line x1, y1, x2, y2, PATHCOLOR
  end

  screen.flip

end # while running
