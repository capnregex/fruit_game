
require 'sdl'
require './fruit.rb'

class Orange < Fruit
  SURFACE = SDL::Surface.load('images/orange-50.png')

  def draw screen
    SDL::Surface.blit(SURFACE,0,0,50,50,screen,x-25,y-25)
  end
  
end

