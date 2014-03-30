require 'sinatra/base'

class App < Sinatra::Application
  TASK_LIST = []

  get '/' do
    erb :index
  end

  get '/tasks/new' do
    erb :add_task
  end

  post '/' do
    TASK_LIST << params[:add_task]
    redirect '/'
  end

  get '/tasks/:id' do
    erb :show_task, locals: {:task => TASK_LIST[params[:id].to_i]}
  end
end