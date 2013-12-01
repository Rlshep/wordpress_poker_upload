class EditPage
  include PageObject

  # Season 7 summary page
  page_url 'http://deadmoneypoker.org/wp-admin/page.php?action=edit&post=572'

  text_field(:posttitle, :name => 'post_title')
  button(:update, :id => 'publish')
  text_area(:content, :id => 'content')
  div(:message, :id => 'message')
end