class Api::V1::ActionTagsController < ApplicationController

	# fetch all action tags and their children actions
	def index
		action_tags = ActionTag.fetch_action_tags(@current_user.user_record_type)
		render json: {action_tags: action_tags, request_status: true, status: 200 }
	end
end
