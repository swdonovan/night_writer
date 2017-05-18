gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'
require 'pry'

class NightReadTest < Minitest::Test

  def test_NightRead_reads_other_file_content
    file_name = File.read(ARGV[0])
    text = NightRead.new
		text.translator("..")
    actual = text.reader.incoming_text
    expected = file_name.chomp

    assert_equal expected, actual
  end

  def test_if_file_to_translate_contains_english_letters
    text = NightRead.new
    file_name = File.read(ARGV[0])
    alpha = Array.new
    alpha = *('a'..'z')
    alpha.join
    actual = file_name.include? alpha.to_s
binding.pry
    assert_equal true, actual
  end

 def test_if_writer_creates_file
   text = NightRead.new
   file_name = File.read(ARGV[1])

   refute_nil file_name
 end
end
