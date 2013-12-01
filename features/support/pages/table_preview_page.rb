class TablePreviewPage
  include PageObject

  page_url "http://deadmoneypoker.org/wp-admin/edit.php?page=wp-table/wp-table-admin.php"

  button(:importtable, :name => 'do[10]')
end