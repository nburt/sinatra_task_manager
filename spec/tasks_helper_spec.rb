require 'spec_helper'
require 'capybara/rspec'
require 'tasks_helper'

describe TasksHelper do
  it 'can add and display tasks' do
    tasks_helper = TasksHelper.new
    tasks_helper.add('Get milk')
    expect(tasks_helper.display_tasks).to eq ['Get milk']
  end
end