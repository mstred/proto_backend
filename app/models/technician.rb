class Technician < ActiveRecord::Base
	has_one :location , as: :locationable , dependent: :destroy
    has_many :ratings , dependent: :destroy
	accepts_nested_attributes_for :location , :allow_destroy => true
end
