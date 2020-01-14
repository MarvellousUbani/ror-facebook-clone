class Post < ApplicationRecord
	belongs_to :author, class_name: 'User' , foreign_key:'author_id'
	default_scope -> { order(created_at: :desc) }
	

	validates_presence_of :content
	validates_presence_of :author_id
end