require 'rails_helper'

RSpec.describe Spree::FoodInformation, type: :model do
  it "has a description" do
    food_information = Spree::FoodInformation.new
    food_information.description = "food description"
    expect(food_information.description).not_to be_nil
  end
end
