module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create(:user, email: ENV["TEST_EMAIL"], password: ENV["TEST_PASSWORD"])
			user.confirm
			sign_in user
		end
	end
end