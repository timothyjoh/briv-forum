require 'rails_helper'

RSpec.describe 'Posting', type: :system do
  describe 'with erlich' do
    fixtures :users

    before do
      visit root_path
      find_link('Login').click
      expect(page).to have_content 'Log in'
      expect(page).to have_content 'Forgot your password?'
      find("#authenticate").fill_in('Email', with: 'erlich@aviato.com')
      find("#authenticate").fill_in('Password', with: 'bachmanity')
      find_button('Log in').click
    end

    scenario 'creates a post' do
      find_button('Create a Post').click
      expect(page).to have_content 'Create a new post'
      fill_in('Title', with: 'Hello World')
      fill_in('Body', with: 'This is a test of __markdown__')
      find_button('Submit changes').click
      expect(page).to have_content 'Hello World'
      expect(page).to have_content 'This is a test of markdown'
      expect(page).to have_content 'Comments 0'
      visit root_path
      expect(page).to have_content 'Hello World'
      expect(page).to have_content 'ceoofaviato less than a minute ago'
    end
  end

end