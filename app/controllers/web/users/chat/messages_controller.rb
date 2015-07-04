class Web::Users::Chat::MessagesController < Web::Users::Chat::ApplicationController
	def index
		@messages = Message.for_users(resource_user, current_user)
		@new_message = Message.new
	end	

	def create
		@message = Message.new(message_params)
		@message.sender = current_user
		@message.receiver = resource_user
		@message.save!
		redirect_to action: :index
	end

	private

	def message_params
		params.require(:message).permit(:content)
	end	
end
