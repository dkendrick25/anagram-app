class Word < ActiveRecord::Base
	def self.reverse_letters(word)
  		# create a new array of 2 items
  		reversed = Array.new(word.length)
 
  		# loop through letters and keep index
  		word.each_with_index do |letter, index|
    	reversed[word.length - index - 1] = letter
  		end
  		reveresed
  	end

	# initialize array of anagrams, add original word
		anagrams = []
		final_list = []

		# split word into array of letters
		letters = word.split('')

		# reverse second two letters, swap first and second, repeat for all letters
		for letter in letters do
			second_two = reverse_letters(letters.last(2))
			letters = [letters[0], second_two].flatten!
			anagrams << letters.join unless letters.join == word
			
			letters[0], letters[1] = letters[1], letters[0]
			anagrams << letters.join unless letters.join == word
		end

		anagrams.each do |potential_word|
			if Word.find_by_text(potential_word).present?
				final_list << potential_word
			end
		end	

		# return anagram array, removes dupes
		final_list.uniq
	end

	 
	
end
 
