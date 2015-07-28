module Spree
  module Api

    class FoodInformationController < Spree::Api::BaseController
      before_action :find_food_information, except: [:index, :create]

      def index
        authorize! :read, FoodInformation
        @food_informations = FoodInformation.accessible_by(current_ability, :read).all().
            ransack(params[:q]).result.page(params[:page]).per(params[:per_page])

        respond_with(@food_informations)
      end

      def show
        authorize! :read, FoodInformation
        respond_with(@food_information)
      end

      def create
        authorize! :create, FoodInformation
        @food_information = FoodInformation.new(food_information_params)
        if @food_information.save
          respond_with(@food_information, status: 201, default_template: :show)
        else
          invalid_resource!(@food_information)
        end
      end

      private
      def find_food_information
        # authorize request here as well:
        authorize! :read, FoodInformation
        @food_information = FoodInformation.find(params[:id])
      end

      def food_information_params
        params.require(:food_information).permit(permitted_food_information_attributes)
      end

      def permitted_food_information_attributes
        [:description,
         :net_contents,
         :origin,
         :producer_address,
         :allergens,
        :ingredients => [],
         :nutrition_information => [[:quantity, :nutrition_values => [:nutrition, :name, :value]]],
        ]
      end
    end
  end
end

#{:quantity => "100g", :nutrition_values => [{:nutrition => "energy", :name => "Energy kJ / kCal", :value => "726 kJ / 173 kcal"},
#                                            {:nutrition => "fat", :name => "Fat", :value => "9,0g"}]
