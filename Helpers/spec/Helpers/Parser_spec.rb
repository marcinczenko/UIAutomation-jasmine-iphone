require 'spec_helper'

module Helpers
  
  FAILURE_MESSAGE_1 = """===================
FAILURE!!!!!!!!!!!!
Expected 'Hello World ' to equal 'Hello World !'.
in
Hello World App should display \"Hello World !\" in the label after pressing the \"Click Me :)\" button.
===================\n"""

  FAILURE_MESSAGE_2 = FAILURE_MESSAGE_1 + """===================
FAILURE!!!!!!!!!!!!
Expected 'I am not empty' to equal ''.
in
Hello World App should display empty string in the label after pressing the \"Reset\" button.
===================\n"""
  NO_FAILURE_MESSAGE = ""
  
  describe Parser do
    it "reports exactly one error when there is exactly one failed test" do
      parser = Parser.new("#{$FIXTURES_PATH}/OneFailure.plist")
      parser.output.should == FAILURE_MESSAGE_1
      parser.exit_code.should == 1
    end
    it "reports all errors when there are more than one failed test" do
      parser = Parser.new("#{$FIXTURES_PATH}/TwoFailures.plist")
      parser.output.should == FAILURE_MESSAGE_2
      parser.exit_code.should == 1
    end
    it "does not report any errors when there are no errors" do
      parser = Parser.new("#{$FIXTURES_PATH}/NoFailures.plist")
      parser.output.should == NO_FAILURE_MESSAGE
      parser.exit_code.should == 0
    end    
  end
end
