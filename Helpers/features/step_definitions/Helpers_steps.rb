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
