class Customer < ActiveRecord::Base
	has_one :location , as: :locationable , dependent: :destroy
	accepts_nested_attributes_for :location , :allow_destroy => true
    before_create :set_auth_token

    private

    def set_auth_token
      return if access_token.present?

      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: self.access_token)
    end
end
