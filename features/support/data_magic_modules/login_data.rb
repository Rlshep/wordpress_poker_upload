module LoginData
  def password encrypted_password
    LoginHelper.new.decrypt encrypted_password
  end
end