module Sikulio
  class Element

    attr_accessor :screen

    # The identifier (e.g. filename or OCR string) which Sikuli will use to locate the element
    attr_accessor :ident

    # Sets screen and image file path
    def initialize(screen, ident)
      self.screen = screen
      self.ident = ident
    end

    def create_relative_element(offset_x, offset_y)
      Sikulio::RelativeElement.new screen, ident, offset_x, offset_y
    end

    # Click on this element
    def click
      screen.click ident
    end

    # Find this element on screen
    def find
      screen.find ident
    end

    # Send keystrokes
    def type(keystrokes)
      screen.type keystrokes
    end

  end
end
