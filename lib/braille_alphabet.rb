class BrailleAlphabet
  attr_reader :to_braille
  def initialize
   @to_braille = {"top_line" => {"abehkloruvz" => "0.",
                         "cdfgmnpqxy" => "00", "ijstw"=>".0",
                         " " => "..", "ABEHKLORUVZ" => "..0.", "CDFGMNPQXY" => "..00", "IJSTW" => "...0"},
                  "middle_line" => {"bfilpsv" => "0.",
                         "ghjqrtw" => "00", "denoyz" => ".0",
                         "ackmux" => "..", " " => "..", "BFILPSV" => "..0.", "GHJQRTW" => "..00",
                         "DENOYZ" => "...0", "ACKMUX" => "...."},
                  "bottom_line" =>
                        {"klmnopqrst" => "0.", "uvxyz" => "00",
                         "abcdefghij" => "..", "w" => ".0", " " => "..",
                         "KLMNOPQRST" => ".00.", "UVXYZ" => ".000",
                         "ABCDEFGHIJ"=> ".0..", "W" => ".0.0"}}

  #  @to_english = {"a" => ""}


  end
end
