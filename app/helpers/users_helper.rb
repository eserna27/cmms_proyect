module UsersHelper
	
	def master_user
		redirect_to(root_url) unless current_user.user_type == "master"
	end

	def master_user?
		current_user.user_type == "master"
	end
end
