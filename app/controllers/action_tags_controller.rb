class ActionTagsController < ApplicationController

	def index
		action_tags = ActionTag.fetch_action_tags
		render json: {action_tags: action_tags, request_status: true, status: 200 }
	end
end
