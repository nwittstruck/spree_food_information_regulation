require 'rails_helper'

RSpec.describe Spree::Api::FoodInformationController, type: :controller do
  render_views

  let(:food_information) { create(:food_information) }


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
        api_get :show, {id: food_information.id}
        expect(response).to have_http_status(:success)
        expect(json_response[:description]).to eq(food_information.description)
      end
    end


    describe "POST #create" do
      let(:food_information_data) { {
          :description => "Description of the product",
          :ingredients => ["Flour", "Sugar", "Hazelnuts"],
          :net_contents => "250g",
          :origin => "Germany",
          :producer_address => "Streetnumber 123, 20202 Example City,Germany",
          :nutrition_information => [{:quantity => "100g", :nutrition_values => [{:nutrition => "energy", :name => "Energy kJ / kCal", :value => "726 kJ / 173 kcal"},
                                                                                 {:nutrition => "fat", :name => "Fat", :value => "9,0g"}]},
                                     {:quantity => "Serving", :nutrition_values => [{:nutrition => "energy", :name => "Energy kJ / kCal", :value => "126 kJ / 73 kcal"},
                                                                                    {:nutrition => "fat", :name => "Fat", :value => "1,0g"}]}
          ],
          :allergens => "Hazelnuts"
      } }

      it "returns access denied" do
        api_post :create, {food_information: food_information_data}
        expect(response).to have_http_status(:success)

        expect(json_response[:id]).not_to be_nil
        expect(json_response[:description]).to eq(food_information_data[:description])
        expect(json_response[:ingredients]).to eq(food_information_data[:ingredients])
        expect(json_response[:net_contents]).to eq(food_information_data[:net_contents])
        expect(json_response[:origin]).to eq(food_information_data[:origin])
        expect(json_response[:producer_address]).to eq(food_information_data[:producer_address])
        expect(json_response[:nutrition_information]).to eq(food_information_data[:nutrition_information])
        expect(json_response[:allergens]).to eq(food_information_data[:allergens])
      end
    end
  end
end
