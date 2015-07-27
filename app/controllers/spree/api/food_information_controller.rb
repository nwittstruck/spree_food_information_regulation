class Spree::Api::FoodInformationController < Spree::Api::BaseController
  def show
    @food_information = Spree::FoodInformation.find(params[:id])
    respond_with(@food_information)
  end
end
