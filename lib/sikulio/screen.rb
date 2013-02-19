require 'singleton'

module Sikulio
  
  # Provides consistent access to a single Sikuli screen object
  # 
  # Sikuli throws intermittent errors if multiple screen objects are in use
  # Providing singleton access to a screen prevents this from occuring
  # Usage: Sikulio::Screen.instance 

  class Screen
    include Singleton 

    attr_accessor :screen

    def initialize
      self.screen = Sikuli::Screen.new
    end
  end
end
