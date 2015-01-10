class EditPage
  include PageObject

  # Season 8 summary page
  page_url 'http://deadmoneypoker.org/wp-admin/page.php?action=edit&post=673'

  text_field(:posttitle, :name => 'post_title')
  button(:update, :id => 'publish')
  text_area(:content, :id => 'content')
  div(:message, :id => 'message')
end