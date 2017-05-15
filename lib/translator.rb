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
        elsif x == " "
          @braille_hash_top.push("..")
        elsif x != " " && x == x.upcase
          if braille_hash["top_line"].keys[0].include? x.downcase
            @braille_hash_top.push(".." + braille_hash["top_line"].values[0])
          elsif braille_hash["top_line"].keys[1].include? x.downcase
            @braille_hash_top.push(".." + braille_hash["top_line"].values[1])
          elsif braille_hash["top_line"].keys[2].include? x.downcase
            @braille_hash_top.push(".." + braille_hash["top_line"].values[2])
          end
        end
      end
      @translated_input.split("").each do |x|
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
        elsif x == " "
          @braille_hash_bottom.push("..")
        elsif x != " " && x == x.upcase
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
      binding.pry
      #3lines@braille_hash_top.join!; @braille_hash_middle.join!; @braille_hash_bottom.join!
      until @braille_hash_top.length <= 160
        @final_braille_on_rails = ((@braille_hash_top.join.slice(0..159);
                                    @braille_hash_top = @braille_hash_top.join.slice(160..-1)) + "\n")
                                 + (@braille_hash_middle.join.slice(0..159);
                                #     @braille_hash_middle = @braille_hash_middle.join.slice(160..-1)))
        print @final_braille_on_rails
      if @braille_hash_top.join.length <= 160
        @final_braille_on_rails = @braille_hash_top.join + "\n" + @braille_hash_middle.join + "\n" + @braille_hash_bottom.join
        print @final_braille_on_rails
      else
      end
    end
    end
end
      #   chunk_one = []
      #   chunk_four = []
      #   if @braille_hash_top.join.length != nil && chunk_one.join.length != 160
      #     chunk_one << @braille_hash_top.shift
      #   else
      #     chunk_four << @braille_hash_top.shift
      #     # binding.pry
      #   end
      #   chunk_two = []
      #   chunk_five = []
      #   if @braille_hash_middle.join.length != nil || chunk_two.join.length <= 160
      #     chunk_two << @braille_hash_middle.shift
      #   else
      #     chunk_five
      #   end
      #   chunk_three = []
      #   until @braille_hash_bottom.join.length != nil || chunk_three.join.length <= 160
      #     chunk_three << @braille_hash_bottom.shift
      #   end
        # binding.pry
        #  print chunk_one.join + "\n" + chunk_two.join + "\n" + chunk_three.join
         #for characters with array bettween 160-320 shovel into next chunks
