class SchoolGroup < ApplicationRecord
	# validations
	validates_presence_of :group_name, :address, :postal_code, :country
	
	# associations
    has_many :domain_record, :as => :domain_record
    has_many :school_group_admins
end
