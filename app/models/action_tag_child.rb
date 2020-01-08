class ActionTagChild < ApplicationRecord
	# validations
	validates_presence_of :name, :icon, :action_tag_id

	# associations
	belongs_to :action_tag

	# scop
	scope :active, -> { select(:id, :name, :url, :icon).where(is_active: true, :is_deleted => false) }
end
