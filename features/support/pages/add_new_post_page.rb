class AddNewPostPage
  include PageObject

  page_url 'http://deadmoneypoker.org/wp-admin/post-new.php'

  text_field(:posttitle, :name => 'post_title')
  button(:content, :id => 'content')
  div(:editor, :id => 'editorcontainer')
  button(:publish, :name => 'publish')
  text_area(:content, :id => 'content')
  list_item(:resultstag, :id => 'category-3')
  div(:message, :id => 'message')
end