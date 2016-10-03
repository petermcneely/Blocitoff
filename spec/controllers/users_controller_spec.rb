require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	login_user
	describe "GET #show" do
		it "returns http success" do
			get :show
			expect(response).to have_http_status(:success)
		end

		it "loads the user's items" do
			subject.current_user.items << FactoryGirl.create(:item, name: "Test item")
			get :show
			expect(assigns(:items)).to eq subject.current_user.items
		end
	end
end
