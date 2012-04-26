require 'spec_helper'

module Runners
  
  describe HangupDetector do
    it 'can notify another process after given timeout' do
      runner = double('runner')
      runner.should_receive(:notify)
      hangupDetector = HangupDetector.new([runner],1)
      sleep(3)
    end
    it 'can notify more than one process after given timeout' do
      runner1 = double('runner1')
      runner1.should_receive(:notify)
      runner2 = double('runner2')
      runner2.should_receive(:notify)
      hangupDetector = HangupDetector.new([runner1,runner2],1)
      sleep(3)
    end
    it 'can be stopped at any time without waiting for the timbox' do
      runner = double('runner')
      runner.should_not_receive(:notify)
      hangupDetector = HangupDetector.new([runner],1)
      hangupDetector.stop()
      sleep(3)
    end
  end  
end
