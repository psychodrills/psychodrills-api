puts "========== Creating SuperAdmin Profile... ================="
super_admin = SuperAdmin.new
ActiveRecord::Base.transaction do
	super_admin.first_name = "Psychodrills"
	super_admin.middle_name = ""
	super_admin.last_name = "Admin"
	super_admin.email = "psychodrills@gmail.com"
	super_admin.date_of_birth = "2000-01-01"
	super_admin.phone_number = "1234567891"
	if super_admin.save
		user = User.new
		user.first_name = super_admin.first_name
		user.middle_name = super_admin.middle_name
		user.last_name = super_admin.last_name
		user.email = super_admin.email
		user.user_name = "PsychodrillsAdmin"
		user.password = "psychodrillslogin"
		user.user_record = super_admin
		if user.save
			puts "========== SuperAdmin Profile Created Successfully! ================="
		else
			puts "========== Creating SuperAdmin Profile Failed ================="
			raise ActiveRecord::Rollback
		end
	else
		puts "========== Creating SuperAdmin Profile Failed ================="
		raise ActiveRecord::Rollback
	end
end