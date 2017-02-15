require './cipher.rb'
require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  @translation = Cipher.new(transfer_params(params)).translate_all
  erb :index, :locals => { :translation => @translation }
end

post '/clear' do
  @translation = nil
  erb :index, :locals => { :translation => @translation }
end

private

def transfer_params(params)
  {:message => params[:message], :key => params[:key].to_i}
end