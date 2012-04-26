module Runners
  
    class SimpleRunner
        def initialize (command)
            @command = command
            @exited_normally = true
            @output = ""
        end        

        def start            
            @us = IO.popen("#{@command}", "w+")
            @th = Thread.new { run() }
        end
        
        def notify
            begin                
                Process.kill("QUIT", @us.pid)
            rescue Errno::ESRCH
            end
            @exited_normally = false
        end

        def run
            while true do
              begin
                  str=@us.gets 
                  @output << str
              rescue Exception => e
                  return   
              end                  
            end                     
        end
        
        def wait
          pid, exit_status = Process::waitpid2(@us.pid,0)                           
          exit_status
        end
        
        def exited_normally?
          @exited_normally
        end
        
        def output
          @output
        end
    end
end
