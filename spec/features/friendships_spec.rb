# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User like', type: :feature do
  before :each do
    @user = User.create(name: 'mike', email: 'mike@gmail.com', password: '111111')
    @asha = User.create(name: 'asha', email: 'asha@gmail.com', password: '999999')
  end

  scenario 'has Request friendship' do
    login_with 'mike@gmail.com', '111111'
    visit users_path
    find('.addingfriend').click
    expect(page).to have_content('Pending Request')
  end

  scenario 'has Accept friendship' do
    login_with 'mike@gmail.com', '111111'
    visit users_path
    find('.addingfriend').click
    find('.Logout').click
    login_with 'asha@gmail.com', '999999'
    visit users_path
    find('.acceptingfriend').click
    expect(page).to have_content('See Profile')
  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end
