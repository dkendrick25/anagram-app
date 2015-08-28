def reverse_letters(letters)
  # create a new array of 2 items
  length = letters.length
  reversed_letters = Array.new(length)
 
  # loop through letters and keep index
  letters.each_with_index do |letter, index|
    reversed_letters[length - index - 1] = letter
  end
 
  reversed_letters
end