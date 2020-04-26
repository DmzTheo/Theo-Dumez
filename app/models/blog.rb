class Blog < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	extend FriendlyId
	friendly_id :name, use: :slugged
	acts_as_votable
	mount_uploader :image, AvatarUploader

	validates :name, length: { in: 42..50 }, uniqueness: true
	validates :descriptionindex, length: { in: 131..149 }, uniqueness: true
end
