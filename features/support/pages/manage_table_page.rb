class ManageTablePage
  include PageObject

  page_url "http://deadmoneypoker.org/wp-admin/edit.php?page=wp-table/wp-table-admin.php"

  text_field(:importname, :name => 'import_name')
  button(:choosefile, :id => 'csv_file')
  text_field(:delimiter, :name => 'delimiter')
  button(:importtable, :name => 'do[9]')
  div(:message, :id => 'message')

end