class Translator
  attr_reader :braille_hash
  def initialize(incoming_text)
    @translated_input = incoming_text
    @braille_hash = {"top_line" => {"abehkloruvz" => "0.", "cdfgmnpqxy" => "00", "ijstw"=>".0"},
                     "middle_line" => {"bfilpsv" => "0.", "ghjqrtw" => "00", "denoyz" => ".0", "ackmux" => ".."},
                     "bottom_line" => {"klmnopqrst" => "0.", "uvxyz" => "00", "abcdefghij" => "..", "w" => ".0"}}
    @braille_hash_top = Array.new
    @braille_hash_middle = Array.new
    @braille_hash_bottom = Array.new
    @final_braille_on_rails = Array.new

  end

  def translator
    @translated_input.split("").each do |x|
      if braille_hash["top_line"].keys[0].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[0])
      elsif braille_hash["top_line"].keys[1].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[1])
      elsif braille_hash["top_line"].keys[2].include? x
        @braille_hash_top.push(braille_hash["top_line"].values[2])
      elsif x != " " && x.downcase == x.upcase
        @braille_hash_top.push(".." + braille_hash["top_line"].values[2])
        binding.pry
        end
      end
    @translated_input.split("").each do |x|
      if braille_hash["middle_line"].keys[0].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[0])
      elsif braille_hash["middle_line"].keys[1].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[1])
      elsif braille_hash["middle_line"].keys[2].include? x
        @braille_hash_middle.push(braille_hash["middle_line"].values[2])
      elsif x == x.upcase
        @braille_hash_middle.push(".." + braille_hash["middle_line"].values[2])
        end
      end
    @translated_input.split("").each do |x|
      # binding.pry
      if braille_hash["bottom_line"].keys[0].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[0])
      elsif braille_hash["bottom_line"].keys[1].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[1])
      elsif braille_hash["bottom_line"].keys[2].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[2])
      elsif braille_hash["bottom_line"].keys[3].include? x
        @braille_hash_bottom.push(braille_hash["bottom_line"].values[3])
      elsif x == x.upcase
        @braille_hash_bottom.push(".0" + braille_hash["bottom_line"].values[2])
        end
      end

      @final_braille_on_rails = @braille_hash_top.join + "\n" + @braille_hash_middle.join + "\n" + @braille_hash_bottom.join
      print @final_braille_on_rails
  end
end

# @translator = Translator.new
