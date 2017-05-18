gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriteTest < Minitest::Test

  def test_NightWrite_reads_other_file_content
    file_name = File.read(ARGV[0])
    text = NightWrite.new
    actual = text.reader.incoming_text
    expected = file_name.chomp

    assert_equal expected, actual
  end

  def test_if_translated_file_contains_english_letters
    text = NightWrite.new
    file_name = File.read(ARGV[1])
    alpha = Array.new
    alpha = *('a'..'z')
    alpha.join
    actual = file_name.include? alpha.to_s

    assert_equal false, actual
  end

 def test_if_writer_creates_file
   text = NightWrite.new
   file_name = File.read(ARGV[1])

   refute_nil file_name
 end
end
