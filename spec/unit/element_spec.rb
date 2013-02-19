require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Element do

  let(:file) { File.join(File.dirname(__FILE__), "images", "my_pic.png") }
  let(:screen) { Sikuli::Screen.new }

  before do
   @el = Element.new(screen, file)
  end	  

  describe "#initialize" do
    it "sets its screen and ident based on the provided values" do
     @el.screen.should == screen
     @el.ident.should == file
    end
  end

  describe "#click" do
    it "clicks itself" do
     @el.screen.should_receive(:click).with(file)
     @el.click
    end
  end

  describe "#find" do
    it "finds itself" do
     @el.screen.should_receive(:find).with(file)
     @el.find
    end
  end
  
  describe "#type" do
    it "sends some keystrokes" do
     @el.screen.should_receive(:type).with("blah")
     @el.type "blah"
    end
  end

end
