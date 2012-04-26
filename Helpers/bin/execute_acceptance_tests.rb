#!/usr/bin/env ruby

require 'FileUtils'

if !ENV['WORKSPACE']
  puts "WORKSPACE environment variable is not defined. Please make sure it points to the root of your workspace."
  exit 1
end

def run_instruments
  template = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate"
  app = "#{ENV['HOME']}/UIAutomation/build/bin/Release-iphonesimulator/HelloWorld.app"
  script = "#{ENV['WORKSPACE']}/JasmineStyleUIAutomationTests/suite.js"
  log = "#{ENV['HOME']}/UIAutomation/log"
  puts `instruments -t #{template} #{app} -e UIASCRIPT #{script} -e UIARESULTSPATH #{log}`
  $?.exitstatus
end

def check_the_log_file_if_success
  if $?.success?
    check_the_log_file
  else
    exit $?.exitstatus
  end
end

def check_the_log_file
  puts `#{ENV['WORKSPACE']}/Helpers/bin/parse_automation_log.rb "Run 1/Automation Results.plist"`
  $?.exitstatus
end


FileUtils.rm_rf "#{ENV['HOME']}/UIAutomation/log"
FileUtils.mkdir_p "#{ENV['HOME']}/UIAutomation/log"

FileUtils.cd "#{ENV['HOME']}/UIAutomation/log" do
  run_instruments
  exit check_the_log_file_if_success
end