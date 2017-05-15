gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/second_night_writer'
require 'pry'

class NightWriterTest < Minitest::Test
  def test_NightWriter_reads_file_content
    text = NightWriter.new
    input = "testing"

    assert_equal input, text.reader.incoming_text
  end

  def test_NightWriter_reads_other_file_content
    skip
    file_name = File.open(lib/test.txt, "r")
    body = file_name.read
    file_name.close
    text = NightWriter.new

    assert_equal body, text.reader.incoming_text
  end

 def test_if_file_contents_can_be_split
   text = NightWriter.new
   translating = text.translate
   input = "testing"

   assert_equal input.split(""), translating
 end

 def test_if_text_translates_to_braille
   text = NightWriter.new

 end
end
