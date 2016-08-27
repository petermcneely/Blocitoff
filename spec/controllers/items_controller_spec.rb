require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	login_user
	describe "GET #create" do
		let(:my_item) {FactoryGirl.create(:item, user: subject.current_user)}

    	it "returns http success" do
      		get :create, user_id: subject.current_user.id, item: {name: my_item.name}
      		expect(response).to redirect_to root_path
    	end

    	it "creates a new to do item" do
    		get :create, user_id: subject.current_user.id, item: {name: my_item.name}
    		expect(Item.last.name).to eq my_item.name
    	end
  	end
end
