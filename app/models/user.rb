class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	has_friendship
	has_many :stories, dependent: :destroy
	has_many :messages
	has_one_attached :avatar
	validates :username, presence: :true, uniqueness: { case_sensitive: false }
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
	validate :validate_username

	def validate_username
		if User.where(email: username).exists?
			errors.add(:username, :invalid)
		end
	end

	def conversations
		Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
	end

end
