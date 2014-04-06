class TasksHelper

  def initialize
    @task_list = []
  end

  def add(task)
    @task_list << task
  end

  def display_tasks
    @task_list
  end
end