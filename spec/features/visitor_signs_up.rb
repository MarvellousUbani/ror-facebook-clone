# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor signs up', type: :feature do
  scenario 'with valid email and name' do
    sign_up_with 'mikey@gmail.com', 'mikey', 'password', 'password'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'mikey', 'password', 'password'

    expect(page).to have_content('Login')
  end

  scenario 'with non-matching passwords' do
    sign_up_with 'mikey@gmail.com', 'mikey', 'pass2020', 'password'

    expect(page).to have_content('Login')
  end

  scenario 'with too-short password' do
    sign_up_with 'mikey@gmail.com', 'mikey', 'pass', 'pass'

    expect(page).to have_content('Login')
  end

  scenario 'with blank name' do
    sign_up_with 'valid@example.com', '', 'password', 'password'

    expect(page).to have_content('Login')
  end

  def sign_up_with(email, name, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end
