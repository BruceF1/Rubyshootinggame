require 'gosu'

class DuckHunt < Gosu::Window

  def initialize
    super(800, 600)
    self.caption = 'Get those darn ducks!'
    @image = Gosu::Image.new('duck.png')
    @crosshair_image = Gosu::Image.new('crosshair.png')
    @x = 200
    @y = 200
    @width = 50
    @height = 54
    @velocity_x = 5
    @velocity_y =5
    @visible = 0
    @hit = 0
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
    @visible -= 1
    @visible = 30 if @visible < -10 && rand < 0.01
  end

  def button_down(id)
if (id == Gosu::MsLeft)
if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
@hit = 1
else
@hit = -1
end
end
end

  def draw
    if @visible > 0
    @image.draw(@x - @width / 2, @y - @height / 2, 1)
    end
    @crosshair_image.draw(mouse_x - 40, mouse_y - 10, 1)
  end
end


window = DuckHunt.new
window.show
