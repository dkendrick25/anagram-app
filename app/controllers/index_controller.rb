get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  @anagrams = Word.find_anagram(@word)
  erb :show
end

post '/' do
  @word = params[:word]
  redirect "/anagrams/#{@word}"
end