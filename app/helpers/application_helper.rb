module ApplicationHelper

	def body_class
		@body_class if @body_class.present?
	end

	def three_letters?(input)
		if input.delete(' ').length <= 3 && input.delete(' ').length > 0
			true
		elsif input.delete(' ').length > 3
			raise Exception.new("Word must be less than or equal to 3 characters")
		elsif input.delete(' ').length == 0
			raise Exception.new("Please enter a 3 letter word")
 		end
	end

	def distinct_letters?(input)
		letter_array = input.chars
		unique_letters = letter_array.uniq
		if unique_letters.length < letter_array.length
			false
		else
			true
		end
	end

	def single_word?(input)
		unless input.match(" ")
			true
		else
			raise Exception.new("Must be single word")
		end
	end

	def valid_input?(input)
		if is_blank?(input) && single_word?(input)
			true
		else
			false
		end
	end

	def is_blank?(input)
		if input.delete(' ').length > 0 
			true
		else
			raise Exception.new("Word cannot be blank")
		end
	end

	def does_not_exist?(input)
		if Word.where(:text => "#{input.downcase}").blank?
			true
		else
			raise Exception.new("Word is already in dictionary")
		end
	end

	def valid_new_word?(input)
		if is_blank?(input) && does_not_exist?(input)
			true
		else
			false
		end
	end

	def word_form_method(word)
		if word.new_record?
			@method = "post"
		else
			@method = "put"
		end
		@method
	end

  def word_form_action(word)
    if word.new_record?
      @action = "/words"
    else
      @action = "/words/#{word.id}"      
    end
    @action
  end

  def word_form_id(word)
  	if word.new_record?
  		@id = "add-word"
  	else
  		@id = "word-#{word.id}"
  	end
  	@id
  end

  def word_form_class(word)
  	if word.new_record?
  		@class = "add-word"
  	else
  		@class = "edit-word"
  	end
  	@class
  end

end
