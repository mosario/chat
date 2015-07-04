class Message < ActiveRecord::Base
	class << self
		def for_users(*users)
			where(sender: users, receiver: users).order(id: :desc)
		end
	end

	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	validates :content, presence: true
	validates :sender, presence: true
	validates :receiver, presence: true

	validate do
		errors.add(:receiver, :must_not_be_sender) if receiver && receiver == sender
	end
end
