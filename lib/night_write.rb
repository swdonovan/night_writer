require 'pry'
require_relative 'file_reader'
require_relative 'translator'

class NightWrite
  attr_reader :incoming_text,
              :file_name,
              :reader,
              :translated_input
  attr_accessor :translate

  def initialize
    @reader = FileReader.new
  end
  # binding.pry

  def translate
    @final_input = Translator.new.translator(@reader.incoming_text)
    # translator = Translator.new
    # @final_input = translator.translator(@reader.incoming_text)
  end
end
  # def writer
  #   writer = File.open(ARGV[1], "w")
  #   writer.write(braille_text)
  #   writer.close
  # # end
# puts "Created '#{ARGV[1]}' containing #{@reader.size} characters."

#
testing = NightWrite.new
puts testing.translate
