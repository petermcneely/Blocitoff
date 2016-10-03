class ItemsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@item = @user.items.build(item_params)
		@item.user = @user

		if @item.save
			flash[:notice] = "Successfully created your to-do item!"
		else
			error_message = "Unable to create that to-do item due to the following errors: "
			@item.errors.full_messages.each do |message|
				error_message += message + ", "
			end
			error_message.chomp!(", ")
			error_message += "."
			flash[:alert] = error_message
		end
		redirect_to root_path
	end

	private
	def item_params
		params.require(:item).permit(:name)
	end
end
