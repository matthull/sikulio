module Sikulio
  class Element

    attr_accessor :screen

    # The identifier (e.g. filename or OCR string) which Sikuli will use to locate the element
    attr_accessor :ident

    # Default timeout for all wait operations
    attr_accessor :default_timeout

    # Sets screen and image file path
    def initialize(screen, ident, default_timeout=10)
      self.screen = screen
      self.ident = ident
      self.default_timeout = default_timeout
    end

    def create_relative_element(offset_x, offset_y)
      Sikulio::RelativeElement.new screen, ident, offset_x, offset_y
    end

    # Click on this element
    def click
      self.wait
      screen.click ident
    end

    def double_click
      self.wait
      screen.double_click ident
    end

    # Find this element on screen
    def find
      screen.find ident
    end

    # Send some keystrokes
    def type(keystrokes)
      screen.type keystrokes
    end

    # Click and then send some keystrokes
    def enter(keystrokes)
      self.click
      self.type keystrokes
    end

    # Wait until this element is visible
    def wait(timeout = default_timeout)
      screen.wait ident, timeout
    end
  end
end
