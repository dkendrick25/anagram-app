get '/words' do
	@words = Word.all.order(:text)
	@list = @words.in_groups(3, false)
	@column1 = @list[0]
	@column2 = @list[1]
	@column3 = @list[2]

	@body_class = "words"
	erb :"/words/index"
end

get '/words/new' do
	@word = Word.new

	@body_class = "home"
	erb :"/words/new"
end

post '/words' do
	@word = Word.new(text: params[:text])
	begin
		valid_new_word?(@word.text)
		Word.create(text: params[:text])
		redirect "/words"
	rescue Exception => error
		@error = error.message
		@body_class = "home"
		erb :"/words/new"
	end
end

get '/words/:id/edit' do
	@word = Word.find(params[:id])

	@body_class = "home"
	erb :"words/edit"
end

put '/words/:id' do
	@word = Word.find(params[:id])
	@word.text = params[:text]
	@check_word = Word.new(text: params[:text])
	begin
		valid_new_word?(@check_word.text)
		@word.save
		redirect "/words/#{@word.id}"
	rescue Exception => error
		@error = error.message
		@body_class = "home"
		erb :"/words/edit"
	end
end

get '/words/:id' do
	@word = Word.find(params[:id])

	@body_class = "words"
	erb :"/words/show"
end

delete '/words/:id' do
	@word = Word.find(params[:id])
	@word.delete
	redirect "/words"
end