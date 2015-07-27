object false
node(:count) { @food_informations.count }
node(:total_count) { @food_informations.total_count }
node(:current_page) { params[:page] ? params[:page].to_i : 1 }
node(:per_page) { params[:per_page] || Kaminari.config.default_per_page }
node(:pages) { @food_informations.num_pages }
child(@food_informations => :food_information) do
  extends "spree/api/food_information/show"
end