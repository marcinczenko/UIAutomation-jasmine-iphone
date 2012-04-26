$LOAD_PATH << File.expand_path('../../../lib',__FILE__)
$LOAD_PATH << File.expand_path('../../../bin',__FILE__)
$FIXTURES_PATH = String.new File.expand_path('../../fixtures',__FILE__)
$BIN_PATH = String.new File.expand_path('../../../bin',__FILE__)
$WORKSPACE_ROOT = String.new File.expand_path('../../../../',__FILE__)

require "Shell"

