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
  end
end