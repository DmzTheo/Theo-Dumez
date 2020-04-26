class Comment < ApplicationRecord
	belongs_to :blog
	belongs_to :user

	extend FriendlyId
	friendly_id :comment, use: :slugged
	
	validates :comment, uniqueness: true
end
