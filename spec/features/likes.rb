require 'rails_helper'

RSpec.describe 'User like', type: :feature do
  before :each do
    User.create(name: 'mike', email: 'mike@gmail.com', password: '111111')
    Post.create(content: 'text', author_id: 1)
  end

  scenario 'has like' do
    login_with 'mike@gmail.com', '111111'
    click_on 'Like'
    visit posts_path
    expect(page).to have_content('1 like')
  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end
