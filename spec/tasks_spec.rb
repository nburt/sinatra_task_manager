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
  end
end