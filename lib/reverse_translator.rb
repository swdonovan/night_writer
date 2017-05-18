require './lib/braille_alphabet.rb'
class ReverseTranslator
attr_reader :translator

# def initialize
# 	@line_containers
# end


	def translator(output)
		split(output)
		line_assignment
		chop_strings_into_groups
	end

	def split(output)
		@output = output.split("\n")
	end

	def line_containers
		@top_line = Array.new
		@middle_line = Array.new
		@bottom_line = Array.new
	end

	def line_assignment
		line_containers
		counter = 1
		until @output.length == 0
			@top_line << @output[0] if counter == 1
			@output.delete(@output[0])
			counter += 1

			@middle_line << @output[0] if counter == 2
			@output.delete(@output[0])
			counter += 1

			@bottom_line << @output[0] if counter == 3
			@output.delete(@output[0])
			counter = 1
		end
	end

		def chop_strings_into_groups
			@top_letters = @top_line[0].chars.each_slice(2).to_a
			@middle_letters = @middle_line[0].chars.each_slice(2).to_a
			@bottom_letters = @bottom_line[0].chars.each_slice(2).to_a
			join_lines_into_one
		end

		def join_lines_into_one
			@complete_letter = []
			@complete_letter << @top_letters[0] << @middle_letters[0] << @bottom_letters[0]
			reverse_alphabet
		end

		def reverse_alphabet
			@to_braille = BrailleAlphabet.new.to_braille
			@to_braille["top_line"].values.each.with_index do |value, index|
			 if value == @complete_letter[0].join

			 end
			end
		end
end














# until top_letters = output.chars.length == 0
# 	outpmiddle_letters = umiddleach_char.with_index do |chars, i|
# 		ifbottom_letters =  bottomrs == "\n"
# 			@mega_array << output.slice!(0..i).split("")
# 			binding.pry
# 			r
# 		end
# 	end
# end
