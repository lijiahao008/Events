class Profile < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :categories
	has_many :events

	has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/
end
