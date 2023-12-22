@getFactorial
Feature: Calculate Factorial
  Scenario Outline: Should calculate positive integer
   Given I am on the home page
   Then Verify home page is opened "mainPageText","Factorial Calculator Extreme!"
   When User type integer "numberInput","<input>"
   When User clikcs button "calculateButton"
   Then Verify result message "result","<message>"
  
   
   Examples:
   |input|message|
   |0|The factorial|
   |2|The factorial| 

   Scenario Outline: Should not calculate special char. and alphabetic char
   Given I am on the home page
   Then Verify home page is opened "mainPageText","Factorial Calculator Extreme!"
   When User type integer "numberInput","<input>"
   When User clikcs button "calculateButton"
   Then Verify result message "result","<message>"


   Examples:
   |input|message|
   |3/4|Please enter an integer| 
   |*|Please enter an integer|
   |test|Please enter an integer|

   Scenario: Should not calculate negative integer
   Given I am on the home page
   Then Verify home page is opened "mainPageText","Factorial Calculator Extreme!"
   When User type integer "numberInput","-1"
   When User clikcs button "calculateButton"
   Then Verify result message "result","Please enter an positive integer"

   Scenario: Should not calculate more than three digits integer
   Given I am on the home page
   Then Verify home page is opened "mainPageText","Factorial Calculator Extreme!"
   When User type integer "numberInput","1234"
   When User clikcs button "calculateButton"
   Then Verify result message "result","Please enter max 3 digits positive integer"