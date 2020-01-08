class SuperAdmin < ApplicationRecord
	# validations
    validates_presence_of :first_name, :last_name, :email, :date_of_birth, :phone_number

    # associations
    has_one :user_record, :as => :user_record
end
