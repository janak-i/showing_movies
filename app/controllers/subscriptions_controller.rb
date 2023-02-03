class SubscriptionsController < ApplicationController
	before_action :authentication
	def new
		plan = Plan.find(params[:plan_id])
		@subscription = plan.subscriptions.build
		render json: @subscription
	end


	def create
		byebug
		@subscription = Subscription.new(subscription_params)
		if @subscription.save
			render json: @subscription, :notice => "Thank you for subscribing!"
		else
			render :new
		end
	end

	def show
		byebug
		@subscription = Subscription.find(params[:id])
	end


	private
	def subscription_params
		params.require(:subscription).permit(:plan_id, :email, :user_id)
	end

end
