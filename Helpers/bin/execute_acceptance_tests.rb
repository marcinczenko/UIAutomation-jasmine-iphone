#!/usr/bin/env ruby

require 'FileUtils'

$LOAD_PATH.unshift(File.expand_path('../../lib',__FILE__)) unless $LOAD_PATH.include?(File.expand_path('../../lib',__FILE__))
require 'Runners'

if !ENV['WORKSPACE']
  puts "WORKSPACE environment variable is not defined. Please make sure it points to the root of your workspace."
  exit 1
end

$exit_code = 0

def instruments_command()
  template = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate"
  app = "#{ENV['HOME']}/UIAutomation/build/bin/Release-iphonesimulator/HelloWorld.app"
  script = "#{ENV['WORKSPACE']}/JasmineStyleUIAutomationTests/suite.js"
  log = "#{ENV['HOME']}/UIAutomation/log"
  puts "instruments -t '#{template}' '#{app}' -e UIASCRIPT '#{script}' -e UIARESULTSPATH '#{log}'"
  # "instruments -t #{template} #{app} -e UIASCRIPT #{script} -e UIARESULTSPATH #{log}"
  "instruments -t '#{template}' '#{app}' -e UIASCRIPT '#{script}' -e UIARESULTSPATH '#{log}'"
end

def automation_log_parser_command()
  "'#{ENV['WORKSPACE']}/Helpers/bin/parse_automation_log.rb' 'Run 1/Automation Results.plist'"
end

def run_instruments
  run_command(instruments_command,20)
end

def run_command(command,timeout)
  runner = Runners::SimpleRunner.new(command)
  runner.start()
  hangupDetector = Runners::HangupDetector.new([runner],timeout)
  exit_status = runner.wait()
  hangupDetector.stop()
  puts runner.output()
  if !exit_status.success? || !runner.exited_normally?
    1
  else
    0
  end
end

def check_the_log_file
  run_command(automation_log_parser_command,10)
end


FileUtils.rm_rf "#{ENV['HOME']}/UIAutomation/log"
FileUtils.mkdir_p "#{ENV['HOME']}/UIAutomation/log"

FileUtils.cd "#{ENV['HOME']}/UIAutomation/log" do
  exit_status = run_instruments
  if 0 == exit_status
    exit_status = check_the_log_file
  end
  exit exit_status  
end
