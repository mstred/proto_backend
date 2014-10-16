class Order < ActiveRecord::Base
    include Filterable

    belongs_to :customer
    belongs_to :technician
    before_save :set_order_uid

    scope :uid, -> (uid) { where uid: uid }
    scope :customer_id, -> (customer_id) { where customer_id: customer_id }
    scope :technician_id, -> (technician_id) { where technician_id: technician_id }
    scope :status, -> (status) { where status: status }
    
    private
    # Generates a unique id as the object is created
    def set_order_uid
        return if uid.present?
        begin
            self.uid = SecureRandom.uuid
        end while self.class.exists?(uid: self.uid)
    end
end
