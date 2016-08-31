class User < ActiveRecord::Base
	has_secure_password

	has_many :tips
	
	def editor?
		self.role == 'editor'
	end

	def admin?
		self.role == 'admin'
	end

	def super?
		self.role == 'super'
	end
end
