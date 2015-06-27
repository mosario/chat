class Web::UsersController < Web::ApplicationController
	def index
		@users = User.without(current_user)
	end
end
