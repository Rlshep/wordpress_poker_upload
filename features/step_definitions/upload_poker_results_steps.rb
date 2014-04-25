require_relative '../support/results_table_helper'
require_relative '../support/pages/windows_upload_page'
require 'test/unit'

results_table_helper = ResultsTableHelper.new
wup = WindowsUploadPage.new
file_helper = FileHelper.new

Given(/^I am on the Dead Money Poker Login Page$/) do
  visit_page LoginPage
end

When(/^I Login$/) do
  on_page(LoginPage).process_login
end
When(/^I Click Tables$/) do
  on_page(DashboardPage).tables
end

When(/^I type in the latest result table name$/) do
  on_page(ManageTablePage).importname = results_table_helper.get_table_name @latest_result_file
end

When(/^I change delimiter to "([^"]*)"$/) do |delimiter|
  on_page(ManageTablePage).delimiter = delimiter
end

And(/^I get the latest csv result file$/) do
  @latest_result_file = file_helper.latest_file_name $config['local_path'], 'Results*.csv'
end

And(/^I remove the extra columns$/) do
  results_parser = PokerResultsFileHandler.new
  path_name = results_table_helper.get_path_name @latest_result_file
  file_name = results_table_helper.get_file_name @latest_result_file

  results_parser.parse_poker_results_csv_file_by_path_and_file_name path_name, file_name
end

And(/^I choose the latest result csv file$/) do
  on_page(ManageTablePage).choosefile

  wup.upload_file (results_table_helper.get_full_truncated_file_name @latest_result_file)
end


And(/^I click the Manage Table Import Table button$/) do
  on_page(ManageTablePage).importtable
end

And(/^I click the Table Preview Import Table button$/) do
  on_page(TablePreviewPage).importtable
end

Then(/^I should see Table added successfully"$/) do
  @table_number = on_page(ManageTablePage).message.slice /\d+/
end

When(/^I click Add New link$/) do
  on_page(DashboardPage).addposts
end

And(/^I enter a header for latest results$/) do
  on_page(AddNewPostPage).posttitle = (results_table_helper.get_table_name @latest_result_file)
end

And(/^I enter the result table number from saved results$/) do
  on_page(AddNewPostPage).content = '[table=' + @table_number + ']'
end

And(/^I click Publish button$/) do
  Watir::Wait.until {(on_page(AddNewPostPage).publish_element).enabled?}
  on_page(AddNewPostPage).publish
end


Then(/^I should see Post published$/) do
  on_page(AddNewPostPage).message.should include 'Post published.'
end

And(/^I check Results tag$/) do
  on_page(AddNewPostPage).resultstag
end

When(/^I add latest result to summary file for "([^"]*)"$/) do |title|
  latest_summary_file = file_helper.latest_file_name $config['local_path'], 'Summary*.csv'
  latest_result_file = file_helper.latest_file_name $config['local_path'], 'Results*.csv'

  @latest_summary_file_name = PokerSummaryFileHandler.new.create_new_poker_summary_file $config['local_path'], latest_summary_file, latest_result_file, title
end

When(/^I type in the latest summary table name$/) do
  on_page(ManageTablePage).importname = results_table_helper.get_table_name @latest_summary_file_name
end

And(/^I choose the latest summary file$/) do
  on_page(ManageTablePage).choosefile

  wup.upload_file (results_table_helper.get_full_truncated_file_name @latest_summary_file_name)
end

When(/^I click the Pages link$/) do
  on_page(DashboardPage).pages
end

And(/^I enter the summary table number from saved results$/) do
  on_page(EditPage).content = '[table=' + @table_number + ']'
end

And(/^I choose the latest summary csv file$/) do
  on_page(ManageTablePage).choosefile

  wup.upload_file (results_table_helper.get_full_windows_file_name @latest_summary_file_name)
end

And(/^I navigate to edit summary page$/) do
  visit_page(EditPage)
end

And(/^I click update page button$/) do
  Watir::Wait.until {(on_page(EditPage).update_element).enabled?}
  sleep 5
  on_page(EditPage).update

end

Then(/^I should see page updated$/) do
  on_page(AddNewPostPage).message.should include 'Page updated.'
end

