Sikulio: A framework for testing with Sikuli
============================================

Sikulio provides a Page Object style framework on top of Sikuli.

Still very much a work in progress.

Requirements
------------

* [JRuby] (http://jruby.org/download)
* [Sikuli Ruby] (https://github.com/chaslemley/sikuli_ruby)

See the [Sikuli Ruby README] (https://github.com/chaslemley/sikuli_ruby/blob/master/README.md) for details on installing and configuring Sikuli.

Installation
------------

gem install sikulio --pre

Usage
-----

When you define a subclass of Sikulio::Component, Sikulio will look for the relevant 
folder under the configured image root and scan if for png files.  A Sikulio element method will
be defined for each image file that was found.

In addition, you can manually define certain types of elements.

    require 'sikulio'

    Sikulio::Config.image_root = 'images'

    class MyComponent < Sikulio::Component
      init_image_elements -- Adds a Sikulio element for each .png files found in images/my_component

      default_x_offset 40
 
      -- Create an element based on OCR scan for text 'Cancel'
      text_element :cancel_button, 'Cancel'

      -- Create an element relative to the first_name_field element.
      -- Sikulio will define that element as 40 pixels to the
      -- right (based on default x offset defined above) and 
      -- 0 pixels down (as the global default for y offset is 0
      -- from the center of the first_name_field element
      relative_element :first_name_field,
        :relative_to => :first_name_label,
    end

    comp = MyComponent.new
    
    comp.first_name_field.click
    comp.first_name_field.type 'Joe'

Running the test suite
----------------------
    
    jruby -S bundle exec rspec spec

Take some chill time while the tests are running - the integration tests will launch a Java Swing application
and will fail if you take focus away.
