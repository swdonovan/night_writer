gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriteTest < Minitest::Test
  def test_NightWriter_reads_file_content
    text = NightWrite.new
    input = "testing"

    assert_equal input, text.reader.incoming_text
  end

  def test_NightWriter_reads_other_file_content
    file_name = File.read(ARGV[0])
    text = NightWrite.new

    assert_equal file_name.chomp, text.reader.incoming_text
  end

 def test_if_file_contents_can_be_split
   night_writer = NightWrite.new
   expected_output = "testing".split("")

   assert_equal(expected_output, night_writer.translate)
 end

 # def test_if_writer_writes_file
 #  
 # end
end
