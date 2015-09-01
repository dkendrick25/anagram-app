class Word < ActiveRecord::Base
	def self.reverse_letters(letters)
  		# create a new array of 2 items
  		length = letters.length
  		reversed_letters = Array.new(length)
 
  		# loop through letters and keep index
  		letters.each_with_index do |letter, index|
    	reversed_letters[length - index - 1] = letter
  		end
  	end

	def self.find_anagram(letters)
		combinations = []

		length = letters.length

		#make the letters an array
		letters = letters.split("")

		anagrams = []

		letters.each_with_index do |letter, index|
			remaining_letters = letters.select {|l| l != letter}
			anagrams << letter + remaining_letters.join

			anagrams << letter + reverse_letters(remaining_letters).join('')
		end

		#loop through letters to run against the dictionary in the db and only print real words
		combinations.each do |combo|
    		if Word.find_by_text(combo).present?
      			anagrams << combo
  		end
  	end

		combinations
	end
	 
	
end
 
