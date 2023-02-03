class Subscription < ApplicationRecord
	belongs_to :plan
	belongs_to :user
	validates_presence_of :plan_id
	validates_presence_of :email
end
