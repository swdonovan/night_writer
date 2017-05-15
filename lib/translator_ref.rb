class Translator
  attr_accessor :top_line_translate_to_braille,
                :middle_line_translate_to_braille,
                :bottom_line_translate_to_braille

  def initialize(input)
    @translated_input = input
    @braille_hash = {"top_line" => {"abehkloruvz" => "0.", "cdfgmnpqxy" => "00", "ijstw"=>".0"},
                     "middle_line" => {"bfilpsv" => "0.", "ghjqrtw" => "00", "denoyz" => ".0", "ackmux" => ".."},
                     "bottom_line" => {"klmnopqrst" => "0.", "uvxyz" => "00", "abcdefghij" => "..", "w" => ".0"}}
    @braille_hash_top = Array.new
    @braille_hash_middle = Array.new
    @braille_hash_bottom = Array.new
    @final_braille_on_rails = Array.new
  end


  def translator
  @translated_input_array = @translated_input.split("")
  @translated_input_array.top_line_translate_to_braille
  @translated_input_array.middle_line_translate_to_braille
  @translated_input_array.bottom_line_translate_to_braille
  end

  def top_line_translate_to_braille
    @translated_input_array.each do |x|
      if braille_hash["top_line"].keys[0].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[0])
      elsif braille_hash["top_line"].keys[1].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[1])
      elsif braille_hash["top_line"].keys[2].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[2])
      elsif x == " "
        @braille_hash_top.push("..")
      elsif x != " " && x == x.upcase
        @upcase_to_top_line
      end
    end
  end
  def upcase_to_top_line
    if braille_hash["top_line"].keys[0].include? x.downcase
      @braille_hash_top.push(".." + braille_hash["top_line"].values[0])
    elsif braille_hash["top_line"].keys[1].include? x.downcase
      @braille_hash_top.push(".." + braille_hash["top_line"].values[1])
    elsif braille_hash["top_line"].keys[2].include? x.downcase
      @braille_hash_top.push(".." + braille_hash["top_line"].values[2])
    end
  end
  def middle_line_translate_to_braille
    @translated_input_array.each do |x|
      if braille_hash["middle_line"].keys[0].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[0])
      elsif braille_hash["middle_line"].keys[1].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[1])
      elsif braille_hash["middle_line"].keys[2].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[2])
      elsif braille_hash["middle_line"].keys[3].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[3])
      elsif x == " "
        @braille_hash_middle.push("..")
      elsif x != " " && x == x.upcase
        @upcase_to_middle_line
      end
    end
  end
  def upcase_to_middle_line
    if braille_hash["middle_line"].keys[0].include? x.downcase
      @braille_hash_middle.push(".." + braille_hash["middle_line"].values[0])
    elsif braille_hash["middle_line"].keys[1].include? x.downcase
      @braille_hash_middle.push(".." + braille_hash["middle_line"].values[1])
    elsif braille_hash["middle_line"].keys[2].include? x.downcase
      @braille_hash_middle.push(".." + braille_hash["middle_line"].values[2])
    elsif braille_hash["middle_line"].keys[3].include? x.downcase
      @braille_hash_middle.push(".." + braille_hash["middle_line"].values[3])
    end
  end

  def bottom_line_translate_to_braille
    @translated_input_array.each do |x|
      if braille_hash["bottom_line"].keys[0].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[0])
      elsif braille_hash["bottom_line"].keys[1].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[1])
      elsif braille_hash["bottom_line"].keys[2].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[2])
      elsif braille_hash["bottom_line"].keys[3].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[3])
      elsif x == " "
        @braille_hash_bottom.push("..")
      elsif x != " " && x == x.upcase
        @upcase_to_bottom_line
      end
    end
  end

  def upcase_to_bottom_line
    if braille_hash["bottom_line"].keys[0].include? x.downcase
      @braille_hash_bottom.push(".0" + braille_hash["bottom_line"].values[0])
    elsif braille_hash["bottom_line"].keys[1].include? x.downcase
      @braille_hash_bottom.push(".0" + braille_hash["bottom_line"].values[1])
    elsif braille_hash["bottom_line"].keys[2].include? x.downcase
      @braille_hash_bottom.push(".0" + braille_hash["bottom_line"].values[2])
    elsif braille_hash["bottom_line"].keys[3].include? x.downcase
      @braille_hash_bottom.push(".0" + braille_hash["bottom_line"].values[3])
    end
  end
end
