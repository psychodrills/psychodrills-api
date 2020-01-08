class AdminMenuLink < ActionTag

	# scope
	scope :active, -> { select(:id, :name, :url, :icon).where(is_active: true, :is_deleted => false) }
end
