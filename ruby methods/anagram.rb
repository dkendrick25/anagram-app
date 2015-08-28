require_relative 'reverse_letters'

def find_anagrams(letters)
	length = letters.length

	#make the letters an array
	letters = letters.split("")

	anagrams = []

	leters.each_with_index do |letter, index|
		remaining_letters = letters.select {|l| l != letter}
		anagrams << letter + remaining_letters.join

		anagrams << letter + reverse_letters(remaining_letters).join('')
	end

	anagrams
end