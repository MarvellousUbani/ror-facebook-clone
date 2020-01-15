# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :avatar

  validates_presence_of :name

  after_initialize :set_defaults

  def set_defaults
    self.location ||= 'Worldwide'
    self.description ||= 'Some Text About Me Here'
  end
end
