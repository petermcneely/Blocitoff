require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	login_user
  let!(:my_item) {FactoryGirl.create(:item, user: subject.current_user)}

	describe "GET #create" do
  	it "redirects to the authenticated root path" do
      get :create, format: :js, user_id: subject.current_user.id, item: {name: my_item.name}
    	expect(response).to have_http_status(:success)
  	end

  	it "creates a new to do item" do
  		get :create, format: js, user_id: subject.current_user.id, item: {name: my_item.name}
  		expect(Item.last.name).to eq my_item.name
  	end
  end

  describe "DELETE #destroy" do
    it "redirects to the authenticated root path" do
      delete :destroy, format: :js, user_id: subject.current_user.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end

    it "redirects to the authenticated root path" do
      delete :destroy, format: :js, user_id: subject.current_user.id, id: my_item.id
      expect(Item.where(my_item.id).to_ary.count).to eq 0
    end
  end
end
