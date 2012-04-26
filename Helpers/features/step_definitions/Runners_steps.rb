require 'Runners'

Given /^a script has been started$/ do
  @runner = Runners::SimpleRunner.new("#{$BIN_PATH}/sleeper.rb 3")
  @runner.start()
end

When /^the timebox is over before the script finishes$/ do
  @hangupDetector = Runners::HangupDetector.new([@runner],1)
  @runner.wait()
  @hangupDetector.stop()
end

Then /^the script will be terminated$/ do
  @runner.exited_normally?.should == false
end

Given /^a script has been started \(running shortly\)$/ do
  @runner = Runners::SimpleRunner.new("#{$BIN_PATH}/sleeper.rb 1")
  @runner.start()
end

When /^it is finished normally$/ do
  @runner.wait()
end

Then /^we can detect that$/ do
  @runner.exited_normally?.should == true
end

When /^it is finished$/ do
  @runner.wait()
end

Then /^we can collect the output$/ do |string|
  @runner.output.should == string
end
