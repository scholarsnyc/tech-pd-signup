require 'sinatra'
require 'data_mapper'
require './models'

get '/' do
  @sessions = Session.all
  erb :list
end

get '/signups' do
  @sessions = Session.all
  erb :signups
end
  
get '/signup/:id' do
  @session = Session.get(params[:id])
  erb :signup
end

get '/:id' do
  @signup = Signup.get(params[:id])
end

delete '/:id' do
  Signup.get(params[:id]).destroy!
  redirect '/'
end
  
post '/signup' do
  @signup = Signup.create(params[:signup])
  erb :confirmation
end
