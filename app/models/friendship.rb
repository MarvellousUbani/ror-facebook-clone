# frozen_string_literal: true

class Friendship < ApplicationRecord
  enum confirmed: { pending: 0, approved: 1 }
  has_and_belongs_to_many :users
  validate :non_self_friendship, on: :create

  def self.pending_requests(user_id)
    where(user_id: user_id, confirmed: 0)
  end

  def self.accept_requests(user_id)
    where(friend_id: user_id, confirmed: 0)
  end

  def self.confirmed_requests(user_id)
    where(user_id: user_id, confirmed: 1).or(where(friend_id: user_id, confirmed: 1))
  end

  def non_self_friendship
    errors.add(:friendships, 'You cannot befriend yourself') if friend_id == user_id
  end
end
