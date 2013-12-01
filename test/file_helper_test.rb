require_relative '../features/support/file_helper'
require 'test/unit'

class FileHelperTest < Test::Unit::TestCase
  def test_latest_file
    file_helper = FileHelper.new
    expected_file_name = File.dirname(__FILE__)+'/test_dir/test_file_3.txt'
    assert_equal expected_file_name, (file_helper.latest_file_name File.dirname(__FILE__)+'/test_dir', 'test_file*')
  end
end

