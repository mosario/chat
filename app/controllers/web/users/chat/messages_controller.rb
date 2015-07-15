class Web::Users::Chat::MessagesController < Web::Users::Chat::ApplicationController
	layout false, only: :create

	def index
		@messages = Message.for_users(resource_user, current_user)
		@new_message = Message.new
	end	

	def create
		@message = Message.new(message_params)
		@message.sender = current_user
		@message.receiver = resource_user
		[current_user.id, resource_user.id].sort.join("-")
		
		@message.save!
		# Danthes.publish_to "/messages/new", :chat_message => @message.content
		# redirect_to action: :index
	end

	private

	def message_params
		params.require(:message).permit(:content)
	end	
end
