require 'pry'

class FileReader

  # # def initialize
  #   read
  #   braille_text
  #   writer
  #   incoming_text
  #   braille_text
  # end


  # def read
    file_name = File.open(ARGV[0], "r")
    incoming_text = file_name.read
    file_name.close
    incoming_text
  # end

  # def braille_text
    braille_text = incoming_text * 3
  # end

  # def writer
    writer = File.open(ARGV[1], "w")
    writer.write(braille_text)
    writer.close
  # end
puts "Created '#{ARGV[1]}' containing #{incoming_text.size} characters."

end

# class NightWriter
#
#   def initialize
#     reader = FileReader.new
#   end
#
#   fil_new = reader
# end
