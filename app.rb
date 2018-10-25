require 'sinatra'
require_relative './lib/entry'
require_relative './database_connection_setup'

# DEAR DIARY
class DearDiary < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    erb :'entries/index'
  end

  get '/entries/new' do
    erb :'entries/new'
  end

  post '/entries' do
    Entry.new(title: params[:title], body: params[:body])
    redirect '/entries'
  end

  get '/entries/:id' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/entry'
  end

  get '/entries/:id/edit' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/edit'
  end

  patch '/entries/:id' do
    Entry.update(id: params[:id], title: params[:title], body: params[:body])
    redirect "entries/#{params[:id]}"
  end

  run! if app_file == $PROGRAM_NAME
end
