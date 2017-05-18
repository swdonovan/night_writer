gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'pry'
class FileReaderTest < Minitest::Test

  def test_if_ARGV_has_a_value
    assert_equal "lib/message.txt", ARGV[0]
  end

  def test_if_file_name_is_correct
    # binding.pry
    name = File.open(ARGV[0], "r")

    assert_equal "#<File:lib/message.txt>", name.inspect
  end

  def test_if_incoming_text_is_captured
    name = File.open(ARGV[0], "r")
    incoming_text = name.read

    refute_nil incoming_text
  end
end
