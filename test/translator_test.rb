gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require 'pry'

class TranslatorTest < Minitest::Test

  def test_if_translator_accepts_input
    translate_new = Translator.new
    actual = translate_new.translator("hello")

    refute_nil actual
  end

    def test_english_to_braille_top_line
    translate = Translator.new
    actual = translate.translator("h").join
    expected = "0."

    assert_equal expected, actual.slice(0..1)
  end

  def test_english_to_braille_middle_line
    translate = Translator.new
    actual = translate.translator("h").join
    expected = "00"

    assert_equal expected, actual.slice(3..4)
  end

  def test_english_to_braille_bottom_line
    translate = Translator.new
    actual = translate.translator("h").join
    expected = ".."

    assert_equal expected, actual.slice(6..7)
  end

  def test_if_braille_formats_properly

    translate = Translator.new
    actual = translate.translator("h").join.chomp
    expected = "0.\n00\n.."

    assert_equal expected, actual
  end

  def test_if_lines_are_correct_length
    translate = Translator.new
    actual = translate.translator("hi").join.length
    expected= 15
    assert_equal expected, actual
  end


end
