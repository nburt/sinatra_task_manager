require 'spec_helper'
require 'capybara/rspec'
require 'tasks_helper'

describe TasksHelper do
  it 'can add and display tasks' do
    tasks_helper = TasksHelper.new
    tasks_helper.add('Get milk')
    expect(tasks_helper.display_tasks).to eq ['Get milk']
  end

  it 'can edit tasks' do
    tasks_helper = TasksHelper.new
    tasks_helper.add('Get milk')
    tasks_helper.edit(0, 'Get butter')
    expect(tasks_helper.display_tasks).to eq ['Get butter']
  end
end