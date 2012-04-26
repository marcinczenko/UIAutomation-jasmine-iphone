Given /^"([^"]*)" file$/ do |fileName|
  @filePath = "#{$FIXTURES_PATH}/#{fileName}"
  if !File.exists?(@filePath) then
    raise "File #{fileName} at #{$FIXTURES_PATH} cannot be found !"
  end
end

When /^file is parsed$/ do
  expect {
    @output = `ruby #{$BIN_PATH}/parse_automation_log.rb #{@filePath}`
  }.to_not raise_error()
end

Then /^the exit code should be (\d+)$/ do |exitCode|
  $?.exitstatus.should == exitCode.to_i
end

Then /^the output message should be$/ do |outputString|
  @output.should == outputString
end

Then /^the output message should be empty string$/ do
  @output.should == ""
end

Given /^the "([^"]*)" script exists$/ do |script_name|
  @script_path = "#{$BIN_PATH}/#{script_name}"
  if !File.exists?(@script_path) then
    raise "Script #{script_name} cannot be found !"
  end
end

When /^executed from the root of the workspace$/ do
  expect {
    Shell.cd($WORKSPACE_ROOT) do
      @output = `ruby #{@script_path}`
    end
  }.to_not raise_error()
end

Then /^it clears the "([^"]*)" folder$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^it executes the UIAutomation instruments from the "([^"]*)" folder$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^it verifies the log file produced by the UIAutomation instrument$/ do
  pending # express the regexp above with the code you wish you had
end
