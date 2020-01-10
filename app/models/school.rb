class School < ApplicationRecord
	# associations
    has_many :domain_record, :as => :domain_record
end
