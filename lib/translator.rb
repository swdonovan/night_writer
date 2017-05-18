require 'pry'
require './lib/braille_alphabet'
class Translator

  attr_reader :braille_bottom_line

  def translator(input)
    @braille_alphabet = BrailleAlphabet.new.to_braille
    translated_input_characters = input.split("")
    top_line_translate_to_braille(translated_input_characters)
  end

  def top_line_translate_to_braille(translated_input_characters)
    @braille_top_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_top_line, char, "top_line")
    end
    @braille_top_line = @braille_top_line.join
    middle_line_translate_to_braille(translated_input_characters)
  end

  def middle_line_translate_to_braille(translated_input_characters)
    @braille_middle_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_middle_line, char, "middle_line")
    end
    @braille_middle_line = @braille_middle_line.join
    bottom_line_translate_to_braille(translated_input_characters)
  end

  def bottom_line_translate_to_braille(translated_input_characters)
    @braille_bottom_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_bottom_line, char, "bottom_line")
    end
      @braille_bottom_line = @braille_bottom_line.join
    final_output_braille
  end

  def check_braille_lines(array, char, line)
    @braille_alphabet[line].keys.each.with_index do |key, index|
      if key.include? char
        array.push(@braille_alphabet[line].values[index])
      end
    end
  end

  def final_output_braille
    @final_output = Array.new
    length
    @final_output
  end
end

def length
  until @braille_bottom_line.length == 0
    @final_output << @braille_top_line.slice!(0..79) + "\n" +
    @braille_middle_line.slice!(0..79) + "\n" +
    @braille_bottom_line.slice!(0..79) + "\n"
  end
end
