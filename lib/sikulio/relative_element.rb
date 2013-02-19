module Sikulio
  class RelativeElement

    attr_accessor :screen
    attr_accessor :ident
    attr_accessor :offset_x
    attr_accessor :offset_y

    # Sets screen and image file path
    def initialize(screen, ident, offset_x, offset_y)
      self.screen = screen
      self.ident = ident
      self.offset_x = offset_x
      self.offset_y = offset_y
    end

    # Click on this element
    def click
      start_point = screen.find ident
      click_x = start_point.x + offset_x
      click_y = start_point.y + offset_y

      screen.click click_x, click_y
    end

    # Find this element on screen
    def find
      screen.find ident
    end

    # Send keystrokes to element
    def type(keystrokes)
      screen.type keystrokes
    end

  end
end
