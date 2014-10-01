class Rating < ActiveRecord::Base
    belongs_to :technician
    validates :stars, inclusion: { in: 0..5 }
end
