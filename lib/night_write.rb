require 'pry'
require_relative 'file_reader'
require_relative 'translator'

class NightWrite
  attr_reader   :incoming_text,
                :file_name,
                :reader,
                :translated_input,
                :final_input

  attr_accessor :translate,
                :writer

  def initialize
    @reader = FileReader.new
  end

  def translate
    @final_input = Translator.new.translator(@reader.incoming_text)
    @final_input = @final_input.join
    writer
  end

  def writer
    writer = File.open(ARGV[1], "w+")
    writer.write(@final_input)
    writer.close
  end
end


testing = NightWrite.new
puts testing.translate

puts "Created '#{ARGV[1]}' containing #{testing.reader.incoming_text.size} characters."
