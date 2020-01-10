class Api::V1::SchoolGroupsController < ApplicationController

	# index
	def index 
		heads = SchoolGroup.column_names.delete_if { |item| item =~  /created_at|updated_at/i }.map{|f| f.humanize}
		school_groups = SchoolGroup.select(:id, :group_name, :head_of_the_group, :email, :phone, :address, :city, :postal_code, :country)
		data = {heads: heads, school_groups: school_groups}
		render json: {result_data: data, request_status: true, request_message: "", status: 200}
	end

	# creatings new school group
	def create
		school_group = SchoolGroup.new(params[:school_group].except(:group_domain_name).permit(:group_name, :head_of_the_group, :email, :phone, :address, :city, :postal_code, :country))
		if school_group.save
			Domain.create_domain(params[:school_group][:group_domain_name], school_group)
			render json: {request_status: true, request_message: "School created successfully", status: 200}
		else
			render json: {request_status: false, request_message: "School creation failed!", status: 401}
		end
	end

end