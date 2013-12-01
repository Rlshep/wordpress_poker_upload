Feature: Import Poker Results Table

@poker_upload_results
Scenario: Upload a new results file
  Given I am on the Dead Money Poker Login Page
When I get the latest csv result file
And I remove the extra columns
And I Login
And I Click Tables
And I type in the latest result table name
And I choose the latest result csv file
And I change delimiter to ","
And I click the Manage Table Import Table button
And I click the Table Preview Import Table button
Then I should see Table added successfully"
When I click Add New link
And I enter a header for latest results
And I enter the result table number from saved results
And I check Results tag
And I click Publish button
Then I should see Post published

@poker_upload_summary
Scenario: Upload a new summary file
  Given I am on the Dead Money Poker Login Page
When I add latest result to summary file
And I Login
And I Click Tables
And I type in the latest summary table name
And I choose the latest summary csv file
And I change delimiter to ","
And I click the Manage Table Import Table button
And I click the Table Preview Import Table button
Then I should see Table added successfully"
And I navigate to edit summary page
And I enter the summary table number from saved results
And I click update page button
Then I should see page updated
