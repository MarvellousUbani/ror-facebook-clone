require 'rails_helper'

RSpec.describe 'User logs in', type: :feature do

  before :each do
    User.create(name: 'mike', email: 'mike@gmail.com', password: '111111')
  end

  scenario 'with invalid email' do
    login_with 'blabla', '111111'

    expect(page).to have_content('Login')
  end

  scenario 'with invalid password' do
    login_with 'mike@gmail.com', 'wrongpassword'

    expect(page).to have_content('Login')
  end

  scenario 'with valid email and password' do
    login_with 'mike@gmail.com', '111111'

    expect(page).to have_content('Logout')
  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end
