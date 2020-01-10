require 'rails_helper'

RSpec.describe 'User logs in', type: :feature do

  before :each do
    User.create(name: 'mike', email: 'mike@gmail.com', password: '111111')
  end


  scenario 'has post button' do
    login_with 'mike@gmail.com', '111111'
    fill_in "post_content", with: "Good Day"
		click_on "Post"
	  visit posts_path
	  expect(page).to have_content("Good Day")

  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end