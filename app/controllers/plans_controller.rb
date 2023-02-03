class PlansController < ApplicationController
	# before_action :authenticate, :only => [:index, :update]
	# before_action :load_plans, only: [:index]
	# before_action :get_user, only: [:create]
	before_action :current_user


	def index
		@plans=Plan.all
		render json: @plans
	end


	def show
		@plan=Plan.find(params[:id])
		render json: @plan
	end

	def create
		byebug
		@plan=Plan.new(plan_params)
		if @plan.save
			render json: @plan,  status: 200
		else
			render json: {errors: @plan.errors.full_messages}
		end
	end




	def  update
		@plan=Plan.find(params[:id])
		if @plan.update(plan_params)
			render json: @plan, status: 200
		else

			render json: {errors: @plan.errors.full_messages}
		end
	end

	private

	def plan_params
		params.require(:plan).permit(:plan_name, :price)
	end

	def load_plans
		byebug
		if user_type == "admin"
			@plans = Plan.all
		elsif _user_type == "normal_user"
			@plans = user_type.plans
		end
	end



	def get_user
		@user_type=User.find(params[:id])
		if @user_type=="admin"
			puts "you you are  applicable"
		else
			puts "you are not authorized"
		end
	end
end







