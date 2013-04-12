#!/usr/bin/env ruby

require 'sdl'
require "./point.rb"
require "./path.rb"
require "./fruit.rb"
require "./orange.rb"

SDL.init SDL::INIT_VIDEO
screen = SDL::Screen.open 640, 480, 24, SDL::SWSURFACE
x = y = 0

BGCOLOR = screen.format.mapRGB 255, 255, 255
PATHCOLOR = screen.format.mapRGB 0, 0, 255

running = true

path = Path.read('path.csv')
orange = Orange.new(100,100)

while running
  while event = SDL::Event2.poll
    case event
    when SDL::Event2::Quit
      running = false
    when SDL::Event2::MouseMotion
      x = event.x
      y = event.y
    when SDL::Event2::MouseButtonDown
      orange.moveto(event.x, event.y)
    end ## case
  end ## while event

  screen.fill_rect 0, 0, 640, 480, BGCOLOR # 
  path.draw(screen, PATHCOLOR)
  orange.draw(screen)

  screen.flip

end # while running

