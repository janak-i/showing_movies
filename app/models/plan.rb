class Plan < ApplicationRecord
	has_many :subscriptions
	has_many :users
end
