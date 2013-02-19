require File.join(File.dirname(__FILE__), '..', 'spec_helper')

include Java

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JOptionPane

class ClickingIsFunApp < JFrame
  def initialize
    super "Clicking Is Fun"

    self.initUI
  end

  def initUI
   
    panel = JPanel.new
    self.getContentPane.add panel
    panel.setLayout nil

    button = JButton.new "Click Me"
    button.setBounds 100,60,100,30

    button.addActionListener do |e|
      JOptionPane.showMessageDialog panel, "Button Clicked", "An Informative Message", JOptionPane::INFORMATION_MESSAGE
    end

    panel.add button

    self.setSize 300,200
    self.setDefaultCloseOperation JFrame::DISPOSE_ON_CLOSE
    self.setLocationRelativeTo nil
    self.setVisible true
  end
  
end

describe Component do

  Sikulio::Config.image_root = File.join(File.dirname(__FILE__), '..', 'support', 'images')

  class ClickingIsFun < Component
    init_image_elements
  end
  
  it "clicks the image" do
 
    app = ClickingIsFunApp.new

    cif = ClickingIsFun.new
    
    cif.click_me_button.click

    cif.button_clicked_dialog.find

    app.dispose

  end
end
