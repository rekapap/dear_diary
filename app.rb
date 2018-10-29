require 'sinatra'
require_relative './lib/entry'
require_relative './database_connection_setup'
require 'json'

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
    Entry.create(title: params[:title], body: params[:editordata])
    redirect '/entries'
  end

  get '/entries/:id' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/entry'
  end

  delete '/entries/:id' do
    Entry.delete(id: params[:id])
    redirect '/entries'
  end

  get '/entries/:id/edit' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/edit'
  end

  patch '/entries/:id' do
    params[:body]
    # result = JSON.parse(param)['ops'].first['insert']
    Entry.update(id: params[:id], title: params[:title], body: params[:editordata])
    redirect "/entries/#{params[:id]}"
  end
  
  run! if app_file == $PROGRAM_NAME
end
