require 'pry'
require_relative 'file_reader'

class NightWriter
  attr_reader :incoming_text,
              :file_name,
              :reader,
              :translated_input

attr_accessor :braille_hash_top

  def initialize
    @reader = FileReader.new
  end

  def translate
    @translated_input = @reader.incoming_text
    # @translated_input.braille_hash_top
    braille_hash = {"abijklruvz" => "0.",
                    "cdfgmnpqxy" => "00",
                    "ehostw"=>".0"}
    @translated_input.split("").map do |x|
      if braille_hash.keys[0].include? x
        braille_hash.values[0]
      elsif braille_hash.keys[1].include? x
        braille_hash.values[1]
      elsif braille_hash.keys[2].include? x
        braille_hash.values[2]
      else
        x
      end
    end
  end

  def braille_hash_top

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
