# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :friendships

  has_one_attached :avatar

  validates_presence_of :name

  after_initialize :set_defaults

  def set_defaults
    self.location ||= 'Worldwide'
    self.description ||= 'Some Text About Me Here'
  end

  def friends_and_own_posts
    friends_ids = Friendship.where(user_id: id).map(&:friend_id)
    friends_ids.push(id)
    Post.where(author_id: [friends_ids])
  end
end
