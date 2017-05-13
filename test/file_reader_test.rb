gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class FileReaderTest < Minitest::Test



  def test_if_file_name_is_correct
    file_name = ARGV[0]

    assert_equal message.txt, file_name
  end




end
