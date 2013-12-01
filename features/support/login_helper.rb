require 'openssl'
require 'encryptor'
require 'base64'

class LoginHelper
  @@secret_key = Base64.decode64('secret')
  @@iv = Base64.decode64('iv')
  @@salt = Time.now.to_i.to_s

  def encrypt (unencrypted_value)
    return Base64.encode64(Encryptor.encrypt(unencrypted_value, :key => @@secret_key, :iv => @@iv, :salt => @salt, :algorithm => 'aes-256-cbc')).force_encoding('UTF-8')
  end

  def decrypt (encrypted_value)
    return Encryptor.decrypt(Base64.decode64(encrypted_value.force_encoding('ASCII-8BIT')), :key => @@secret_key, :iv => @@iv, :salt => @salt, :algorithm => 'aes-256-cbc')
  end
end
