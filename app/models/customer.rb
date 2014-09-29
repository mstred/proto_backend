class Customer < ActiveRecord::Base
	has_one :location , as: :locationable , dependent: :destroy
	accepts_nested_attributes_for :location , :allow_destroy => true
end
