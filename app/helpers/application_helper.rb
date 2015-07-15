module ApplicationHelper
	def chat_room_name(user1, user2)
		[user1.id, user2.id].sort.join("-")
	end
end
