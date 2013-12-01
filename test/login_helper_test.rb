require_relative '../features/support/login_helper'
require 'test/unit'

class LoginHelperTest < Test::Unit::TestCase
  def test_encryption
    login_helper1 = LoginHelper.new
    encrypted_password = login_helper1.encrypt 'password'
    assert_equal 'password', (login_helper1.decrypt encrypted_password)

    login_helper2 = LoginHelper.new
    assert_equal 'password', (login_helper2.decrypt encrypted_password)
  end
end