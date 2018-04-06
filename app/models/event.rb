class Event < ApplicationRecord
	has_many :packages, dependent: :destroy
end
