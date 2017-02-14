require './cipher.rb'
require 'sinatra'
# require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

post '/' do
  @translation = cipher(params[:message], params[:key].to_i)
  erb :index, :locals => { :translation => @translation }
end

post '/clear' do
  @translation = nil
  erb :index, :locals => { :translation => @translation }
end