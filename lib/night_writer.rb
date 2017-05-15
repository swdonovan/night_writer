require 'pry'
require_relative 'file_reader'

class NightWriter
  attr_reader :incoming_text,
              :file_name,
              :reader,
              :translated_input

  def initialize
    @reader = FileReader.new
    @braille_hash_top = Array.new
    @braille_hash_middle = Array.new
    @braille_hash_bottom = Array.new
  end

  def translate
    @translated_input = @reader.incoming_text
    braille_hash = {"top_line" => {"abijklruvz" => "0.", "cdfgmnpqxy" => "00", "ehostw"=>".0"},
                    "middle_line" => {"bfilpsv" => "0.", "ghjqrtw" => "00", "denoyz" => ".0", "ackmux" => ".."},
                    "bottom_line" => {"klmnopqrst" => "0.", "uvxyz" => "00", "abcdefghij" => "..", "w" => ".0"}}
    @translated_input.split("").each do |x|
      if braille_hash["top_line"].keys[0].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[0])
      elsif braille_hash["top_line"].keys[1].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[1])
      elsif braille_hash["top_line"].keys[2].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[2])
        end
      end
    @translated_input.split("").each do |x|
      if braille_hash["middle_line"].keys[0].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[0])
      elsif braille_hash["middle_line"].keys[1].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[1])
      elsif braille_hash["middle_line"].keys[2].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[2])
        end
      end
    @translated_input.split("").each do |x|
      if braille_hash["bottom_line"].keys[0].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[0])
      elsif braille_hash["bottom_line"].keys[1].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[1])
      elsif braille_hash["bottom_line"].keys[2].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[2])
      elsif braille_hash["bottom_line"].keys[3].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[3])
        end
      end
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
