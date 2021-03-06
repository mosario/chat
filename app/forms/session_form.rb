class SessionForm
	include ActiveModel::Model

	attr_accessor :email, :password

  validates :email, presence: true
	validates :password, presence: true

	validate do
		errors.add(:base, :wrong_email_or_password) unless user.try(:authenticate, password)
	end

	def user
		@user ||= User.find_by email: email
	end
end
