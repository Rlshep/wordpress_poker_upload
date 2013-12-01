require 'rautomation'

class WindowsUploadPage
  def upload_file file_name
    puts file_name
    window = RAutomation::Window.new(:title => /Open/i)

    window.exists? # => true

    window.text_field(:class => "Edit", :index => 0).set file_name
    button = window.button(:value => "&Open")
    button.exists?
    button.click
  end
end