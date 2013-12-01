
module MenuPanel
  include PageObject

  link(:posts, :text => 'Posts')
  link(:addposts, :text => 'Add New')
  link(:tables, :text => 'Tables')
  link(:pages, :text => 'Pages')
end