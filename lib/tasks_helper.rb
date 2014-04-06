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

  def edit(id, new_task)
    @task_list[id] = new_task
  end

  def delete(id)
    @task_list.delete_at(id)
  end
end