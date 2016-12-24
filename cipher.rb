require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

post '/' do
  @translation = cipher(params[:message], params[:key])
  erb :index, :locals => { :translation => @translation }
end

def cipher(str, key)
  key %= 26

  ary = str.split(//).map! do |char|
    if /[^a-zA-Z]/.match(char)
      char
    else
      beginning = (/[a-z]/.match(char) ? "a" : "A" )
      ((char.ord + key - beginning.ord) % 26 + beginning.ord).chr
    end
  end
  ary.join
end
