# require_relative 'night_writer'
class FileReader
  attr_reader :incoming_text,
              :file_name

  def initialize
    @file_name = File.open(ARGV[0], "r")
    @incoming_text = @file_name.read.chomp
    @file_name.close
  end
end

#
# words = FileReader.new
#
# puts words.incoming_text
