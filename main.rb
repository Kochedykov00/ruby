require 'sinatra'
require 'pg'
require "./models/new.rb"
require "./models/comment.rb"
require 'pry'

get '/news' do
  @news = New.all

  erb :index
end

get '/new/:id' do
  id = params[:id]

  @new = New.by_id(id)
  @comments = Comment.all_comments_of_new(id)
  erb :new
end



get '/new/:text/delete/:id' do
  id = params[:id]
  text = params[:text]

  Comment.delete(id)

  redirect to("/new/#{text}")
end

post '/news' do
  New.new(params)
  redirect to("/news")
end

post '/new' do
  id = params[:new]
  Comment.new(params)
  redirect to("/new/#{id}")
end

get '/new/delete/:id' do
  id = params[:id]

  New.delete(id)

  redirect to("/news")
end