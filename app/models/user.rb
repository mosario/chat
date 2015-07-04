class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true

	# has_many :messages

	scope :without, ->(user) { where.not(id: user) }
	
	def to_s
		email
	end
end
