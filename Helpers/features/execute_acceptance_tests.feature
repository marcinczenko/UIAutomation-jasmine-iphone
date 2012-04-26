Feature: Execute acceptance tests
  In order to continuously monitor my acceptance tests
  As a product owner
  I want a script that will run the acceptance tests and inform me about the outcomes.

Scenario: Running execute_acceptance_tests script
  Given the "execute_acceptance_tests.rb" script exists
  When executed from the root of the workspace
  Then it clears the "${HOME}/UIAutomation/log" folder
  And it executes the UIAutomation instruments from the "${HOME}/UIAutomation/log" folder
  And it verifies the log file produced by the UIAutomation instrument
