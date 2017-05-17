require 'pry'
require './lib/braille_alphabet'
class Translator

  def translator(input)
    @braille_alphabet = BrailleAlphabet.new.to_braille
    translated_input_characters = input.split("")
    top_line_translate_to_braille(translated_input_characters)
    middle_line_translate_to_braille(translated_input_characters)
    bottom_line_translate_to_braille(translated_input_characters)
    print final_output_braille
  end

  def top_line_translate_to_braille(translated_input_characters)
    @braille_top_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_top_line, char, "top_line")
    end
  end

  def middle_line_translate_to_braille(translated_input_characters)
    @braille_middle_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_middle_line, char, "middle_line")
    end
  end

  def bottom_line_translate_to_braille(translated_input_characters)
    @braille_bottom_line = Array.new
    translated_input_characters.each do |char|
      check_braille_lines(@braille_bottom_line, char, "bottom_line")
    end
  end

  def check_braille_lines(array, char, line)
    @braille_alphabet[line].keys.each.with_index do |key, index|
      if key.include? char
        array.push(@braille_alphabet[line].values[index])
      # elsif char == char.upcase
      #   upcase_conversion(array, char, line)
      end
    end
  end

  # def upcase_conversion(array, char, line)
  #   char.downcase!
  #   @braille_alphabet[line].keys.each.with_index do |key, index|
  #     if line == "bottom_line"
  #       if key.include? char
  #         array.push(".0" + @braille_alphabet[line].values[index])
  #       end
  #     elsif line == "top_line"
  #       if key.include? char
  #         array.push(".." + @braille_alphabet[line].values[index])
  #         # binding.pry
  #       end
  #     elsif line == "middle_line"
  #       if key.include? char
  #         array.push(".." + @braille_alphabet[line].values[index])
  #       end
  #     end
  #   end
  # end

  def final_output_braille
    final_output = Array.new
    final_output =
    @braille_top_line.join + "\n" + @braille_middle_line.join + "\n" +
    @braille_bottom_line.join
  end
end
  # def upcase_to_top_line(char)
  #   if @braille_alphabet["top_line"].keys[0].include? char.downcase
  #     @braille_top_line.push(".." + @braille_alphabet["top_line"].values[0])
  #   elsif @braille_alphabet["top_line"].keys[1].include? char.downcase
  #     @braille_top_line.push(".." + @braille_alphabet["top_line"].values[1])
  #   elsif @braille_alphabet["top_line"].keys[2].include? char.downcase
  #     @braille_top_line.push(".." + @braille_alphabet["top_line"].values[2])
  #   end
  # end


  # def upcase_to_middle_line(char)
  #   if @braille_alphabet["middle_line"].keys[0].include? char.downcase
  #     @braille_middle_line.push(".." + @braille_alphabet["middle_line"].values[0])
  #   elsif @braille_alphabet["middle_line"].keys[1].include? char.downcase
  #     @braille_middle_line.push(".." + @braille_alphabet["middle_line"].values[1])
  #   elsif @braille_alphabet["middle_line"].keys[2].include? char.downcase
  #     @braille_middle_line.push(".." + @braille_alphabet["middle_line"].values[2])
  #   elsif @braille_alphabet["middle_line"].keys[3].include? char.downcase
  #     @braille_middle_line.push(".." + @braille_alphabet["middle_line"].values[3])
  #   end
  # end


  # def upcase_to_bottom_line(char)
  #   if @braille_alphabet["bottom_line"].keys[0].include? char.downcase
  #     @braille_bottom_line.push(".0" + @braille_alphabet["bottom_line"].values[0])
  #   elsif @braille_alphabet["bottom_line"].keys[1].include? char.downcase
  #     @braille_bottom_line.push(".0" + @braille_alphabet["bottom_line"].values[1])
  #   elsif @braille_alphabet["bottom_line"].keys[2].include? char.downcase
  #     @braille_bottom_line.push(".0" + @braille_alphabet["bottom_line"].values[2])
  #   elsif @braille_alphabet["bottom_line"].keys[3].include? char.downcase
  #     @braille_bottom_line.push(".0" + @braille_alphabet["bottom_line"].values[3])
  #   end
  # end
