class RankingController < ApplicationController
  
  layout 'review_site'
  
  before_action :ranking
  
  def ranking
    ids = Review.group(:product_id).order("count_product_id DESC").limit(3).count(:product_id).keys
    @ranking = ids.map { |id| Product.find(id) }
  end
end
