class Word < ActiveRecord::Base

	before_save :add_letters, :downcase

	validates_presence_of :text
	
	def add_letters
			characters = self.text.chars
			alphabetized_characters = characters.sort
			self.letters = alphabetized_characters.join
	end

	def downcase
		self.text.downcase!
	end

	def self.find_anagrams(word)
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

	def self.reverse_letters(word)
		reversed = Array.new(word.length)

		word.each_with_index {|letter, index|
			reversed[word.length - index - 1] = letter
		}

		reversed
	end


end