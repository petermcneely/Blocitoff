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
		
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])

		if @item.delete
			flash[:notice] = "Successfully deleted your to-do item!"
		else
			flash[:alert] = "Unable to delete your to-do item. Please try again."
		end
		
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	private
	def item_params
		params.require(:item).permit(:name)
	end
end
