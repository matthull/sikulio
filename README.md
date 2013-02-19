Sikulio: A framework for testing with Sikuli
============================================

Sikulio provides a Page Object style framework on top of Sikuli.

Requirements
------------

* [JRuby] (http://jruby.org/download)
* [Sikuli Ruby] (https://github.com/chaslemley/sikuli_ruby)

See the [Sikuli Ruby README] (https://github.com/chaslemley/sikuli_ruby/blob/master/README.md) for details on installing and configuring Sikuli.

Installation
------------

gem install sikulio

Usage
-----

    require 'sikulio'

    Sikulio::Config.image_asdf = 'images'

    class MyComponent < Sikulio::Component
      init_image_elements -- Adds a Sikulio element for each .png files found in images/my_component

      relative_element :first_name_field,
        :relative_to => :first_name_label,
	:offset_x => 30, -- Look x pixels to the right of the relative_to element's center
        :offset_y => 0   -- Look y pixels down from the relative_to element's center
    end

Running the test suite
----------------------
    
    jruby -S bundle exec rspec spec

Take some chill time while the tests are running - the integration tests will launch a Java Swing application
and will fail if you take focus away.