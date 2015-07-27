class Spree::Api::FoodInformationController < Spree::Api::BaseController
  before_action :find_food_information, except: [:index]

  def index
    @food_informations = []
    if @current_user_roles.include?("admin")
      # ::TODO:: Pagination
      @food_informations = Spree::FoodInformation.all().accessible_by(current_ability, :read).
          ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
    else
      @food_informations = []
    end

    logger.debug @food_informations

    respond_with(@food_informations)
  end

  def show
    respond_with(@food_information)
  end


  private
  def find_food_information
    @food_information = Spree::FoodInformation.find(params[:id])
  end
end
