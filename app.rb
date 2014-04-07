require 'sinatra/base'
require './lib/tasks_helper'

class App < Sinatra::Application
  TASK_LIST = TasksHelper.new

  get '/' do
    erb :index, locals: {:task_list => TASK_LIST.display_tasks}
  end

  get '/tasks/new' do
    erb :add_task
  end

  post '/' do
    TASK_LIST.add(params[:add_task])
    redirect '/'
  end

  get '/tasks/:id' do
    erb :show_task, locals: {:id => params[:id], :task => TASK_LIST.display_tasks[params[:id].to_i]}
  end

  get '/tasks/:id/edit' do
    erb :edit_task, locals: {:id => params[:id], :task => TASK_LIST.display_tasks[params[:id].to_i]}
  end

  put '/tasks/:id' do
    TASK_LIST.edit(params[:id].to_i, params[:new_task_name])
    redirect '/'
  end

  delete '/tasks/:id' do
    TASK_LIST.delete(params[:id].to_i)
    redirect '/'
  end
end