class BrailleAlphabet
  attr_reader :to_braille
  def initialize
   @to_braille = {"top_line" => {"abehkloruvz" => "0.",
                                 "cdfgmnpqxy" => "00", "ijstw"=>".0", " " => ".."
                       },
                  "middle_line" => {"bfilpsv" => "0.",
                         "ghjqrtw" => "00", "denoyz" => ".0",
                         "ackmux" => "..", " " => ".."},
                  "bottom_line" =>
                        {"klmnopqrst" => "0.", "uvxyz" => "00",
                         "abcdefghij" => "..", "w" => ".0", " " => ".."}}
  end
end
