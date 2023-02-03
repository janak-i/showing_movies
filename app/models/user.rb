class User < ApplicationRecord
	validates :email, presence: true
	validates :password, presence: true
	has_one :subscription
	has_one :plan, :through => :subscription
	has_many :movies

	enum user_type: {
		admin: '0',
		normal_user: '1'
	}
	validates :email, uniqueness: { message: 'Already Exists' }

end
