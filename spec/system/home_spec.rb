require 'rails_helper'

RSpec.describe 'Home', type: :system do
  scenario 'visits home page' do
    visit root_path
    expect(page).to have_content 'Latest Posts'
    expect(page).to have_content 'Login'
    expect(page).not_to have_content 'Logout'
    expect(page).not_to have_content 'Edit profile'
    expect(page).to have_content 'You must be signed in to post'
  end

  scenario 'visit login page, bogus user' do
    visit root_path
    find_link('Login').click
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Forgot your password?'
    find("#authenticate").fill_in('Email', with: 'john@whatever.com')
    find("#authenticate").fill_in('Password', with: 'whatever')
    find_button('Log in').click
    expect(page).to have_content 'Invalid Email or password'
    expect(page).to have_content 'Forgot your password?'
  end

  describe 'signup' do
    before do
      visit root_path
      find_link('Sign up').click
    end

    describe 'create a valid user' do
      before do
        fill_in('Email', with: 'john@whatever.com')
        fill_in('Username', with: 'JonnyBoy')
        fill_in('Password', with: 'whatever')
        fill_in('Password confirmation', with: 'whatever')
        find_button('Sign up').click
      end
      scenario 'should redirect to homepage' do
        expect(page).to have_content 'Latest Posts'
        expect(page).to have_content 'Edit profile'
        expect(page).not_to have_content 'You must be signed in to post'
        expect(page).to have_selector '.btn-primary'
      end

      scenario 'can edit profile' do
        find_link('Edit profile').click
        expect(page).to have_content 'Edit JonnyBoy'
        expect(page).to have_content 'Cancel my account'
      end

    end
  end

end