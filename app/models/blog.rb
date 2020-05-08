class Blog < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	extend FriendlyId
	friendly_id :name, use: :slugged
	acts_as_votable
	has_one_attached :image

	validates :name, uniqueness: true
	validates :meta_title, length: { in: 42..50 }, uniqueness: true
	validates :descriptionindex, length: { in: 131..149 }, uniqueness: true
	validates :image, presence: true
end
