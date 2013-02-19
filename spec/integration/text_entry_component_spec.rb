require File.join(File.dirname(__FILE__), '..', 'spec_helper')

include Java

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JOptionPane
import javax.swing.JTextField
import javax.swing.JLabel

class TypingIsFunApp < JFrame
  def initialize
    super "Typing Is Fun"

    self.initUI
  end

  def initUI
   
    panel = JPanel.new
    panel.setLayout nil

    wrongTextField = JTextField.new 10
    wrongTextField.setBounds 10,20,20,30
    panel.add wrongTextField

    label = JLabel.new "Enter Text"
    label.setBounds 10,80,60,90

    panel.add label

    textField = JTextField.new 30
    textField.setBounds 78,80,180,90
    panel.add textField

    self.add panel
    self.pack

    self.setSize 300,300
    self.setDefaultCloseOperation JFrame::DISPOSE_ON_CLOSE
    self.setLocationRelativeTo nil
    self.setVisible true
    
    wrongTextField.requestFocus
  end
  
end

describe Component do

  Sikulio::Config.image_root = File.join(File.dirname(__FILE__), '..', 'support', 'images')

  class TypingIsFun < Component
    init_image_elements 'typing_is_fun'
    relative_element :enter_text_field,
    :relative_to => :enter_text_label,
    :offset_x => 100,
    :offset_y => 0
  end
  
  it "clicks the image" do
 
    app = TypingIsFunApp.new
    tif = TypingIsFun.new
	
    tif.enter_text_field.click
    tif.enter_text_field.type "blah and blah"

    tif.expected_result.find

    app.dispose

  end
end
