class SchoolGroupAdmin < ApplicationRecord

	# validations
	validates_presence_of :first_name, :last_name, :email, :phone_number

	# associations
	belongs_to :school_group

	# creating school group admin while creating school group
	def self.create_school_group_admin(params, school_group)
		school_group_admin = school_group.school_group_admins.new(params.except(:group_domain_name)
			.permit(:first_name, :middle_name, :last_name, :email, :phone_number))
		school_group_admin.save
		school_group_admin_user_name = params[:group_domain_name].downcase + "admin"
		school_group_admin_password = params[:group_domain_name].first(4) + params[:phone_number].last(4)
		user = User.new(:first_name => school_group_admin.first_name, :middle_name => school_group_admin.middle_name, 
			:last_name => school_group_admin.last_name, :email => school_group_admin.email, :user_name => school_group_admin_user_name, 
			:password => school_group_admin_password)
		user.user_record = school_group_admin
		user.save
	end
end
