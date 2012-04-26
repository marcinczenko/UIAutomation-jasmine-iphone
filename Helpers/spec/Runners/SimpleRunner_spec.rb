require 'spec_helper'

module Runners
  
  describe SimpleRunner do
    it 'can a run a script' do
      @runner = SimpleRunner.new("#{$BIN_PATH}/sleeper.rb 1")
      @runner.start()
      @runner.wait()      
    end
    it 'provide script standard output and the exit status' do
      @runner = SimpleRunner.new("#{$BIN_PATH}/sleeper.rb 1")
      @runner.start()
      exit_status = @runner.wait()
      exit_status.success?.should == true
      @runner.output.should == "START\nSTOP\n"
      @runner.exited_normally?.should == true
    end
    it 'can be notified to be terminated abnormally' do
      @runner = SimpleRunner.new("#{$BIN_PATH}/sleeper.rb 5")
      @runner.start()
      @runner.notify()
      @runner.wait()
      @runner.exited_normally?.should == false
    end
  end  
end
