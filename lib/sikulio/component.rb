require 'active_support/core_ext/module/delegation.rb'

module Sikulio

  ##
  # Represents a segment of the UI. For example: 
  # * Web page
  # * Modal dialog
  # * Windows toolbar
  # 
  # Exposes a DSL for initializing and accessing Sikulio elements
  # 
  # The following example MyComponent class will include an auto-generated Sikulio element for
  # each image file located in the my_component folder under the image_root folder. Additionally,
  # defines a text entry field relative to the some_label element.
  #
  #   Sikulio::Config.image_root = 'image_root'   
  #
  #   class MyComponent < Component
  #   ...
  #     init_image_elements
  #
  #     relative_element :some_entry_field,
  #       :relative_to => :some_label,
  #       :offset_x => 30,
  #       :offset_y => 0
  #   ...
  
  class Component
 
    # A Sikuli screen instance that will be shared by this component's elements 
    attr_accessor :screen
    
    # Default x offset to use when creating relative elements
    attr_accessor :default_x_offset

    # The root folder under which GUI images are stored
    cattr_accessor :image_root

    delegate :type, :to => :screen

    def component_path
      @component_path ||= self.class.to_s.underscore
    end

    def component_path=(path)
      @component_path = path
    end
    
    # Sets the screen attribute for this component
    # Defaults to the singleton screen provided by Sikulio::Screen
    def initialize(screen = Sikulio::Screen.instance.screen)
      self.screen = screen
    end

    # Initializes Sikulio image elements corresponding to 
    # the images in the specified location
    def self.init_image_elements(component_path=nil, image_root=Sikulio::Config.image_root)

      component_path ||= self.to_s.underscore

      images = Dir[File.join(image_root, component_path, "/*.png")]

      images.each do |i|
        el_name = File.basename(i, ".png")
	define_method(el_name) { Element.new self.instance_variable_get(:@screen), i }
      end

    end

    # Defines an element based on a string rather than file (for OCR)
    def self.text_element(el_name, text)
      
      define_method(el_name) do
        Element.new self.instance_variable_get(:@screen),
	  text
      end
    end

    def self.set_default_x_offset(offset)
      @default_x_offset = offset
    end

    # Defines an element positioned relative to another element
    # e.g. a text input field, relative to the field label
    def self.relative_element(el_name, params = {})

      default_x_offset = @default_x_offset

      define_method(el_name) do
        RelativeElement.new self.instance_variable_get(:@screen),
	  self.send(params[:relative_to]).ident,
	  params[:offset_x] || default_x_offset,
	  params[:offset_y] || 0
      end
    end
  end
end
