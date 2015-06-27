class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true

	scope :without, ->(user) { where.not(id: user) }
	
	def to_s
		email
	end
end
