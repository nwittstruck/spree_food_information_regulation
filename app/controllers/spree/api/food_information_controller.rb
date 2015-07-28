class Spree::Api::FoodInformationController < Spree::Api::BaseController
  before_action :find_food_information, except: [:index]

  def index
    authorize! :read, Spree::FoodInformation
    @food_informations = Spree::FoodInformation.accessible_by(current_ability, :read).all().
          ransack(params[:q]).result.page(params[:page]).per(params[:per_page])

    respond_with(@food_informations)
  end

  def show
    authorize! :read, Spree::FoodInformation
    respond_with(@food_information)
  end

  private
  def find_food_information
    # authorize request here as well:
    authorize! :read, Spree::FoodInformation
    @food_information = Spree::FoodInformation.find(params[:id])
  end
end
