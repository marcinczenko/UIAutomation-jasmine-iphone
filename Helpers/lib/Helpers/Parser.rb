require 'rexml/document'

module Helpers
  
  class Parser
    def initialize(filePath)
      @output = ""
      parse_the_log_file(filePath)
    end
    
    def parse_the_log_file(filePath)
      output_from_the_opening_element = ""
      
      for_each_failing_log_element_in(xml_document_from(filePath)) do |element|
        if opening_element?(element)
          output_from_the_opening_element = format_output_for(element)
        elsif closing_element?(element)
          output_from_the_closing_element = format_output_for(element)
          combine(output_from_the_opening_element,output_from_the_closing_element)
        end
      end      
    end
    
    def xml_document_from(filePath)
      REXML::Document.new(File.new(filePath))
    end
    
    def for_each_failing_log_element_in(xmldoc)
      xmldoc.elements.each("/plist/dict/array/dict[key[text()='LogType'][following-sibling::string[text()='Fail']]]") {|e| yield e }
    end
    
    def opening_element?(element)
      element.elements["integer[text()='4'][preceding-sibling::key[text()='Type']]"]
    end
    
    def closing_element?(element)
      element.elements["integer[text()='7'][preceding-sibling::key[text()='Type']]"]
    end
    
    def format_output_for(element)
      element.elements["string[preceding-sibling::key[text()='Message']]/text()"].to_s().strip().gsub(/\\n$/, "")
    end
    
    def combine(first,second)
      @output << "===================\nFAILURE!!!!!!!!!!!!\n#{second}\nin\n#{first}\n===================\n"
    end
    
    def output
      @output
    end
    
    def exit_code
      if "" == @output
        0
      else
        1
      end
    end
  end
end
