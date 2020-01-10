class SchoolGroup < ApplicationRecord
	# validations
	validates_presence_of :group_name, :head_of_the_group, :email, :phone, :address, :postal_code, :country
	
	# associations
    has_many :domain_record, :as => :domain_record
end
