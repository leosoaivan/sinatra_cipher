require './cipher.rb'
require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  @translation = Cipher.new(params).translate_all
  erb :index, :locals => { :translation => @translation }
end

post '/clear' do
  @translation = nil
  erb :index, :locals => { :translation => @translation }
end