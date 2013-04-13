require 'sinatra'
require 'data_mapper'
require './models'

get '/' do
  @sessions = Session.all
  erb :list
end
  
get '/signup/:id' do
  @session = Session.get(params[:id])
  erb :signup
end
  
post '/signup' do
  @signup = Signup.create(params[:signup])
  erb :confirmation
end

get '/signups' do
  @sessions = Session.all
  erb :signups
end

get '/rebuild' do
  Signup.all.destroy!
  Session.all.destroy!
  Session.populate!
end
