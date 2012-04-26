Feature: Runners
  In order not to be blocked by a non-responsive script 
  As a programmer
  I want to be able to terminate a non-responsive script in a convenient way

Scenario: A non-responsive script
  Given a script has been started
  When the timebox is over before the script finishes
  Then the script will be terminated

Scenario: Normally terminating script
  Given a script has been started (running shortly)
  When it is finished normally
  Then we can detect that

Scenario: Collecting the output from the scrip
  Given a script has been started (running shortly)
  When it is finished
  Then we can collect the output
	"""
	START
	STOP
	
	"""
