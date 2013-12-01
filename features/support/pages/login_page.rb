class LoginPage
  include PageObject
  include DataMagic

  page_url "http://deadmoneypoker.org/wp-login.php"

  text_field(:username, :id => "user_login")
  text_field(:password, :id => "user_pass")
  button(:login, :name => "wp-submit")

  def process_login
    populate_page_with data_for('login_page')
    login
  end
end