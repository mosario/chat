class Web::Users::Chat::MessagesController < Web::Users::Chat::ApplicationController
	def index
		@messages = Message.for_users(resource_user, current_user)
	end	
end
