require 'pry'
require_relative 'file_reader'
require_relative 'translator.rb'

class NightWriter
  attr_reader :incoming_text,
              :file_name,
              :reader,
              :translated_input

  def initialize
    @reader = FileReader.new
  end
  # binding.pry

  def translate
    @translated_input = @reader.incoming_text
    @translator = Translator.new(@translated_input)
    @translated_input = @translator.translator
  end
end
  # def writer
  #   writer = File.open(ARGV[1], "w")
  #   writer.write(braille_text)
  #   writer.close
  # # end
# puts "Created '#{ARGV[1]}' containing #{@reader.size} characters."


testing = NightWriter.new
puts testing.translate.inspect
