require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Component do
  
  Sikulio::Config.image_root = File.join(File.dirname(__FILE__), '..', 'support', 'images')

  describe 'component_path' do
   
    class MyComponent < Component; end
	 
    subject(:comp) { MyComponent.new }	  

    its(:component_path) { should == 'my_component' }

    it 'can be set manually' do
      comp.component_path = 'foo'
      comp.component_path.should == 'foo'
    end
  end

  describe '#init_image_elements', 'when component path and image root are manually specified' do

    class ManuallyConfiguredComponent < Component
      init_image_elements 'my_component', Sikulio::Config.image_root
    end

    subject { ManuallyConfiguredComponent.new }

    its(:some_button) { should respond_to :click }
    its(:some_label)  { should respond_to :click }
  end

  describe '#init_image_elements', 'when only component path is manually specified' do

    class ConfiguredComponentPathComponent < Component
      init_image_elements 'my_component'
    end

    subject { ConfiguredComponentPathComponent.new }

    its(:some_button) { should respond_to :click }
    its(:some_label)  { should respond_to :click }
  end

  describe '#init_image_elements', 'when no paths are specified' do

    class MyComponent < Component
      init_image_elements
    end

    subject { MyComponent.new }

    its(:some_button) { should respond_to :click }
    its(:some_label)  { should respond_to :click }
  end

  describe '#relative_element' do

    class MyComponent < Component
      init_image_elements

      relative_element :some_field,
        :relative_to => :some_label,
        :offset_x => 20,
        :offset_y => 0
    end

    subject { MyComponent.new }

    it { should respond_to :some_field }
  end

  describe "#relative_element", "with defaults" do

    class MyComponent < Component
      init_image_elements

      set_default_x_offset 20

      relative_element :some_field,
        :relative_to => :some_label
    end

    let(:my_component) { MyComponent.new }
    subject { my_component }

    #its(:default_x_offset) { should == 20 }
    it { should respond_to :some_field }

    it "sets x offsets based on its default x offset" do
      subject.some_field.offset_x.should == 20 
    end

    it "sets y offsets to 0" do
      subject.some_field.offset_y.should == 0
    end
  end

  describe "#type" do
    class MyComponent < Component; end

    it "sends some keystrokes to its screen" do
      comp = MyComponent.new
      comp.screen.should_receive(:type).with('asdf')
      comp.type 'asdf'
    end
  end
end
