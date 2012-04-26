module Runners

    class HangupDetector

        def initialize (arrayOfProcessesToBeNotified, timeout)
            @observers = Array.new
            arrayOfProcessesToBeNotified.each do |observer|
                add_observer(observer)
            end            
            @monitorStop = false
            @monitorThread = Thread.new { run(timeout) }
        end

        def add_observer(observer)
            @observers << observer
        end

        def run(timeout)
            time_running = 0
            while !@monitorStop do
                sleep(1)
                time_running += 1                
                break if time_running > timeout
            end
            if !@monitorStop
                @observers.each do |observer|
                    observer.notify()
                end                
            end
        end

        def stop
            @monitorStop = true
            @monitorThread.join
        end
    end
end
