# frozen_string_literal: true

class Friendship < ApplicationRecord
  enum confirmed: { pending: 0, approved: 1 }
  has_and_belongs_to_many :users
end
