class ActionTag < ApplicationRecord
	# validations
	validates_presence_of :name, :icon

	# associations
	has_many :action_tag_children

	# scope
	scope :active, -> { select(:id, :name, :url, :icon).where(is_active: true, :is_deleted => false) }

	# fetch action tags
	def self.fetch_action_tags(user_record_type)
		items = []
		if user_record_type == "SuperAdmin"
			actions_tags = AdminMenuLink.active
		elsif user_record_type == ""
			
		end
		actions_tags.each do |tag|
			action_tag_children = tag.action_tag_children.active
			items << (action_tag_children.present? ? tag.as_json.merge(:children => action_tag_children.as_json) : tag.as_json)
		end
		{:items => items}
	end
end
