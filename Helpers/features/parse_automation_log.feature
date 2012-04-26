Feature: Parse automation log
  In order to integrate with continuous integration system
  As a user
  I want I want to receive error code and the problem description for each automation test that fails

Scenario: Parsing automation log file with one failing test
  Given "OneFailure.plist" file
  When file is parsed
  Then the exit code should be 1
  And the output message should be
	"""
	===================
	FAILURE!!!!!!!!!!!!
	Expected 'Hello World ' to equal 'Hello World !'.
	in
	Hello World App should display "Hello World !" in the label after pressing the "Click Me :)" button.
	===================
	
	"""

Scenario: Parsing automation log file with more than one failing test
  Given "TwoFailures.plist" file
  When file is parsed
  Then the output message should be
	"""
	===================
	FAILURE!!!!!!!!!!!!
	Expected 'Hello World ' to equal 'Hello World !'.
	in
	Hello World App should display "Hello World !" in the label after pressing the "Click Me :)" button.
	===================
	===================
	FAILURE!!!!!!!!!!!!
	Expected 'I am not empty' to equal ''.
	in
	Hello World App should display empty string in the label after pressing the "Reset" button.
	===================
	
	"""

Scenario: Parsing automation log file with no failing tests
  Given "NoFailures.plist" file
  When file is parsed
  Then the output message should be empty string
