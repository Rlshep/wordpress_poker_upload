#include 'mail'
#
#options = { :address              => "smtp.gmail.com",
#            :port                 => 587,
#            :domain               => 'gmail.com',
#            :user_name            => 'rlshep@gmail.com',
#            :password             => '7tThlZkxZdKY',
#            :authentication       => 'plain',
#            :enable_starttls_auto => true  }
#
#Mail.defaults do
#  delivery_method :smtp, options
#end
#
#Mail.deliver do
#  to 'rlshep@gmail.com'
#  from 'rlshep@gmail.com'
#  subject 'testing sendmail'
#  body 'testing sendmail'
#end