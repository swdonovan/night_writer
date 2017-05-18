require './lib/braille_alphabet.rb'
class ReverseTranslator
attr_reader :translator

# def initialize
# 	@line_containers
# end


	def translator(input)
		split(input)
		line_assignment
		chop_init
		join_lines_into_one
		reverse_alphabet
	end

	def split(output)
		@output = output.split("\n")
	end

	def chop_init
		chop_strings_into_groups(@top_line)
		chop_strings_into_groups(@middle_line)
		chop_strings_into_groups(@bottom_line)
	end

	def chop_strings_into_groups(line)
		line.each.with_index do |value, index|
			line[index] = line[index].scan(/.{2}/)
		end
	end

	def line_containers
		@top_line = []
		@middle_line = []
		@bottom_line = []
	end

	def line_assignment
		line_containers
		@counter = 1
		until @output.length == 0
			assigning(@top_line) if @counter == 1
			assigning(@middle_line) if @counter == 2
			assigning(@bottom_line) if @counter == 3
		end
	end

	def assigning(input)
		input << @output[0].to_s
		@output.delete(@output[0])
		if @counter < 3
			@counter += 1
		elsif @counter ==3
			@counter = 1
		end
	end
#find a way to refactor

	def join_lines_into_one
		@complete_letter = Array.new
		@master = 0
		master_comp = @top_line.length
		until @master == master_comp
			theory_case
		end
	end

	def theory_case
		counter = 0
		count_master = @top_line.length
##PRY
		until counter == 40
			@complete_letter << @top_line[@master][counter] <<
					@middle_line[@master][counter] << @bottom_line[@master][counter]
			counter += 1
		end
		@master += 1 if counter == 40
		counter = 0
	end

#Possible new class
	def reverse_alphabet
		@final_count = 0
		@to_braille = BrailleAlphabet.new.to_braille
		c_master = @complete_letter.length
		until @final_count == c_master
			examination(@to_braille["top_line"], 0) 	 if @counter == 1
			binding.pry
			examination(@to_braille["middle_line"], 0) if @counter == 2
			examination(@to_braille["bottom_line"], 0) if @counter == 3
		end
	end

	def examination(line, exam_count)
		@exam_counter = exam_count
		@value = line.values[@exam_counter]
		@key   = line.keys[@exam_counter]
		if @complete_letter[@final_count..(@final_count + 2)].join == ".....0"
			capital_convert
			@final_count += 3
		else
			lower_case_convert
		end
	end

	def lower_case_convert
		if @value == @complete_letter[@final_count]
			@output << @key
			capital_conversion(@output) if @counter == 3
			@counter += 1; @final_count += 1
		else
			@exam_counter += 1
			lower_case_convert
		end
	end

	def capital_convert
		cap_count = @final_count + 3
		until @counter == 3
			if @value == @complete_letter[@final_count + cap_count]
				@output << @key
				binding.pry
				capital_conversion(@output) if @counter == 3
				@counter += 1
				@final_count += 1
			else
				@exam_counter += 1
				capital_convert
			end
		end
	end


	def capital_conversion(final_output)
		binding.pry
		@output[0] = @output[0].split(/ /)
		@output.each do |zero_in_chars|
			if @ouput[1].include?(zero_in_chars) == false
				@output.delete[@output]
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
