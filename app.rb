require 'sinatra/base'

class App < Sinatra::Application
  TASK_LIST = []

  get '/' do
    erb :index, locals: {:task_list => TASK_LIST}
  end

  get '/tasks/new' do
    erb :add_task
  end

  post '/' do
    TASK_LIST << params[:add_task]
    redirect '/'
  end

  get '/tasks/:id' do
    erb :show_task, locals: {:id => params[:id], :task => TASK_LIST[params[:id].to_i]}
  end

  get '/tasks/:id/edit' do
    erb :edit_task, locals: {:id => params[:id], :task => TASK_LIST[params[:id].to_i]}
  end

  put '/tasks/:id' do
    TASK_LIST[params[:id].to_i] = params[:new_task_name]
    redirect '/'
  end

  delete '/tasks/:id' do
    TASK_LIST.delete_at(params[:id].to_i)
    redirect '/'
  end
end