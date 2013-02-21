require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Element do

  let(:file) { File.join(File.dirname(__FILE__), "images", "my_pic.png") }
  let(:screen) { Sikuli::Screen.new }

  before do
   @el = Element.new(screen, file, 5)
  end	  

  describe "#initialize" do
    it "sets its screen and ident based on the provided values" do
     @el.screen.should == screen
     @el.ident.should == file
    end
  end

  describe "#click" do
    it "clicks itself" do
     @el.screen.should_receive(:wait).with(file, 5)
     @el.screen.should_receive(:click).with(file)
     @el.click
    end
  end

  describe "#double_click" do
    it "double-clicks itself" do
     @el.screen.should_receive(:wait).with(file, 5)
     @el.screen.should_receive(:double_click).with(file)
     @el.double_click
    end
  end

  describe "#find" do
    it "finds itself" do
     @el.screen.should_receive(:find).with(file)
     @el.find
    end
  end
  
  describe "#enter" do
    it "clicks the element then sends some keystrokes" do
     @el.screen.should_receive(:wait).with(file, 5)
     @el.screen.should_receive(:click).with(file)
     @el.screen.should_receive(:type).with("blah")
     @el.enter "blah"
    end
  end

  describe "#wait" do
    it "waits the specified interval until it appears on the screen" do
      @el.screen.should_receive(:wait).with(file, 5)
      @el.wait 5
    end
  end
end
