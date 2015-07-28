require 'rails_helper'

RSpec.describe Spree::Api::FoodInformationController, type: :controller do
  render_views

  let(:food_information) {create(:food_information)}


  # this will add an api key to the request:
  before do
    stub_authentication!
  end

  context "as a normal user" do
    describe "GET #index" do
      it "returns access denied" do
        api_get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe "GET #show" do
      it "returns access denied" do
        api_get :show, {:id => 1}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context "as an admin" do
    sign_in_as_admin!

    describe "GET #index" do
      it "returns http success" do
        api_get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns access denied" do
        api_get :show, {:id => food_information.id}
        expect(response).to have_http_status(:success)
        expect(json_response[:description]).to eq(food_information.description)
      end
    end
  end
end
