# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User like', type: :feature do
  before :each do
    @user = User.create(name: 'mike', email: 'mike@gmail.com', password: '111111')
    @post = Post.create(content: 'text', author_id: @user.id)
  end

  scenario 'has like on post' do
    login_with 'mike@gmail.com', '111111'
    find('.likebtn').click
    visit posts_path
    expect(page).to have_content('1 like')
  end

  scenario 'has no like on post' do
    login_with 'mike@gmail.com', '111111'
    find('.likebtn').click
    visit posts_path
    find('.likebtn').click
    expect(page).to have_content('0 likes')
  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end
