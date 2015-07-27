Spree::Api::ApiHelpers.module_eval do
  Spree::Api::ApiHelpers::ATTRIBUTES << :food_information_attributes

  class_variable_set(:@@food_information_attributes,
                     [
                         :id,
                         :description
                     ])

end
