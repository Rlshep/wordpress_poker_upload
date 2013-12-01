require 'rspec-expectations'
require 'page-object'
require_relative 'data_magic_modules/login_data'

World(PageObject::PageFactory)
DataMagic.add_translator LoginData
$config = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../../config/config.yaml'))