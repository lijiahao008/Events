class Event < ApplicationRecord
	searchkick
	belongs_to :profile
	has_and_belongs_to_many :categories
	has_many :reviews

	geocoded_by :location
	after_validation :geocode


end
