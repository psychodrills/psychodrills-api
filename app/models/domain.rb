class Domain < ApplicationRecord
	# associations
    belongs_to :domain_record, :polymorphic => true

    # create domain
    def self.create_domain(domain_name, record)
    	domain = self.new()
    	domain_suffix = (record.class.to_s == 'SchoolGroup') ? ".admin.psychodrills.com" : ".psychodrills.com"
    	domain.domain_name = domain_name+domain_suffix
    	domain.domain_record = record
    	domain.save
    end
end
