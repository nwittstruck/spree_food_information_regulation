Spree::Api::ApiHelpers.module_eval do
  mattr_reader :food_information_attributes

  class_variable_set(:@@food_information_attributes,
                     [
                         :id,
                         :description,
                         :ingredients,
                         :net_contents,
                         :origin,
                         :producer_address,
                         :nutrition_information,
                         :allergens
                     ])
end
