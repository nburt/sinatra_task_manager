require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'it manages tasks' do
  scenario 'user can view the homepage' do
    visit '/'
    within 'h1' do
      expect(page).to have_content 'Welcome to your Task Manager'
    end

    the 'user can add tasks' do
      click_link 'Add Task'
      fill_in 'add_task', with: 'Get milk'
      click_button 'Add Task'
      within 'ol' do
        expect(page).to have_content 'Get milk'
      end
    end

    and_the 'user can view tasks individually' do
      click_link 'Show Task'
      within 'h1' do
        expect(page).to have_content 'Get milk'
      end
    end

    and_the 'user can edit tasks' do
      click_link 'Edit Task'
      fill_in 'new_task_name', with: 'Get orange juice'
      click_button 'Edit Task'
      within 'ol' do
        expect(page).to_not have_content 'Get milk'
        expect(page).to have_content 'Get orange juice'
      end
    end

    and_the 'user can delete tasks' do
      click_link 'Show Task'
      click_button 'Delete Task'
      within 'ol' do
        expect(page).to_not have_content 'Get orange juice'
      end
    end
  end
end