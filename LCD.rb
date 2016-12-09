require 'minitest/autorun'

class LCDTranslation

	def translate(number)
		line1parts = [" _ ", "   ", " _ ", " _ ", "   ", " _ ", " _ ", " _ ", " _ ", " _ "]
		line2parts = ["| |", "  |", " _|", " _|", "|_|", "|_ ", "|_ ", "  |", "|_|", "|_|"]
		line3parts = ["|_|", "  |", "|_ ", " _|", "  |", " _|", "|_|", "  |", "|_|", " _|"]
		line1 = ""
		line2 = ""
		line3 = ""
		number.to_s.chars.each do |digitAsChar|
			digit = digitAsChar.to_i
			line1 += line1parts[digit]
			line2 += line2parts[digit]
			line3 += line3parts[digit]
		end
		return line1 + "\n" + line2 + "\n" + line3
		
	end
end

class TestNumberToLCD < MiniTest::Unit::TestCase

	def test_one
		translate_test(1, "   \n  |\n  |")
	end

	def test_two
		translate_test(2, " _ \n _|\n|_ ")
	end

	def test_eleven
		translate_test(11, "      \n  |  |\n  |  |")
	end 

	def test_twentyTwo
		translate_test(22, " _  _ \n _| _|\n|_ |_ ")
	end 

	def translate_test(input, expected)
		puts "\n" + LCDTranslation.new.translate(input)
		assert_equal(expected, LCDTranslation.new.translate(input))
	end
end 
